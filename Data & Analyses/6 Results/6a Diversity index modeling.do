**********  Diversity Index Models  **********

log using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Results\6a Results.log", replace

*************************************************
*************************************************

**********  Chapter 6 Results  **********

*************************************************
*************************************************

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 Preliminary Findings Final.dta"

*************************************************
*** setting time variable
*************************************************
xtset unitid year
xtdescribe

*************************************************
** converting educapp to 1000 instead of 1
*************************************************
gen educappFTEK = educappFTE/1000

gen dem_legisprop_c = 1 if dem_legisprop < 0.25
replace dem_legisprop_c = 2 if dem_legisprop >= 0.25 & dem_legisprop < 0.5
replace dem_legisprop_c = 3 if dem_legisprop >= 0.5 & dem_legisprop < 0.75
replace dem_legisprop_c = 4 if dem_legisprop >= 0.75


*************************************************
* descriptive stats
*************************************************

** insert summ

** insert pwcorr

*************************************************
*** looking deeper at descriptives ***
*************************************************

** insts with 75% or higher white men
list unitid instname year p_white_m if p_white_m >= .750

** insts with no white men
list unitid instname year p_white_m if p_white_m == 0

** insts with 75% or higher white women
list unitid instname year p_white_w if p_white_w >= .750

** insts with no white women
list unitid instname year p_white_w if p_white_w == 0

** insts with 45% or higher black women
list unitid instname year p_black_w if p_black_w >= .45

** looking deeper at inst with highest % BW but only in 2015
list year p_black_w if unitid==131399
* in 2016 % BW at this inst dropped from 52 to 36 and slowly decreased for the rest of the period to .296 by 2023

** insts with high % other race men and women
list unitid instname year p_other_w if p_other_w >= .45

list unitid instname year p_other_m if p_other_m >= .45

** insts with highest and lowest diversity index values
list unitid instname year i_diversity if i_diversity >= .845

list year i_diversity if unitid ==141981
list p_asian_m p_asian_w p_black_m p_black_w p_hisp_m p_hisp_w p_white_m p_white_w p_other_m p_other_w if unitid==141981 & year==2023

list year i_diversity if unitid == 125471
list p_asian_m p_asian_w p_black_m p_black_w p_hisp_m p_hisp_w p_white_m p_white_w p_other_m p_other_w if unitid==125471 & year==2023

list year i_diversity if unitid == 123509

list unitid instname year i_diversity if i_diversity <=0.300

*****

*************************************************
* YEARLY models
*************************************************
bysort year: mixed i_diversity dem_gov dem_legisprop educappFTEK hbcu c_r1 c_r2 size_midsize  size_large || state: || unitid:, ml

*************************************************
***** Models 1-4
*************************************************

* base model year on diversity w controls
mixed i_diversity year hbcu c_r1 c_r2 size_midsize size_large || state: || unitid:, ml

* m1 + demgov
mixed i_diversity year dem_gov hbcu c_r1 c_r2 size_midsize size_large || state: || unitid:, ml

* m1 + demgov and legisprop
mixed i_diversity year dem_gov dem_legisprop hbcu c_r1 c_r2 size_midsize size_large || state: || unitid:, ml


* m1 + demgov legisprop and educapp
mixed i_diversity year dem_gov dem_legisprop educappFTEK hbcu c_r1 c_r2 size_midsize size_large || state: || unitid:, ml


*************************************************
*** Margins for several interactions
*************************************************

mixed i_diversity c.year##c.educappFTEK dem_gov dem_legisprop i.hbcu c_r1 c_r2 size_midsize size_large || state: || unitid:, ml
margins, at (educappFTE=(5(5)35) year=(2015(1)2023)) saving("\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Results\6 Year Educapp Interaction Marginsplot.dta", replace)
marginsplot, noci

mixed i_diversity year c.dem_legisprop##c.educappFTEK dem_gov i.hbcu c_r1 c_r2 size_midsize size_large || state: || unitid:, ml
margins, at (educappFTE=(5(5)35) dem_legisprop=(0(.25)1))



*************************************************
*** sem modeling
*************************************************

sem (year -> dem_gov, ) (year -> dem_legisprop, ) (year -> educappFTEK, ) (year -> i_diversity, ) (dem_gov -> dem_legisprop, ) (dem_gov -> educappFTEK, ) (dem_legisprop -> educappFTEK, ) (educappFTEK -> i_diversity,) (dem_gov -> i_diversity,) (dem_legisprop -> i_diversity,) (size_midsize -> i_diversity, ) (size_large -> i_diversity, ) (c_r1 -> i_diversity, ) (c_r2 -> i_diversity, ) (hbcu -> i_diversity, ), nocapslatent


** standardized coefficients **

sem (year -> dem_gov, ) (year -> dem_legisprop, ) (year -> educappFTEK, ) (year -> i_diversity, ) (dem_gov -> dem_legisprop, ) (dem_gov -> educappFTEK, ) (dem_legisprop -> educappFTEK, ) (educappFTEK -> i_diversity,) (dem_gov -> i_diversity,) (dem_legisprop -> i_diversity,) (size_midsize -> i_diversity, ) (size_large -> i_diversity, ) (c_r1 -> i_diversity, ) (c_r2 -> i_diversity, ) (hbcu -> i_diversity, ), nocapslatent standardized

** looking at specific pathways **

estat stdize: nlcom _b[dem_gov:year]*_b[educappFTEK:dem_gov]*_b[i_diversity:educappFTEK]
estat stdize: nlcom _b[dem_legisprop:year]*_b[educappFTEK:dem_legisprop]*_b[i_diversity:educappFTEK]
estat stdize: nlcom _b[educappFTEK:year]*_b[i_diversity:educappFTEK]
estat stdize: nlcom _b[dem_gov:year]*_b[dem_legisprop:dem_gov]*_b[i_diversity:dem_legisprop]
estat stdize: nlcom _b[dem_gov:year]*_b[dem_legisprop:dem_gov]*_b[educappFTEK:dem_legisprop]*_b[i_diversity:educappFTEK]

** post-estimation **

estat gof, stats(all)
estat eqgof

** direct and indirect effects **

estat teffects


*************************************************
log close
clear
