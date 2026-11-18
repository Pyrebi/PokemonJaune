_BluesHouseDaisyRivalAtLabText::
	text "Salut <PLAYER>!"
	line "<RIVAL> est au"
	cont "labo de"
	cont "Grand-père."
	done

_BluesHouseDaisyOfferMapText::
	text "Grand-père t'a"
	line "confié une"
	cont "course? Tiens,"
	cont "ceci va t'aider!"
	prompt

_GotMapText::
	text "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_BluesHouseDaisyBagFullText::
	text "Tu portes trop de"
	line "choses."
	done

_BluesHouseDaisyUseMapText::
	text "Utilise la CARTE"
	line "pour savoir où tu"
	cont "es."
	done

_BluesHouseDaisyWalkingText::
	text "Passer du temps"
	line "avec tes #MON"
	cont "les rend plus"
	cont "amicaux."
	done

_BluesHouseTownMapText::
	text "C'est une grande"
	line "carte! Très"
	cont "utile!"
	done
