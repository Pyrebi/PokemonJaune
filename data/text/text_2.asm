_AIBattleWithdrawText::
	text_ram wTrainerName
	text_start
	line "retire @"
	text_ram wEnemyMonNick
	text "!"
	prompt

_AIBattleUseItemText::
	text_ram wTrainerName
	text_start
	line "utilise @"
	text_ram wNameBuffer
	text_start
	cont "sur @"
	text_ram wEnemyMonNick
	text "!"
	prompt

_BoxFullDebugText::
	text "La BOITE est"
	line "pleine!"
	done

_BoxWillBeClearedText::
	text "La BOITE va être"
	line "vidée."
	done

_TradeWentToText::
	text_ram wStringBuffer
	text " part"
	line "chez @"
	text_ram wLinkEnemyTrainerName
	text "."
	done

_TradeForText::
	text "Contre le #MON"
	line "de <PLAYER>,"
	cont "@"
	text_ram wStringBuffer
	text ","
	done

_TradeSendsText::
	text_ram wLinkEnemyTrainerName
	text " envoie"
	line "@"
	text_ram wNameBuffer
	text "."
	done

_TradeWavesFarewellText::
	text_ram wLinkEnemyTrainerName
	text " fait"
	line "ses adieux tandis"
	done

_TradeTransferredText::
	text "que @"
	text_ram wNameBuffer
	text_start
	line "est transféré."
	done

_TradeTakeCareText::
	text "Prends bien soin"
	line "de @"
	text_ram wNameBuffer
	text "."
	done

_TradeWillTradeText::
	text_ram wLinkEnemyTrainerName
	text " va"
	line "échanger @"
	text_ram wNameBuffer
	text_start
	done

_TradeforText::
	text "contre le #MON"
	line "de <PLAYER>:"
	cont "@"
	text_ram wStringBuffer
	text "."
	done

_PlaySlotMachineText::
	text "Une machine à"
	line "sous! Tu veux"
	cont "jouer?"
	done

_OutOfCoinsSlotMachineText::
	text "Zut! Plus de"
	line "jetons!"
	done

_BetHowManySlotMachineText::
	text "Miser combien de"
	line "jetons?"
	done

_StartSlotMachineText::
	text "C'est parti!"
	done

_NotEnoughCoinsSlotMachineText::
	text "Pas assez de"
	line "jetons!"
	prompt

_OneMoreGoSlotMachineText::
	text "Encore une"
	line "partie?"
	done

_LinedUpText::
	text " alignés!"
	line "Gain: @"
	text_ram wStringBuffer
	text " jetons!"
	done

_NotThisTimeText::
	text "Pas cette fois!"
	prompt

_YeahText::
	text "Ouais!@"
	text_end

_DexSeenOwnedText::
	text "#DEX    Vus:@"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text_start
	line "         Pris:@"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text_end

_DexRatingText::
	text "Evaluation"
	line "#DEX<COLON>"
	done

_GymStatueText1::
	text_ram wGymCityName
	text_start
	line "ARENE #MON"
	cont "CHAMPION: @"
	text_ram wGymLeaderName
	text_start

	para "VAINQUEURS:"
	line "<RIVAL>"
	done

_GymStatueText2::
	text_ram wGymCityName
	text_start
	line "ARENE #MON"
	cont "CHAMPION: @"
	text_ram wGymLeaderName
	text_start

	para "VAINQUEURS:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

_ViridianCityPokecenterGuyText::
	text "Les CENTRES"
	line "#MON soignent"
	cont "tes #MON"
	cont "fatigués, blessés"
	cont "ou K.O.!"
	done

_PewterCityPokecenterGuyText::
	text "Aaah!"

	para "Quand RONDOUDOU"
	line "chante, les"
	cont "#MON"
	cont "s'endorment..."

	para "...Moi aussi..."
	line "Zzz..."
	done

_CeruleanPokecenterGuyText::
	text "LEO a plein de"
	line "#MON!"

	para "Il collectionne"
	line "aussi les plus"
	cont "rares!"
	done

_LavenderPokecenterGuyText::
	text "Les OSSELAIT"
	line "portent un crâne,"
	cont "non?"

	para "Il y a des gens"
	line "qui paieraient"
	cont "cher pour en"
	cont "avoir un!"
	done

_MtMoonPokecenterBenchGuyText::
	text "Si tu as trop de"
	line "#MON,"
	cont "stocke-les sur le"
	cont "PC!"
	done

_RockTunnelPokecenterGuyText::
	text "Il paraît que des"
	line "SPECTRES hantent"
	cont "LAVANVILLE!"
	done

_UnusedBenchGuyText1::
	text "J'aimerais bien"
	line "attraper des"
	cont "#MON."
	done

_UnusedBenchGuyText2::
	text "Je suis épuisé de"
	line "m'être tant"
	cont "amusé..."
	done

_UnusedBenchGuyText3::
	text "Le directeur de"
	line "SYLPHE se cache"
	cont "au PARC SAFARI."
	done

_VermilionPokecenterGuyText::
	text "C'est vrai qu'un"
	line "#MON de haut"
	cont "niveau est plus"
	cont "puissant..."

	para "Mais tous les"
	line "#MON ont des"
	cont "faiblesses face à"
	cont "certains types."

	para "Alors, aucun"
	line "#MON n'est"
	cont "invincible."
	done

_CeladonCityPokecenterGuyText::
	text "Si j'avais un"
	line "vélo, j'irais sur"
	cont "la PISTE"
	cont "CYCLABLE!"
	done

_FuchsiaCityPokecenterGuyText::
	text "Si tu étudies les"
	line "#MON, visite"
	cont "le PARC SAFARI."

	para "On y trouve plein"
	line "de #MON rares."
	done

_CinnabarPokecenterGuyText::
	text "Un #MON peut"
	line "apprendre des"
	cont "capacités si on"
	cont "annule son"
	cont "évolution."

	para "L'évolution peut"
	line "attendre qu'il"
	cont "ait appris de"
	cont "nouvelles"
	cont "capacités."
	done

_SaffronCityPokecenterGuyText1::
	text "Ce serait génial"
	line "si le CONSEIL 4"
	cont "venait écraser la"
	cont "TEAM ROCKET!"
	done

_SaffronCityPokecenterGuyText2::
	text "La TEAM ROCKET"
	line "est partie! On"
	cont "peut ressortir"
	cont "sans crainte!"
	cont "Génial!"
	done

_CeladonCityHotelText::
	text "C'est ma soeur"
	line "qui m'a emmené en"
	cont "vacances!"
	done

_BookcaseText::
	text "Plein de livres"
	line "sur les #MON!"
	done

_NewBicycleText::
	text "Une BICYCLETTE"
	line "toute neuve!"
	done

_PushStartText::
	text "Appuie sur START"
	line "pour ouvrir le"
	cont "MENU!"
	done

_SaveOptionText::
	text "L'option SAUVER"
	line "est dans le MENU."
	done

_StrengthsAndWeaknessesText::
	text "Chaque type de"
	line "#MON a des"
	cont "forces et des"
	cont "faiblesses face"
	cont "aux autres."
	done

_TimesUpText::
	text "HAUT-PARLEUR:"
	line "Ding-dong!"

	para "C'est fini!"
	prompt

_GameOverText::
	text "HAUT-PARLEUR: Ta"
	line "partie de SAFARI"
	cont "est terminée!"
	done

_CinnabarGymQuizDummyIntroText::
	text "Quiz #MON!"

	para "Bonne réponse: la"
	line "porte de la salle"
	cont "suivante s'ouvre!"

	para "Mauvaise réponse:"
	line "tu affrontes un"
	cont "dresseur!"

	para "Pour garder tes"
	line "#MON en forme"
	cont "pour le"
	cont "CHAMPION..."

	para "Réponds juste!"
	line "C'est parti!"
	prompt

_CinnabarGymQuizIntroText::
	text "Quiz #MON!"

	para "Bonne réponse: la"
	line "porte de la salle"
	cont "suivante s'ouvre!"

	para "Mauvaise réponse:"
	line "tu affrontes le"
	cont "dresseur qui"
	cont "bloque le"
	cont "passage!"

	para "Pour garder tes"
	line "#MON en forme"
	cont "pour le"
	cont "CHAMPION..."

	para "Réponds juste!"
	line "C'est parti!"

	para ""
	done

_CinnabarGymQuizShortIntroText::
	text "Quiz #MON!"
	line "Teste tes"
	cont "connaissances!"

	para ""
	done

_CinnabarQuizQuestionsText1::
	text "CHENIPAN évolue"
	line "en PAPILUSION?"
	done

_CinnabarQuizQuestionsText2::
	text "Il existe 9"
	line "BADGES officiels"
	cont "de la LIGUE"
	cont "#MON?"
	done

_CinnabarQuizQuestionsText3::
	text "PTITARD évolue 3"
	line "fois?"
	done

_CinnabarQuizQuestionsText4::
	text "Les attaques"
	line "électriques"
	cont "sont-elles"
	cont "efficaces contre"
	cont "les #MON de"
	cont "type SOL?"
	done

_CinnabarQuizQuestionsText5::
	text "Deux #MON de"
	line "même espèce et de"
	cont "même niveau ne"
	cont "sont pas"
	cont "identiques?"
	done

_CinnabarQuizQuestionsText6::
	text "La CT28 contient"
	line "TOMBEROCHE?"
	done

_CinnabarGymQuizCorrectText::
	text "C'est la bonne"
	line "réponse!"

	para "Tu peux passer!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "Désolé! Mauvaise"
	line "réponse!"
	prompt

_MagazinesText::
	text "Des magazines"
	line "#MON!"

	para "Des carnets"
	line "#MON!"

	para "Des graphiques"
	line "#MON!"
	done

_BillsHouseMonitorText::
	text "TELEPORTEUR"
	line "s'affiche sur"
	cont "l'écran du PC."
	done

_BillsHouseInitiatedText::
	text "<PLAYER> active le"
	line "séparateur de"
	cont "cellules du"
	cont "TELEPORTEUR!@"
	text_end

_BillsHousePokemonListText1::
	text "Les #MON"
	line "préférés de LEO!"
	prompt

_BillsHousePokemonListText2::
	text "Quel #MON"
	line "veux-tu voir?"
	done

_OakLabEmailText::
	text "Il y a un e-mail!"

	para "..."

	para "Avis à tous les"
	line "dresseurs de"
	cont "#MON!"

	para "L'élite de la"
	line "LIGUE #MON est"
	cont "prête à affronter"
	cont "tous les"
	cont "challengers!"

	para "Amenez vos"
	line "meilleurs #MON"
	cont "et voyez ce que"
	cont "vous valez!"

	para "QG LIGUE #MON"
	line "PLATEAU INDIGO"

	para "PS: PROF.CHEN,"
	line "passez nous voir!"
	cont "..."
	done

_GameCornerCoinCaseText::
	text "Il faut une BOITE"
	line "JETON!"
	done

_GameCornerNoCoinsText::
	text "Tu n'as pas de"
	line "jetons!"
	done

_GameCornerOutOfOrderText::
	text "EN PANNE Cette"
	line "machine est"
	cont "cassée."
	done

_GameCornerOutToLunchText::
	text "PARTI MANGER"
	line "Cette place est"
	cont "réservée."
	done

_GameCornerSomeonesKeysText::
	text "Les clés de"
	line "quelqu'un! Il va"
	cont "revenir."
	done

_JustAMomentText::
	text "Un instant."
	done

TMNotebookText::
	text "C'est une"
	line "brochure sur les"
	cont "CT."

	para "..."

	para "Il existe 50 CT"
	line "en tout."

	para "Il existe aussi 5"
	line "CS réutilisables"
	cont "à volonté."

	para "SYLPHE SARL@"
	text_end

_TurnPageText::
	text "Tourner la page?"
	done

_ViridianSchoolNotebookText5::
	text "FILLE: Hé! Ne"
	line "regarde pas mes"
	cont "notes!@"
	text_end

_ViridianSchoolNotebookText1::
	text "Tu regardes le"
	line "cahier!"

	para "Première page..."

	para "Les POKé BALLS"
	line "servent à"
	cont "attraper les"
	cont "#MON."

	para "On peut porter"
	line "jusqu'à 6"
	cont "#MON."

	para "Ceux qui élèvent"
	line "et font combattre"
	cont "des #MON sont"
	cont "des dresseurs."
	prompt

_ViridianSchoolNotebookText2::
	text "Deuxième page..."

	para "Un #MON en"
	line "pleine forme est"
	cont "dur à attraper:"
	cont "affaiblis-le"
	cont "d'abord!"

	para "Le poison, les"
	line "brûlures et"
	cont "autres dégâts"
	cont "sont efficaces!"
	prompt

_ViridianSchoolNotebookText3::
	text "Troisième page..."

	para "Les dresseurs de"
	line "#MON cherchent"
	cont "d'autres"
	cont "dresseurs à"
	cont "affronter."

	para "Des combats ont"
	line "lieu sans cesse"
	cont "dans les ARENES"
	cont "#MON."
	prompt

_ViridianSchoolNotebookText4::
	text "Quatrième page..."

	para "Le but des"
	line "dresseurs est de"
	cont "battre les 8"
	cont "CHAMPIONS"
	cont "d'ARENE."

	para "Ils gagnent alors"
	line "le droit"
	cont "d'affronter..."

	para "Le CONSEIL 4 de"
	line "la LIGUE #MON!"
	prompt

_EnemiesOnEverySideText::
	text "Des ennemis de"
	line "tous côtés!"
	done

_WhatGoesAroundComesAroundText::
	text "On récolte ce que"
	line "l'on sème!"
	done

_FightingDojoText::
	text "DOJO DE COMBAT"
	done

_IndigoPlateauHQText::
	text "PLATEAU INDIGO QG"
	line "LIGUE #MON"
	done

_RedBedroomSNESText::
	text "<PLAYER> joue à la"
	line "SUPER NES!"
	cont "...Bon! Il est"
	cont "temps d'y aller!"
	done

_Route15UpstairsBinocularsText::
	text "Tu regardes dans"
	line "les jumelles..."

	para "Un grand oiseau"
	line "étincelant vole"
	cont "vers la mer."
	done

_AerodactylFossilText::
	text "Fossile de PTERA"
	line "Un #MON rare"
	cont "et préhistorique."
	done

_KabutopsFossilText::
	text "Fossile de"
	line "KABUTOPS Un"
	cont "#MON rare et"
	cont "préhistorique."
	done

_FanClubPicture1Text::
	text "Mon adorable"
	line "GALOPA."
	done

_FanClubPicture2Text::
	text "Mon RAPASDEPIC"
	line "chéri."
	done

_LinkCableHelpText1::
	text "CONSEILS AUX"
	line "DRESSEURS"

	para "Utiliser le Câble"
	line "Game Link"
	prompt

_LinkCableHelpText2::
	text "Quel sujet"
	line "veux-tu lire?"
	done

_LinkCableInfoText1::
	text "Une fois ta GAME"
	line "BOY reliée à une"
	cont "autre, parle à"
	cont "l'hôtesse de"
	cont "droite dans un"
	cont "CENTRE #MON."
	prompt

_LinkCableInfoText2::
	text "Le COLISEE permet"
	line "d'affronter un"
	cont "ami."
	prompt

_LinkCableInfoText3::
	text "Le CENTRE TROC"
	line "sert à échanger"
	cont "des #MON."
	prompt

_ViridianSchoolBlackboardText1::
	text "Le tableau décrit"
	line "les changements"
	cont "de STATUT en"
	cont "combat."
	prompt

_ViridianSchoolBlackboardText2::
	text "Quel sujet"
	line "veux-tu lire?"
	done

_ViridianBlackboardSleepText::
	text "Un #MON"
	line "endormi ne peut"
	cont "pas attaquer!"

	para "Il reste endormi"
	line "même après le"
	cont "combat."

	para "Utilise un REVEIL"
	line "pour le"
	cont "réveiller!"
	prompt

_ViridianBlackboardPoisonText::
	text "Empoisonné, un"
	line "#MON perd des"
	cont "PV petit à petit."

	para "Le poison"
	line "persiste après le"
	cont "combat."

	para "Utilise un"
	line "ANTIDOTE pour le"
	cont "guérir!"
	prompt

_ViridianBlackboardPrlzText::
	text "La paralysie peut"
	line "empêcher un"
	cont "#MON"
	cont "d'attaquer!"

	para "Elle persiste"
	line "après le combat."

	para "Utilise un"
	line "ANTI-PARA pour la"
	cont "soigner!"
	prompt

_ViridianBlackboardBurnText::
	text "Une brûlure"
	line "réduit la"
	cont "puissance et la"
	cont "vitesse et"
	cont "inflige des"
	cont "dégâts."

	para "Elle persiste"
	line "après le combat."

	para "Utilise un"
	line "ANTI-BRULE pour"
	cont "la soigner!"
	prompt

_ViridianBlackboardFrozenText::
	text "Gelé, un #MON"
	line "ne peut plus"
	cont "bouger du tout!"

	para "Il reste gelé"
	line "même après le"
	cont "combat."

	para "Utilise un"
	line "ANTIGEL pour le"
	cont "dégeler!"
	prompt

_VermilionGymTrashText::
	text "Non, il n'y a que"
	line "des ordures ici."
	done

_VermilionGymTrashSuccessText1::
	text "Hé! Il y a un"
	line "interrupteur sous"
	cont "les ordures!"
	cont "Allumons-le!"

	para "Le 1er verrou"
	line "électrique"
	cont "s'ouvre!@"
	text_end

_VermilionGymTrashSuccessText2::
	text "Hé! Il y a un"
	line "autre"
	cont "interrupteur sous"
	cont "les ordures!"
	cont "Allumons-le!"
	prompt

_VermilionGymTrashSuccessText3::
	text "Le 2e verrou"
	line "électrique"
	cont "s'ouvre!"

	para "La porte"
	line "motorisée"
	cont "s'ouvre!@"
	text_end

_VermilionGymTrashFailText::
	text "Non! Rien que des"
	line "ordures. Hé! Les"
	cont "verrous"
	cont "électriques sont"
	cont "réinitialisés!@"
	text_end

_FoundHiddenItemText::
	text "<PLAYER> trouve"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "Mais <PLAYER> n'a"
	line "plus de place"
	cont "pour d'autres"
	cont "objets!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> trouve"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " jetons!@"
	text_end

_FoundHiddenCoins2Text::
	text "<PLAYER> trouve"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " jetons!@"
	text_end

_DroppedHiddenCoinsText::
	text_start

	para "Oups! Des jetons"
	line "sont tombés!"
	done

_IndigoPlateauStatuesText1::
	text "PLATEAU INDIGO"
	prompt

_IndigoPlateauStatuesText2::
	text "Le but ultime des"
	line "dresseurs! QG"
	cont "LIGUE #MON"
	done

_IndigoPlateauStatuesText3::
	text "La plus haute"
	line "autorité #MON"
	cont "QG LIGUE #MON"
	done

_PokemonBooksText::
	text "Plein de livres"
	line "sur les #MON!"
	done

_DiglettSculptureText::
	text "C'est une"
	line "sculpture de"
	cont "TAUPIQUEUR."
	done

_ElevatorText::
	text "C'est un"
	line "ascenseur."
	done

_TownMapText::
	text "Une CARTE.@"
	text_end

_PokemonStuffText::
	text "Waouh! Plein de"
	line "trucs #MON!"
	done

_OutOfSafariBallsText::
	text "HAUT-PARLEUR:"
	line "Ding-dong!"

	para "Tu n'as plus de"
	line "SAFARI BALLS!"
	prompt

_WildRanText::
	text_ram wEnemyMonNick
	text_start
	line "sauvage s'enfuit!"
	prompt

_EnemyRanText::
	text_ram wEnemyMonNick
	text_start
	line "ennemi s'enfuit!"
	prompt

_HurtByPoisonText::
	text "<USER>"
	line "souffre du"
	cont "poison!"
	prompt

_HurtByBurnText::
	text "<USER>"
	line "souffre de sa"
	cont "brûlure!"
	prompt

_HurtByLeechSeedText::
	text "VAMPIGRAINE"
	line "draine"
	cont "<USER>!"
	prompt

_EnemyMonFaintedText::
	text_ram wEnemyMonNick
	text_start
	line "ennemi est K.O.!"
	prompt

_MoneyForWinningText::
	text "<PLAYER> gagne"
	line "¥@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

_TrainerDefeatedText::
	text "<PLAYER> a battu"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_PlayerMonFaintedText::
	text_ram wBattleMonNick
	text_start
	line "est K.O.!"
	prompt

_UseNextMonText::
	text "Utiliser un autre"
	line "#MON?"
	done

_Rival1WinText::
	text "<RIVAL>: Ouais!"
	line "Je suis trop"
	cont "fort, hein?"
	prompt

_PlayerBlackedOutText2::
	text "<PLAYER> n'a plus"
	line "de #MON en"
	cont "forme!"

	para "<PLAYER> est"
	line "hors-jeu!"
	prompt

_LinkBattleLostText::
	text "<PLAYER> a perdu"
	line "contre @"
	text_ram wTrainerName
	text "!"
	prompt

_TrainerAboutToUseText::
	text_ram wTrainerName
	text " va"
	line "envoyer"
	cont "@"
	text_ram wEnemyMonNick
	text "!"

	para "<PLAYER> change-"
	line "t-il de #MON?"
	done

_TrainerSentOutText::
	text_ram wTrainerName
	text " envoie"
	line "@"
	text_ram wEnemyMonNick
	text "!"
	done

_NoWillText::
	text "Il n'a plus la"
	line "force de se"
	cont "battre!"
	prompt

_CantEscapeText::
	text "Impossible de"
	line "fuir!"
	prompt

_NoRunningText::
	text "Non! On ne fuit"
	line "pas un combat de"
	cont "dresseurs!"
	prompt

_GotAwayText::
	text "Tu prends la"
	line "fuite!"
	prompt

_RunAwayText::
	text "Vite, fuyons!"
	prompt

_ItemsCantBeUsedHereText::
	text "Impossible"
	line "d'utiliser des"
	cont "objets ici."
	prompt

_AlreadyOutText::
	text_ram wBattleMonNick
	text " est"
	line "déjà au combat!"
	prompt

_MoveNoPPText::
	text "Plus de PP pour"
	line "cette capacité!"
	prompt

_MoveDisabledText::
	text "La capacité est"
	line "bloquée!"
	prompt

_NoMovesLeftText::
	text_ram wBattleMonNick
	text " n'a"
	line "plus d'attaques!"
	done

_MultiHitText::
	text "L'ennemi est"
	line "touché @"
	text_decimal wPlayerNumHits, 1, 1
	text " fois!"
	prompt

_ScaredText::
	text_ram wBattleMonNick
	text " a"
	line "trop peur!"
	prompt

_GetOutText::
	text "SPECTRE:"
	line "Dehors..."
	cont "Dehors..."
	prompt

_FastAsleepText::
	text "<USER>"
	line "dort"
	cont "profondément!"
	prompt

_WokeUpText::
	text "<USER>"
	line "se réveille!"
	prompt

_IsFrozenText::
	text "<USER>"
	line "est gelé!"
	prompt

_FullyParalyzedText::
	text "<USER>"
	line "est totalement"
	cont "paralysé!"
	prompt

_FlinchedText::
	text "<USER>"
	line "a la trouille!"
	prompt

_MustRechargeText::
	text "<USER>"
	line "doit récupérer!"
	prompt

_DisabledNoMoreText::
	text "<USER>"
	line "n'est plus"
	cont "entravé!"
	prompt

_IsConfusedText::
	text "<USER>"
	line "est confus!"
	prompt

_HurtItselfText::
	text "Il se blesse dans"
	line "sa confusion!"
	prompt

_ConfusedNoMoreText::
	text "<USER>"
	line "n'est plus"
	cont "confus!"
	prompt

_SavingEnergyText::
	text "<USER>"
	line "accumule de"
	cont "l'énergie!"
	prompt

_UnleashedEnergyText::
	text "<USER>"
	line "libère son"
	cont "énergie!"
	prompt

_ThrashingAboutText::
	text "<USER>"
	line "se déchaîne!"
	done

_AttackContinuesText::
	text "<USER>"
	line "continue son"
	cont "attaque!"
	done

_CantMoveText::
	text "<USER>"
	line "ne peut pas"
	cont "bouger!"
	prompt

_MoveIsDisabledText::
	text "<USER>:"
	line "@"
	text_ram wNameBuffer
	text " est"
	cont "bloquée!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "utilise"
	cont "@"
	text_end

_UsedMove2Text::
	text_start
	line "lance"
	cont "@"
	text_end

_UsedInsteadText::
	text "plutôt"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer
	text "@"

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

_AttackMissedText::
	text "<USER>"
	line "rate son attaque!"
	prompt

_KeptGoingAndCrashedText::
	text "<USER>"
	line "s'écrase au sol!"
	prompt

_UnaffectedText::
	text "<TARGET>"
	line "n'est pas"
	cont "affecté!"
	prompt

_DoesntAffectMonText::
	text "Ca n'affecte pas"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "Coup critique!"
	prompt

_OHKOText::
	text "K.O. en un coup!"
	prompt

_LoafingAroundText::
	text_ram wBattleMonNick
	text_start
	line "paresse."
	prompt

_BeganToNapText::
	text_ram wBattleMonNick
	text " fait"
	line "une sieste!"
	prompt

_WontObeyText::
	text_ram wBattleMonNick
	text_start
	line "n'obéit pas!"
	prompt

_TurnedAwayText::
	text_ram wBattleMonNick
	text_start
	line "se détourne!"
	prompt

_IgnoredOrdersText::
	text_ram wBattleMonNick
	text_start
	line "ignore l'ordre!"
	prompt

_SubstituteTookDamageText::
	text "Le CLONE encaisse"
	line "les dégâts pour"
	cont "<TARGET>!"
	prompt

_SubstituteBrokeText::
	text "Le CLONE de"
	line "<TARGET>"
	cont "est détruit!"
	prompt

_BuildingRageText::
	text "La FRENESIE de"
	line "<USER>"
	cont "augmente!"
	prompt

_MirrorMoveFailedText::
	text "MIROIR"
	next "échoue!"
	prompt

_HitXTimesText::
	text "Touché @"
	text_decimal wEnemyNumHits, 1, 1
	text " fois!"
	prompt

_GainedText::
	text_ram wNameBuffer
	text " gagne"
	line "@"
	text_end

_WithExpAllText::
	text "avec MULTI EXP,"
	cont "@"
	text_end

_BoostedText::
	text "un bonus de"
	cont "@"
	text_end

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	text " points EXP!"
	prompt

_GrewLevelText::
	text_ram wNameBuffer
	text " monte"
	line "au niveau @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_SuperEffectiveText::
	text "C'est super"
	line "efficace!"
	prompt

_NotVeryEffectiveText::
	text "Ce n'est pas très"
	line "efficace..."
	prompt

_SafariZoneEatingText::
	text_ram wEnemyMonNick
	text_start
	line "sauvage mange!"
	prompt

_SafariZoneAngryText::
	text_ram wEnemyMonNick
	text_start
	line "sauvage s'énerve!"
	prompt

_WildMonAppearedText::
	text "Un @"
	text_ram wEnemyMonNick
	text_start
	line "sauvage apparaît!"
	prompt

_HookedMonAttackedText::
	text "@"
	text_ram wEnemyMonNick
	text_start
	line "a mordu à"
	cont "l'hameçon!"
	prompt
