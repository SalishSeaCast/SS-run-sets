!!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
!! PISCES  (key_pisces) cfg namelist (see below for key_pisces_reduced)
!!              1  - air-sea exchange                         (nampisext)
!!              2  - biological parameters                    (nampisbio)
!!              3  - parameters for nutrient limitations      (nampislim)
!!              4  - parameters for phytoplankton             (nampisprod,nampismort)
!!              5  - parameters for zooplankton               (nampismes,nampiszoo)
!!              6  - parameters for remineralization          (nampisrem)
!!              7  - parameters for calcite chemistry         (nampiscal)
!!              8  - parameters for inputs deposition         (nampissed)
!!              9  - parameters for Kriest parameterization   (nampiskrp, nampiskrs)
!!              10 - additional 2D/3D  diagnostics            (nampisdia)
!!              11 - Damping                                  (nampisdmp)
!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
!!
!!
!'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
&nampissbc
!,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
!               !  file name                                     ! frequency (hours) ! variable  ! time interp. !  clim  ! 'yearly'/ ! weights  ! rotation ! land/sea mask !
!               !                                                !  (if <0  months)  !   name    !   (logical)  !  (T/F) ! 'monthly' ! filename ! pairing  ! filename      !
   sn_riverno3  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'no3',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_rivernh4  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'nh4',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_riversil  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'sil',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_riverdia  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'dia',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_riverphy  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'phy',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_rivermes  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'mes',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_riverzoo  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'zoo',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_riverdoc  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'don',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_riverpoc  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'pon',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_riverdsi  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'bsi',       .true.,       .true.,  'yearly',   '',        '',        ''
   sn_rivertra  = 'HS_rivers-climatology/bio/rivers_bio_tracers_mean',   -12,               'tur',       .true.,       .true.,  'yearly',   '',        '',        ''
   ! sn_turb      = 'riverTurbDaily2',                                    24,               'turb',      .true.,       .false., 'daily',    '',        '',        ''
   cn_dir       = './'  ! root directory for the location of the runoff files
   ln_river = .true.
   ln_turb = .false.
&end
