INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 8,1 ; Petalburg Gym
	db 1   ; Norman
	GBAPTR NormanScriptStart
	GBAPTR NormanScriptEnd


	db MIX_RECORDS_ITEM
	db 1  ; ???
IF REGION == REGION_DE
	db 5  ; distribution limit from German debug ROM
ELSE
	db 30 ; distribution limit from English release
ENDC
	dw EON_TICKET


	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart


	db END_OF_CHUNKS


GoSeeYourFather:
	Text_DE "Lauf und besuche deinen Vater in der\n"
	Text_DE "ARENA von BLÜTENBURG CITY.@"

	Text_EN "Go see your father at the GYM in\n"
	Text_EN "PETALBURG.@"


NormanScriptStart:
	setvirtualaddress NormanScriptStart
	
	checkitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .delete_script
	checkpcitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .delete_script
	checkflag $00CE
	virtualgotoif 1, .delete_script
	
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
.delete_script
	killscript

NoRoomToGive:
	virtualmsgbox KeyItemsPocketIsFull
	waitmsg
	waitkeypress
	release
	end

GoodToSeeYou:
	Text_EN "DAD“\v1! Good to see you!\n"
	Text_EN "There’s a letter here for you,\v1.@"

	Text_DE "VATER: \v1! Schön, dich zu sehen!\n"
	Text_DE "Hier ist ein Brief für dich, \v1.@"

AppearsToBeAFerryTicket:
	Text_EN "DAD“It appears to be a ferry TICKET.\n"
	Text_EN "but I’ve never seen one like it before.\l"
	Text_EN "You should visit LILYCOVE and ask\n"
	Text_EN "about it there.@"

	Text_DE "VATER: Ich bin mir nicht sicher, es\n"
	Text_DE "könnte ein TICKET für eine Fähre sein.\p"
	Text_DE "Du solltest nach SEEGRASULB CITY gehen\n"
	Text_DE "und dich dort genauer erkundigen.@"

KeyItemsPocketIsFull:
	Text_EN "DAD“\v1’ the KEY ITEMS POCKET in\n"
	Text_EN "your BAG is full.\p"
	Text_EN "Move some key items for safekeeping\n"
	Text_EN "in your PC’ then come see me.@"

	Text_DE "VATER: \v1, die BASIS-TASCHE\n"
	Text_DE "deines BEUTELS ist voll.\p"
	Text_DE "Lagere einige deiner Basis-Items in\n"
	Text_DE "deinem PC und komm dann wieder.@"

; whoever wrote the English text obviously wasn’t
; familiar with R/S’s character set…
NormanScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart
	
	checkitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .ineligible
	checkpcitem EON_TICKET, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .ineligible
	checkflag $00CE
	virtualgotoif 1, .ineligible

	checkitemroom EON_TICKET, 1
	compare LASTRESULT, 0
	virtualgotoif 1, .no_room

	virtualloadpointer GoSeeYourFather
	setbyte 2
	end

.ineligible
	virtualloadpointer MayBeplayedOnlyOnce
	setbyte 3
	end

.no_room
	virtualloadpointer BagsKeyItemsPocketFull
	setbyte 3
	end

MayBeplayedOnlyOnce:
; …or with the English language.
	Text_EN "This EVENT may beplayed only once.@"

	Text_DE "Dieses GESCHEHEN kann nur einmal\n"
	Text_DE "gespielt werden.@"

BagsKeyItemsPocketFull:
	Text_EN "Your BAG’s KEY ITEMS POCKET is full.@"

	Text_DE "Deine BASIS-TASCHE ist voll.@"

DataEnd:
	EOF