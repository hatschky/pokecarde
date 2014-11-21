all: chilan.bin drash.bin eggant.bin nutpea.bin pumkin.bin strib.bin

%.1: %.asm
	python ../../scripts/charmap.py $< $@

%.2: %.1
	rgbasm -o $@ $<

%.3: %.2
	rgblink -o $@ $<

%.4: %.3
	dd if=$< of=$@ bs=1 skip=256 count=1324

%.bin: %.4
	python ../../scripts/berrychecksum.py $< $@

clean:
	rm -f *.bin