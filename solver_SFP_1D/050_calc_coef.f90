subroutine calc_coef(phi, a_i, b_i, c_i, d_i)

    use main_variables
!
    real*8 A_p, A_m
    real*8 B_p, B_m
    real*8 delt_x_p, delt_x_m, xi
    real*8 a_i(nmax), b_i(nmax), c_i(nmax), d_i(nmax)
    real*8 phi(nmax)
    real*8 Gamma_p, Gamma_m
    real*8, parameter :: x_D = 0.205d-4      !!temporary diffusion coef (self N2)
!   dens(n) óvïœçXÅÉÅÅíçà”
!
!   ------- n=1 center boundary condition ---------
        delt_x_p = xscl(2)-xscl(1)
        Gamma_p  = 0.5d0*(dens(2)*x_D+dens(1)*x_D)
!
        a_i(1) = dens(1)/delt_t-dens(1)*xvel(1)/delt_x_p+2.0d0*Gamma_p/(delt_x_p**2)
        b_i(1) = 2.0d0*Gamma_p/(delt_x_p**2)-dens(1)*xvel(1)/delt_x_p
        c_i(1) = 0.0d0
        d_i(1) = phi(1)*dens(1)/delt_t
!    
!   ------- coef. calc. ---------
    do n=2, nmax-1
!
        delt_x_p = xscl(n+1)-xscl(n)
        delt_x_m = xscl(n)-xscl(n-1)
        xi       = delt_x_p*delt_x_m*(delt_x_p+delt_x_m)
        Gamma_m  = 0.5d0*(dens(n-1)*x_D+dens(n)*x_D)
        Gamma_p  = 0.5d0*(dens(n+1)*x_D+dens(n)*x_D)
!        
        A_p = 0.5d0*(dens(n+1)+dens(n))*xvel(n)*delt_x_m**2/xi
        A_m = 0.5d0*(dens(n)+dens(n-1))*xvel(n-1)*delt_x_p**2/xi
        B_p = 2.0d0*Gamma_p*(xscl(n)+delt_x_p)**2/(xscl(n)**2*(delt_x_p+delt_x_m)*delt_x_p)
        B_m = 2.0d0*Gamma_m*(xscl(n)-delt_x_m)**2/(xscl(n)**2*(delt_x_p+delt_x_m)*delt_x_m)
!
        a_i(n) = dens(n)/delt_t+A_m-A_p+B_p+B_m
        b_i(n) = B_p-A_p
        c_i(n) = B_m+A_m
        d_i(n) = phi(n)*dens(n)/delt_t
!
    end do
!
!
!   ------- n=nmax far field boundary condition ---------
        delt_x_m = xscl(nmax)-xscl(nmax-1)

        a_i(nmax) = dens(nmax)/delt_t+dens(nmax)*xvel(n-1)/delt_x_m
        b_i(nmax) = 0.0d0
        c_i(nmax) = dens(nmax)*xvel(n-1)/delt_x_m
        d_i(nmax) = phi(namx)*dens(nmax)/delt_t
!
!
end subroutine