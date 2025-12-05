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

recode hbcu (.=0)

rename state state1
encode state1, gen(state)

drop party_gov size carnegie15 party_legis state1

replace state =17  if unitid==442569

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\4b Abridged Master Dataset 2015-2023.dta", replace

*******************************************************************************
*******************************************************************************

log close
clear