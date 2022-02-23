CC = ghdl
CFLAGS = -e
EXECS = Calculator_HayesCalvert_tb
LIBSRCS = --ieee=standard

Calculator_HayesCalvert_tb: Calculator_HayesCalvert_tb.o
	${CC} ${CFLAGS} Calculator_HayesCalvert_tb.o

Calculator_HayesCalvert_tb.o:
	${CC} *.vhd

clean:
	rm -f *.o