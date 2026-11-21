SECTION "Comfort", ROMX

; double vitesse à vélo ; à pied ou en surf : course avec B
; (ou sans B si l'option COURSE AUTO est active, B fait alors marcher)
DoBikeSpeedup_::
	ld a, [wWalkBikeSurfState]
	dec a ; à vélo ?
	jr z, .checks
	ldh a, [hJoyHeld]
	and PAD_B
	jr z, .noB
	ld a, 1 << BIT_BONUS_AUTORUN
.noB
	ld hl, wBonusOptions
	xor [hl]
	and 1 << BIT_BONUS_AUTORUN
	ret z
.checks
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ret nz
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wCurMap]
	cp ROUTE_17 ; Piste Cyclable
	jp nz, AdvancePlayerSprite
	ldh a, [hJoyHeld]
	and PAD_UP | PAD_LEFT | PAD_RIGHT
	ret nz
	jp AdvancePlayerSprite

; combat sauvage : Poké Ball à gauche du niveau si l'espèce est déjà capturée
PrintEnemyOwnedBall::
	ld a, [wIsInBattle]
	dec a
	ret nz
	ld a, [wEnemyMonSpecies2]
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	predef FlagActionPredef
	ld a, c
	and a
	ret z
	hlcoord 1, 1
	ld [hl], '<BALL>'
	ret

; fiche du Pokédex : stats de base de [wCurPartySpecies] (sous la ligne de
; séparation, à la place de la description)
PokedexShowBaseStats::
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	hlcoord 1, 10
	lb bc, 7, 18
	call ClearScreenArea
	hlcoord 1, 10
	ld de, .titleText
	call PlaceString
	hlcoord 1, 12
	ld de, .statsText
	call PlaceString
	hlcoord 5, 12
	ld de, wMonHBaseStats ; PV
	call .printStat
	hlcoord 14, 12
	ld de, wMonHBaseStats + 1 ; ATQ
	call .printStat
	hlcoord 5, 14
	ld de, wMonHBaseStats + 2 ; DEF
	call .printStat
	hlcoord 14, 14
	ld de, wMonHBaseStats + 3 ; VIT
	call .printStat
	hlcoord 5, 16
	ld de, wMonHBaseStats + 4 ; SPE
	call .printStat
; total
	ld hl, wMonHBaseStats
	ld b, NUM_STATS
	xor a
	ld d, a
	ld e, a
.totalLoop
	ld a, [hli]
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	dec b
	jr nz, .totalLoop
	ld a, d
	ld [wBuffer], a
	ld a, e
	ld [wBuffer + 1], a
	hlcoord 15, 16
	ld de, wBuffer
	lb bc, 2, 3
	jp PrintNumber

.printStat
	lb bc, 1, 3
	jp PrintNumber

.titleText db "STATS DE BASE:@"
.statsText
	db   "PV        ATQ"
	next "DEF       VIT"
	next "SPE       TOT@"
