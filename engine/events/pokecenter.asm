DisplayPokemonCenterDialogue_::
	ld a, [wCurMap]
	cp PEWTER_POKECENTER
	jr nz, .regularCenter
	call CheckPikachuFollowingPlayer
	jr z, .regularCenter
	ld hl, LooksContentText ; if pikachu is sleeping, don't heal
	call PrintText
	ret
.regularCenter
; soin express : pas de discours d'accueil ni d'animation de la machine
	call SaveScreenTilesToBuffer1 ; save screen
	ld hl, wStatusFlags4
	set BIT_UNKNOWN_4_1, [hl]
	set BIT_USED_POKECENTER, [hl]
	ld hl, ShallWeHealYourPokemonText
	call PrintText
	call YesNoChoicePokeCenter ; yes/no menu
	call UpdateSprites
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declinedHealing ; if the player chose No
	call SetLastBlackoutMap
	predef HealParty
	ld a, SFX_HEAL_AILMENT
	call PlaySound
	call WaitForSoundToFinish
	ld hl, PokemonFightingFitText
	call PrintText
.declinedHealing
	call LoadScreenTilesFromBuffer1 ; restore screen
.done
	ld hl, PokemonCenterFarewellText
	call PrintText
	call UpdateSprites
	ret

PokemonCenterNurseFacesUp:
	ld a, $1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
	ldh [hSpriteImageIndex], a
	call SetSpriteImageIndex
	ld c, 64
	call DelayFrames
	ret

PokemonCenterUpdateSpriteImageIndex:
	ld a, b
	ldh [hSpriteIndex], a
	ld a, c
	ldh [hSpriteImageIndex], a
	push bc
	call SetSpriteFacingDirectionAndDelay
	pop bc
	ld a, b
	ldh [hSpriteIndex], a
	ld a, c
	ldh [hSpriteImageIndex], a
	call SetSpriteImageIndex
	ret

PokemonCenterWelcomeText:
	text_far _PokemonCenterWelcomeText
	text_end

ShallWeHealYourPokemonText:
	text_pause
	text_far _ShallWeHealYourPokemonText
	text_end

NeedYourPokemonText:
	text_far _NeedYourPokemonText
	text_end

PokemonFightingFitText:
	text_far _PokemonFightingFitText
	text_end

PokemonCenterFarewellText:
	text_pause
	text_far _PokemonCenterFarewellText
	text_end

LooksContentText:
	text_far _LooksContentText
	text_end
