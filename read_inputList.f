		program read_inputList

		implicit none 

		! Variables for input file list
		CHARACTER(len=80) filename, argu
		INTEGER  nfile     ! number of netcdf files
		INTEGER ii 

		! get the input file name from command line
		CALL GETARG(1, argu)
		open(10, file=argu, status='old')
		read(10,*) nfile
		do ii=1,nfile
			read(10,*)filename 
			print *, 'Total Files =',nfile,'file=',ii,'  ',filename
		end do
		close(10)

		end program read_inputList