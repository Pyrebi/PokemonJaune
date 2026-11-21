; Icônes du menu de l'équipe reprises de Pokémon Cristal (pret/pokecrystal,
; gfx/icons) : 2 images de 16x16 par icône. Chaque #MON de l'équipe a son
; icône chargée dans son propre emplacement (tuiles de sprite 4 * index, et
; ICONOFFSET + 4 * index pour la 2e image) ; l'emplacement 6 sert à l'icône
; affichée seule (écran de surnom, échange).

SECTION "Crystal Icons", ROMX


; charge les icônes de l'équipe (écran éteint)
LoadPartyCrystalIconsLCDOff::
	xor a ; index dans l'équipe
.loop
	ld hl, wPartyCount
	cp [hl]
	ret nc
	push af
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	call GetCrystalIconPointer ; de = graphismes
	pop af
	push af
	call GetIconSlotVRAM ; hl = 1re image
; CopyData copie de hl vers de : on échange source et destination
	push hl ; VRAM
	ld h, d
	ld l, e ; hl = graphismes
	pop de  ; de = VRAM
	push de
	ld bc, 4 * TILE_SIZE
	call CopyData ; 1re image (hl avance jusqu'à la 2e)
	pop de
	push hl
	ld hl, ICONOFFSET * TILE_SIZE
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, 4 * TILE_SIZE
	call CopyData ; 2e image
	pop af
	inc a
	jr .loop

; charge l'icône de [wMonPartySpriteSpecies] dans l'emplacement 6 (écran allumé)
LoadSingleCrystalIcon::
	ld a, [wMonPartySpriteSpecies]
	call GetCrystalIconPointer
	ld a, CRYSTAL_ICON_SLOT_SINGLE
	call GetIconSlotVRAM
	push hl
	push de
	lb bc, BANK(@), 4
	call CopyVideoData
	pop de
	ld hl, 4 * TILE_SIZE
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, ICONOFFSET * TILE_SIZE
	add hl, bc
	lb bc, BANK(@), 4
	jp CopyVideoData

; a = emplacement -> hl = vSprites tile (4 * a)
GetIconSlotVRAM:
	add a
	add a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl ; x TILE_SIZE
	ld bc, vSprites
	add hl, bc
	ret

; a = espèce -> de = graphismes de son icône
GetCrystalIconPointer:
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	cp NUM_POKEMON
	jr c, .ok
	xor a
.ok
	ld e, a
	ld d, 0
	ld hl, MonCrystalIcons
	add hl, de
	ld a, [hl]
	add a
	ld e, a
	ld hl, CrystalIconPointers
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

; icône de chaque #MON, dans l'ordre du Pokédex
MonCrystalIcons:
	db  0 ; BULBASAUR
	db  0 ; IVYSAUR
	db  0 ; VENUSAUR
	db  1 ; CHARMANDER
	db  1 ; CHARMELEON
	db  2 ; CHARIZARD
	db  3 ; SQUIRTLE
	db  3 ; WARTORTLE
	db  3 ; BLASTOISE
	db  4 ; CATERPIE
	db  4 ; METAPOD
	db  5 ; BUTTERFREE
	db  4 ; WEEDLE
	db  4 ; KAKUNA
	db  6 ; BEEDRILL
	db  7 ; PIDGEY
	db  7 ; PIDGEOTTO
	db  7 ; PIDGEOT
	db  8 ; RATTATA
	db  8 ; RATICATE
	db  7 ; SPEAROW
	db  7 ; FEAROW
	db  9 ; EKANS
	db  9 ; ARBOK
	db 10 ; PIKACHU
	db 10 ; RAICHU
	db 11 ; SANDSHREW
	db 11 ; SANDSLASH
	db  8 ; NIDORAN_F
	db  8 ; NIDORINA
	db 11 ; NIDOQUEEN
	db  8 ; NIDORAN_M
	db  8 ; NIDORINO
	db 11 ; NIDOKING
	db 12 ; CLEFAIRY
	db 12 ; CLEFABLE
	db  8 ; VULPIX
	db  8 ; NINETALES
	db 13 ; JIGGLYPUFF
	db 13 ; WIGGLYTUFF
	db 14 ; ZUBAT
	db 14 ; GOLBAT
	db 15 ; ODDISH
	db 15 ; GLOOM
	db 15 ; VILEPLUME
	db  6 ; PARAS
	db  6 ; PARASECT
	db  4 ; VENONAT
	db  5 ; VENOMOTH
	db 16 ; DIGLETT
	db 16 ; DUGTRIO
	db  8 ; MEOWTH
	db  8 ; PERSIAN
	db 11 ; PSYDUCK
	db 11 ; GOLDUCK
	db 17 ; MANKEY
	db 17 ; PRIMEAPE
	db  8 ; GROWLITHE
	db  8 ; ARCANINE
	db 18 ; POLIWAG
	db 18 ; POLIWHIRL
	db 18 ; POLIWRATH
	db 19 ; ABRA
	db 19 ; KADABRA
	db 19 ; ALAKAZAM
	db 17 ; MACHOP
	db 17 ; MACHOKE
	db 17 ; MACHAMP
	db 15 ; BELLSPROUT
	db 15 ; WEEPINBELL
	db 15 ; VICTREEBEL
	db 20 ; TENTACOOL
	db 20 ; TENTACRUEL
	db 21 ; GEODUDE
	db 21 ; GRAVELER
	db 21 ; GOLEM
	db 22 ; PONYTA
	db 22 ; RAPIDASH
	db 23 ; SLOWPOKE
	db 23 ; SLOWBRO
	db 24 ; MAGNEMITE
	db 24 ; MAGNETON
	db  7 ; FARFETCH_D
	db  7 ; DODUO
	db  7 ; DODRIO
	db 25 ; SEEL
	db 25 ; DEWGONG
	db 26 ; GRIMER
	db 26 ; MUK
	db 27 ; SHELLDER
	db 27 ; CLOYSTER
	db 28 ; GASTLY
	db 28 ; HAUNTER
	db 28 ; GENGAR
	db  9 ; ONIX
	db 19 ; DROWZEE
	db 19 ; HYPNO
	db 27 ; KRABBY
	db 27 ; KINGLER
	db 24 ; VOLTORB
	db 24 ; ELECTRODE
	db 15 ; EXEGGCUTE
	db 15 ; EXEGGUTOR
	db 11 ; CUBONE
	db 11 ; MAROWAK
	db 17 ; HITMONLEE
	db 17 ; HITMONCHAN
	db 11 ; LICKITUNG
	db 26 ; KOFFING
	db 26 ; WEEZING
	db 22 ; RHYHORN
	db 11 ; RHYDON
	db 12 ; CHANSEY
	db 15 ; TANGELA
	db 11 ; KANGASKHAN
	db 29 ; HORSEA
	db 29 ; SEADRA
	db 29 ; GOLDEEN
	db 29 ; SEAKING
	db 30 ; STARYU
	db 30 ; STARMIE
	db 19 ; MR__MIME
	db  6 ; SCYTHER
	db 19 ; JYNX
	db 19 ; ELECTABUZZ
	db 19 ; MAGMAR
	db  6 ; PINSIR
	db 22 ; TAUROS
	db 29 ; MAGIKARP
	db 31 ; GYARADOS
	db 25 ; LAPRAS
	db 26 ; DITTO
	db  8 ; EEVEE
	db  8 ; VAPOREON
	db  8 ; JOLTEON
	db  8 ; FLAREON
	db 24 ; PORYGON
	db 27 ; OMANYTE
	db 27 ; OMASTAR
	db 27 ; KABUTO
	db 27 ; KABUTOPS
	db  7 ; AERODACTYL
	db 32 ; SNORLAX
	db  7 ; ARTICUNO
	db  7 ; ZAPDOS
	db  7 ; MOLTRES
	db  9 ; DRATINI
	db  9 ; DRAGONAIR
	db  2 ; DRAGONITE
	db 19 ; MEWTWO
	db 19 ; MEW

CrystalIconPointers:
	dw BulbasaurCrystalIcon
	dw CharmanderCrystalIcon
	dw BigmonCrystalIcon
	dw SquirtleCrystalIcon
	dw CaterpillarCrystalIcon
	dw MothCrystalIcon
	dw BugCrystalIcon
	dw BirdCrystalIcon
	dw FoxCrystalIcon
	dw SerpentCrystalIcon
	dw PikachuCrystalIcon
	dw MonsterCrystalIcon
	dw ClefairyCrystalIcon
	dw JigglypuffCrystalIcon
	dw BatCrystalIcon
	dw OddishCrystalIcon
	dw DiglettCrystalIcon
	dw FighterCrystalIcon
	dw PoliwagCrystalIcon
	dw HumanshapeCrystalIcon
	dw JellyfishCrystalIcon
	dw GeodudeCrystalIcon
	dw EquineCrystalIcon
	dw SlowpokeCrystalIcon
	dw VoltorbCrystalIcon
	dw LaprasCrystalIcon
	dw BlobCrystalIcon
	dw ShellCrystalIcon
	dw GhostCrystalIcon
	dw FishCrystalIcon
	dw StaryuCrystalIcon
	dw GyaradosCrystalIcon
	dw SnorlaxCrystalIcon

BulbasaurCrystalIcon: INCBIN "gfx/icons/crystal/bulbasaur.2bpp"
CharmanderCrystalIcon: INCBIN "gfx/icons/crystal/charmander.2bpp"
BigmonCrystalIcon: INCBIN "gfx/icons/crystal/bigmon.2bpp"
SquirtleCrystalIcon: INCBIN "gfx/icons/crystal/squirtle.2bpp"
CaterpillarCrystalIcon: INCBIN "gfx/icons/crystal/caterpillar.2bpp"
MothCrystalIcon: INCBIN "gfx/icons/crystal/moth.2bpp"
BugCrystalIcon: INCBIN "gfx/icons/crystal/bug.2bpp"
BirdCrystalIcon: INCBIN "gfx/icons/crystal/bird.2bpp"
FoxCrystalIcon: INCBIN "gfx/icons/crystal/fox.2bpp"
SerpentCrystalIcon: INCBIN "gfx/icons/crystal/serpent.2bpp"
PikachuCrystalIcon: INCBIN "gfx/icons/crystal/pikachu.2bpp"
MonsterCrystalIcon: INCBIN "gfx/icons/crystal/monster.2bpp"
ClefairyCrystalIcon: INCBIN "gfx/icons/crystal/clefairy.2bpp"
JigglypuffCrystalIcon: INCBIN "gfx/icons/crystal/jigglypuff.2bpp"
BatCrystalIcon: INCBIN "gfx/icons/crystal/bat.2bpp"
OddishCrystalIcon: INCBIN "gfx/icons/crystal/oddish.2bpp"
DiglettCrystalIcon: INCBIN "gfx/icons/crystal/diglett.2bpp"
FighterCrystalIcon: INCBIN "gfx/icons/crystal/fighter.2bpp"
PoliwagCrystalIcon: INCBIN "gfx/icons/crystal/poliwag.2bpp"
HumanshapeCrystalIcon: INCBIN "gfx/icons/crystal/humanshape.2bpp"
JellyfishCrystalIcon: INCBIN "gfx/icons/crystal/jellyfish.2bpp"
GeodudeCrystalIcon: INCBIN "gfx/icons/crystal/geodude.2bpp"
EquineCrystalIcon: INCBIN "gfx/icons/crystal/equine.2bpp"
SlowpokeCrystalIcon: INCBIN "gfx/icons/crystal/slowpoke.2bpp"
VoltorbCrystalIcon: INCBIN "gfx/icons/crystal/voltorb.2bpp"
LaprasCrystalIcon: INCBIN "gfx/icons/crystal/lapras.2bpp"
BlobCrystalIcon: INCBIN "gfx/icons/crystal/blob.2bpp"
ShellCrystalIcon: INCBIN "gfx/icons/crystal/shell.2bpp"
GhostCrystalIcon: INCBIN "gfx/icons/crystal/ghost.2bpp"
FishCrystalIcon: INCBIN "gfx/icons/crystal/fish.2bpp"
StaryuCrystalIcon: INCBIN "gfx/icons/crystal/staryu.2bpp"
GyaradosCrystalIcon: INCBIN "gfx/icons/crystal/gyarados.2bpp"
SnorlaxCrystalIcon: INCBIN "gfx/icons/crystal/snorlax.2bpp"
