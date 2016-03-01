	program write_function

	implicit none 

	! Variables for input file list
	character(len=80) infilename
	integer  ifile     
	
	ifile=1
	
	write(infilename,'(I0.3)') ifile
	infilename = '/somepath/' // TRIM(ADJUSTL(infilename)) // '.txt'
	print *, infilename
	
	
	end program write_function
