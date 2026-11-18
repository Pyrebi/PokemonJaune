_SafariZoneSecretHouseFishingGuruYouHaveWonText::
	text "Ah! Enfin!"

	para "Tu es le premier à"
	line "atteindre la"
	cont "MAISON SECRETE!"

	para "Je commençais à"
	line "craindre que"
	cont "personne ne gagne"
	cont "notre lot."

	para "Félicitations! Tu"
	line "as gagné!"
	prompt

_SafariZoneSecretHouseFishingGuruReceivedHM03Text::
	text "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SafariZoneSecretHouseFishingGuruHM03ExplanationText::
	text "La CS03 contient"
	line "SURF!"

	para "Les #MON"
	line "pourront te"
	cont "transporter sur"
	cont "l'eau!"

	para "Et cette CS n'est"
	line "pas jetable! Tu"
	cont "peux l'utiliser"
	cont "encore et encore!"

	para "Tu as beaucoup de"
	line "chance d'avoir"
	cont "gagné ce fabuleux"
	cont "lot!"
	done

_SafariZoneSecretHouseFishingGuruHM03NoRoomText::
	text "Tu n'as pas de"
	line "place pour ce"
	cont "fabuleux lot!"
	done
