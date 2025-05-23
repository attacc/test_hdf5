!
! License-Identifier: GPL
!
! Copyright (C) 2006 The Yambo Team
!
! Authors (see AUTHORS file for details): AM
!
module pars
 !
#if defined _DOUBLE
 use hdf5, h5t_native_SP => h5t_native_real
#else
 use hdf5, h5t_native_SP => h5t_native_double
#endif
 use iso_fortran_env, ONLY:int32,int64,real32,real64
 !
 implicit none
 !
 ! Core PARAMETERS
 !=================
 !
 !...PARALLEL
 integer, parameter :: max_n_of_cpus=100000
 integer, parameter :: MAX_N_GROUPS   =100  ! MAX number of groups
 integer, parameter :: MAX_N_OF_CHAINS=100
 integer, parameter :: n_CPU_str_max=20
 !
 !...MEMORY
 integer, parameter :: N_MEM_max                     = 1000
 integer, parameter :: N_MEM_max_element_components  = 600
 integer, parameter :: N_MEM_SAVE_max      = 500
 !
 !...MEMORY library
 integer, parameter :: N_MEM_LIBs_max   = 200
 integer, parameter :: N_MEM_shelf_max  = 200
 !
 !...RT
 integer, parameter :: n_ext_fields_max=4
 !
 !...Input file analyze
 integer, parameter :: n_max_DB_IO_off_fields=20
 integer, parameter :: n_max_jobstr=10
 integer, parameter :: num_of_alternative_locations=4+2*n_max_jobstr
 !
 !...Debug
 integer, parameter :: n_debugs_max=100
 ! 
 !...Output Files/Report File
 integer,parameter  :: max_n_ofs=1000
 integer,parameter  :: max_open_ofs=1000
 integer,parameter  :: repfile_index=1001
 integer,parameter  :: logfile_index=1002
 !
 !...I/O
 integer, parameter :: max_io_units=40
 integer, parameter :: io_units_shift=max_io_units+20 ! io_units for netcdf
 integer, parameter :: max_io_vars_open=500
 integer, parameter :: max_active_sections=10
 !
 !...QP_apply
 integer, parameter :: n_QP_actions_MAX=10
 !
 ! KINDS
 !=======
 integer, parameter  :: DP = selected_real_kind(14,200)
 !integer, parameter :: DP = real64
#if defined _DOUBLE
 integer, parameter  :: SP = selected_real_kind(14,200)
 integer, parameter  :: SP6 = selected_real_kind(6,30)
 !integer, parameter :: SP = real64
#else
 integer, parameter  :: SP = selected_real_kind(6,30)
 integer, parameter  :: SP6 = selected_real_kind(6,30)
 !integer, parameter :: SP = real32
#endif
 !
 integer, parameter  :: IP  = int32      ! 4 bytes integer, == selected_int_kind(8)
 integer, parameter  :: IPL = int64      ! 8 bytes integer, == selected_int_kind(16)
 !
 ! Equivalent to OneByteInt in NetCdf (normal integer is 4 byte)
 integer, parameter  :: LP = selected_int_kind(2)
 !
 ! Kinds used in the Yambo-IO
 ! ===============================
 integer, parameter  :: DP_YIO = DP             ! Float double precision 
 integer, parameter  :: SP_YIO = SP             ! Float single precision
 integer, parameter  :: IP_YIO = IP+100         ! Integer 
 integer, parameter  :: LP_YIO = LP+100         ! Logical 
 integer, parameter  :: CR_YIO = 0              ! Character type
 !
 ! STRINGs
 !=========
 integer, parameter  :: schlen=100
 integer, parameter  :: lchlen=300
 integer, parameter  :: msg_len=50
 integer, parameter  :: DB_menu_length=30+msg_len
 !
 ! CONSTANTs
 !===========
 real(SP),    parameter :: pi=3.141592653589793238462643383279502884197_SP
 real(DP),    parameter :: pi_DP=3.141592653589793238462643383279502884197_DP
 real(SP),    parameter :: zero_dfl=1.E-5_SP
 !
 real(SP),    parameter :: infinity_dfl=HUGE(1._SP)
 real(SP),    parameter :: tiny_dfl    =TINY(1._SP)
 real(SP),    parameter :: rZERO=0._SP
 real(SP),    parameter :: rONE =1._SP
 !
 real(SP),    parameter :: VAR_EMPTY=-9.9999999_SP
 !
 complex(SP), parameter :: cI   =(0._SP,1._SP)
 complex(SP), parameter :: cONE =(1._SP,0._SP)
 complex(SP), parameter :: cZERO=(0._SP,0._SP)
 !
 complex(DP), parameter :: cI_DP   =(0._DP,1._DP)
 complex(DP), parameter :: cONE_DP =(1._DP,0._DP)
 complex(DP), parameter :: cZERO_DP=(0._DP,0._DP)
 !
end module 
