module computing_error

    use parameters
    use flux

    implicit none
    
contains

    function L1_Error(Rho_ex,Rho_num) result(l1error)

        real(PR), intent(in) :: Rho_ex(0:imax+1,0:jmax+1), Rho_num(0:imax+1,0:jmax+1)
        real(PR) :: l1error
        real(PR) :: SumL1
        integer :: i, j

        ! Initialisation
        SumL1 = 0

        ! Computing L1 error on density
        do j = 1, jmax
            do i = 1, imax

                SumL1 = SumL1 + abs(Rho_ex(i,j) - Rho_num(i,j))
                
            end do
        end do

        l1error = SumL1

    end function L1_Error

    function L2_Error(Rho_ex,Rho_num) result(l2error)

        real(PR), intent(in) :: Rho_ex(0:imax+1,0:jmax+1), Rho_num(0:imax+1,0:jmax+1)
        real(PR) :: l2error
        real(PR) :: SumL2
        integer :: i, j

        ! Initialisation
        SumL2 = 0

        ! Computing L1 error on density
        do j = 1, jmax
            do i = 1, imax

                SumL2 = SumL2 + (Rho_ex(i,j) - Rho_num(i,j))
                
            end do 
        end do

        l2error = sqrt(SumL2)

    end function L2_Error
    
end module computing_error
