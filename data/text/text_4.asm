_FileDataDestroyedText::
	text "Les données de"
	line "sauvegarde sont"
	cont "détruites!"
	prompt

_WouldYouLikeToSaveText::
	text "Voulez-vous"
	line "SAUVER la partie?"
	done

_SavingText::
	text "Sauvegarde..."
	done

_GameSavedText::
	text "<PLAYER> a sauvé"
	line "la partie!"
	done

_OlderFileWillBeErasedText::
	text "L'ancienne"
	line "sauvegarde sera"
	cont "effacée."
	cont "D'accord?"
	done

_BillsPCSameBoxText::
	text "Il est déjà dans"
	line "cette BOITE!"
	prompt

_BillsPCTargetBoxFullText::
	text "Cette BOITE est"
	line "pleine!"
	prompt

_BillsPCMonMovedText::
	text_ram wNameBuffer
	text " est"
	line "envoyé dans la"
	cont "BOITE @"
	text_ram wBoxNumString
	text "."

	para "La partie est"
	line "sauvegardée."
	prompt

_WhenYouChangeBoxText::
	text "Changer de BOITE"
	line "#MON"
	cont "sauvegarde la"
	cont "partie."

	para "D'accord?"
	done

_ChooseABoxText::
	text "Choisis une"
	line "BOITE.@"
	text_end

_EvolvedText::
	text_ram wStringBuffer
	text " évolue"
	done

_IntoText::
	text_start
	line "en @"
	text_ram wNameBuffer
	text "!"
	done

_StoppedEvolvingText::
	text "Quoi? @"
	text_ram wStringBuffer
	text_start
	line "n'évolue plus!"
	prompt
