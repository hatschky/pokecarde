INCLUDE "berries/macros.asm"

	Enigma_Berry

	Text_EN "DRASH@@"7
	Firmness VERY_HARD
	Size 13,4
	Yield_Range 2, 3
	dd 0
	dd 0
	Growth_Stage_Hours 18
	Flavor 0, 0, 40, 0, 0
	Smoothness 65

BerrySprite:
	INCBIN "sprites/berries/drash.4bpp"
BerryPalette:
	INCLUDE "sprites/berries/drash.pal"

	Text_EN "When it ripens, this sweet BERRY"45
	Text_EN "falls and sticks into the ground."45

	db 0,0,0
	db $10 ; cures poison
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db $04 ; self-cures poison
	db 0,0,0

	End_Berry