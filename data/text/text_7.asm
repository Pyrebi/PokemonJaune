_PokemonText::
	text "#MON!"
	done

_PokemartGreetingText::
	text "Bonjour!"
	next "Je peux t'aider?"
	done

_PokemonFaintedText::
	text_ram wNameBuffer
	text_start
	line "est K.O.!"
	done

_PlayerBlackedOutText::
	text "<PLAYER> n'a plus"
	line "de #MON en"
	cont "forme!"

	para "<PLAYER> est"
	line "hors-jeu!"
	prompt

_RepelWoreOffText::
	text "L'effet du"
	line "REPOUSSE s'est"
	cont "dissipé."
	done

_NoBicycleText::
	text "Tu n'as pas de"
	line "BICYCLETTE."
	prompt

_UseAnotherRepelText::
	text "Utiliser un autre"
	line "@"
	text_ram wNameBuffer
	text "?"
	done

_UsedAnotherRepelText::
	text "<PLAYER> utilise"
	line "@"
	text_ram wNameBuffer
	text "!"
	done

_PokemartBuyingGreetingText::
	text "Prends ton temps."
	done

_PokemartTellBuyPriceText::
	text_ram wStringBuffer
	text "?"
	line "Ca fera"
	cont "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text ". OK?"
	done

_PokemartBoughtItemText::
	text "Voilà! Merci"
	line "beaucoup!"
	prompt

_PokemartNotEnoughMoneyText::
	text "Tu n'as pas assez"
	line "d'argent."
	prompt

_PokemartItemBagFullText::
	text "Tu ne peux plus"
	line "porter d'objets."
	prompt

_PokemonSellingGreetingText::
	text "Que veux-tu"
	line "vendre?"
	done

_PokemartTellSellPriceText::
	text "Je t'en donne"
	line "¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "."
	done

_PokemartItemBagEmptyText::
	text "Tu n'as rien à"
	line "vendre."
	prompt

_PokemartUnsellableItemText::
	text "Je ne peux pas"
	line "acheter ça."
	prompt

_PokemartThankYouText::
	text "Merci!"
	done

_PokemartAnythingElseText::
	text "Puis-je faire"
	line "autre chose pour"
	cont "toi?"
	done

_LearnedMove1Text::
	text_ram wLearnMoveMonName
	text " apprend"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_WhichMoveToForgetText::
	text "Quelle capacité"
	next "faut-il oublier?"
	done

_AbandonLearningText::
	text "Abandonner"
	line "@"
	text_ram wStringBuffer
	text "?"
	done

_DidNotLearnText::
	text_ram wLearnMoveMonName
	text_start
	line "n'a pas appris"
	cont "@"
	text_ram wStringBuffer
	text "!"
	prompt

_TryingToLearnText::
	text_ram wLearnMoveMonName
	text " veut"
	line "apprendre"
	cont "@"
	text_ram wStringBuffer
	text "!"
	cont "(PUISSANCE @"
	text_ram wMovePowerText
	text ")"

	para "Mais @"
	text_ram wLearnMoveMonName
	text_start
	line "ne peut connaître"
	cont "que 4 capacités!"

	para "Oublier une"
	line "capacité pour"
	cont "@"
	text_ram wStringBuffer
	text "?"
	done

_OneTwoAndText::
	text "1, 2 et...@"
	text_end

_PoofText::
	text " Tadaa!@"
	text_end

_ForgotAndText::
	text_start
	para "@"
	text_ram wLearnMoveMonName
	text " oublie"
	line "@"
	text_ram wNameBuffer
	text "!"

	para "Et..."
	prompt

_HMCantDeleteText::
	text "Les capacités CS"
	line "ne peuvent pas"
	cont "être oubliées!"
	prompt

_PokemonCenterWelcomeText::
	text "Bienvenue au"
	line "CENTRE #MON!"

	para "Nous soignons vos"
	line "#MON pour"
	cont "qu'ils soient en"
	cont "pleine forme!"
	prompt

_ShallWeHealYourPokemonText::
	text "Voulez-vous"
	line "soigner vos"
	cont "#MON?"
	done

_NeedYourPokemonText::
	text "OK. Confiez-nous"
	line "vos #MON."
	done

_PCHealedText::
	text "Tes #MON sont"
	line "en pleine forme!"
	prompt

_PokemonFightingFitText::
	text "Merci! Vos"
	line "#MON sont en"
	cont "pleine forme!"
	prompt

_PokemonCenterFarewellText::
	text "A bientôt!"
	done

_LooksContentText::
	text "Il a l'air de"
	line "dormir"
	cont "paisiblement."
	done

_CableClubNPCAreaReservedFor2FriendsLinkedByCableText::
	text "Cette zone est"
	line "réservée à 2 amis"
	cont "reliés par un"
	cont "câble."
	done

_CableClubNPCWelcomeText::
	text "Bienvenue au Club"
	line "Câble!"
	done

_CableClubNPCPleaseApplyHereHaveToSaveText::
	text "Inscris-toi ici."

	para "Avant la"
	line "connexion, il"
	cont "faut sauvegarder"
	cont "la partie."
	done
