_CableClubNPCPleaseWaitText::
	text "Patiente.@"
	text_end

_CableClubNPCLinkClosedBecauseOfInactivityText::
	vc_patch Change_link_closed_inactivity_message
IF DEF(_YELLOW_VC)
	text "Please come again!"
	done
	text_start
	db   "osed because of"
	cont "inactivity."
ELSE
	text "Connexion coupée"
	line "pour cause"
	cont "d'inactivité."
ENDC
	vc_patch_end

	para "Contacte ton ami"
	line "et reviens nous"
	cont "voir!"
	done

_CableClubNPCPleaseComeAgainText::
	text "Reviens quand tu"
	line "veux!"
	done

_CableClubNPCMakingPreparationsText::
	text "Nous faisons les"
	line "préparatifs."
	cont "Patiente."
	done

_FlashLightsAreaText::
	text "Un FLASH"
	line "aveuglant éclaire"
	cont "les lieux!"
	prompt

_WarpToLastPokemonCenterText::
	text "Retour au dernier"
	line "CENTRE #MON."
	done

_CannotUseTeleportNowText::
	text_ram wNameBuffer
	text " ne"
	line "peut pas utiliser"
	cont "TELEPORT ici."
	prompt

_CannotFlyHereText::
	text_ram wNameBuffer
	text " ne"
	line "peut pas VOLER"
	cont "ici."
	prompt

_NotHealthyEnoughText::
	text "Pas assez en"
	line "forme."
	prompt

_NewBadgeRequiredText::
	text "Non! Il faut un"
	line "nouveau BADGE."
	prompt

_CannotUseItemsHereText::
	text "Tu ne peux pas"
	line "utiliser d'objet"
	cont "ici."
	prompt

_CannotGetOffHereText::
	text "Tu ne peux pas"
	line "descendre ici."
	prompt

_UsedStrengthText::
	text_ram wNameBuffer
	text " utilise"
	line "FORCE.@"
	text_end

_CanMoveBouldersText::
	text_ram wNameBuffer
	text " peut"
	line "déplacer les"
	cont "rochers."
	prompt

_CurrentTooFastText::
	text "Le courant est"
	line "bien trop fort!"
	prompt

_CyclingIsFunText::
	text "Le vélo, c'est"
	line "génial! Oublie le"
	cont "SURF!"
	prompt

_GotMonText::
	text "<PLAYER> obtient"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_SentToBoxText::
	text "Plus de place"
	line "pour les #MON!"
	cont "@"
	text_ram wBoxMonNicks
	text " est"
	cont "envoyé dans la"
	cont "BOITE @"
	text_ram wStringBuffer
	text " du PC!"
	done

_BoxIsFullText::
	text "Plus de place"
	line "pour les #MON!"

	para "La BOITE #MON"
	line "est pleine!"

	para "Change de BOITE"
	line "dans un CENTRE"
	cont "#MON!"
	done
