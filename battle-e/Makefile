all: 08-A001.z80 08-A002.z80 08-A003.z80 08-A004.z80 \
     08-A005.z80 08-A006.z80 08-A007.z80 08-A008.z80 \
     08-A009.z80 08-A010.z80 08-A011.z80 08-A012.z80 \
     08-A013.z80 08-A014.z80 08-A015.z80 08-A016.z80 \
     08-A017.z80 08-A018.z80 08-A019.z80 08-A020.z80 \
     08-A021.z80 08-A022.z80 08-A023.z80 08-A024.z80 \
     08-A025.z80 08-A026.z80 08-A027.z80 08-A028.z80 \
     08-A029.z80 08-A030.z80 08-A031.z80 08-A032.z80 \
     08-A033.z80 08-A034.z80 08-A035.z80 08-A036.z80 \
     08-A037.z80 08-A038.z80 08-A039.z80 08-A040.z80 \
     08-A041.z80 08-A042.z80 08-A043.z80 08-A044.z80 \
     08-A045.z80 08-A046.z80 08-A047.z80 08-A048.z80 \
     08-K001.z80 08-K002.z80 08-K003.z80 08-K004.z80 \
     08-K005.z80 08-K006.z80

%.tx: %.asm
	python ../scripts/charmap.py $< $@

08-A%.o: 08-A%.asm battletrainer.tx
	rgbasm -o $@ $<
08-K%.o: 08-K%.asm enigmaberry.tx
	rgbasm -o $@ $<
%.gbc: %.o
	rgblink -o $@ $<
# hack to use RGBDS for something other than its intended purpose
08-A%.z80: 08-A%.gbc
	dd if=$< of=$@ bs=1 skip=256 count=6815
#	cmp -b ../z80/$@ $@
08-K%.z80: 08-K%.gbc
	dd if=$< of=$@ bs=1 skip=256 count=3578
#	cmp -b ../z80/$@ $@

clean:
	rm -f *.z80 *.tx *.o *.gbc