; Maître des capacités (accessible depuis le PC) : propose à un #MON de
; (après la Ligue : toute sa liste par niveau et toutes ses CT/CS compatibles)
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
	ld [wMovePower], a
	call GetMovePower
	call GetMoveName
	call CopyToStringBuffer
; confirmation avec la puissance
	ld hl, .confirmText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .chooseMon
	predef LearnMove
	jr .chooseMon

.confirmText
	text_far _RelearnerConfirmText
	text_end
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

; entrée : [wMovePower] = capacité ; sortie : [wMovePower] = sa puissance
; et écrit le texte correspondant dans wMovePowerText (« - » si 0 ou 1 :
; capacités de statut ou à dégâts fixes)
GetMovePower::
	ld a, [wMovePower]
	and a
	jr z, .gotPower
	dec a
	ld hl, Moves + MOVE_POWER
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, [hli]
	push af
	ld a, [hl] ; type
	call .typeText
	pop af
.gotPower
	ld [wMovePower], a
	ld hl, wMovePowerText
	cp 2
	jr nc, .number
	ld [hl], '-'
	inc hl
	ld [hl], '@'
	ret
.number
	ld c, 100
	call .digit
	ld c, 10
	call .digit
	add '0'
	ld [hli], a
	ld [hl], '@'
	ret
.typeText ; écrit le nom abrégé du type a dans wMoveTypeText
	cp FIRE
	jr c, .physicalType
	sub FIRE - (GHOST + 1)
.physicalType
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, ShortTypeNames
	add hl, bc
	ld de, wMoveTypeText
	ld c, 4
.typeLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .typeLoop
	ld a, '@'
	ld [de], a
	ret

.digit ; écrit le chiffre de a / c (sans zéro en tête), a = reste
	ld b, '0' - 1
.sub
	inc b
	sub c
	jr nc, .sub
	add c
	push af
	ld a, b
	cp '0'
	jr nz, .write
	ld a, l
	cp LOW(wMovePowerText) ; pas de zéro en tête
	jr z, .skip
	ld a, b
.write
	ld [hli], a
.skip
	pop af
	ret

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
; après la Ligue : toute la liste par niveau, quel que soit le niveau
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	jr z, .levelLimit
	ld a, MAX_LEVEL
	ld [wBuffer], a
.levelLimit
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
; après la Ligue : toutes les capacités CT/CS que l'espèce peut apprendre
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	jr z, .noTMs
	ld c, 0
.tmLoop
	push bc
	ld hl, wMonHLearnset
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	pop bc
	and a
	jr z, .tmNext
	ld a, c
	inc a ; numéro de CT/CS (CS à partir de 51)
	ld [wTempTMHM], a
	push bc
	callfar TMToMove
	ld a, [wTempTMHM]
	call AddRelearnableMove
	pop bc
.tmNext
	inc c
	ld a, c
	cp NUM_TM_HM
	jr c, .tmLoop
.noTMs
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

; noms de types abrégés (4 caractères), dans l'ordre des constantes de type
; (NORMAL à SPECTRE, puis FEU à DRAGON)
ShortTypeNames:
	db "NORM", "COMB", "VOL ", "POIS", "SOL ", "ROCH", "OIS.", "INS.", "SPEC"
	db "FEU ", "EAU ", "PLAN", "ELEC", "PSY ", "GLAC", "DRAG"
