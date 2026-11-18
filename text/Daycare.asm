_DaycareGentlemanIntroText::
	text "Je tiens une"
	line "PENSION. Veux-tu"
	cont "que j'élève un de"
	cont "tes #MON?"
	done

_DaycareGentlemanWhichMonText::
	text "Quel #MON"
	line "dois-je élever?"
	prompt

_DaycareGentlemanWillLookAfterMonText::
	text "Bien, je m'occupe"
	line "de @"
	text_ram wNameBuffer
	text_start
	cont "quelque temps."
	prompt

_DaycareGentlemanComeSeeMeInAWhileText::
	text "Reviens me voir"
	line "dans un moment."
	done

_DaycareGentlemanMonHasGrownText::
	text "Ton @"
	text_ram wNameBuffer
	text_start
	line "a bien grandi!"

	para "Il a gagné"
	line "@"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text " niveaux!"

	para "Doué, hein?"
	prompt

_DaycareGentlemanOweMoneyText::
	text "Tu me dois ¥@"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "pour récupérer"
	cont "ce #MON."
	done

_DaycareGentlemanGotMonBackText::
	text "<PLAYER> récupère"
	line "@"
	text_ram wDayCareMonName
	text "!"
	done

_DaycareGentlemanMonNeedsMoreTimeText::
	text "Déjà de retour?"
	line "Ton @"
	text_ram wNameBuffer
	text_start
	cont "a encore besoin"
	cont "de temps ici."
	prompt

_DaycareGentlemanAllRightThenText::
	text "Très bien,"
	line "@"
	text_end

_DaycareGentlemanComeAgainText::
	text "Reviens quand tu"
	line "veux."
	done

_DaycareGentlemanNoRoomForMonText::
	text "Tu n'as pas de"
	line "place pour ce"
	cont "#MON!"
	done

_DaycareGentlemanOnlyHaveOneMonText::
	text "Tu n'as qu'un"
	line "seul #MON avec"
	cont "toi."
	done

_DaycareGentlemanCantAcceptMonWithHMText::
	text "Je ne peux pas"
	line "accepter un"
	cont "#MON qui"
	cont "connaît une"
	cont "capacité CS."
	done

_DaycareGentlemanHeresYourMonText::
	text "Merci! Voici ton"
	line "#MON!"
	prompt

_DaycareGentlemanNotEnoughMoneyText::
	text "Hé, tu n'as pas"
	line "assez d'argent!"
	done
