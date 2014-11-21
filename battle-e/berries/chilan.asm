INCLUDE "macros.asm"

	Berry "CHILAN"
	db SOFT
	Size 27,2
	Yield_Range 1, 2
	REPT 8
		db 0
	ENDR
	db 1 ; hours per growth stage
	db 30,0,30,0,0 ; flavor
	db 85  ; smoothness
	db 0

BerrySprite:
	INCBIN "../sprites/berries/chilan.4bpp"
BerryPalette:
	INCLUDE "../sprites/berries/chilan.pal"

	Tag_Text "This sparse BERRY grows quickly."
	Tag_Text "Its skin is quite tough."
	REPT 22
		db 0 ; Pokéblock ingredient only
	ENDR