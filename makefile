CC=g++
ODIR=obj
#PRE_FLAGS=-lgcov -g -fprofile-arcs -ftest-coverage
#PRE_FLAGS=-g
PRE_FLAGS=-O3
CFLAGS=-fopenmp -ltbb -Wall -lX11 -pthread
DEPS = d8_methods.h  data_structures.h  dinf_methods.h  interface.h  data_io.h pit_fill.h  utility.h  flat_resolution.h  debug.h visualize.h

_OBJ = d8_methods.o data_structures.o dinf_methods.o interface.o data_io.o main.o pit_fill.o utility.o flat_resolution.o debug.o visualize.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.cpp $(DEPS)
	$(CC) $(PRE_FLAGS) -c -o $@ $< $(CFLAGS)

richdem: $(OBJ)
	$(CC) $(PRE_FLAGS) -o $@ $^ $(CFLAGS)
	du -hs ./richdem

clean:
	rm -f $(ODIR)/*.o *~ core
