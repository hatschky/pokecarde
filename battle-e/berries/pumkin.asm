INCLUDE "macros.asm"

	Berry "PUMKIN"
	db SUPER_HARD
	Size 4,8
	Yield_Range 2, 3
	db 0,0,0,0,0,0,0,0
	db 18 ; hours per growth stage
	db 0,0,0,0,40 ; flavor
	db 65  ; smoothness
	db 0

BerrySprite:
	INCBIN "../sprites/berries/pumkin.4bpp"
BerryPalette:
	INCLUDE "../sprites/berries/pumkin.pal"

	Tag_Text "This BERRY is amazingly sour."
	Tag_Text "It’s heavy due to its dense filling."
	db 0,0,0
	db $04 ; cures freeze
	db 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0
	db $06 ; self-cures freeze
	db 0,0,0