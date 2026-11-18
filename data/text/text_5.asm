_IsEvolvingText::
	text "Quoi? @"
	text_ram wStringBuffer
	text_start
	line "évolue!"
	done

_FellAsleepText::
	text "<TARGET>"
	line "s'endort!"
	prompt

_AlreadyAsleepText::
	text "<TARGET>"
	line "dort déjà!"
	prompt

_PoisonedText::
	text "<TARGET>"
	line "est empoisonné!"
	prompt

_BadlyPoisonedText::
	text "<TARGET>"
	line "est gravement"
	cont "empoisonné!"
	prompt

_BurnedText::
	text "<TARGET>"
	line "est brûlé!"
	prompt

_FrozenText::
	text "<TARGET>"
	line "est gelé!"
	prompt

_FireDefrostedText::
	text "Le feu a dégelé"
	line "<TARGET>!"
	prompt

_MonsStatsRoseText::
	text "<USER>:"
	line "@"
	text_ram wStringBuffer
	text "@"
	text_end

_GreatlyRoseText::
	text " monte<SCROLL>beaucoup!"
	prompt

_RoseText::
	text " monte!"
	prompt

_MonsStatsFellText::
	text "<TARGET>:"
	line "@"
	text_ram wStringBuffer
	text "@"
	text_end

_GreatlyFellText::
	text " baisse<SCROLL>beaucoup!"
	prompt

_FellText::
	text " baisse!"
	prompt

_RanFromBattleText::
	text "<USER>"
	line "prend la fuite!"
	prompt

_RanAwayScaredText::
	text "<TARGET>"
	line "s'enfuit, apeuré!"
	prompt

_WasBlownAwayText::
	text "<TARGET>"
	line "est balayé!"
	prompt

_ChargeMoveEffectText::
	text "<USER>@"
	text_end

_MadeWhirlwindText::
	text_start
	line "crée une tornade!"
	prompt

_TookInSunlightText::
	text_start
	line "absorbe le soleil!"
	prompt

_LoweredItsHeadText::
	text_start
	line "baisse la tête!"
	prompt

_SkyAttackGlowingText::
	text_start
	line "brille!"
	prompt

_FlewUpHighText::
	text_start
	line "s'envole!"
	prompt

_DugAHoleText::
	text_start
	line "creuse un trou!"
	prompt

_BecameConfusedText::
	text "<TARGET>"
	line "est confus!"
	prompt

_MimicLearnedMoveText::
	text "<USER>"
	line "apprend"
	cont "@"
	text_ram wNameBuffer
	text "!"
	prompt

_MoveWasDisabledText::
	text "<TARGET>:"
	line "@"
	text_ram wNameBuffer
	text " est"
	cont "bloquée!"
	prompt

_NothingHappenedText::
	text "Il ne se passe"
	line "rien!"
	prompt

_NoEffectText::
	text "Aucun effet!"
	prompt

_ButItFailedText::
	text "Mais cela échoue!"
	prompt

_DidntAffectText::
	text "Ca n'affecte pas"
	line "<TARGET>!"
	prompt

_IsUnaffectedText::
	text "<TARGET>"
	line "n'est pas affecté!"
	prompt

_ParalyzedMayNotAttackText::
	text "<TARGET>"
	line "est paralysé! Il"
	cont "pourrait ne pas"
	cont "attaquer!"
	prompt

_SubstituteText::
	text "Un CLONE est créé!"
	prompt

_HasSubstituteText::
	text "<USER>"
	line "a déjà un CLONE!"
	prompt

_TooWeakSubstituteText::
	text "Trop faible pour"
	line "créer un CLONE!"
	prompt

_WasSeededText::
	text "<TARGET>"
	line "est infecté!"
	prompt

_EvadedAttackText::
	text "<TARGET>"
	line "esquive l'attaque!"
	prompt

_HitWithRecoilText::
	text "<USER>"
	line "subit le"
	cont "contrecoup!"
	prompt

_ConvertedTypeText::
	text "Prend le type de"
	line "<TARGET>!"
	prompt

_StatusChangesEliminatedText::
	text "Tous les"
	line "changements de"
	cont "STATUT sont"
	cont "annulés!"
	prompt

_GettingPumpedText::
	text "<USER>"
	line "se concentre!"
	prompt

_StartedSleepingEffect::
	text "<USER>"
	line "s'endort!"
	done

_FellAsleepBecameHealthyText::
	text "<USER>"
	line "s'endort et"
	cont "récupère!"
	done

_RegainedHealthText::
	text "<USER>"
	line "récupère des PV!"
	prompt

_TransformedText::
	text "<USER>"
	line "se transforme en"
	cont "@"
	text_ram wNameBuffer
	text "!"
	prompt

_LightScreenProtectedText::
	text "<USER>"
	line "est protégé contre"
	cont "les attaques"
	cont "spéciales!"
	prompt

_ReflectGainedArmorText::
	text "<USER>"
	line "est protégé par"
	cont "une armure!"
	prompt

_ShroudedInMistText::
	text "<USER>"
	line "s'entoure de"
	cont "brume!"
	prompt

_CoinsScatteredText::
	text "Des pièces"
	line "jaillissent"
	cont "partout!"
	prompt

_SuckedHealthText::
	text "<TARGET>"
	line "perd de l'énergie!"
	prompt

_DreamWasEatenText::
	text "Le rêve de"
	line "<TARGET>"
	cont "est dévoré!"
	prompt

_TradeCenterOpponentText::
	text "!"
	done

_ColosseumOpponentText::
	text "!"
	done
