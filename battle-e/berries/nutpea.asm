INCLUDE "macros.asm"

	Berry "NUTPEA"
	db SUPER_HARD
	Size 12,4
	Yield_Range 1, 3
	db 0,0,0,0,0,0,0,0
	db 18 ; hours per growth stage
	db 10,10,10,10,10 ; flavor
	db 5 ; smoothness
	db 0

BerrySprite:
	INCBIN "../sprites/berries/nutpea.4bpp"

BerryPalette:
	INCLUDE "../sprites/berries/nutpea.pal"

	Tag_Text "This BERRY is rigid and cracks open"
	Tag_Text "when the center is squeezed."
	REPT 22
		db 0 ; Pokéblock ingredient only
	ENDR