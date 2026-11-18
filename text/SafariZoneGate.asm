_SafariZoneGateSafariZoneWorker1Text::
	text "Bienvenue au PARC"
	line "SAFARI!"
	done

_SafariZoneGateSafariZoneWorker1LeavingEarlyText::
	text "Tu pars déjà?@"
	text_end

_SafariZoneGateSafariZoneWorker1ReturnSafariBallsText::
	text "Rends-nous les"
	line "SAFARI BALLS"
	cont "qu'il te reste."
	done

_SafariZoneGateSafariZoneWorker1GoodLuckText::
	text "Bonne chance!"
	done

_SafariZoneGateSafariZoneWorker1GoodHaulComeAgainText::
	text "Bonne pêche?"
	line "Reviens quand tu"
	cont "veux!"
	done

_SafariZoneGateSafariZoneWorker1WouldYouLikeToJoinText::
	text "Pour seulement"
	line "¥500, tu peux"
	cont "attraper autant"
	cont "de #MON que tu"
	cont "veux dans le"
	cont "parc!"

	para "Tu veux"
	line "participer à la"
	cont "chasse?@"
	text_end

_SafariZoneGateSafariZoneWorker1ThatllBe500PleaseText::
	text "Ca fera ¥@"
	text_bcd wPriceTemp, $c3
	text ","
	line "s'il te plaît!"

	para "Nous n'utilisons"
	line "que des BALLS"
	cont "spéciales ici."

	para "<PLAYER> reçoit"
	line "30 SAFARI BALLS!@"
	text_end

_SafariZoneGateSafariZoneWorker1CallYouOnThePAText::
	text_start

	para "On t'appellera"
	line "au haut-parleur à"
	cont "la fin du temps"
	cont "des SAFARI BALLS!"
	done

_SafariZoneGateSafariZoneWorker1PleaseComeAgainText::
	text "OK! Reviens quand"
	line "tu veux!"
	done

_SafariZoneGateSafariZoneWorker1NotEnoughMoneyText::
	text "Oups! Pas assez"
	line "d'argent!"
	done

_SafariZoneGateSafariZoneWorker2FirstTimeHereText::
	text "Salut! C'est ta"
	line "première visite?"
	done

_SafariZoneGateSafariZoneWorker2SafariZoneExplanationText::
	text "Le PARC SAFARI a"
	line "4 zones."

	para "Chaque zone a des"
	line "#MON"
	cont "différents."
	cont "Utilise les"
	cont "SAFARI BALLS pour"
	cont "les attraper!"

	para "Quand le temps ou"
	line "les SAFARI BALLS"
	cont "sont épuisés, la"
	cont "partie est finie!"

	para "Avant d'y aller,"
	line "ouvre une BOITE"
	cont "#MON vide pour"
	cont "avoir de la"
	cont "place!"
	done

_SafariZoneGateSafariZoneWorker2YoureARegularHereText::
	text "Désolé, tu es un"
	line "habitué!"
	done

_SafariZoneLowCostText1::
	text_start

	para "Bon, d'accord,"
	line "paie ce que tu as"
	prompt

_SafariZoneLowCostText2::
	text "Mais je ne peux"
	line "pas te donner les"
	cont "30 BALLS."
	done

_SafariZoneLowCostText3::
	text_start

	para "Tu es tenace,"
	line "hein?"

	para "OK, tu entres"
	line "gratis, mais"
	cont "cette fois-ci!@"
	text_end

_SafariZoneLowCostText4::
	text_start
	done

_SafariZoneLowCostText5::
	text "Désolé, mais"
	line "l'entrée est"
	cont "payante."
	done

_SafariZoneLowCostText6::
	text "Tu ne peux pas"
	line "entrer sans"
	cont "payer!"
	done

_SafariZoneLowCostText7::
	text "J'ai dit: pas"
	line "d'argent, pas"
	cont "d'entrée!"
	done

_SafariZoneLowCostText8::
	text "Lis sur mes"
	line "lèvres: NON!"
	cont "Compris?"
	done
