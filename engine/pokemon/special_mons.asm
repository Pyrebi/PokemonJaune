SECTION "Special Mons", ROMX

; Pokémon « spéciaux » du joueur (hl = début de sa structure, conservé) :
; PIKACHU obtenu hors combat (celui du PROF.CHEN) = super, autres Pokémon
; obtenus hors combat (cadeaux, CASINO, fossiles...) et légendaires = stars.
; Ils reçoivent une marque (octet du taux de capture) et l'EXP de stats au
; maximum ; le bonus de stats est appliqué par CalcStats_.
MarkSpecialMon::
	push de
	call .mark_
	pop de
	ret
.mark_
	push hl
	ld a, [wIsInBattle]
	and a
	ld a, [wCurPartySpecies]
	jr nz, .caught
	cp PIKACHU
	ld c, SUPER_MON_MARK
	jr z, .mark
	ld c, STAR_MON_MARK
	jr .mark
.caught
	ld hl, SpecialWildMons
	ld de, 1
	call IsInArray
	pop hl
	ret nc
	push hl
	ld c, STAR_MON_MARK
.mark
	pop hl
	push hl
	ld de, MON_CATCH_RATE
	add hl, de
	ld [hl], c
	ld de, MON_HP_EXP - MON_CATCH_RATE
	add hl, de
	ld a, $ff
	ld b, NUM_STATS * 2
.statExpLoop
	ld [hli], a
	dec b
	jr nz, .statExpLoop
	pop hl
	ret

MarkSpecialMonFromDE::
	ld h, d
	ld l, e
	jp MarkSpecialMon

MarkSpecialBoxMon::
	ld hl, wBoxMon1
	jp MarkSpecialMon

SpecialWildMons:
	db ARTICUNO, ZAPDOS, MOLTRES, MEWTWO, MEW, SNORLAX, -1

; CalcStats (voir home/move_mon.asm) puis, pour les #MON du joueur (b = 1),
; bonus des Pokémon marqués : x1,5 (super) ou x1,25 (star), plafond 999.
CalcStats_::
	ld c, $0
.statsLoop
	inc c
	call CalcStat
	ldh a, [hMultiplicand+1]
	ld [de], a
	inc de
	ldh a, [hMultiplicand+2]
	ld [de], a
	inc de
	ld a, c
	cp NUM_STATS
	jr nz, .statsLoop
	ld a, b
	and a
	ret z ; ennemis (statistiques sans EXP de stats)
	push bc
	push de
	push hl
	ld bc, MON_CATCH_RATE - (MON_HP_EXP - 1)
	add hl, bc
	ld a, [hl]
	ld c, 1 ; x1,5 = x + x/2
	cp SUPER_MON_MARK
	jr z, .boost
	inc c   ; x1,25 = x + x/4
	cp STAR_MON_MARK
	jr nz, .done
.boost
	ld h, d
	ld l, e ; hl = fin des stats
	ld b, NUM_STATS
.boostLoop
	dec hl
	dec hl ; octet fort de la stat
	push bc
	push hl
	ld a, [hli]
	ld d, a
	ld e, [hl] ; de = stat
	ld b, d
	ld a, e
.shift
	srl b
	rra
	dec c
	jr nz, .shift
	add e
	ld e, a
	ld a, b
	adc d
	ld d, a ; de = stat + stat >> c
	cp HIGH(MAX_STAT_VALUE)
	jr c, .store
	jr nz, .cap
	ld a, e
	cp LOW(MAX_STAT_VALUE) + 1
	jr c, .store
.cap
	ld de, MAX_STAT_VALUE
.store
	pop hl
	ld a, d
	ld [hli], a
	ld [hl], e
	dec hl
	pop bc
	dec b
	jr nz, .boostLoop
.done
	pop hl
	pop de
	pop bc
	ret

; partie commencée avant cette version : le PIKACHU de départ de l'équipe
; devient « super » (marque, EXP de stats au maximum, stats recalculées)
UpgradeStarterPikachu::
	xor a
	ld [wWhichPokemon], a
.loop
	ld a, [wWhichPokemon]
	ld hl, wPartyCount
	cp [hl]
	ret nc
	callfar IsThisPartyMonStarterPikachu
	jr nc, .next
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld bc, MON_CATCH_RATE
	add hl, bc
	ld a, [hl]
	pop hl
	cp SUPER_MON_MARK
	jr z, .next
	xor a
	ld [wIsInBattle], a
	ld a, PIKACHU
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call MarkSpecialMon
	push hl
	call GetMonHeader
	pop hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hli]
	ld [wCurEnemyLevel], a
	ld d, h
	ld e, l ; de = stats
	ld bc, (MON_HP_EXP - 1) - MON_STATS
	add hl, bc
	ld b, 1
	call CalcStats
.next
	ld hl, wWhichPokemon
	inc [hl]
	jr .loop
