INCLUDE "macros.asm"

	BT_Level MOSSDEEP
	db HIKER
	BT_Floor MOSSDEEP
	OT_Name "HUGO"
	OT_ID 00000, 00000

	Introduction START,_A,DIET,_QU,NO,WAY
	After_Win    HAH,_ELIP,I_AM,NOW,HUNGRY,_ELIP
	After_Loss   IT_S,SUPER,HARD,TO,DIET,_EX_EX

	Pokemon WALREIN
	dw SITRUS_BERRY
	Moves BLIZZARD, REST, BODY_SLAM, SURF
	Level 66
	PP_Ups 0,0,0,0
	EVs 252,0,0,0,252,6
	OT_ID 00000, 00000
	IVs 31,15,15,15,31,15, WALREIN_THICK_FAT
	PV $0000008E ; ♂ Quiet
	Nickname "WALREIN"
	Friendship 255

	Pokemon HARIYAMA
	Holds FOCUS_BAND
	Moves WHIRLWIND, KNOCK_OFF, BELLY_DRUM, CROSS_CHOP
	Level 68
	PP_Ups 0,0,0,0
	EVs 252,252,0,0,0,6
	OT_ID 00000, 00000
	IVs 31,31,15,15,15,15, HARIYAMA_THICK_FAT
	PV $0000007F ; ♂ Brave
	Nickname "HARIYAMA"
	Friendship 255

	Pokemon GRUMPIG
	dw SITRUS_BERRY
	Moves PSYCHIC, IRON_TAIL, CONFUSE_RAY, PROTECT
	Level 70
	PP_Ups 0,0,0,0
	EVs 0,0,0,6,252,252
	OT_ID 00000, 00000
	IVs 15,15,15,15,31,31, GRUMPIG_THICK_FAT
	PV $00000018 ; ♀ Quirky
	Nickname "GRUMPIG"
	Friendship 255