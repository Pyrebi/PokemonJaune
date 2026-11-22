HiddenItems:
	ld hl, HiddenItemCoords
	call FindHiddenItemOrCoinsIndex
	ld [wHiddenItemOrCoinsIndex], a
	ld hl, wObtainedHiddenItemsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .itemAlreadyFound
	call EnableAutoTextBoxDrawing
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenEventFunctionArgument] ; item ID
	ld [wNamedObjectIndex], a
	call GetItemName
	tx_pre_jump FoundHiddenItemText

.itemAlreadyFound
	ld a, $ff
	ldh [hItemAlreadyFound], a
	ret

; mini Poké Balls sur les objets cachés pas encore ramassés de la carte
; (appelé pendant le V-blank par PrepareOAMData, après les autres sprites)
DEF HIDDEN_BALL_TILE EQU $f8
DrawHiddenItemBalls::
	ld a, [wFontLoaded]
	bit BIT_FONT_LOADED, a ; police chargée (texte, menu) : la tuile est écrasée
	ret nz
	ld hl, HiddenItemCoords
	ld c, 0 ; index de l'objet caché
.loop
	ld a, [hli] ; carte
	cp -1
	ret z
	ld b, a
	ld a, [wCurMap]
	cp b
	jr nz, .skip
	ld a, [hli] ; y
	ld d, a
	ld a, [hli] ; x
	ld e, a
	push hl
	push bc
	call .isObtained
	call z, .drawBall
	pop bc
	pop hl
	inc c
	jr .loop
.skip
	inc hl
	inc hl
	inc c
	jr .loop

; z si l'objet caché c n'a pas encore été ramassé
.isObtained
	ld a, c
	srl a
	srl a
	srl a
	ld hl, wObtainedHiddenItemsFlags
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, c
	and 7
	ld b, a
	ld a, [hl]
	inc b
.shift
	dec b
	jr z, .test
	rrca
	jr .shift
.test
	and 1
	ret

; d = y, e = x de l'objet
.drawBall
	ldh a, [hOAMBufferOffset]
	cp LOW(wShadowOAMSprite36) ; garder les dernières entrées (saut, pêche)
	ret nc
	ld l, a
	ld h, HIGH(wShadowOAM)
; écart avec le joueur, limité à l'écran
	ld a, [wYCoord]
	ld b, a
	ld a, d
	sub b
	add 5
	cp 11
	ret nc
	sub 5
	add a
	add a
	add a
	add a ; x 16 (écart signé)
	add 64 + 4 + 16 ; OAM Y
	ld d, a
	ld a, [wXCoord]
	ld b, a
	ld a, e
	sub b
	add 6
	cp 12
	ret nc
	sub 6
	add a
	add a
	add a
	add a
	add 64 + 4 + 8 ; OAM X
	ld e, a
; pendant un pas, les coordonnées ne changent qu'à la fin, mais chaque avancée
; a déjà décalé le décor (et les PNJ) de 2 pixels : 2 * (8 - compteur)
	ld a, [wWalkCounter]
	and a
	jr z, .gotProgress
	cpl
	add 8 + 1 ; 8 - compteur
	add a
.gotProgress
	ld b, a
	ld a, [wSpritePlayerStateData1YStepVector]
	call .offset
	add d
	ld [hli], a
	ld a, [wSpritePlayerStateData1XStepVector]
	call .offset
	add e
	ld [hli], a
	ld a, HIDDEN_BALL_TILE
	ld [hli], a
	xor a
	ld [hli], a
	ld a, l
	ldh [hOAMBufferOffset], a
	ret

; a = vecteur de pas (-1, 0, 1), b = pixels déjà parcourus -> a = décalage
; (le décor se déplace à l'opposé du joueur)
.offset
	and a
	ret z
	bit 7, a
	ld a, b
	ret nz ; vers le haut / la gauche : le décor descend
	cpl
	inc a
	ret

INCLUDE "data/events/hidden_item_coords.asm"

FoundHiddenItemText::
	text_far _FoundHiddenItemText
	text_asm
	ld a, [wHiddenEventFunctionArgument] ; item ID
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .bagFull
	ld hl, wObtainedHiddenItemsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	ld a, SFX_GET_ITEM_2
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jp TextScriptEnd
.bagFull
	call WaitForTextScrollButtonPress ; wait for button press
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, HiddenItemBagFullText
	call PrintText
	jp TextScriptEnd

HiddenItemBagFullText::
	text_far _HiddenItemBagFullText
	text_end

HiddenCoins:
	ld b, COIN_CASE
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jr z, .doNotPickUpCoins
	ld hl, HiddenCoinCoords
	call FindHiddenItemOrCoinsIndex
	ld [wHiddenItemOrCoinsIndex], a
	ld hl, wObtainedHiddenCoinsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr nz, .doNotPickUpCoins
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ldh [hCoins + 1], a
	ld a, [wHiddenEventFunctionArgument]
	sub COIN
	cp 10
	jr z, .bcd10
	cp 20
	jr z, .bcd20
	cp 40
	jr z, .bcd20 ; should be bcd40
	jr .bcd100

.doNotPickUpCoins
	ld a, $ff
	ldh [hItemAlreadyFound], a
	ret

.bcd10
	ld a, $10
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd20
	ld a, $20
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd40 ; due to a typo, this is never used
	ld a, $40
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd100
	ld a, $1
	ldh [hCoins], a
.bcdDone
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	ld hl, wObtainedHiddenCoinsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	call EnableAutoTextBoxDrawing
	ld a, [wPlayerCoins]
	cp $99
	jr nz, .roomInCoinCase
	ld a, [wPlayerCoins + 1]
	cp $99
	jr nz, .roomInCoinCase
	tx_pre_id DroppedHiddenCoinsText
	jr .done
.roomInCoinCase
	tx_pre_id FoundHiddenCoinsText
.done
	jp PrintPredefTextID

INCLUDE "data/events/hidden_coins.asm"

FoundHiddenCoinsText::
	text_far _FoundHiddenCoinsText
	sound_get_item_2
	text_end

DroppedHiddenCoinsText::
	text_far _FoundHiddenCoins2Text
	sound_get_item_2
	text_far _DroppedHiddenCoinsText
	text_end

FindHiddenItemOrCoinsIndex:
	ld a, [wHiddenEventY]
	ld d, a
	ld a, [wHiddenEventX]
	ld e, a
	ld a, [wCurMap]
	ld b, a
	ld c, -1
.loop
	inc c
	ld a, [hli]
	cp -1 ; end of the list?
	ret z  ; if so, we're done here
	cp b
	jr nz, .next1
	ld a, [hli]
	cp d
	jr nz, .next2
	ld a, [hli]
	cp e
	jr nz, .loop
	ld a, c
	ret
.next1
	inc hl
.next2
	inc hl
	jr .loop
