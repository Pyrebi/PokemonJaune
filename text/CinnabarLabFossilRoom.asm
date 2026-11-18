_CinnabarLabFossilRoomScientist1Text::
	text "Salut!"

	para "Moi grand docteur"
	line "important!"

	para "Moi étudier ici"
	line "fossiles de"
	cont "#MON rares!"

	para "Toi! Toi avoir"
	line "fossile pour moi?"
	prompt

_CinnabarLabFossilRoomScientist1NoFossilsText::
	text "Non! Trop"
	line "dommage!"
	done

_CinnabarLabFossilRoomScientist1GoForAWalkText::
	text "Moi prendre un"
	line "peu de temps!"

	para "Toi aller te"
	line "promener un peu!"
	done

_CinnabarLabFossilRoomScientist1FossilIsBackToLifeText::
	text "Où étais-tu?"

	para "Ton fossile est"
	line "revenu à la vie!"

	para "C'était @"
	text_ram wStringBuffer
	text_start
	line "comme je pensais!"
	prompt

_CinnabarLabFossilRoomScientist1SeesFossilText::
	text "Oh! C'est"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "C'est un fossile"
	line "de @"
	text_ram wStringBuffer
	text ", un"
	cont "#MON qui a"
	cont "disparu!"

	para "Ma Machine de"
	line "Résurrection va"
	cont "rendre la vie"
	cont "à ce #MON!"
	done

_CinnabarLabFossilRoomScientist1TakesFossilText::
	text "Alors! Vite, toi"
	line "me donner ça!"

	para "<PLAYER> donne"
	line "@"
	text_ram wNameBuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1GoForAWalkText2::
	text "Moi prendre un"
	line "peu de temps!"

	para "Toi aller te"
	line "promener un peu!"
	done

_CinnabarLabFossilRoomScientist1ComeAgainText::
	text "Aïe! Toi revenir!"
	done
