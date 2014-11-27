INCLUDE "../macros.asm"
SECTION "prologue", ROM0[$100]

	db "GameFreak inc."
	db 0,0,0,0,0,0
	dd $12345678
	Text "カ。ドＥ"8 ; corrupted カードｅ “Card e”
	db 0,0,0,0,$01,$55
	db 0,0,0,0
	db REGION
	db 0
	db "GameFreak inc."
	db 0,0
	EOF