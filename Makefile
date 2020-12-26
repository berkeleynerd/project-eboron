CFLAGS = -g -O2 -flto -Wall -Wextra -Wconversion -Wno-sign-conversion -Wno-unused-parameter -std=c99

norebo: src/Runtime/norebo.c src/Runtime/risc-cpu.c src/Runtime/risc-cpu.h
	$(CC) -o $@ src/Runtime/norebo.c src/Runtime/risc-cpu.c $(CFLAGS)

clean:
	rm -f norebo
	rm -rf build1 build2 build3
