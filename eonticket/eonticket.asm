INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"
ScriptBaseAddress EQU ($100 - $1E)

SECTION "packet",ROM0[$100]


	db IN_GAME_SCRIPT
	db 8,1 ; Petalburg Gym
	db 1   ; Norman
	GBAPTR ScriptBaseAddress, NormanScriptStart
	GBAPTR ScriptBaseAddress, NormanScriptEnd


	db MIX_RECORDS_ITEM
	db 1  ; ???
	db 30 ; distribution limit
	dw EON_TICKET


	db INSTANT_SCRIPT
	GBAPTR ScriptBaseAddress, PreloadScriptStart


	db VARIABLE_LENGTH
GoSeeYourFather:
	Text "Go see your father at the GYM in\n"
	Text "PETALBURG.@"

NormanScriptStart:
	setvirtualaddress NormanScriptStart
	
	checkitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, KillScript
	checkpcitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, KillScript
	checkflag $00CE
	virtualgotoif 1, KillScript
	
	lock
	faceplayer
	virtualmsgbox GoodToSeeYou
	waitmsg
	waitkeypress

	checkitemroom EON_TICKET, 1
	compare LASTRESULT, 0
	virtualgotoif 1, NoRoomToGive

	copyvarifnotzero $8000, EON_TICKET
	copyvarifnotzero $8001, 1
	callstd 0
	setflag $0853
	virtualmsgbox AppearsToBeAFerryTicket
	waitmsg
	waitkeypress
	release
KillScript:
	killscript

NoRoomToGive:
	virtualmsgbox KeyItemsPocketIsFull
	waitmsg
	waitkeypress
	release
	end

; whoever wrote this text obviously wasn’t
; familiar with R/S’s character set…
GoodToSeeYou:
	Text "DAD“\v1! Good to see you!\n"
	Text "There’s a letter here for you,\v1.@"
AppearsToBeAFerryTicket:
	Text "DAD“It appears to be a ferry TICKET.\n"
	Text "but I’ve never seen one like it before.\l"
	Text "You should visit LILYCOVE and ask\n"
	Text "about it there.@"
KeyItemsPocketIsFull:
	Text "DAD“\v1’ the KEY ITEMS POCKET in\n"
	Text "your BAG is full.\p"
	Text "Move some key items for safekeeping\n"
	Text "in your PC’ then come see me.@"
NormanScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart
	
	checkitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, Ineligible
	checkpcitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, Ineligible
	checkflag $00CE
	virtualgotoif 1, Ineligible

	checkitemroom EON_TICKET, 1
	compare LASTRESULT, 0
	virtualgotoif 1, NoRoomForEvent

	virtualloadpointer GoSeeYourFather
	setbyte 2
	end

Ineligible:
	virtualloadpointer MayBeplayedOnlyOnce
	setbyte 3
	end

NoRoomForEvent:
	virtualloadpointer BagsKeyItemsPocketFull
	setbyte 3
	end

; …or with the English language.
MayBeplayedOnlyOnce:
	Text "This EVENT may beplayed only once.@"

BagsKeyItemsPocketFull:
	Text "Your BAG’s KEY ITEMS POCKET is full.@"