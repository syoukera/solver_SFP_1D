!   modules
module main_variables
implicit none
!   grid parameter
    real*8,parameter   :: pai  =3.1415926535d0
    integer, parameter :: nmax = 1000           ! grid number [-]
    integer, parameter :: nsp = 1               ! number of chemical species [-]
    real*8 xscl(nmax), xvel(nmax)                ! grid position, xscl:scalar, svel:velocity [m]
!
!   time parameter
    real*8, parameter :: delt_t   = 1.0e-6      ! delta t [s]
    real*8, parameter :: time_end = 1.0e-2      ! end time [s]
!
!   const parameter
    real*8, parameter :: pres0    = 1.0e5       ! static pressure [Pa]
    real*8, parameter :: gas_const= 8.3145      ! gas constant [J/mol K]
    real*8, parameter :: ave_mol_w= 28.8d-3     ! mean molecular weight of air [kg/mol]
!
!   variables
    real*8 vel(nmax)                           ! velocity [m/s]
    real*8 pres(nmax)                            ! pressure (fluid motion) [Pa]
    real*8 temp(nmax)                            ! teperature [K]
    real*8 dens(nmax)                            ! density [kg/m3]
    real*8 enth(nmax)                            ! enthalpy [J/kg K]
    real*8 m_chsp(nmax,nsp)                      ! mass fraction of chemical species [-]
!
    real*8 o_vel(nmax)                         ! old value of velocity
    real*8 o_pres(nmax)                          ! old value of pressure 
    real*8 o_temp(nmax)                          ! old value of teperature 
    real*8 o_dens(nmax)                          ! old value of density
    real*8 o_enth(nmax)                          ! old value of enthalpy
    real*8 o_m_chsp(nmax,nsp)                    ! old value of mass fraction of chemical species
! 
end module

     CHARACTER(6) FUNCTION NUM2STR(NUM)
		! ステップ数を6桁の文字列に変換（左側0パディング）
	    IMPLICIT NONE
      INTEGER,INTENT(IN) :: NUM
      CHARACTER*6 STR
      INTEGER I
      !////--------------------------------------------------------------------
      WRITE(STR,'(I6)') NUM
      DO I=1,6
				IF( STR(I:I) == ' ' ) STR(I:I) = '0'
      END DO
      NUM2STR = STR
	    !--------------------------------------------------------------------////
    END FUNCTION
