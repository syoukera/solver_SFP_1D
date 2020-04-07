subroutine initial_set
!
    use main_variables
!
!   --------- scalar values ----------
    do n=1, nmax
        vel(n)      = 0.0d0
        pres(n)     = 0.0d0
        temp(n)     = 300.0d0
        dens(n)     = pres0*ave_mol_w/(gas_const*temp(n))
        enth(n)     = 0.0d0   ! temporary
        m_chsp(n,1) = 0.0d0
        if (n.le.100) m_chsp(n,1) = 1.0d0
    end do
end subroutine
      
  