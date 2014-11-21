INCLUDE "macros.asm"

	Berry "STRIB"
	db HARD
	Size 12,2
	Yield_Range 4, 12
	db 0,0,0,0,0,0,0,0
	db 24 ; hours per growth stage
	db 30,0,0,30,0 ; flavor
	db 85  ; smoothness
	db 0

BerrySprite:
	INCBIN "../sprites/berries/strib.4bpp"
BerryPalette:
	INCLUDE "../sprites/berries/strib.pal"

	Tag_Text "It grows slowly, but abundantly."
	Tag_Text "Makes a soothing sound when shaken."
	REPT 22
		db 0 ; Pokéblock ingredient only
	ENDR