INCLUDE "../constants/abilities.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/moves.asm"
INCLUDE "../constants/pokemon.asm"
INCLUDE "../constants/trainerclasses.asm"

MOSSDEEP_BATTLE EQU 0

LEVEL: MACRO
	dw \1
	ENDM
EVs: MACRO
	db \1, \2, \3, \4, \5, \6
	ENDM
OT: MACRO
	dw \1, \2
	ENDM
IVs: MACRO
	dw \1 + (\2 << 5) + (\3 << 10) + ((\4 & 1) << 15)
	dw (\4 >> 1) + (\5 << 4) + (\6 << 9) + (\7 << 15)
	ENDM
PV: MACRO
	dw (\1 & $FFFF), (\1 >> 16)
	ENDM