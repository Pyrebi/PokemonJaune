; prints text for bookshelves in buildings without sign events
PrintBookshelfText::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr nz, .noMatch
; facing up
	ld a, [wCurMapTileset]
	ld b, a
	lda_coord 8, 7
	ld c, a
	ld hl, BookshelfTileIDs
.loop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	cp b
	jr nz, .nextBookshelfEntry1
	ld a, [hli]
	cp c
	jr nz, .nextBookshelfEntry2
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	xor a
	ldh [hInteractedWithBookshelf], a
	ret
.nextBookshelfEntry1
	inc hl
.nextBookshelfEntry2
	inc hl
	jr .loop
.noMatch
	call FieldItemPrompt ; arbuste ou eau devant le joueur ?
	jr nc, .noFieldItem
	xor a
	ldh [hInteractedWithBookshelf], a
	ret
.noFieldItem
	ld a, $ff
	ldh [hInteractedWithBookshelf], a
	farjp PrintCardKeyText

; Si le joueur fait face à un arbuste (SECATEUR) ou à l'eau (BATEAU), possède
; l'objet et le badge requis, propose de l'utiliser. Retourne carry si oui.
FieldItemPrompt:
; pas d'invite si un personnage ou un panneau est devant le joueur
	call IsSpriteOrSignInFrontOfPlayer
	ldh a, [hTextID]
	and a
	jr nz, .no
; arbuste à couper (mêmes tuiles que COUPE, sans les hautes herbes)
	ld a, [wTileInFrontOfPlayer]
	ld b, a
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	jr nz, .notOverworld
	ld a, b
	cp $3d
	jr z, .cutTree
	jr .checkWater
.notOverworld
	cp GYM
	jr nz, .checkWater
	ld a, b
	cp $50
	jr nz, .checkWater
.cutTree
	ld a, [wObtainedBadges]
	bit BIT_CASCADEBADGE, a
	ret z ; carry déjà à 0 après le "cp"
	ld d, SECATEUR
	jr .checkItem
.checkWater
	ld a, [wWalkBikeSurfState]
	cp 2 ; déjà en train de surfer
	jr z, .no
	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a
	jr z, .no
	callfar IsNextTileShoreOrWater
	jr nc, .no
	ld d, SURFBOARD
.checkItem
	ld b, d
	push de
	call IsItemInBag
	pop de
	jr z, .no
	ld a, d
	ld [wCurItem], a
	call EnableAutoTextBoxDrawing
	ld a, (FieldItemPromptText_id - TextPredefs) / 2 + 1
	call PrintPredefTextID
	scf
	ret
.no
	and a
	ret

; texte prédéfini : « Utiliser <objet>? », puis utilisation de l'objet
FieldItemPromptText::
	text_asm
	call FieldItemAskAndUse
	jp TextScriptEnd

; demande « Utiliser [wCurItem]? » et utilise l'objet si oui
FieldItemAskAndUse::
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, .askText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	xor a
	ld [wPseudoItemID], a
	jp UseItem
.askText
	text_far _FieldItemAskText
	text_end

; texte des rochers : propose les GANTS si possible, sinon message habituel
BoulderTextScript::
	ld hl, wStatusFlags1
	bit BIT_STRENGTH_ACTIVE, [hl]
	jr nz, .plain
	ld a, [wObtainedBadges]
	bit BIT_RAINBOWBADGE, a
	jr z, .plain
	ld b, GANTS
	call IsItemInBag
	jr z, .plain
	ld a, GANTS
	ld [wCurItem], a
	jp FieldItemAskAndUse
.plain
	ld hl, .text
	jp PrintText
.text
	text_far _BoulderText
	text_end

INCLUDE "data/tilesets/bookshelf_tile_ids.asm"
