subroutine scl_trans
!
    use main_variables
    real*8 a_i(nmax), b_i(nmax), c_i(nmax), d_i(nmax)
    real*8 phi(nmax)
!
    do n=1, nmax
        phi(n) = m_chsp(n,1)
        o_m_chsp(n,1) = m_chsp(n,1)
    end do
!
    call calc_coef(phi, a_i, b_i, c_i, d_i)
!
    call calc_tdma(phi, a_i, b_i, c_i, d_i)
!
    do n=1, nmax
        m_chsp(n,1) = phi(n)
    end do
!
end subroutine