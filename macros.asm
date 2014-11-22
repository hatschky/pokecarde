; some Z80 opcodes aren’t supported by Game Boy, 
; but are used in e-Reader programs

; ld [\1], hl
LD_IND_HL: MACRO
	db $22, (\1 & $FF), (\1 >> 8)
	ENDM
; ld [\1], a
LD_IND_A: MACRO
	db $32, (\1 & $FF), (\1 >> 8)
	ENDM

; ld hl, [\1]
LD_HL_IND: MACRO
	db $2A, (\1 & $FF), (\1 >> 8)
	ENDM
; ld a, [\1]
LD_A_IND: MACRO
	db $3A
	dw \1
	ENDM

waita: MACRO
	ld a, \1
	db $76
	ENDM
; ld [hl], a
LD_IND_HL_A: MACRO
	db $77
	ENDM

; add a, [hl]
ADD_A_HL_IND: MACRO
	db $86
	ENDM

EX_DE_HL: MACRO
	db $EB
	ENDM

wait: MACRO
	db $D3, \1
	ENDM

API: MACRO
	db ($C7 + (\1 & $100) >> 5), (\1 & $FF) ; $C7 for API $0xx, $CF for API $1xx
	ENDM



dd: MACRO
	dw (\1) & $FFFF
	dw (\1) >> 16
	ENDM

RGB: MACRO
	dw (\1) | ((\2) << 5) | ((\3) << 10)
	ENDM

GBAPTR: MACRO
	dd $02000000 + \2 - \1
	ENDM

Insert_Prologue: MACRO
	db "GameFreak inc."
	db 0,0,0,0,0,0
	dd \1
	db \2
	REPT 8 - STRLEN(\2)
		db 0
	ENDR
	db 0,0,0,0,$01,$55
	db 0,0,0,0
	db \3
	db 0
	db "GameFreak inc."
	db 0,0
	ENDM

Insert_Header: MACRO
	db $01,0,0,0,$02,\1,0,\1,0,0,0,$04,0,$80,$01,0,0
	ENDM

REGION_JP EQU $01
REGION_EN EQU $02
REGION_FR EQU $03 ; ?
REGION_IT EQU $04 ; ?
REGION_DE EQU $05 ; !
REGION_ES EQU $07 ; ¿?

; types of card data
VARIABLE_LENGTH  EQU $02
INSTANT_SCRIPT   EQU $05
IN_GAME_SCRIPT   EQU $06
CUSTOM_BERRY     EQU $07
MIX_RECORDS_ITEM EQU $0B
BATTLE_TRAINER   EQU $0D
MULTIPLE_DATA    EQU $10


; names for some API functions based on Martin Korth’s GBATEK
; http://problemkaputt.de/gbatek.htm
FadeIn: MACRO
	ld a, \1
	API $000
	ENDM
API_02C: MACRO
	ld hl, $0000
	push hl
	ld bc, \1
	ld de, \2
	IF \3 == 0
		xor a ; save a byte
	ELSE
		ld a, \3
	ENDC
	API $02C
	ENDM
LoadCustomBackground: MACRO
	ld de, \1
	IF \2 == 0
		xor a ; save a byte
	ELSE
		ld a, \2
	ENDC
	API $02D
	ENDM
SetSpritePos: MACRO
	ld bc, \3
	ld de, \2
	LD_HL_IND \1
	API $032
	ENDM
SpriteShow: MACRO
	LD_HL_IND \1
	API $046
	ENDM
SpriteHide: MACRO
	LD_HL_IND \1
	API $047
	ENDM
SpriteMirrorToggle: MACRO
	ld e, \1
	LD_HL_IND \2
	API $048
	ENDM
CreateCustomSprite: MACRO
	ld e, \2
	ld hl, \3
	API $04D
	LD_IND_HL \1
	ENDM
SetBackgroundPalette: MACRO
	ld c, \1
	ld de, \2
	ld hl, \3
	API $07E
	ENDM
API_084: MACRO
	ld l, \4
	push hl
	ld bc, \3
	ld de, \2
	LD_HL_IND \1
	API $084
	ENDM
CreateRegion: MACRO
	ld bc, (\2 << 8 + \3)
	ld de, (\4 << 8 + \5)
	ld hl, (\6 << 8 + \7)
	API $090
	LD_IND_A \1
	ENDM
SetRegionColor: MACRO
	ld e, \2
	LD_A_IND \1
	API $091
	ENDM
CLEAR_REGION: MACRO
	LD_A_IND \1
	API $092
	ENDM
SetTextColor: MACRO
	ld de, (\2 << 8 + \3)
	LD_A_IND \1
	API $098
	ENDM
DrawText: MACRO
	CLEAR_REGION \1
	ld bc, \2
	ld de, (\3 << 8 + \4)
	LD_A_IND \1
	API $099
	ENDM
SetTextSize: MACRO
	API $09A
	ENDM
API_09B: MACRO
	ld de, \2
	LD_A_IND \1
	API $09B
	ENDM
API_0C7: MACRO
	ld hl, \1
	API $0C7
	ENDM
EXIT: MACRO
	API $100
	ENDM
API_106: MACRO
	ld de, \1
	ld hl, \2
	API $106
	ENDM
SOUND_PAUSE: MACRO
	API $116
	ENDM
IS_SOUND_PLAYING: MACRO
	API $08D
	ld b, $00
	ld e, $01
	ld hl, $0006
	API $119
	ld a, \1
	EXIT
	ENDM
API_121: MACRO
	ld de, $0000
	ld hl, $0000
	API $121
	ENDM