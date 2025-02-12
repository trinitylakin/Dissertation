*** IPEDS Data File Merging ***
*** Institutional Characteristics and Yearly Faculty Composition ***
*** 2015 through 2023 ***

log using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\1 Save and Merge Faculty and IC Yearly Files.log", replace

***************************************************************************
*** Saving and Merging Faculty Data ***

*** Creating dta faculty data ***
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2015.csv"
gen year = 2015
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2015.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2016.csv"
gen year = 2016
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2016.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2017.csv"
gen year = 2017
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2017.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2018.csv"
gen year = 2018
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2018.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2019.csv"
gen year = 2019
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2019.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2020.csv"
gen year = 2020
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2020.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2021.csv"
gen year = 2021
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2021.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2022.csv"
gen year = 2022
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2022.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2023.csv"
gen year = 2023
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2023.dta", replace
clear

*******************************************************************************************

*** Saving and Merging Institutional Characteristics Data ***

*** Creating dta files ***
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2015.csv"
gen year = 2015
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2015.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2016.csv"
gen year = 2016
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2016.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2017.csv"
gen year = 2017
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2017.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2018.csv"
gen year = 2018
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2018.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2019.csv"
gen year = 2019
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2019.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2020.csv"
gen year = 2020
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2020.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2021.csv"
gen year = 2021
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2021.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2022.csv"
gen year = 2022
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2022.dta", replace
clear
*
import delimited "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2023.csv"
gen year = 2023
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2023.dta", replace
clear
******

*** Merge Inst Char Data ***
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2015.dta"
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2016.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2017.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2018.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2019.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2020.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2021.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2022.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\IC2023.dta", nogenerate
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Inst Char\1 IC Merged 2015 through 2023.dta", replace

*******************************************************************************************

log close
clear
