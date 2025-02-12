*******************************************************************************
*******************************************************************************
              *** Combine All Three Datasets into One ***
                 ** IPEDS, NCSL SHEF 2015-2023 **
*******************************************************************************
*******************************************************************************

log using  "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\State Funding\4 Combine IPEDS NCSL SHEF.log", replace

*******************************************************************************
*******************************************************************************

*** Merge State Political/Economic Context Datasets ***

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\3a Clean NCSL Data 2015-2023"
*
merge m:m state year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\State Funding\3b Clean SHEF Data 2015-2023.dta", nogenerate
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\4a Combined NCSL and SHEF 2015-2023.dta", replace

clear

*******************************************************************************
*******************************************************************************

*** Merge State Context with IPEDS Data ***

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\2 Merged Faculty and IC Data 2015-2023.dta"
*
merge m:m state year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\4a Combined NCSL and SHEF 2015-2023.dta", nogenerate

rename institutionname instname

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\4b Master Dataset with Tenure Status 2015-2023.dta", replace

*******************************************************************************
*******************************************************************************

*** Create Abrigded Version Without Tenure Status ***

drop m_asian_t m_asian_ntt w_asian_t w_asian_tt w_asian_ntt w_asian m_black_t m_black_ntt w_black_t w_black_tt w_black_ntt w_black m_hisp_t m_hisp_ntt w_hisp_t w_hisp_tt w_hisp_ntt w_hisp m_white_t m_white_ntt w_white_t w_white_tt w_white_ntt w_white t_tenured t_tenuretrack t_notontt p_tenured p_tenuretrack p_notontt p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt m_other_t m_other_ntt w_other_t w_other_tt w_other_ntt w_other p_other_w_t p_other_w_tt p_other_w_ntt p_other_m_t p_other_m_tt p_other_m_ntt p_other_t p_other_tt p_other_ntt m_asian_tt m_black_tt m_hisp_tt m_white_tt m_other_tt 


*******************************************************************************
*******************************************************************************
              *** Transform Variables for Regression ***
*******************************************************************************
*******************************************************************************
rename party_demprop dem_legisprop
recode dem_legisprop (.=0)

clonevar dem_gov = party_gov
recode dem_gov (2 3 . = 0)
label define demgov 1 "Democrat" 0 "Republican or Independent"
label values dem_gov demgov

clonevar size_small = size
recode size_small (2=1)(3 4 5 .=0)
label variable size_small "Small Institution Under 5k Students"

clonevar size_midsize = size
recode size_midsize (1 2 5 . =0)(3 4 =1)
label variable size_midsize "Midsize Institution 5k-19k Students"

clonevar size_large = size
recode size_large (1 2 3 4 . = 0)(5=1)
label variable size_large "Large Institution Over 20k Students"

clonevar c_r1 = carnegie15
recode c_r1 (2 3 .=0)
label variable c_r1 "R1 University"

clonevar c_r2 = carnegie15
recode c_r2 (1 3 .=0)(2=1)
label variable c_r2 "R2 University"

clonevar c_other = carnegie15
recode c_other (1 2 . =0)(3=1)
label variable c_other "Not R1 or R2 University"

drop party_gov size carnegie15

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\4b Abridged Master Dataset 2015-2023.dta", replace

*******************************************************************************
*******************************************************************************

log close
clear