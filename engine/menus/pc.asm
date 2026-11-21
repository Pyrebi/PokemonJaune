ActivatePC::
	call SaveScreenTilesToBuffer2
	ld a, SFX_TURN_ON_PC
	call PlaySound
	ld hl, TurnedOnPC1Text
	call PrintText
	call WaitForSoundToFinish
	farcall GivePCStarMons
	ld hl, wMiscFlags
	set BIT_USING_GENERIC_PC, [hl]
	call LoadScreenTilesFromBuffer2
	call Delay3
PCMainMenu:
	farcall DisplayPCMainMenu
	ld hl, wMiscFlags
	set BIT_NO_MENU_BUTTON_SOUND, [hl]
	call HandleMenuInput
	bit B_PAD_B, a
	jp nz, LogOff
; entrées : 0 LEO, 1 joueur, 2 maître des capacités, 3 soins,
; puis [CHEN], [LIGUE], déconnexion
	ld a, [wCurrentMenuItem]
	and a
	jp z, BillsPC
	cp 1
	jr z, .playersPC
	cp 2
	jr z, MoveRelearner
	ld b, a
	cp 3
	jr z, HealFromPC
	ld a, [wMaxMenuItem]
	cp b ; dernière entrée = déconnexion
	jp z, LogOff
	ld a, b
	cp 4
	jp z, OaksPC
	jp PKMNLeague
.playersPC
	ld hl, wMiscFlags
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	set BIT_USING_GENERIC_PC, [hl]
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	ld hl, AccessedMyPCText
	call PrintText
	farcall PlayerPC
	jr ReloadMainMenu
MoveRelearner:
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	farcall MoveRelearnerPC
	jr ReloadMainMenu
HealFromPC:
	predef HealParty
	ld a, SFX_HEAL_AILMENT
	call PlaySound
	call WaitForSoundToFinish
	ld hl, PCHealedText
	call PrintText
	jr ReloadMainMenu
OaksPC:
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	farcall OpenOaksPC
	jr ReloadMainMenu
PKMNLeague:
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	farcall PKMNLeaguePC
	jr ReloadMainMenu
BillsPC:
	ld a, SFX_ENTER_PC
	call PlaySound
	call WaitForSoundToFinish
	CheckEvent EVENT_MET_BILL
	jr nz, .billsPC ;if you've met bill, use that bill's instead of someone's
	ld hl, AccessedSomeonesPCText
	jr .printText
.billsPC
	ld hl, AccessedBillsPCText
.printText
	call PrintText
	farcall BillsPC_
ReloadMainMenu:
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call ReloadMapData
	call UpdateSprites
	jp PCMainMenu
LogOff:
	ld a, SFX_TURN_OFF_PC
	call PlaySound
	call WaitForSoundToFinish
	ld hl, wMiscFlags
	res BIT_USING_GENERIC_PC, [hl]
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	ret

TurnedOnPC1Text:
	text_far _TurnedOnPC1Text
	text_end

AccessedBillsPCText:
	text_far _AccessedBillsPCText
	text_end

AccessedSomeonesPCText:
	text_far _AccessedSomeonesPCText
	text_end

PCHealedText:
	text_far _PCHealedText
	text_end

AccessedMyPCText:
	text_far _AccessedMyPCText
	text_end

; removes one of the specified item ID [hItemToRemoveID] from bag (if existent)
RemoveItemByID::
	ld hl, wBagItems
	ldh a, [hItemToRemoveID]
	ld b, a
	xor a
	ldh [hItemToRemoveIndex], a
.loop
	ld a, [hli]
	cp -1 ; reached terminator?
	ret z
	cp b
	jr z, .foundItem
	inc hl
	ldh a, [hItemToRemoveIndex]
	inc a
	ldh [hItemToRemoveIndex], a
	jr .loop
.foundItem
	ld a, $1
	ld [wItemQuantity], a
	ldh a, [hItemToRemoveIndex]
	ld [wWhichPokemon], a
	ld hl, wNumBagItems
	jp RemoveItemFromInventory
