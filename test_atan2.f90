!
! Raul Valenzuela
! September 2014
!

program test_atan2

character(len=3) :: argu1,argu2
real :: x,y  
real :: rad2deg
real :: pi

call getarg(1,argu1)
call getarg(2,argu2)

pi=4*atan(1.) ! way to declare it precisely in fortran
rad2deg=180/pi

! Write( string, '(f10.2)' )  x      ! writes 53.65 into the string
! Read( string, '(f10.0)' )  y      ! reads the value from string and assigns it to y
!                                           ! note the f10.0 format is nice... you don't have
!                                           ! to know in advance where the decimal pt lies.

read(argu1,*) y
read(argu2,*) x

outvalue=atan2(x,y)

if (outvalue .le. 0) then
outvalue=outvalue+360/rad2deg
end if 

write(*,*) outvalue*rad2deg

end program
