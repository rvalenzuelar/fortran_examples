# Makefile for navigation corrections software

FC = gfortran
CC = gcc
FFLAGS = -g
CFLAGS = -g
LDFLAGS = 

# Libraries
NETCDF = /usr/local
LIBS = -L${NETCDF}/lib -lnetcdf -lnetcdff -lcurl -lhdf5 -lhdf5_hl
INCLUDES = -I${NETCDF}/include

all: dump_netcdf

*.o:
	${FC} ${FFLAGS} ${LDFLAGS} -c $? ${INCLUDES}

dump_netcdf: dump_netcdf.f90
	${FC} ${FFLAGS} ${LDFLAGS} -o $@ $? ${LIBS} ${INCLUDES}

clean:
	rm -f core *.o *~ 

