**********  Addtl Analyses  **********

log using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Results\6b Addtl Analyses.log", replace

*************************************************
*************************************************

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 Preliminary Findings Final.dta"

*************************************************
*** setting time variable
*************************************************
xtset unitid year
xtdescribe

*************************************************
*************************************************

** Contextualizing changes in diversity index value
** what does a change in DI mean for the actual composition of the faculty?

bysort unitid (year): gen DI_2015 = i_diversity if year == 2015
bysort unitid (year): gen DI_2023 = i_diversity if year == 2023
bysort unitid: egen DI_2015_val = max(DI_2015)
bysort unitid: egen DI_2023_val = max(DI_2023)
drop DI_2015
drop DI_2023
bysort unitid: gen DI_diff = DI_2023_val - DI_2015_val

*********
sum DI_diff
sort DI_diff
list DI_diff unitid instname if DI_diff >=.030 & DI_diff <=.035 & year==2023

** list of insts with average DI change
** Western Oregon University .322 -- 210429 
** Univ of Wisconsin - Parkside .322 -- 240374
** Indiana University - Indianapolis .326 -- 151111
** Univ of Illinois - Chicago .326 -- 145600 
** Marshall University .326 -- 237525 

**************** .322 change
** Western Oregon University ***** OVERALL DECREASE - 50pp
 list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==210429 & year==2015
 list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==210429 & year==2023
 
 ** Univesity of Wisconic - Parkside ***** OVERALL DECREASE - 10pp
  list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==240374 & year==2015
 list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==240374 & year==2023
 
 ***************** .326 change
 ** Indiana University - Indianapolis ****** OVERALL INCREASE - 700pp
   list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==151111 & year==2015
 list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==151111 & year==2023
 
 ** University of Illinois - Chicago ****** OVERALL INCREASE - 400pp
    list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==145600 & year==2015
 list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==145600 & year==2023
 
 ** Marshall University ****** OVERALL INCREASE SLIGHTLY - 30pp
     list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==237525 & year==2015
 list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==237525 & year==2023
 
************************************
** insts with greatest gains
list unitid instname DI_diff if DI_diff >=.35 & year==2023
** only one inst increased greater than .35
** University of New Hampshire College of Professional Studies Online
** .403 increase
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==183257 & year==2015
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==183257 & year==2023
** started with only 3 WW, added 1 AM, 2 WM, and 6 WW

************************************
** insts with greatest losses
list unitid instname DI_diff if DI_diff <=0 & year==2023
** West Virigina University - Parkersburg -.152 -- 237686
** Bay Mills Community College -.125 -- 380359
** Ohio University - Southern Campus -.118 -- 204839
** Kent State University - Salem -.114 -- 203492

** WVU - Parkersburg
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==237686 & year==2015
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==237686 & year==2023
** overall lost only 4 total; lost all 11 OW, 4 WM, gained 10 WW

** Bay Mills CC
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==380359 & year==2015
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==380359 & year==2023
** gained 3 overall; lost 1 OW, gained 1 WM, 4 WW

** Ohio Univ - Southern Campus
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==204839 & year==2015
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==204839 & year==2023
** lost 3 overall; lost 6 WM, gained 3 WW, lost 1 HM gained 1 BW

** Kent State - Salem
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==203492 & year==2015
list m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other t_total if unitid==203492 & year==2023
** lost 9 overall; lost 1 WW, 8 WM, lost 1 BM gained 1 AW

** Ohio and Kent State - lost white men but maintained white women, no net gain in NW representation, so overall DI decreased due to majority faculty belonging to one race and gender group (WW)

*****************************
log close
clear
