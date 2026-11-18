; see constants/player_constants.asm

DefaultNamesPlayer:
	db "NOUV. NOM"
FOR n, 1, NUM_PLAYER_NAMES + 1
	next #PLAYERNAME{d:n}
ENDR
	db "@"

DefaultNamesRival:
	db "NOUV. NOM"
FOR n, 1, NUM_PLAYER_NAMES + 1
	next #RIVALNAME{d:n}
ENDR
	db "@"
