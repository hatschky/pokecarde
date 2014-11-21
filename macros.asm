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

; ld b, [hl]
;LD_B_HL_IND: MACRO
;	db $46
;	ENDM
; ld c, [hl]
;LD_C_HL_IND: MACRO
;	db $4E
;	ENDM

; ld l, [hl]
;LD_L_HL_IND: MACRO
;	db $6E
;	ENDM

; ld [hl], b
;LD_IND_HL_B: MACRO
;	db $70
;	ENDM
; ld [hl], c
;LD_IND_HL_C: MACRO
;	db $71
;	ENDM

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

CommonFunction1: MACRO ; Beauty Ellie 1A31, Eon Ticket 1B38
	ret c
	nop
	wait 32
	ld l, $02
	push hl
	ld bc, $B9A0
	ld de, $0076
	ld a, $08
	API $0C4
	pop bc
.asm_1b64
	API $0DB

	cp $01
	jr z, .asm_1b6f
	API $0DB
	or a
	jr nz, .asm_1b76
.asm_1b6f
	waita $01
	API $0C5
	jr .asm_1b64

.asm_1b76
	waita $01
	LD_HL_IND $00C2
	ld a, l
	and $02
	jr z, .asm_1b90

	IS_SOUND_PLAYING 2 ; exit

.asm_1b90
	API $0CA
	cp $02
	jr c, .asm_1b76
	ENDM

CommonFunction2: MACRO ; Beauty Ellie 1AA6, Eon Ticket 1BAF
.asm_1baf
	waita $01
	API $0DB

	ld l, a
	ld h, $00
	LD_IND_HL \1 ; Eon Ticket 1914
	API $0CA

	cp $02
	jr nc, .asm_1bd4

	ld hl, \2 ; Eon Ticket 0078
	SOUND_PAUSE

	IS_SOUND_PLAYING 1 ; return

.asm_1bd4
	LD_HL_IND \1
	ld a, l
	sub $04
	or h
	jr z, .asm_1be6

	LD_HL_IND \1
	ld a, l
	sub $03
	or h
	jr nz, .asm_1baf
.asm_1be6
	ENDM

CommonFunction3: MACRO ; Beauty Ellie 1AE0, Eon Ticket 1BE6
	DRAW_TEXT \1, \2, 8, 4

	ld de, $0040
	ld hl, \9
	API $106

.asm_1bfe
	waita $01

	ld hl, \3
	API $0C8

	or a
	jr nz, .asm_1c18

	IS_SOUND_PLAYING 1 ; return

.asm_1c18
	LD_HL_IND \3
	LD_IND_HL \4
	ld a, l
	cp $22
	jr nz, .asm_1bfe

	ld a, h
	cp $22
	jr nz, .asm_1bfe

	ld de, $003c
	ld hl, \5
	call \7

	ld de, $1800
	ld hl, \6
	call \7

	ld hl, $5fff
	LD_IND_HL \8
	API_0C7 \8
	ENDM