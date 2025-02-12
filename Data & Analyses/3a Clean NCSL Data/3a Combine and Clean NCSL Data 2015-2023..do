*******************************************************************************
*******************************************************************************
                *** Combine and Clean Yearly NCSL Data ***
                  ** State partisan control 2015-2023 **
*******************************************************************************
*******************************************************************************

log using  "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\3a Combine and Clean NCSL Data 2015-2023.log", replace

*******************************************************************************
*******************************************************************************
                *** Save Yearly NCSL Data Files ***
*******************************************************************************
*******************************************************************************

** 2015
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2015.xlsx", sheet("Table 1") firstrow
gen year = 2015
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2015.dta", replace
clear
** 2016
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2016.xlsx", sheet("Table 1") firstrow
gen year = 2016
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2016.dta", replace
clear
** 2017
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2017.xlsx", sheet("Table 1") firstrow
gen year = 2017
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2017.dta", replace
clear
** 2018
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2018.xlsx", sheet("Table 1") firstrow
gen year = 2018
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2018.dta", replace
clear
** 2019
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2019.xlsx", sheet("Table 1") firstrow
gen year = 2019
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2019.dta", replace
clear
** 2020
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2020.xlsx", sheet("Table 1") firstrow
gen year = 2020
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2020.dta", replace
clear
** 2021
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2021.xlsx", sheet("Table 1") firstrow
gen year = 2021
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2021.dta", replace
clear
** 2022
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2022.xlsx", sheet("Table 1") firstrow
gen year = 2022
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2022.dta", replace
clear
** 2023
import excel "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\partisan control 2023.xlsx", sheet("Table 1") firstrow
gen year = 2023
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2023.dta", replace
clear

*******************************************************************************
*******************************************************************************
                *** Combine and Clean Yearly NCSL Data ***
*******************************************************************************
*******************************************************************************

** 2015 & 2016
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2015.dta"

 merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2016.dta", nogenerate
** & 2017
merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2017.dta", nogenerate
** & 2018
merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2018.dta", nogenerate
** & 2019
merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2019.dta", nogenerate
** & 2020
merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2020.dta", nogenerate
** & 2021
merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2021.dta", nogenerate
** & 2022
merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2022.dta", nogenerate
** & 2023
merge m:m STATE year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\Yearly files\2023.dta", nogenerate
***********

***Cleaning Dataset ***

drop if TotalSeats==.
rename STATE state
replace state = "Alaska" if state=="Alaska*"
replace state = "New York" if state=="New York*"
replace state = "Vermont" if state=="Vermont*"
replace state = "Washington" if state=="Washington*"

gen legislature1 = (LegisControl+LegControl)
encode legislature1, gen (party_legis)
recode party_legis (2=1)(5 6 =2)(7=3)
label define legis 1 "Democrat" 2 "Republican" 3 "Split" 4 "N/A"
label values party_legis legis

encode GovParty, gen (party_gov)
recode party_gov (2=4)(3=2)
recode party_gov (4=3)
label define gov 1 "Democrat" 2 "Republican" 3 "Independent"
label values party_gov gov

gen party_demprop = ((HouseDem+SenateDem)/TotalSeats)

keep state year party_demprop party_legis party_gov

********************************************************************************
********************************************************************************
                      **** Labeling Variables ****
********************************************************************************
********************************************************************************

label variable state "State"
label variable year "Year"
label variable party_legis "Partisan Control of State Legislature"
label variable party_gov "Governor Party Affiliation"
label variable party_demprop "Democratic Representation in State Legislature"

*******************************************************************************
*******************************************************************************

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\NCSL party comp\3a Clean NCSL Data 2015-2023", replace

********************************************************************************
********************************************************************************
log close
clear
