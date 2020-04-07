! test program for spherical flame propagation
!
!
    use main_variables
    real*8 xtime
    integer n_out, out_step
!
!   -------- data in out ----------
    out_step = 1000
    n_out = 0
!
!   -------- initial setting ------------
    call grid_set
    call initial_set
!
!   -------- time loop --------------
!
    xtime = 0.0d0
!
    do ntime = 1, 9999999
        xtime = xtime+delt_t
! 
        call scl_trans        
!
!   -------- data output --------------
!
        if (mod(ntime,out_step).eq.0) then
            n_out = n_out+1
            call data_output(n_out)
        end if
!
        if (xtime.ge.time_end) exit
    end do
!
    end
   