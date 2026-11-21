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
