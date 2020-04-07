subroutine data_output(n_out)
!
    use main_variables
    integer n_out,n_file
    real*8 x_mm
    character*6 data_n, num2str
    nfile = 10+n_out
    data_n = num2str(n_out)
!
    open(unit=n_file, file='data_'//data_n//'.csv' ,status='unknown')
    write (n_file,'(30(A,","))') '  R(mm)','x(-)'
    write (6,'(30(A,","))') '  R(mm)','x(-)'
    do n=1, 200
        x_mm = xscl(n)*1.0d-3
        write (n_file,'(30(E12.4,","))') x_mm, m_chsp(n,1)
        write (6,'(30(E12.4,","))') x_mm, m_chsp(n,1)
    end do
    close(n_file)
!
end subroutine