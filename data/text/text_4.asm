_FileDataDestroyedText::
	text "Les données de"
	line "sauvegarde sont"
	cont "détruites!"
	prompt

_WouldYouLikeToSaveText::
	text "Voulez-vous SAUVER"
	line "la partie?"
	done

_SavingText::
	text "Sauvegarde..."
	done

_GameSavedText::
	text "<PLAYER> a sauvé la"
	line "partie!"
	done

_OlderFileWillBeErasedText::
	text "L'ancienne"
	line "sauvegarde sera"
	cont "effacée. D'accord?"
	done

_WhenYouChangeBoxText::
	text "Changer de BOITE"
	line "#MON sauvegarde"
	cont "la partie."

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
