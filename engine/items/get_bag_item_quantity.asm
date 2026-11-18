GetQuantityOfItemInBag:
; In: b = item ID
; Out: b = how many of that item are in the bag
	call GetPredefRegisters
	ld a, b
	sub HM01
	jr c, .notTMHM
; CT/CS : bit de wOwnedTMHMs
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
	and 1
	ld b, a
	ret
.notTMHM
	ld hl, wNumBagItems
.loop
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .notInBag
	cp b
	jr nz, .loop
	ld a, [hl]
	ld b, a
	ret
.notInBag
	ld b, 0
	ret
