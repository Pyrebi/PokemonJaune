_SSAnneCaptainsRoomRubCaptainsBackText::
	text "CAPITAINE:"
	line "Ooargh... Je me"
	cont "sens affreux..."
	cont "Burp! Mal de"
	cont "mer..."

	para "<PLAYER> frotte le"
	line "dos du CAPITAINE!"

	para "Frotte-frotte..."
	line "Frotte-frotte...@"
	text_end

_SSAnneCaptainsRoomCaptainIFeelMuchBetterText::
	text "CAPITAINE: Ouf!"
	line "Merci! Je me sens"
	cont "beaucoup mieux!"

	para "Tu veux voir ma"
	line "technique de"
	cont "COUPE?"

	para "Je pourrais te la"
	line "montrer si je"
	cont "n'étais pas"
	cont "malade..."

	para "J'y pense! Prends"
	line "ceci!"

	para "Apprends-la à ton"
	line "#MON et tu"
	cont "pourras voir"
	cont "COUPE quand tu"
	cont "veux!"
	prompt

_SSAnneCaptainsRoomCaptainReceivedHM01Text::
	text "<PLAYER> obtient"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SSAnneCaptainsRoomCaptainNotSickAnymoreText::
	text "CAPITAINE: Ouf!"

	para "Maintenant que je"
	line "ne suis plus"
	cont "malade, il est"
	cont "temps de partir."
	done

_SSAnneCaptainsRoomCaptainHM01NoRoomText::
	text "Oh non! Tu n'as"
	line "pas de place pour"
	cont "ça!"
	done

_SSAnneCaptainsRoomTrashText::
	text "Beurk! J'aurais"
	line "pas dû regarder!"
	done

_SSAnneCaptainsRoomSeasickBookText::
	text "Comment vaincre"
	line "le mal de mer..."
	cont "Le CAPITAINE lit"
	cont "ça!"
	done
