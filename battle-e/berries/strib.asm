INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "STRIB@@"7
	Firmness HARD
	Size 12,2
	Yield_Range 4, 12
	dd 0
	dd 0
	Growth_Stage_Hours 24
	Flavor 30, 0, 0, 30, 0
	Smoothness 85

BerrySprite:
	INCBIN "sprites/berries/strib.4bpp"
BerryPalette:
	INCLUDE "sprites/berries/strib.pal"

	Text_EN "It grows slowly, but abundantly."45
	Text_EN "Makes a soothing sound when shaken."45

	REPT 22
		db 0 ; Pokéblock ingredient only
	ENDR

	End_Berry