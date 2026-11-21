ReadSuperRodData:
	ld a, [wCurMap]
	ld c, a
	ld hl, SuperRodFishingSlots
.loop
	ld a, [hli]
	cp $ff
	jr z, .notfound
	cp c
	jr z, .found
	ld de, $8
	add hl, de
	jr .loop
.found
	call GenerateRandomFishingEncounter
	ret
.notfound
	ld de, $0
	ret

GenerateRandomFishingEncounter:
	call Random
	cp 40 percent
	jr c, .got_encounter
	inc hl
	inc hl
	cp 70 percent
	jr c, .got_encounter
	inc hl
	inc hl
	cp 90 percent
	jr c, .got_encounter
	inc hl
	inc hl
.got_encounter
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret

INCLUDE "data/wild/super_rod.asm"

; copie dans wBuffer les 4 rencontres à la MEGA CANNE de la carte actuelle,
; au format (niveau, espèce) ; sortie : carry si la carte en a
CopySuperRodData::
	ld a, [wCurMap]
	ld c, a
	ld hl, SuperRodFishingSlots
.loop
	ld a, [hli]
	cp $ff
	jr z, .notFound
	cp c
	jr z, .found
	ld de, 8
	add hl, de
	jr .loop
.found
	ld de, wBuffer
	ld b, 4
.copy
	ld a, [hli] ; espèce
	ld c, a
	ld a, [hli] ; niveau
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	dec b
	jr nz, .copy
	scf
	ret
.notFound
	and a
	ret
