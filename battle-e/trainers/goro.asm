INCLUDE "macros.asm"

	BT_Level MOSSDEEP
	Class NINJA_BOY
	BT_Floor MOSSDEEP
	OT_Name "GORO"
	OT_ID 00000, 00000

	Introduction COME_ON,_EX_EX,COME_ON,_EX_EX,SPEED_BOOST,_EX_EX
	After_Win    MORE,_EX_EX,MORE,_EX_EX,SPEED_BOOST,_EX_EX
	After_Loss   ARRGH,_ELIP,GIVE_ME,MORE,SPEED_BOOST,_ELIP_EX

	Pokemon ELECTRODE
	Holds KING_S_ROCK
	Moves THUNDERBOLT, LIGHT_SCREEN, MIRROR_COAT, EXPLOSION
	Level 50
	PP_Ups 0,0,0,0
	EVs 0,0,0,255,255,0
	OT_ID 00000, 00000
	IVs 15,15,15,31,31,15, ELECTRODE_STATIC
	PV $0000000E ; ⚲ Naive
	Nickname "ELECTRODE"
	Friendship 255

	Pokemon NINJASK
	Holds KING_S_ROCK
	Moves SILVER_WIND, AERIAL_ACE, FAINT_ATTACK, SHADOW_BALL
	Level 52
	PP_Ups 0,0,0,0
	EVs 0,255,0,255,0,0
	OT_ID 00000, 00000
	IVs 15,31,15,31,15,15, NINJASK_SPEED_BOOST
	PV $000000D5 ; ♂ Jolly
	Nickname "NINJASK"
	Friendship 255

	Pokemon CROBAT
	Holds KING_S_ROCK
	Moves CONFUSE_RAY, SLUDGE_BOMB, AIR_CUTTER, DOUBLE_TEAM
	Level 54
	PP_Ups 0,0,0,0
	EVs 0,255,0,255,0,0
	OT_ID 00000, 00000
	IVs 15,31,15,31,15,15, CROBAT_INNER_FOCUS
	PV $0000000D ; ♀ Jolly
	Nickname "CROBAT"
	Friendship 255