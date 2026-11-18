; Maître des capacités (accessible depuis le PC) : propose à un #MON de
; l'équipe les capacités de départ et celles de sa liste par niveau jusqu'à son
; niveau actuel, sauf celles qu'il connaît déjà. L'apprentissage passe par la
; routine habituelle LearnMove (oubli d'une capacité, PP...).

MoveRelearnerPC::
.chooseMon
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	jr c, .exit
	call BuildRelearnableMovesList
	ld a, [wPocketView]
	and a
	jr nz, .chooseMove
	ld hl, .noMovesText
	call PrintText
	jr .chooseMon
.chooseMove
	ld hl, .whichMoveText
	call PrintText
	ld hl, wListPointer
	ld [hl], LOW(wPocketView)
	inc hl
	ld [hl], HIGH(wPocketView)
	xor a
	ld [wPrintItemPrices], a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld a, MOVESLISTMENU
	ld [wListMenuID], a
	ld a, [wWhichPokemon] ; le menu de liste réutilise wWhichPokemon
	push af
	call DisplayListMenuID
	pop bc
	ld a, b
	ld [wWhichPokemon], a
	jr c, .chooseMon ; annulé : rechoisir un #MON
	ld a, [wCurListMenuItem]
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	predef LearnMove
	jr .chooseMon
.exit
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	jp LoadGBPal

.noMovesText
	text_far _RelearnerNoMovesText
	text_end

.whichMoveText
	text_far _RelearnerWhichMoveText
	text_end

; construit dans wPocketView la liste des capacités réapprenables
; du #MON [wWhichPokemon] (espèce [wCurPartySpecies])
BuildRelearnableMovesList:
; wBuffer : +0 = niveau du #MON, +1/+2 = adresse de ses capacités
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld a, [hl]
	ld [wBuffer], a
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld a, l
	ld [wBuffer + 1], a
	ld a, h
	ld [wBuffer + 2], a
	xor a
	ld [wPocketView], a
	ld a, -1
	ld [wPocketView + 1], a
; capacités de départ (niveau 1)
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	ld hl, wMonHMoves
	ld b, NUM_MOVES
.startingMovesLoop
	ld a, [hli]
	push hl
	push bc
	call AddRelearnableMove
	pop bc
	pop hl
	dec b
	jr nz, .startingMovesLoop
; capacités apprises par niveau, jusqu'au niveau actuel
	call GetMonLearnset
.learnsetLoop
	ld a, [hli] ; niveau
	and a
	ret z
	ld b, a
	ld a, [wBuffer]
	cp b
	ld a, [hli] ; capacité
	jr c, .learnsetLoop ; niveau pas encore atteint
	push hl
	call AddRelearnableMove
	pop hl
	jr .learnsetLoop

; ajoute la capacité a à la liste si elle n'est ni connue ni déjà listée
AddRelearnableMove:
	and a
	ret z
	ld d, a
; déjà connue ?
	ld a, [wBuffer + 1]
	ld l, a
	ld a, [wBuffer + 2]
	ld h, a
	ld b, NUM_MOVES
.knownLoop
	ld a, [hli]
	cp d
	ret z
	dec b
	jr nz, .knownLoop
; déjà dans la liste ?
	ld hl, wPocketView + 1
.listLoop
	ld a, [hli]
	cp -1
	jr z, .append
	cp d
	ret z
	jr .listLoop
.append
	dec hl
	ld a, d
	ld [hli], a
	ld [hl], -1
	ld hl, wPocketView
	inc [hl]
	ret
