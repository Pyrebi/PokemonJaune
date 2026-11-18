_ItemUseBallText00::
	text "Le #MON a dévié"
	line "la BALL!"

	para "Impossible de"
	line "capturer ce"
	cont "#MON!"
	prompt

_ItemUseBallText01::
	text "Raté! La BALL n'a"
	line "pas touché le"
	cont "#MON!"
	prompt

_ItemUseBallText02::
	text "Zut! Le #MON"
	line "s'est libéré!"
	prompt

_ItemUseBallText03::
	text "Mince! Ca y était"
	line "presque!"
	prompt

_ItemUseBallText04::
	text "Raah! C'était tout"
	line "près!"
	prompt

_ItemUseBallText05::
	text "Et hop!"
	line "@"
	text_ram wEnemyMonNick
	text " est"
	cont "capturé!@"
	text_end

_ItemUseBallText07::
	text_ram wBoxMonNicks
	text " est"
	line "envoyé sur le"
	cont "PC de LEO!"
	prompt

_ItemUseBallText08::
	text_ram wBoxMonNicks
	text " est"
	line "envoyé sur le PC"
	cont "de quelqu'un!"
	prompt

_ItemUseBallText06::
	text "Données ajoutées"
	line "au #DEX pour"
	cont "@"
	text_ram wEnemyMonNick
	text "!@"
	text_end

_SurfingGotOnText::
	text "<PLAYER> monte sur"
	line "@"
	text_ram wNameBuffer
	text "!"
	prompt

_SurfingNoPlaceToGetOffText::
	text "Impossible de"
	line "descendre ici!"
	prompt

_RefusingText::
	text_ram wNameBuffer
	text_start
	line "refuse!"
	prompt

_VitaminStatRoseText::
	text_ram wNameBuffer
	text ":"
	line "@"
	text_ram wStringBuffer
	text " monte."
	prompt

_VitaminNoEffectText::
	text "Ca n'aura aucun"
	line "effet."
	prompt

_ThrewBaitText::
	text "<PLAYER> lance un"
	line "APPAT."
	done

_ThrewRockText::
	text "<PLAYER> lance un"
	line "CAILLOU."
	done

_PlayedFluteNoEffectText::
	text "Tu joues de la"
	line "POKéFLUTE."

	para "Quel air"
	line "entraînant!"
	prompt

_FluteWokeUpText::
	text "Tous les #MON"
	line "endormis se"
	cont "réveillent."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> joue de la"
	line "POKéFLUTE.@"
	text_end

_CoinCaseNumCoinsText::
	text "Jetons"
	line "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " "
	prompt

_ItemfinderFoundItemText::
	text "Oui! Le"
	line "CHERCH'OBJET"
	cont "indique un objet"
	cont "tout près."
	prompt

_ItemfinderFoundNothingText::
	text "Non! Le"
	line "CHERCH'OBJET ne"
	cont "réagit pas."
	prompt

_RaisePPWhichTechniqueText::
	text "Augmenter les PP"
	line "de quelle"
	cont "capacité?"
	done

_RestorePPWhichTechniqueText::
	text "Restaurer les PP"
	line "de quelle"
	cont "capacité?"
	done

_PPMaxedOutText::
	text "Les PP de"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "sont au maximum."
	prompt

_PPIncreasedText::
	text "Les PP de"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "augmentent."
	prompt

_PPRestoredText::
	text "Les PP sont"
	line "restaurés."
	prompt

_BootedUpTMText::
	text "Tu allumes une CT!"
	prompt

_BootedUpHMText::
	text "Tu allumes une CS!"
	prompt

_TeachMachineMoveText::
	text "Elle contient"
	line "@"
	text_ram wStringBuffer
	text "!"

	para "Apprendre"
	line "@"
	text_ram wStringBuffer
	text_start
	cont "à un #MON?"
	done

_MonCannotLearnMachineMoveText::
	text_ram wNameBuffer
	text " n'est"
	line "pas compatible"
	cont "avec @"
	text_ram wStringBuffer
	text "."

	para "Il ne peut pas"
	line "apprendre"
	cont "@"
	text_ram wStringBuffer
	text "."
	prompt

_ItemUseNotTimeText::
	text "CHEN: <PLAYER>! Ce"
	line "n'est pas le"
	cont "moment d'utiliser"
	cont "ça!"
	prompt

_ItemUseNotYoursToUseText::
	text "Ce n'est pas à"
	line "toi!"
	prompt

_ItemUseNoEffectText::
	text "Ca n'aura aucun"
	line "effet."
	prompt

_ThrowBallAtTrainerMonText1::
	text "Le dresseur dévie"
	line "la BALL!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "Voler, c'est mal!"
	prompt

_NoCyclingAllowedHereText::
	text "Vélo interdit"
	next "ici."
	prompt

_NoSurfingHereText::
	text "Pas de SURF avec"
	line "@"
	text_ram wNameBuffer
	text " ici!"
	prompt

_BoxFullCannotThrowBallText::
	text "La BOITE #MON"
	line "est pleine!"
	cont "Impossible"
	cont "d'utiliser cet"
	cont "objet!"
	prompt

_DontHavePokemonText::
	text "Tu n'as pas de"
	line "#MON!"
	prompt

_ItemUseText001::
	text "<PLAYER> utilise@"
	text_end

_ItemUseText002::
	text_ram wStringBuffer
	text "!"
	done

_GotOnBicycleText1::
	text "<PLAYER> monte sur@"
	text_end

_GotOnBicycleText2::
	text "la @"
	text_ram wStringBuffer
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> descend@"
	text_end

_GotOffBicycleText2::
	text "de la @"
	text_ram wStringBuffer
	text "."
	prompt

_ThrewAwayItemText::
	text "Tu jettes"
	line "@"
	text_ram wNameBuffer
	text "."
	prompt

_IsItOKToTossItemText::
	text "Jeter vraiment"
	line "@"
	text_ram wStringBuffer
	text "?"
	prompt

_TooImportantToTossText::
	text "C'est trop"
	line "important pour"
	cont "être jeté!"
	prompt

_AlreadyKnowsText::
	text_ram wNameBuffer
	text " connaît"
	line "déjà @"
	text_ram wStringBuffer
	text "!"
	prompt

_ConnectCableText::
	text "OK, branche le"
	line "câble comme ça!"
	prompt

_TradedForText::
	text "<PLAYER> échange"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " contre"
	cont "@"
	text_ram wInGameTradeReceiveMonName
	text "!@"
	text_end

_WannaTrade1Text::
	text "Je cherche un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "! Tu"

	para "l'échanges contre"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade1Text::
	text "Ooh! Tant pis..."
	done

_WrongMon1Text::
	text "Quoi? Ce n'est pas"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "!"

	para "Si tu en trouves"
	line "un, reviens ici!"
	done

_Thanks1Text::
	text "Hé, merci!"
	done

_AfterTrade1Text::
	text "Il est bien, mon"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_WannaTrade2Text::
	text "Bonjour! Veux-tu"
	line "échanger ton"

	para "@"
	text_ram wInGameTradeGiveMonName
	text_start
	line "contre @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade2Text::
	text "Bon, si tu ne veux"
	line "pas..."
	done

_WrongMon2Text::
	text "Hmmm? Ce n'est pas"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Pense à moi quand"
	line "tu en auras un."
	done

_Thanks2Text::
	text "Merci!"
	done

_AfterTrade2Text::
	text "Bonjour! Ton"
	line "@"
	text_ram wInGameTradeGiveMonName
	text " est"
	cont "magnifique!"
	done

_WannaTrade3Text::
	text "Salut! As-tu un"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "?"

	para "Tu l'échanges"
	line "contre @"
	text_ram wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade3Text::
	text "C'est dommage."
	done

_WrongMon3Text::
	text "...Ce n'est pas"
	line "@"
	text_ram wInGameTradeGiveMonName
	text "."

	para "Si tu en as un,"
	line "échange-le moi!"
	done

_Thanks3Text::
	text "Merci, l'ami!"
	done

_AfterTrade3Text::
	text "Comment va mon"
	line "@"
	text_ram wInGameTradeReceiveMonName
	text "?"

	para "Mon @"
	text_ram wInGameTradeGiveMonName
	text " va"
	line "super bien!"
	done

_NothingToCutText::
	text "Il n'y a rien à"
	line "COUPER!"
	prompt

_UsedCutText::
	text_ram wNameBuffer
	text " utilise"
	line "COUPE!"
	prompt
