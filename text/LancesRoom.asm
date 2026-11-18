_LancesRoomLanceBeforeBattleText::
	text "Ah! J'ai entendu"
	line "parler de toi,"
	cont "<PLAYER>!"

	para "Je dirige le"
	line "CONSEIL 4!"
	cont "Appelle-moi"
	cont "PETER, le"
	cont "dresseur de"
	cont "dragons!"

	para "Tu sais que les"
	line "dragons sont des"
	cont "#MON"
	cont "mythiques!"

	para "Ils sont durs à"
	line "attraper et à"
	cont "élever, mais leur"
	cont "puissance est"
	cont "supérieure!"

	para "Ils sont"
	line "quasiment"
	cont "indestructibles!"

	para "Alors, prêt à"
	line "perdre?"

	para "Ton défi de la"
	line "LIGUE s'arrête"
	cont "avec moi,"
	cont "<PLAYER>!"
	done

_LancesRoomLanceEndBattleText::
	text "C'est fini!"

	para "Je déteste"
	line "l'admettre, mais"
	cont "tu es un maître"
	cont "#MON!"
	prompt

_LancesRoomLanceAfterBattleText::
	text "Je n'arrive"
	line "toujours pas à"
	cont "croire que mes"
	cont "dragons ont"
	cont "perdu, <PLAYER>!"

	para "Tu es maintenant"
	line "le champion de la"
	cont "LIGUE #MON!"

	para "...Enfin, tu"
	line "l'aurais été,"
	cont "mais il te reste"
	cont "un défi."

	para "Tu dois affronter"
	line "un autre"
	cont "dresseur! Son nom"
	cont "est..."

	para "<RIVAL>! Il a"
	line "battu le CONSEIL"
	cont "4 avant toi!"

	para "C'est lui le vrai"
	line "champion de la"
	cont "LIGUE #MON!@"
	text_end
