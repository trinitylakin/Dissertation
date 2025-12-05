*******************************************************************************
*******************************************************************************
              *** 5 Preliminary Findings ***
			  
* Summary statistics *
* Correlation matrix *
* Diversity index over time *
* Diagnostic measures *

*******************************************************************************
*******************************************************************************

log using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 Preliminary Findings.log", replace

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\4b Abridged Master Dataset 2015-2023.dta"

*******************************************************************************
*******************************************************************************

*** setting time variable
xtset unitid year
xtdescribe

*******************************************************************************
*******************************************************************************

*** summary stats

summarize

tabstat hbcu m_asian w_asian m_black w_black m_hisp w_hisp m_white w_white m_other w_other p_asian_m p_asian_w  p_black_m p_black_w  p_hisp_m p_hisp_w  p_white_m p_white_w  p_other_m p_other_w  i_diversity dem_legisprop educappFTE dem_gov size_small size_midsize size_large c_r1 c_r2 c_other state , stat(mean median sd min max) columns(statistics)

*******************************************************************************
*******************************************************************************

*** correlation matrices

* only model vars
corr unitid year hbcu state i_diversity dem_gov dem_legisprop educappFTE c_r1 c_r2 c_other size_small size_midsize size_large

*plus significance
pwcorr i_diversity year dem_gov dem_legisprop educappFTE hbcu size_small size_midsize size_large c_r1 c_r2 c_other, sig

*******************************************************************************
*******************************************************************************
*** diagnostic measures

* checking for skewness
sktest unitid year hbcu state p_women p_men p_asian p_asian_w p_asian_m p_black p_black_w p_black_m p_hisp p_hisp_w p_hisp_m p_white p_white_w p_white_m p_other p_other_w p_other_m i_diversity dem_gov dem_legisprop educappFTE c_r1 c_r2 c_other size_small size_midsize size_large

hist i_diversity
graph save "Graph" "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 hist i_diversity.gph", replace

gen i_diversity_log = log(i_diversity)
hist i_diversity_log


gen i_diversity_sq = i_diversity^2
hist i_diversity_sq


gen i_diversity_sqrt = sqrt(i_diversity)
hist i_diversity_sqrt

sktest i_diversity i_diversity_log i_diversity_sq i_diversity_sqrt

 * multicollinearity
regress i_diversity_sq i.year
regress i_diversity_sq i.year dem_gov educappFTE dem_legisprop
regress i_diversity_sq i.year dem_gov educappFTE dem_legisprop c_r1 c_r2 hbcu size_small size_large
vif

*************** multi level mixed effects model ***********************
mixed i_diversity_sq i.year dem_gov educappFTE dem_legisprop c_r1 c_r2 hbcu size_small size_large || state: || unitid:, ml

*summarize composition of nested groups
estat group

* predict residuals
predict resids, residuals
predict fitted, xb
scatter resids fitted, yline(0) title("Residuals vs Fitted Values")
graph save "Graph" "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 residuals base.gph", replace

* some funneling observed, may indicate slight heteroskedasticity
graph box resids, over(state)
graph save "Graph" "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 residuals by state.gph", replace
graph box resids, over(unitid)
graph save "Graph" "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 residuals by unitid.gph", replace

list unitid instname resids if resids >=.15
list unitid instname resids if resids <=-.15

******** testing dropping insts with extreme residuals ************
mixed i_diversity_sq i.year dem_gov educappFTE dem_legisprop c_r1 c_r2 hbcu size_small size_large || state: || unitid:, ml
scatter resids fitted, yline(0) title("Residuals vs Fitted Values")

drop if unitid==484473
mixed i_diversity_sq i.year dem_gov educappFTE dem_legisprop c_r1 c_r2 hbcu size_small size_large || state: || unitid:, ml
predict resids2, residuals
predict fitted2, xb
scatter resids2 fitted2, yline(0) title("Residuals vs Fitted Values")

drop if unitid==230834
mixed i_diversity_sq i.year dem_gov educappFTE dem_legisprop c_r1 c_r2 hbcu size_small size_large || state: || unitid:, ml
predict resids3, residuals
predict fitted3, xb
scatter resids3 fitted3, yline(0) title("Residuals vs Fitted Values")

drop if unitid==180203
mixed i_diversity_sq i.year dem_gov educappFTE dem_legisprop c_r1 c_r2 hbcu size_small size_large || state: || unitid:, ml
predict resids4, residuals
predict fitted4, xb
scatter resids4 fitted4, yline(0) title("Residuals vs Fitted Values")
graph save "Graph" "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 residuals final.gph", replace

* wald chi2 value increases in magnitude after dropping each institution
************************************
 
* estimate intraclass correlations
estat icc 

* Conditional on the fixed-effects covariates, the diversity index of faculty is slightly correlated within the same state, but is highly correlated within the same institution and state. We estimate that institution and state random effects compose approximately 93% of the total residual variance.
* two-level mixed effects model nested at the institution and state levels is a good fit

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\Prelim Findings\5 Preliminary Findings Final.dta", replace


*******************************************************************************
*******************************************************************************

log close
clear





