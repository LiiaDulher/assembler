LINKER ?= gcc
OUR_СС ?= gcc

ALL_TARGETS = asm_use_sort c_use_sort
FASM = ./FASMWIN.EXE

all: ${ALL_TARGETS}
	echo ${ALL_TARGETS}

asm_use_sort: asm_use_sort.o sort.o
	${LINKER} $^ -o $@

asm_use_sort: asm_use_sort.o sort.o
	${LINKER} $^ -o $@

%.o: %.c
	${OUR_СС} $^ -o $@ -c

%.o: %.asm
	INCLUDE=./INCLUDE ${FASM} $<

.PHONY: clean
clean:
	@rm *.o ${ALL_TARGETS}  || true