INCLUDE "../../constants/abilities.asm"
INCLUDE "../../constants/easychat.asm"
INCLUDE "../../constants/items.asm"
INCLUDE "../../constants/moves.asm"
INCLUDE "../../constants/pokemon.asm"
INCLUDE "../../constants/trainerclasses.asm"

MOSSDEEP EQU 0

BT_Level: MACRO
	Section "battle",ROM0[$100]
	db \1
	ENDM
Class: MACRO
	db (\1)
	ENDM
BT_Floor: MACRO
	dw \1
	ENDM
OT_Name: MACRO
	db \1
	db $FF
	REPT 7 - STRLEN(\1)
		db 0
	ENDR
	ENDM
Introduction: MACRO
	dw \1, \2, \3, \4, \5, \6
	ENDM
After_Win: MACRO
	dw \1, \2, \3, \4, \5, \6
	ENDM
After_Loss: MACRO
	dw \1, \2, \3, \4, \5, \6
	ENDM
Pokemon: MACRO
	dw \1
	ENDM
Holds: MACRO
	dw (\1)
	ENDM
Moves: MACRO
	dw \1, \2, \3, \4
	ENDM
Level: MACRO
	db \1
	ENDM
PP_Ups: MACRO
	db (\1) + (\2 << 2) + (\3 << 4) + (\4 << 6)
	ENDM
EVs: MACRO
	db \1, \2, \3, \4, \5, \6
	ENDM
OT_ID: MACRO
	dw \1, \2
	ENDM
IVs: MACRO
	dw \1 + (\2 << 5) + (\3 << 10) + ((\4 & 1) << 15)
	dw (\4 >> 1) + (\5 << 4) + (\6 << 9) + (\7 << 15)
	ENDM
PV: MACRO
	dw (\1 & $FFFF), (\1 >> 16)
	ENDM
Nickname: MACRO
	db \1
	db $FF
	REPT 10 - STRLEN(\1)
		db 0
	ENDR
	ENDM
Friendship: MACRO
	db \1
	ENDM