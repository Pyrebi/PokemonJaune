; Pokédex de la zone (SELECT dans la liste du Pokédex) : Pokémon sauvages de
; la carte actuelle (donc de l'étage exact d'une grotte), avec niveau maximal
; et fréquence ; Poké Ball = déjà capturé, « ????? » = jamais vu.

SECTION "Zone Dex", ROMX

DEF ZONE_LINES EQU 12 ; lignes de liste par page
; variables temporaires (wBuffer + 0-7 : données de la MEGA CANNE)
DEF wZonePage   EQUS "(wBuffer + 10)"
DEF wZoneFirst  EQUS "(wBuffer + 11)"
DEF wZoneLine   EQUS "(wBuffer + 12)"
DEF wZoneMore   EQUS "(wBuffer + 13)"
DEF wZoneNum    EQUS "(wBuffer + 14)"
DEF wZoneLevel  EQUS "(wBuffer + 15)"
DEF wZonePct    EQUS "(wBuffer + 16)"
DEF wZoneCount  EQUS "(wBuffer + 17)"
DEF wZoneIndex  EQUS "(wBuffer + 18)"
DEF wZoneTable  EQUS "(wBuffer + 19)" ; 2 octets
DEF wZonePcts   EQUS "(wBuffer + 21)" ; 2 octets

ZoneDex::
	xor a
	ld [wZonePage], a
.redraw
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call TextBoxBorder
	hlcoord 1, 1
	ld de, .titleText
	call PlaceString
; première ligne affichée = page * ZONE_LINES
	ld a, [wZonePage]
	ld b, a
	xor a
	inc b
.firstLoop
	dec b
	jr z, .gotFirst
	add ZONE_LINES
	jr .firstLoop
.gotFirst
	ld [wZoneFirst], a
	xor a
	ld [wZoneLine], a
	ld [wZoneMore], a
; herbe / grotte
	ld a, [wGrassRate]
	and a
	jr z, .noGrass
	ld de, .grassText
	call ZoneDex_Header
	ld hl, wGrassMons
	ld de, GrassWaterPcts
	ld c, NUM_WILDMONS
	call ZoneDex_ListTable
.noGrass
; surf
	ld a, [wWaterRate]
	and a
	jr z, .noWater
	ld de, .waterText
	call ZoneDex_Header
	ld hl, wWaterMons
	ld de, GrassWaterPcts
	ld c, NUM_WILDMONS
	call ZoneDex_ListTable
.noWater
; pêche (cartes ayant des rencontres à la MEGA CANNE)
	callfar CopySuperRodData
	jr nc, .noFishing
	ld de, .oldRodText
	call ZoneDex_Header
	ld hl, OldRodMons
	ld de, OldRodPcts
	ld c, 1
	call ZoneDex_ListTable
	ld de, .goodRodText
	call ZoneDex_Header
	ld hl, ZoneGoodRodMons
	ld de, GoodRodPcts
	ld c, 2
	call ZoneDex_ListTable
	ld de, .superRodText
	call ZoneDex_Header
	ld hl, wBuffer
	ld de, SuperRodPcts
	ld c, 4
	call ZoneDex_ListTable
.noFishing
	ld a, [wZoneLine]
	and a
	jr nz, .footer
	hlcoord 1, 3
	ld de, .nothingText
	call PlaceString
.footer
	hlcoord 1, 16
	ld de, .backText
	ld a, [wZoneMore]
	and a
	jr z, .placeFooter
	ld de, .nextText
.placeFooter
	call PlaceString
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
.input
	call DelayFrame
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	bit B_PAD_B, a
	ret nz
	and PAD_A | PAD_DOWN | PAD_RIGHT
	jr z, .checkPrevious
	ld a, [wZoneMore]
	and a
	jr z, .checkPrevious
	ld hl, wZonePage
	inc [hl]
	jp .redraw
.checkPrevious
	ldh a, [hJoy5]
	and PAD_UP | PAD_LEFT
	jr z, .input
	ld a, [wZonePage]
	and a
	jr z, .input
	ld hl, wZonePage
	dec [hl]
	jp .redraw

.titleText    db "#MON DE LA ZONE@"
.grassText    db "HERBE/GROTTE:@"
.waterText    db "SURF:@"
.oldRodText   db "CANNE:@"
.goodRodText  db "SUPER CANNE:@"
.superRodText db "MEGA CANNE:@"
.nothingText  db "Aucun #MON ici.@"
.backText     db "B: RETOUR@"
.nextText     db "A:SUITE  B:RETOUR@"

; ligne de titre de section (de = texte)
ZoneDex_Header:
	push de
	call ZoneDex_NextLine
	pop de
	ret nc
	jp PlaceString

; passe à la ligne suivante ; sortie : carry et hl = colonne 1 si elle est
; sur la page affichée
ZoneDex_NextLine:
	ld a, [wZoneLine]
	ld b, a
	inc a
	ld [wZoneLine], a
	ld a, [wZoneFirst]
	ld c, a
	ld a, b
	sub c
	jr c, .hidden
	cp ZONE_LINES
	jr nc, .more
	add 3 ; première ligne de liste
	ld hl, wTileMap + 1
	ld bc, SCREEN_WIDTH
	call AddNTimes
	scf
	ret
.more
	ld a, 1
	ld [wZoneMore], a
.hidden
	and a
	ret

; liste une table de c paires (niveau, espèce) en hl, de = pourcentage de
; chaque emplacement ; les espèces en double sont regroupées
ZoneDex_ListTable:
	ld a, l
	ld [wZoneTable], a
	ld a, h
	ld [wZoneTable + 1], a
	ld a, e
	ld [wZonePcts], a
	ld a, d
	ld [wZonePcts + 1], a
	ld a, c
	ld [wZoneCount], a
	xor a
	ld [wZoneIndex], a
.slotLoop
	ld a, [wZoneIndex]
	ld hl, wZoneCount
	cp [hl]
	ret nc
	call .speciesAt ; a = espèce de l'emplacement
	ld [wZoneNum], a
; déjà listée par un emplacement précédent ?
	ld a, [wZoneIndex]
	ld b, a
	ld c, 0
.dupLoop
	ld a, c
	cp b
	jr z, .notDuplicate
	push bc
	call .speciesAt
	pop bc
	ld hl, wZoneNum
	cp [hl]
	jr z, .next
	inc c
	jr .dupLoop
.notDuplicate
; total des pourcentages et niveau maximal de cette espèce
	xor a
	ld [wZonePct], a
	ld [wZoneLevel], a
	ld c, 0
.sumLoop
	ld a, c
	ld hl, wZoneCount
	cp [hl]
	jr nc, .print
	push bc
	call .speciesAt
	pop bc
	ld hl, wZoneNum
	cp [hl]
	jr nz, .sumNext
; même espèce
	ld a, [wZonePcts]
	ld l, a
	ld a, [wZonePcts + 1]
	ld h, a
	ld e, c
	ld d, 0
	add hl, de
	ld a, [wZonePct]
	add [hl]
	ld [wZonePct], a
	push bc
	call .levelAt
	pop bc
	ld hl, wZoneLevel
	cp [hl]
	jr c, .sumNext
	ld [hl], a
.sumNext
	inc c
	jr .sumLoop
.print
	call ZoneDex_NextLine
	call c, ZoneDex_PrintMon
.next
	ld hl, wZoneIndex
	inc [hl]
	jr .slotLoop

; a = index d'emplacement (c pour les boucles) -> a = espèce / niveau
.speciesAt
	call .slotAddress
	inc hl
	ld a, [hl]
	ret
.levelAt
	ld a, c
.slotAddressFromA
	call .slotAddress
	ld a, [hl]
	ret
.slotAddress
	add a
	ld e, a
	ld d, 0
	ld a, [wZoneTable]
	ld l, a
	ld a, [wZoneTable + 1]
	ld h, a
	add hl, de
	ret

; affiche [wZoneNum] en hl (colonne 1) : Poké Ball, nom, niveau, fréquence
ZoneDex_PrintMon:
	push hl
	ld a, [wZoneNum]
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	push bc
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	predef FlagActionPredef
	ld a, c
	pop bc
	pop hl
	push hl
	and a
	jr z, .notOwned
	ld [hl], '<BALL>'
.notOwned
	ld b, FLAG_TEST
	ld hl, wPokedexSeen
	predef FlagActionPredef
	pop hl
	push hl
	inc hl
	ld a, c
	and a
	ld de, .unknownText
	jr z, .placeName
	ld a, [wZoneNum]
	ld [wNamedObjectIndex], a
	push hl
	call GetMonName ; de = nom
	pop hl
.placeName
	call PlaceString
	pop hl
	push hl
	ld de, 12
	ld a, [wZonePct]
	cp 100
	jr c, .levelColumn
	dec de ; 100 % : niveau une colonne plus à gauche
.levelColumn
	add hl, de
	ld de, wZoneLevel
	lb bc, 1, 2
	call PrintNumber
	pop hl
	ld de, 14
	add hl, de
	push hl
	ld de, wZonePct
	lb bc, 1, 3
	call PrintNumber
	pop hl
	inc hl
	inc hl
	inc hl
	ld [hl], '%'
	ret

.unknownText db "?????@"

; fréquences des emplacements (en %)
GrassWaterPcts: db 20, 20, 15, 10, 10, 10, 5, 5, 4, 1
OldRodPcts:     db 100
GoodRodPcts:    db 50, 50
SuperRodPcts:   db 40, 30, 20, 10

OldRodMons:      db 5, MAGIKARP
ZoneGoodRodMons: db 10, GOLDEEN, 10, POLIWAG ; comme GoodRodMons
