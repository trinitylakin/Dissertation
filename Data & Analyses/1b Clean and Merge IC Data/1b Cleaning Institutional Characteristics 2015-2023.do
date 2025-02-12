********************************************************************************
********************************************************************************
          **** Cleaning Institutional Characteristics Data ****
		             ** IPEDS 2015 through 2023 **
********************************************************************************
********************************************************************************
log using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\1b Clean Institutional Characteristics 2015-2023.log", replace

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\1 IC Merged 2015 through 2023.dta"  

********************************************************************************
********************************************************************************

** Fixing carnegie classifications **
clonevar carnegie15 =carnegieclassification2015basich
replace carnegie15 = 3 if inrange(carnegie15,1,14)|inrange(carnegie15,17,33)
recode carnegie15 (-2=.)(15=1)(16=2)
label define c15 1 "R1 University" 2 "R2 University" 3 "All Others"
label values carnegie15 c15

** HBCU var
clonevar hbcu = historicallyblackcollegeoruniver
recode hbcu (2=0)
label define yesno 1 "Yes" 0 "No"
label values hbcu yesno

** Institution size
recode institutionsizecategoryhd2015 institutionsizecategoryhd2016 institutionsizecategoryhd2017 institutionsizecategoryhd2018 institutionsizecategoryhd2019 institutionsizecategoryhd2020 institutionsizecategoryhd2021 institutionsizecategoryhd2022 institutionsizecategoryhd2023 (-1 -2 . =0)

gen size = (institutionsizecategoryhd2015 + institutionsizecategoryhd2016 + institutionsizecategoryhd2017 + institutionsizecategoryhd2018 + institutionsizecategoryhd2019 + institutionsizecategoryhd2020 + institutionsizecategoryhd2021 + institutionsizecategoryhd2022 + institutionsizecategoryhd2023)

recode size (0=.)

** State
gen state = (stateabbreviationhd2015 + stateabbreviationhd2016 + stateabbreviationhd2017 + stateabbreviationhd2018 + stateabbreviationhd2019 + stateabbreviationhd2020 + stateabbreviationhd2021 + stateabbreviationhd2022 + stateabbreviationhd2023)
*
replace state = "PA" if unitid==214591 | unitid==214607 | unitid==214625 | unitid==214634 | unitid==214643 | unitid==214652 | unitid==214670 | unitid==214689 | unitid==214698 | unitid==214704 | unitid==214713 | unitid==214731 | unitid==214740 | unitid==214759 | unitid==214768 | unitid==214777 | unitid==214786 | unitid==214795 | unitid==214801 | unitid==214810 | unitid==214829 | unitid==479956 | unitid==498562 | unitid==498571
replace state = "IN" if unitid==463056 | unitid==488800
replace state = "CA" if unitid==489779
replace state = "TX" if unitid==490805 
replace state = "CT" if unitid==491288
replace state = "WI" if unitid==491297 | unitid==492689 
*
replace state = "Alabama" if state == "AL"
replace state = "California" if state == "CA"
replace state = "Florida" if state == "FL"
replace state = "Georgia" if state == "GA"
replace state = "Illinois" if state == "IL"
replace state = "Maryland" if state == "MD"
replace state = "Massachusetts" if state == "MA"
replace state = "Michigan" if state == "MI"
replace state = "New York" if state == "NY"
replace state = "North Carolina" if state == "NC"
replace state = "Ohio" if state == "OH"
replace state = "Pennsylvania" if state == "PA"
replace state = "Texas" if state == "TX"
replace state = "Virginia" if state == "VA"
replace state = "D.C." if state == "DC"
replace state = "Wisconsin" if state == "WI"


keep unitid institutionname year state size hbcu carnegie15

********************************************************************************
********************************************************************************
                      **** Labeling Variables ****
********************************************************************************
********************************************************************************
					  
label variable unitid "Institution ID"
label variable year "Year"
label variable state "State"
label variable size "Institution Size Category"
label variable carnegie15 "Carnegie Classification 2015"

********************************************************************************
********************************************************************************

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\1b Clean Institutional Characteristics 2015-2023.dta", replace

log close
clear
********************************************************************************
********************************************************************************
