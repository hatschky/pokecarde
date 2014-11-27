LASTRESULT EQU $800D
end: MACRO
	db $02
	ENDM
callstd: MACRO
	db $09, \1
	ENDM
killscript: MACRO
	db $0D
	ENDM
setbyte: MACRO
	db $0E, \1
	ENDM
copyvarifnotzero: MACRO
	db $1A
	dw \1, \2
	ENDM
compare: MACRO
	db $21
	dw \1, \2
	ENDM
setflag: MACRO
	db $29
	dw \1
	ENDM
checkflag: MACRO
	db $2B
	dw \1
	ENDM
checkitemroom: MACRO
	db $46
	dw \1, \2
	ENDM
checkitem: MACRO
	db $47
	dw \1, \2
	ENDM
checkpcitem: MACRO
	db $4A
	dw \1, \2
	ENDM
faceplayer: MACRO
	db $5A
	ENDM
waitmsg: MACRO
	db $66
	ENDM
lock: MACRO
	db $6A
	ENDM
release: MACRO
	db $6C
	ENDM
waitkeypress: MACRO
	db $6D
	ENDM
setvirtualaddress: MACRO
	db $B8
	GBAPTR \1
	ENDM
virtualgotoif: MACRO
	db $BB
	db \1
	GBAPTR \2
	ENDM
virtualmsgbox: MACRO
	db $BD
	GBAPTR \1
	ENDM
virtualloadpointer: MACRO
	db $BE
	GBAPTR \1
	ENDM