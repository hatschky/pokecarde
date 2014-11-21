RGB: MACRO
	dw \1 | (\2 << 5) | (\3 << 10)
	ENDM

Berry: MACRO
	Section "berry",ROM0[$100]
	db \1
	REPT 7 - STRLEN(\1)
		db $FF
	ENDR
	ENDM

; firmness
VERY_SOFT  EQU 1
SOFT       EQU 2
HARD       EQU 3
VERY_HARD  EQU 4
SUPER_HARD EQU 5

Yield_Range: MACRO
	db \2, \1
	ENDM

Size: MACRO
	dw \1 * 10 + \2
	ENDM

; this can’t be used because RGBDS has no reliable way of putting null bytes in strings
;Tag_Text: MACRO
;	db \1
;	db $FF
;	REPT 44 - STRLEN(\1)
;		db 0
;	ENDR
;	ENDM

Tag_Text EQUS "db"