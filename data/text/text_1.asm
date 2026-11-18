_CardKeySuccessText1::
	text "Bingo!@"
	text_end

_CardKeySuccessText2::
	text_start
	line "La CARTE MAGN."
	cont "a ouvert la porte!"
	done

_CardKeyFailText::
	text "Zut! Il faut une"
	line "CARTE MAGN.!"
	done

_TrainerNameText::
	text_ram wNameBuffer
	text ": @"
	text_end

_NoNibbleText::
	text "Pas la moindre"
	line "touche!"
	prompt

_NothingHereText::
	text "On dirait qu'il"
	line "n'y a rien ici."
	prompt

_ItsABiteText::
	text "Oh! Ca mord!"
	prompt

_ExclamationText::
	text "!"
	done

_GroundRoseText::
	text "Le sol s'est"
	line "soulevé quelque"
	cont "part!"
	done

_BoulderText::
	text "Il faut la"
	line "capacité FORCE"
	cont "pour le déplacer!"
	done

_MartSignText::
	text "Tout pour vos"
	line "besoins! BOUTIQUE"
	cont "#MON"
	done

_PokeCenterSignText::
	text "Soignez vos"
	line "#MON! CENTRE"
	cont "#MON"
	done

_FoundItemText::
	text "<PLAYER> trouve"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_NoMoreRoomForItemText::
	text "Plus de place pour"
	line "les objets!"
	done

_OaksAideHiText::
	text "Salut! Tu te"
	line "souviens de moi?"
	cont "L'assistant du"
	cont "PROF.CHEN!"

	para "Si tu as attrapé"
	line "@"
	text_decimal hOaksAideRequirement, 1, 3
	text " sortes de"
	cont "#MON, je dois"
	cont "te donner:"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "!"

	para "Alors, <PLAYER>!"
	line "As-tu attrapé au"
	cont "moins @"
	text_decimal hOaksAideRequirement, 1, 3
	text " sortes"
	cont "de #MON?"
	done

_OaksAideUhOhText::
	text "Voyons..."
	line "Oh oh! Tu n'as"
	cont "attrapé que @"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text_start
	cont "sortes de #MON!"

	para "Il en faut @"
	text_decimal hOaksAideRequirement, 1, 3
	text_start
	line "pour avoir:"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_OaksAideComeBackText::
	text "Oh. Je vois."

	para "Quand tu en auras"
	line "@"
	text_decimal hOaksAideRequirement, 1, 3
	text ", reviens"
	cont "chercher:"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_OaksAideHereYouGoText::
	text "Super! Tu as"
	line "attrapé @"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " sortes"
	cont "de #MON!"
	cont "Félicitations!"

	para "Tiens, voilà!"
	prompt

_OaksAideGotItemText::
	text "<PLAYER> reçoit"
	line "@"
	text_ram wOaksAideRewardItemName
	text "!@"
	text_end

_OaksAideNoRoomText::
	text "Oh! Tu n'as plus"
	line "de place pour:"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_NurseChanseyText::
	text "LEVEINARD:"
	line "Leveiii!"
	done
