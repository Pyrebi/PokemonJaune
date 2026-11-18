_NameRatersHouseNameRaterWantMeToRateText::
	text "Bonjour, bonjour!"
	line "Je suis le JUGE"
	cont "DES NOMS officiel!"

	para "Veux-tu que je"
	line "juge les surnoms"
	cont "de tes #MON?"
	done

_NameRatersHouseNameRaterWhichPokemonText::
	text "Quel #MON"
	line "dois-je examiner?"
	prompt

_NameRatersHouseNameRaterGiveItANiceNameText::
	text_ram wNameBuffer
	text ", c'est ça?"
	line "C'est un surnom"
	cont "correct!"

	para "Mais veux-tu que"
	line "je lui donne un"
	cont "nom plus joli?"

	para "Qu'en dis-tu?"
	done

_NameRatersHouseNameRaterWhatShouldWeNameItText::
	text "Bien! Comment"
	line "allons-nous"
	cont "l'appeler?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "OK! Ce #MON"
	line "s'appelle"
	cont "@"
	text_ram wBuffer
	text "!"

	para "C'est un meilleur"
	line "nom qu'avant!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "Bien! Reviens"
	line "quand tu veux!"
	done

_NameRatersHouseNameRaterATrulyImpeccableNameText::
	text_ram wNameBuffer
	text ", c'est ça?"
	line "C'est un nom"
	cont "vraiment parfait!"

	para "Prends bien soin"
	line "de @"
	text_ram wNameBuffer
	text "!"
	done
