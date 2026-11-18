_Route1Youngster1MartSampleText::
	text "Salut! Je"
	line "travaille dans"
	cont "une BOUTIQUE"
	cont "#MON."

	para "C'est une"
	line "boutique"
	cont "pratique, alors"
	cont "viens nous voir à"
	cont "JADIELLE."

	para "Tiens, je vais te"
	line "donner un"
	cont "échantillon!"
	cont "Voilà!"
	prompt

_Route1Youngster1GotPotionText::
	text "<PLAYER> obtient"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "Nous vendons"
	line "aussi des POKé"
	cont "BALLS pour"
	cont "attraper des"
	cont "#MON!"
	done

_Route1Youngster1NoRoomText::
	text "Tu portes trop de"
	line "choses!"
	done

_Route1Youngster2Text::
	text "Tu vois ces"
	line "corniches le long"
	cont "de la route?"

	para "Ca fait un peu"
	line "peur, mais tu"
	cont "peux sauter en"
	cont "bas."

	para "Tu reviendras"
	line "plus vite à BOURG"
	cont "PALETTE comme ça."
	done

_Route1SignText::
	text "ROUTE 1 BOURG"
	line "PALETTE -"
	cont "JADIELLE"
	done
