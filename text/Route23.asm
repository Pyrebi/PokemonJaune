_Route23YouDontHaveTheBadgeYetText::
	text "Tu ne passes que"
	line "si tu as"
	cont "le @"
	text_ram wNameBuffer
	text "!"

	para "Tu n'as pas"
	line "le @"
	text_ram wNameBuffer
	text "!"

	para "Il te le faut"
	line "aller à la"
	cont "LIGUE #MON!@"
	text_end

_Route23OhThatIsTheBadgeText::
	text "Tu ne passes que"
	line "si tu as"
	cont "le @"
	text_ram wNameBuffer
	text "!"

	para "Oh! C'est bien le"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_Route23GoRightAheadText::
	text_start

	para "Très bien!"
	line "Tu peux passer!"
	done

_Route23VictoryRoadGateSignText::
	text "PORTE DE LA ROUTE"
	line "VICTOIRE - LIGUE"
	cont "#MON"
	done
