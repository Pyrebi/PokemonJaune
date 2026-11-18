_ChampionsRoomRivalIntroText::
	text "<RIVAL>: Hé!"

	para "J'avais hâte de"
	line "te voir, <PLAYER>!"

	para "Mon rival doit"
	line "être fort pour me"
	cont "garder affûté!"

	para "En complétant le"
	line "#DEX, j'ai"
	cont "cherché partout"
	cont "des #MON"
	cont "puissants!"

	para "Et ce n'est pas"
	line "tout, j'ai formé"
	cont "des équipes"
	cont "capables de"
	cont "battre n'importe"
	cont "quel type!"

	para "Et maintenant!"

	para "Je suis le"
	line "champion de la"
	cont "LIGUE #MON!"

	para "<PLAYER>! Tu sais"
	line "ce que ça veut"
	cont "dire?"

	para "Je vais te le"
	line "dire!"

	para "Je suis le"
	line "dresseur le plus"
	cont "puissant du"
	cont "monde!"
	done

_RivalDefeatedText::
	text "NON! C'est"
	line "impossible! Tu as"
	cont "battu mon équipe!"

	para "Après tout ce"
	line "travail pour"
	cont "devenir champion?"

	para "Mon règne est"
	line "déjà fini? C'est"
	cont "pas juste!"
	prompt

_RivalVictoryText::
	text "Hahaha! J'ai"
	line "gagné, j'ai"
	cont "gagné!"

	para "Je suis trop fort"
	line "pour toi,"
	cont "<PLAYER>!"

	para "Tu as bien fait"
	line "d'arriver jusqu'à"
	cont "moi, <RIVAL>, le"
	cont "génie des"
	cont "#MON!"

	para "Bien essayé,"
	line "minable! Hahaha!"
	prompt

_ChampionsRoomRivalAfterBattleText::
	text "Pourquoi?"
	line "Pourquoi ai-je"
	cont "perdu?"

	para "Je n'ai jamais"
	line "fait d'erreur en"
	cont "élevant mes"
	cont "#MON..."

	para "Zut! Tu es le"
	line "nouveau champion"
	cont "de la LIGUE"
	cont "#MON!"

	para "Même si ça"
	line "m'embête de"
	cont "l'admettre."
	done

_ChampionsRoomOakText::
	text "CHEN: <PLAYER>!"
	done

_ChampionsRoomOakCongratulatesPlayerText::
	text "CHEN: Bravo!"
	line "Félicitations!"
	cont "Tu es le nouveau"
	cont "champion de la"
	cont "LIGUE #MON!"

	para "Tu as tellement"
	line "grandi depuis que"
	cont "tu es parti avec"
	cont "@"
	text_ram wNameBuffer
	text "!"

	para "<PLAYER>, tu es"
	line "devenu adulte!"
	done

_ChampionsRoomOakDisappointedWithRivalText::
	text "CHEN: <RIVAL>! Tu"
	line "me déçois!"

	para "Je suis venu en"
	line "apprenant que tu"
	cont "avais battu le"
	cont "CONSEIL 4!"

	para "Mais à mon"
	line "arrivée, tu avais"
	cont "déjà perdu!"

	para "<RIVAL>!"
	line "Comprends-tu"
	cont "pourquoi tu as"
	cont "perdu?"

	para "Tu as oublié de"
	line "traiter tes"
	cont "#MON avec"
	cont "confiance et"
	cont "amour!"

	para "Sans cela, tu ne"
	line "redeviendras"
	cont "jamais champion!"
	done

_ChampionsRoomOakComeWithMeText::
	text "CHEN: <PLAYER>!"

	para "Tu comprends que"
	line "ta victoire n'est"
	cont "pas seulement ton"
	cont "oeuvre!"

	para "Le lien qui"
	line "t'unit à tes"
	cont "#MON est"
	cont "merveilleux!"

	para "<PLAYER>! Viens"
	line "avec moi!"
	done
