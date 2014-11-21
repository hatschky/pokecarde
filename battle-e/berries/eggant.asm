INCLUDE "macros.asm"

	Berry "EGGANT"
	db SOFT
	Size 4,1
	Yield_Range 2, 3
	db 0,0,0,0, 0,0,0,0
	db 18 ; hours per growth stage
	db 0,40,0,0,0 ; flavor
	db 65  ; smoothness
	db 0

BerrySprite:
	INCBIN "../sprites/berries/eggant.4bpp"
BerryPalette:
	INCLUDE "../sprites/berries/eggant.pal"

	Tag_Text "Very dry tasting, especially the"
	Tag_Text "parts not exposed to the sun."
	db 0,0,0
	db $00
	db 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0
	db $1C ; self-cure infatuation
	db 0,0,0