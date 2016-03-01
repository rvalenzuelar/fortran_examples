	program dump_netcdf
	
	! Dump some CfRadial data using netcdf library for fortran.
	!
	! This program uses a makefile to compile the code
	! with netcdf-fortran libraries
	!
	! Raul Valenzuela
	! November 2014
	
	implicit none 
	include '/usr/include/netcdf.inc'

	! Variables for input file list
	character(len=80) :: filename
	integer :: NCID 				! ID of the CfRadial file
	integer :: DIMID				! ID of the variable (dimension)
	integer :: NCSTATUS	! status of the CfRadial file
	integer :: NSWEEPS
	integer :: NBEAMS
	integer :: NRANGES

	! real vectors for dynamic memory allocation
	! if not declare (and use) allocatable then the retrieved values
	! for vector arrays are inconsistent.
	real,allocatable,dimension(:) :: northward_wind	
	real,allocatable,dimension(:) :: vertical_wind		

	
	! get the input file name from command line
	call getarg(1, filename)
	
	NCSTATUS = NF_OPEN(trim(filename),NF_NOWRITE, NCID)
		
	NCSTATUS = NF_INQ_DIMID(NCID, 'sweep', DIMID)			
	NCSTATUS = NF_INQ_DIMLEN(NCID, DIMID, NSWEEPS)

	NCSTATUS = NF_INQ_DIMID(NCID, 'time', DIMID)
	NCSTATUS = NF_INQ_DIMLEN(NCID, DIMID, NBEAMS)
	
	NCSTATUS = NF_INQ_DIMID(NCID, 'range', DIMID)
	NCSTATUS = NF_INQ_DIMLEN(NCID, DIMID, NRANGES)

	print *,
	print *,
	print *, NSWEEPS,' sweeps ', NBEAMS, ' beams found, each with ', NRANGES, ' gates.'

	! allocate variable values
	ALLOCATE(northward_wind(NBEAMS))
	NCSTATUS = NF_INQ_VARID(NCID, 'northward_wind', DIMID)
	NCSTATUS = NF_GET_VAR_REAL(NCID,DIMID, northward_wind)
	print *, 'DIMID= ', DIMID, ' northward_wind = ', northward_wind(1) ! (n) prints the cell n

	! allocate variable values
	ALLOCATE(vertical_wind(NBEAMS)) 
	NCSTATUS = NF_INQ_VARID(NCID, 'vertical_wind', DIMID)
	NCSTATUS = NF_GET_VAR_REAL(NCID,DIMID, vertical_wind)
	print *, 'DIMID= ', DIMID, ' vertical_wind = ', vertical_wind(1) ! (n) prints the cell n

	! releases memory
	DEALLOCATE(northward_wind)
	DEALLOCATE(vertical_wind)

	! close CfRadial file
	NCSTATUS = NF_CLOSE(NCID)

	print *,
	print *,

	end program dump_netcdf
	
	
