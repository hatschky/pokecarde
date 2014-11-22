all: 00-C000-de.z80 00-C000-en.z80


eonticket-%.tx: eonticket.asm
	python ../scripts/charmap.py $< $@
%.tx: %.asm
	python ../scripts/charmap.py $< $@

00-C000-%.o: 00-C000-%.asm 00-C000.tx eonticket-%.bin
	rgbasm -o $@ $<
eonticket-%.o: eonticket-%.asm eonticket-%.tx
	rgbasm -o $@ $<

%.gbc: %.o
	rgblink -o $@ $<

# hack to use RGBDS for something other than its intended purpose
00-C000-de.z80: 00-C000-de.gbc
	dd if=$< of=$@ bs=1 skip=256 count=7134
00-C000-en.z80: 00-C000-en.gbc
	dd if=$< of=$@ bs=1 skip=256 count=7074
#	cmp -b ../z80/$@ $@
eonticket-de.z80: eonticket-de.gbc
	dd if=$< of=$@ bs=1 skip=256 count=691
eonticket-en.z80: eonticket-en.gbc
	dd if=$< of=$@ bs=1 skip=256 count=631
eonticket-%.bin: eonticket-%.z80
	python ../scripts/scriptchecksum.py $< $@

clean:
	rm -f *.tx *.o *.gbc *.z80 *.bin