; Sac par poches : OBJETS, BALLS, RARES (objets clés) et CT/CS.
; Le stockage reste la liste unique wBagItems (60 lignes) ; les CT/CS sont
; dans le champ de bits wOwnedTMHMs. La poche affichée est construite dans
; wPocketView (même format qu'une liste d'objets), ce qui permet de réutiliser
; tel quel le menu de liste du jeu.

; entrée : a = objet ; sortie : a = poche (POCKET_*)
GetItemPocket::
	cp HM01
	jr c, .notTMHM
	ld a, POCKET_TMHM
	ret
.notTMHM
	cp SAFARI_BALL
	jr z, .ball
	cp POKE_BALL + 1
	jr nc, .notBall
	and a
	jr nz, .ball
.notBall
; objet clé ? (bit [a - 1] de KeyItemFlags)
	dec a
	push hl
	push bc
	ld c, a
	srl a
	srl a
	srl a
	ld hl, KeyItemFlags
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
	pop bc
	pop hl
	and 1
	ld a, POCKET_KEY
	ret nz
	xor a ; POCKET_ITEMS
	ret
.ball
	ld a, POCKET_BALLS
	ret

; entrée : a = numéro de CT/CS (0 = CS01) ; sortie : nz si possédée
TestOwnedTMHM::
	push bc
	push hl
	ld c, a
	srl a
	srl a
	srl a
	ld hl, wOwnedTMHMs
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
	pop hl
	pop bc
	and 1
	ret

; construit wPocketView pour la poche [wCurBagPocket]
BuildPocketView:
	ld de, wPocketView + 1
	ld c, 0 ; nombre d'entrées
	ld a, [wCurBagPocket]
	cp POCKET_TMHM
	jr z, .tmhm
	ld hl, wBagItems
.loop
	ld a, [hli]
	cp -1
	jr z, .end
	ld b, a
	push bc
	call GetItemPocket
	ld b, a
	ld a, [wCurBagPocket]
	cp b
	pop bc
	jr nz, .skip
	ld a, b
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	inc c
.skip
	inc hl
	jr .loop
.tmhm
	ld b, 0 ; numéro de CT/CS
.tmhmLoop
	ld a, b
	cp NUM_TM_HM
	jr z, .end
	call TestOwnedTMHM
	jr z, .tmhmNext
	ld a, b
	add HM01
	ld [de], a
	inc de
	ld a, 1
	ld [de], a
	inc de
	inc c
.tmhmNext
	inc b
	jr .tmhmLoop
.end
	ld a, -1
	ld [de], a
	ld a, c
	ld [wPocketView], a
	ret

; Menu du sac par poches (utilisé hors combat et en combat).
; Sortie : carry si annulé ; sinon [wCurItem] = objet choisi et
; [wWhichPokemon] = son index dans wBagItems (pour le retirer).
BagPocketMenu::
	ld a, [wCurBagPocket]
	cp NUM_POCKETS
	jr c, .redisplay
	xor a
	ld [wCurBagPocket], a
.redisplay
	call BuildPocketView
	ld hl, wListPointer
	ld [hl], LOW(wPocketView)
	inc hl
	ld [hl], HIGH(wPocketView)
	xor a
	ld [wPrintItemPrices], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	ld a, [wBagSavedMenuItem]
	ld [wCurrentMenuItem], a
	call DisplayPocketListMenu
	push af
	ld a, [wCurrentMenuItem]
	ld [wBagSavedMenuItem], a
	pop af
	jr nc, .chose
; annulé : Gauche/Droite = changer de poche
	ldh a, [hJoy5]
	ld b, a
	ld a, [wCurBagPocket]
	bit B_PAD_RIGHT, b
	jr nz, .next
	bit B_PAD_LEFT, b
	jr nz, .previous
	scf
	ret
.next
	inc a
	cp NUM_POCKETS
	jr c, .changePocket
	xor a
	jr .changePocket
.previous
	and a
	jr nz, .decrement
	ld a, NUM_POCKETS
.decrement
	dec a
.changePocket
	ld [wCurBagPocket], a
	xor a
	ld [wBagSavedMenuItem], a
	ld [wListScrollOffset], a
	jr .redisplay
.chose
	ld a, [wCurItem]
	cp HM01
	jr nc, .done
; retrouver l'index de l'objet dans wBagItems
	ld b, a
	ld hl, wBagItems
	ld c, 0
.find
	ld a, [hli]
	cp -1
	jr z, .done
	cp b
	jr z, .found
	inc hl
	inc c
	jr .find
.found
	ld a, c
	ld [wWhichPokemon], a
.done
	and a
	ret

; équivalent de DisplayListMenuID, avec l'en-tête de poche et Gauche/Droite
DisplayPocketListMenu:
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld a, 1
	ldh [hJoy7], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wMenuItemToSwap], a
	ld a, [wPocketView]
	ld [wListCount], a
	ld a, LIST_MENU_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSprites
; en-tête : nom de la poche et numéro (ex. « OBJETS 1/4 »)
	ld a, [wCurBagPocket]
	add a
	ld e, a
	ld d, 0
	ld hl, PocketNames
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 6, 2
	ld [hl], ' '
	inc hl
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], ' '
	hlcoord 14, 2
	ld [hl], ' '
	inc hl
	ld a, [wCurBagPocket]
	add '1'
	ld [hli], a
	ld [hl], '/'
	inc hl
	ld [hl], '0' + NUM_POCKETS
	inc hl
	ld [hl], ' '
	ld a, 1
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wListCount]
	cp 2
	jr c, .setMenuVariables
	ld a, 2
.setMenuVariables
	ld [wMaxMenuItem], a
	ld a, 4
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a
	ld a, PAD_A | PAD_B | PAD_LEFT | PAD_RIGHT
	ld [wMenuWatchedKeys], a
	ld c, 4
	call DelayFrames
	jp DisplayPocketListMenuLoop

PocketNames:
	dw .items, .balls, .key, .tmhm
.items db "OBJETS@"
.balls db "BALLS@"
.key   db "RARES@"
.tmhm  db "CT/CS@"
