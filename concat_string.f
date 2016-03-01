		program concat_string

		implicit none 

		! Variables for input file list
		CHARACTER(len=2) :: str1
		CHARACTER(len=30) :: str2
		str1 = 'VG'
		str2 = 'This is the ' // str1 // ' field'
		WRITE(*,*) str2
		end program concat_string