subroutine calc_tdma(phi, a_i, b_i, c_i, d_i)
!
    use main_variables
    real*8, intent(in)  :: a_i(nmax), b_i(nmax), c_i(nmax), d_i(nmax)
    real*8, intent(out) :: phi(nmax)
    real*8 P_i(nmax), Q_i(nmax)
!
!   -------- TDMA calculation ---------
!   (1) Calc. P1, Q1
    P_i(1) = b_i(1)/a_i(1)
    Q_i(1) = d_i(1)/a_i(1)
!
!   (2) Calc. Pi, Qi
    do n=2, nmax
        P_i(n) = b_i(n)/(a_i(n)-c_i(n)*P_i(n-1))
        Q_i(n) = (d_i(n)+c_i(n)*Q_i(n-1))/(a_i(n)-c_i(n)*P_i(n-1))
    end do
!
!   (3) TN = QN
    phi(nmax) = Q_i(nmax)
!
!   (4) Calc. Ti
    do n=nmax-1, 1, -1
        phi(n) = P_i(n)*phi(n+1)+Q_i(n)
    end do
!
end subroutine