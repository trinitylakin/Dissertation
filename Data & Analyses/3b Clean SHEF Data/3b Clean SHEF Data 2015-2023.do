*******************************************************************************
*******************************************************************************
                *** Clean State Appropriations Data ***
                  ** SHEEO SHEF Report 2015-2023 **
*******************************************************************************
*******************************************************************************

log using  "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\State Funding\3b Clean SHEF Data 2015-2023.log", replace

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\State Funding\SHEForiginal.dta"

*******************************************************************************
*******************************************************************************

drop if FY <= 2014
rename FY year
*
rename State state
drop if state=="U.S."
*
rename EducationAppropriationsExcludi educapp
gen educappFTE = (educapp/NetFTEEnrollment)

keep state year educappFTE 

drop if year==.

********************************************************************************
********************************************************************************
                      **** Labeling Variables ****
********************************************************************************
********************************************************************************

label variable year "Year"
label variable educappFTE "State/Local Appropriations to Higher Education per FTE Enrollment"

********************************************************************************
********************************************************************************

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\State Funding\3b Clean SHEF Data 2015-2023.dta", replace

********************************************************************************
********************************************************************************

log close
clear