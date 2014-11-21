all: alana.bin annie.bin antonio.bin april.bin astrid.bin belford.bin bryce.bin candice.bin celina.bin clayton.bin devin.bin dominic.bin dustin.bin ellie.bin fay.bin fuego.bin goro.bin griffin.bin hayden.bin heather.bin hillary.bin hugo.bin irazu.bin irvin.bin jeffrey.bin judith.bin justine.bin kendall.bin logan.bin maggie.bin mandy.bin marcus.bin natalie.bin natasha.bin nils.bin oscar.bin patrick.bin raquel.bin renee.bin rudy.bin sandia.bin sandy.bin sofia.bin sonya.bin sophie.bin stuart.bin testing.bin tsutomu.bin tyler.bin wilson.bin zuril.bin

%.1: %.asm
	python ../../scripts/charmap.py $< $@

%.2: %.1
	rgbasm -o $@ $<

%.3: %.2
	rgblink -o $@ $<

%.4: %.3
	dd if=$< of=$@ bs=1 skip=256 count=184

%.bin: %.4
	python ../../scripts/trainerchecksum.py $< $@

clean:
	rm -f *.bin