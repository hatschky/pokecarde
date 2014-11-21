all: 00-C000.z80

%.tx: %.asm
	python ../scripts/charmap.py $< $@

00-C000.o: 00-C000.tx eonticket.bin
	rgbasm -o $@ $<
eonticket.o: eonticket.tx
	rgbasm -o $@ $<

%.gbc: %.o
	rgblink -o $@ $<

# hack to use RGBDS for something other than its intended purpose
00-C000.z80: 00-C000.gbc
	dd if=$< of=$@ bs=1 skip=256 count=7074
#	cmp -b ../z80/$@ $@
eonticket.z80: eonticket.gbc
	dd if=$< of=$@ bs=1 skip=256 count=631
eonticket.bin: eonticket.z80
	python ../scripts/scriptchecksum.py $< $@

clean:
	rm -f *.tx *.o *.gbc *.z80 *.bin