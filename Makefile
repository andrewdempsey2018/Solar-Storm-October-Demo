begin_build:	
	echo " DEBUG build start ->"

	ca65 src/main.asm -g -o src/main.o

	ld65 -o game.nes -C nes.cfg src/main.o --dbgfile game.dbg

	echo "------- DEBUG build S-U-C-C-E-S-S.-------"