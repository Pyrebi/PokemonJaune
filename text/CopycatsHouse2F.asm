_CopycatsHouse2FCopycatDoYouLikePokemonText::
	text "<PLAYER>: Salut! Tu"
	line "aimes les #MON?"

	para "<PLAYER>: Euh non,"
	line "c'est moi qui"
	cont "demandais."

	para "<PLAYER>: Hein?"
	line "T'es bizarre!"

	para "COPIEUSE: Hmm?"
	line "Arrêter d'imiter?"

	para "Mais c'est mon"
	line "passe-temps"
	cont "préféré!"
	prompt

_CopycatsHouse2FCopycatTM31PreReceiveText::
	text "Oh waouh! Une"
	line "POKéPOUPEE!"

	para "Pour moi? Merci!"

	para "Alors, prends"
	line "ceci!"
	prompt

_CopycatsHouse2FCopycatReceivedTM31Text::
	text "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation1Text::
	text_start

	para "La CT31 contient"
	line "mon favori, COPIE!"

	para "Utilise-la sur un"
	line "bon #MON!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation2Text::
	text "<PLAYER>: Salut!"
	line "Merci pour la"
	cont "CT31!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: C'est si"
	line "drôle d'imiter"
	cont "tout ce que je"
	cont "fais?"

	para "COPIEUSE: Et"
	line "comment! C'est"
	cont "trop marrant!"
	done

_CopycatsHouse2FCopycatTM31NoRoomText::
	text "Tu n'en veux pas?@"
	text_end

_CopycatsHouse2FDoduoText::
	text "DODUO: Giiih!"

	para "MIROIR, MON BEAU"
	line "MIROIR, DIS-MOI"
	cont "QUI EST LA PLUS"
	cont "BELLE?"
	done

_CopycatsHouse2FRareDollText::
	text "C'est un #MON"
	line "rare! Hein? Ce"
	cont "n'est qu'une"
	cont "poupée!"
	done

_CopycatsHouse2FSNESText::
	text "Un jeu où MARIO"
	line "porte un seau sur"
	cont "la tête!"
	done

_CopycatsHouse2FPCMySecretsText::
	text "..."

	para "Mes Secrets!"

	para "Talent: Imitation!"
	line "Passe-temps:"
	cont "Collectionner des"
	cont "poupées! #MON"
	cont "préféré: MELOFEE!"
	done

_CopycatsHouse2FPCCantSeeText::
	text "Hein? On ne voit"
	line "rien!"
	done
