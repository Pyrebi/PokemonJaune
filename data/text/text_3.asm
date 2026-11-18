_EnemyAppearedText::
	text_ram wEnemyMonNick
	text_start
	line "apparaît!"
	prompt

_TrainerWantsToFightText::
	text_ram wTrainerName
	text " veut"
	line "se battre!"
	prompt

_UnveiledGhostText::
	text "Le SCOPE SYLPHE"
	line "révèle l'identité"
	cont "du SPECTRE!"
	prompt

_GhostCantBeIDdText::
	text "Zut! Impossible"
	line "d'identifier le"
	cont "SPECTRE!"
	prompt

_GoText::
	text "Go! @"
	text_end

_DoItText::
	text "Vas-y! @"
	text_end

_GetmText::
	text "Fonce! @"
	text_end

_EnemysWeakText::
	text "L'ennemi faiblit!"
	line "Fonce! @"
	text_end

_PlayerMon1Text::
	text_ram wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	text_ram wBattleMonNick
	text " @"
	text_end

_EnoughText::
	text "assez!@"
	text_end

_OKExclamationText::
	text "OK!@"
	text_end

_GoodText::
	text "bien!@"
	text_end

_ComeBackText::
	text_start
	line "Reviens!"
	done

; money related
_PickUpPayDayMoneyText::
	text "<PLAYER> ramasse"
	line "¥@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

_ClearSaveDataText::
	text "Effacer toutes"
	line "les données?"
	done

_WhichFloorText::
	text "Quel étage"
	line "veux-tu?"
	done

_SleepingPikachuText1::
	text "Aucune"
	line "réaction..."
	prompt

_PartyMenuNormalText::
	text "Choisis un"
	line "#MON."
	done

_PartyMenuItemUseText::
	text "Sur quel #MON?"
	done

_PartyMenuBattleText::
	text "Envoyer quel"
	line "#MON?"
	done

_PartyMenuUseTMText::
	text "Apprendre à quel"
	line "#MON?"
	done

_PartyMenuSwapMonText::
	text "Déplacer où?"
	done

_PotionText::
	text_ram wNameBuffer
	text_start
	line "récupère @"
	text_decimal wHPBarHPDifference, 2, 3
	text " PV!"
	done

_AntidoteText::
	text_ram wNameBuffer
	text " est"
	line "guéri du poison!"
	done

_ParlyzHealText::
	text_ram wNameBuffer
	text " n'est"
	line "plus paralysé!"
	done

_BurnHealText::
	text_ram wNameBuffer
	text " n'est"
	line "plus brûlé!"
	done

_IceHealText::
	text_ram wNameBuffer
	text " est"
	line "dégelé!"
	done

_AwakeningText::
	text_ram wNameBuffer
	text_start
	line "se réveille!"
	done

_FullHealText::
	text_ram wNameBuffer
	text " est"
	line "en pleine santé!"
	done

_ReviveText::
	text_ram wNameBuffer
	text_start
	line "est ranimé!"
	done

_RareCandyText::
	text_ram wNameBuffer
	text " monte"
	line "au niveau @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_RelearnerNoMovesText::
	text "Ce #MON n'a"
	line "aucune capacité à"
	cont "apprendre ici."
	prompt

_RelearnerWhichMoveText::
	text "Quelle capacité"
	line "apprendre?"
	done

_TurnedOnPC1Text::
	text "<PLAYER> allume le"
	line "PC."
	prompt

_AccessedBillsPCText::
	text "Connexion au PC"
	line "de LEO."

	para "Système de"
	line "stockage #MON"
	cont "ouvert."
	prompt

_AccessedSomeonesPCText::
	text "Connexion au PC"
	line "de quelqu'un."

	para "Système de"
	line "stockage #MON"
	cont "ouvert."
	prompt

_AccessedMyPCText::
	text "Connexion à ton"
	line "PC."

	para "Système de"
	line "stockage d'objets"
	cont "ouvert."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> allume le"
	line "PC."
	prompt

_WhatDoYouWantText::
	text "Que veux-tu"
	line "faire?"
	done

_WhatToDepositText::
	text "Que veux-tu"
	line "stocker?"
	done

_DepositHowManyText::
	text "Combien?"
	done

_ItemWasStoredText::
	text_ram wNameBuffer
	text " est"
	line "stocké sur le PC."
	prompt

_NothingToDepositText::
	text "Tu n'as rien à"
	line "stocker."
	prompt

_NoRoomToStoreText::
	text "Plus de place"
	line "pour stocker des"
	cont "objets."
	prompt

_WhatToWithdrawText::
	text "Que veux-tu"
	line "retirer?"
	done

_WithdrawHowManyText::
	text "Combien?"
	done

_WithdrewItemText::
	text "Tu retires"
	line "@"
	text_ram wNameBuffer
	text "."
	prompt

_NothingStoredText::
	text "Il n'y a rien de"
	line "stocké."
	prompt

_CantCarryMoreText::
	text "Tu ne peux plus"
	line "porter d'objets."
	prompt

_WhatToTossText::
	text "Que veux-tu"
	line "jeter?"
	done

_TossHowManyText::
	text "Combien?"
	done

_AccessedHoFPCText::
	text "Connexion au site"
	line "de la LIGUE"
	cont "#MON."

	para "Liste du PANTHEON"
	line "ouverte."
	prompt

_SleepingPikachuText2::
	text "Aucune"
	line "réaction..."
	prompt

_SwitchOnText::
	text "Allumage!"
	prompt

_WhatText::
	text "Quoi?"
	done

_DepositWhichMonText::
	text "Stocker quel"
	line "#MON?"
	done

_MonWasStoredText::
	text_ram wStringBuffer
	text " est"
	line "dans la BOITE @"
	text_ram wBoxNumString
	text "."
	prompt

_CantDepositLastMonText::
	text "Impossible de"
	line "stocker ton"
	cont "dernier #MON!"
	prompt

_BoxFullText::
	text "Oups! Cette BOITE"
	line "est pleine."
	prompt

_MonIsTakenOutText::
	text_ram wStringBuffer
	text " est"
	line "retiré."
	cont "Tu obtiens"
	cont "@"
	text_ram wStringBuffer
	text "."
	prompt

_NoMonText::
	text "Quoi? Il n'y a"
	line "aucun #MON"
	cont "ici!"
	prompt

_CantTakeMonText::
	text "Tu ne peux plus"
	line "prendre de"
	cont "#MON."

	para "Stocke d'abord"
	line "des #MON."
	prompt

_PikachuUnhappyText::
	text_ram wNameBuffer
	text " n'a"
	line "pas l'air ravi!"
	prompt

_ReleaseWhichMonText::
	text "Relâcher quel"
	line "#MON?"
	done

_OnceReleasedText::
	text "Une fois relâché,"
	line "@"
	text_ram wStringBuffer
	text " sera"
	cont "perdu. D'accord?"
	done

_MonWasReleasedText::
	text_ram wStringBuffer
	text " est"
	line "relâché dehors."
	cont "Adieu @"
	text_ram wStringBuffer
	text "!"
	prompt

_RequireCoinCaseText::
	text "Il faut une BOITE"
	line "JETON!@"
	text_end

_ExchangeCoinsForPrizesText::
	text "Nous échangeons"
	line "tes jetons contre"
	cont "des lots."
	prompt

_WhichPrizeText::
	text "Quel lot veux-tu?"
	done

_HereYouGoText::
	text "Et voilà!@"
	text_end

_SoYouWantPrizeText::
	text "Tu veux donc"
	line "@"
	text_ram wNameBuffer
	text "?"
	done

_SorryNeedMoreCoinsText::
	text "Désolé, il te"
	line "faut plus de"
	cont "jetons.@"
	text_end

_OopsYouDontHaveEnoughRoomText::
	text "Oups! Tu n'as pas"
	line "assez de place.@"
	text_end

_OhFineThenText::
	text "Bon, tant pis.@"
	text_end

_GetDexRatedText::
	text "Veux-tu faire"
	line "évaluer ton"
	cont "#DEX?"
	done

_ClosedOaksPCText::
	text "Fin de connexion"
	line "au PC du"
	cont "PROF.CHEN.@"
	text_end

_AccessedOaksPCText::
	text "Connexion au PC"
	line "du PROF.CHEN."

	para "Système"
	line "d'évaluation du"
	cont "#DEX ouvert."
	prompt

_ExpressionText::
	text "Cette expression"
	line "est la No @"
	text_decimal wExpressionNumber, 1, 2
	text "."
	prompt

_NotEnoughMemoryText::
	text "Pas assez de"
	line "mémoire Version"
	cont "Jaune."
	done

_OakSpeechText1::
	text "Bonjour!"
	line "Bienvenue dans le"
	cont "monde des"
	cont "#MON!"

	para "Je m'appelle"
	line "CHEN! On"
	cont "m'appelle le PROF"
	cont "des #MON!"
	prompt

_OakSpeechText2A::
	text "Ce monde est"
	line "peuplé de"
	cont "créatures"
	cont "appelées"
	cont "#MON!@"
	text_end

_OakSpeechText2B::
	text_start

	para "Pour certains,"
	line "les #MON sont"
	cont "des animaux de"
	cont "compagnie. Pour"
	cont "d'autres, des"
	cont "combattants."

	para "Pour ma part..."

	para "J'étudie les"
	line "#MON, c'est"
	cont "métier."
	prompt

_IntroducePlayerText::
	text "D'abord, quel est"
	line "ton nom?"
	prompt

_IntroduceRivalText::
	text "Voici mon"
	line "petit-fils. C'est"
	cont "ton rival depuis"
	cont "que vous êtes"
	cont "tout petits."

	para "...Euh, comment"
	line "s'appelle-t-il"
	cont "déjà?"
	prompt

_OakSpeechText3::
	text "<PLAYER>!"

	para "Ta propre légende"
	line "#MON va"
	cont "commencer!"

	para "Un monde de rêves"
	line "et d'aventures"
	cont "avec les #MON"
	cont "t'attend! En"
	cont "route!"
	done

_DoYouWantToNicknameText::
	text "Veux-tu donner un"
	line "surnom à"
	cont "@"
	text_ram wNameBuffer
	text "?"
	done

_YourNameIsText::
	text "Bien! Tu"
	line "t'appelles donc"
	cont "<PLAYER>!"
	prompt

_HisNameIsText::
	text "Ah oui! Je me"
	line "souviens! Il"
	cont "s'appelle"
	cont "<RIVAL>!"
	prompt

_WillBeTradedText::
	text_ram wNameOfPlayerMonToBeTraded
	text " et"
	line "@"
	text_ram wNameBuffer
	text " vont"
	cont "être échangés."
	done

_Colosseum3MonsText::
	text "Il faut 3 #MON"
	line "pour combattre!"
	prompt

_ColosseumMewText::
	text "Désolé, MEW est"
	line "interdit!"
	prompt

_ColosseumDifferentMonsText::
	text "Tes #MON"
	line "doivent tous être"
	cont "différents!"
	prompt

_ColosseumMaxL55Text::
	text "Aucun #MON ne"
	line "doit dépasser le"
	cont "N.55!"
	prompt

_ColosseumMinL50Text::
	text "Tous les #MON"
	line "doivent être au"
	cont "moins N.50!"
	prompt

_ColosseumTotalL155Text::
	text "Le total des"
	line "niveaux dépasse"
	cont "155!"
	prompt

_ColosseumMaxL30Text::
	text "Aucun #MON ne"
	line "doit dépasser le"
	cont "N.30!"
	prompt

_ColosseumMinL25Text::
	text "Tous les #MON"
	line "doivent être au"
	cont "moins N.25!"
	prompt

_ColosseumTotalL80Text::
	text "Le total des"
	line "niveaux dépasse"
	cont "80!"
	prompt

_ColosseumMaxL20Text::
	text "Aucun #MON ne"
	line "doit dépasser le"
	cont "N.20!"
	prompt

_ColosseumMinL15Text::
	text "Tous les #MON"
	line "doivent être au"
	cont "moins N.15!"
	prompt

_ColosseumTotalL50Text::
	text "Le total des"
	line "niveaux dépasse"
	cont "50!"
	prompt

_ColosseumHeightText::
	text_ram wNameBuffer
	text " mesure"
	line "plus de 2,0 m!"
	prompt

_ColosseumWeightText::
	text_ram wNameBuffer
	text " pèse"
	line "plus de 20,0 kg!"
	prompt

_ColosseumEvolvedText::
	text_ram wNameBuffer
	text " est"
	line "un #MON évolué"
	prompt

_ColosseumIneligibleText::
	text "Ton adversaire"
	line "n'est pas admis."
	prompt

_ColosseumWhereToText::
	text "Où veux-tu aller?"
	done

_ColosseumPleaseWaitText::
	text "OK, patiente un"
	line "instant."
	done

_ColosseumCanceledText::
	text "La connexion est"
	line "annulée."
	done

_ColosseumVersionText::
	text "Les versions du"
	line "jeu sont"
	cont "différentes."
	prompt

_TextIDErrorText::
	text_decimal hTextID, 1, 2
	text " erreur."
	done

_ContCharText::
	text "<_CONT>@"
	text_end

_NoPokemonText::
	text "Il n'y a pas de"
	line "#MON ici!"
	prompt
