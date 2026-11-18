_Route12SuperRodHouseFishingGuruDoYouLikeToFishText::
	text "Je suis le frère"
	line "du MAITRE PECHEUR!"

	para "J'adoooore la"
	line "pêche!"

	para "Tu aimes pêcher?"
	done

_Route12SuperRodHouseFishingGuruReceivedSuperRodText::
	text "Formidable! J'aime"
	line "ton style!"

	para "Prends ceci et"
	line "pêche, petit!"

	para "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route12SuperRodHouseFishingGuruFishingWayOfLifeText::
	text_start

	para "La pêche, c'est"
	line "un art de vivre!"

	para "Des mers aux"
	line "rivières, pars"
	cont "attraper le gros"
	cont "poisson!"
	done

_Route12SuperRodHouseFishingGuruThatsDisappointingText::
	text "Oh... Quelle"
	line "déception..."
	done

_Route12SuperRodHouseFishingGuruTryFishingText::
	text "Bonjour, <PLAYER>!"

	para "Utilise la MEGA"
	line "CANNE dans"
	cont "n'importe quelle"
	cont "eau! Tu peux"
	cont "attraper toutes"
	cont "sortes de #MON."

	para "Pêche partout où"
	line "tu peux!"
	done

_Route12SuperRodHouseFishingGuruNoRoomText::
	text "Oh non!"

	para "J'avais un cadeau"
	line "pour toi, mais tu"
	cont "n'as pas de place!"
	done
