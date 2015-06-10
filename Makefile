CC = gcc
CFLAGS = -O1 -std=c99 -fPIC
NAME = $(shell basename $(shell pwd))
TARGET = lib${NAME}.so

.SUFFIXS: .c .cpp

main: main.o
	${CC} -shared $< -o ${TARGET}

%.o: %.c
	${CC} $< ${CFLAGS} -c

.PHONY: install

install:
	cp ${TARGET} /usr/lib/

.PHONY: uninstall

uninstall:
	rm /usr/lib/${TARGET}

.PHONY: clean

clean:
	@rm -rf *.o *.so