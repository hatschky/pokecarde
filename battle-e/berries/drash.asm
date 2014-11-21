INCLUDE "macros.asm"

	Berry "DRASH"
	db VERY_HARD
	Size 13,4
	Yield_Range 2, 3
	db 0,0,0,0,0,0,0,0
	db 18 ; hours per growth stage
	db 0,0,40,0,0 ; flavor
	db 65  ; smoothness
	db 0

BerrySprite:
	INCBIN "../sprites/berries/drash.4bpp"
BerryPalette:
	INCLUDE "../sprites/berries/drash.pal"

	Tag_Text "When it ripens, this sweet BERRY"
	Tag_Text "falls and sticks into the ground."
	db 0,0,0
	db $10 ; cures poison
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $04 ; self-cures poison
	db 0,0,0