*******************************************************************************
*******************************************************************************
               *** Cleaning and Merging Yearly Faculty Data ***
                        ** IPEDS 2015 through 2023 **
*******************************************************************************
*******************************************************************************

log using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\1a Clean and Merge Yearly Faculty 2015-2023.log", replace

*******************************************************************************
*******************************************************************************
                      **** Cleaning Yearly Files ****
*******************************************************************************
*******************************************************************************

* 2015
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2015.dta"

*

gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2015_is_rvallfulltimein
gen w_asian = asianwomens2015_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2015_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2015_is_rvallfulltimein
gen w_white = whitewomens2015_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2015_is_rvallf
gen w_multi = twoormoreraceswomens2015_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi
gen t_men =  m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi
gen t_total =  (t_men + t_women)
 

*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)

*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2015.dta", replace
clear
*******************************************************************************
* 2016
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2016.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2016_is_rvallfulltimein
gen w_asian = asianwomens2016_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2016_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2016_is_rvallfulltimein
gen w_white = whitewomens2016_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2016_is_rvallf
gen w_multi = twoormoreraceswomens2016_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
 
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2016.dta", replace
clear
*******************************************************************************
* 2017
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2017.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2017_is_rvallfulltimein
gen w_asian = asianwomens2017_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2017_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2017_is_rvallfulltimein
gen w_white = whitewomens2017_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2017_is_rvallf
gen w_multi = twoormoreraceswomens2017_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)

*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2017.dta", replace
clear
*******************************************************************************
* 2018
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2018.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2018_is_rvallfulltimein
gen w_asian = asianwomens2018_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2018_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2018_is_rvallfulltimein
gen w_white = whitewomens2018_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2018_is_rvallf
gen w_multi = twoormoreraceswomens2018_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
 

*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)

*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2018.dta", replace
clear
*******************************************************************************
* 2019
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2019.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2019_is_rvallfulltimein
gen w_asian = asianwomens2019_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2019_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2019_is_rvallfulltimein
gen w_white = whitewomens2019_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2019_is_rvallf
gen w_multi = twoormoreraceswomens2019_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
 
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)

*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2019.dta", replace
clear
*******************************************************************************
* 2020
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2020.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2020_is_rvallfulltimein
gen w_asian = asianwomens2020_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2020_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2020_is_rvallfulltimein
gen w_white = whitewomens2020_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2020_is_rvallf
gen w_multi = twoormoreraceswomens2020_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
 

*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)

*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2020.dta", replace
clear
*******************************************************************************
* 2021
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2021.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2021_is_rvallfulltimein
gen w_asian = asianwomens2021_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2021_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2021_is_rvallfulltimein
gen w_white = whitewomens2021_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2021_is_rvallf
gen w_multi = twoormoreraceswomens2021_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
 
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2021.dta", replace
clear
*******************************************************************************
* 2022
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2022.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2022_is_rvallfulltimein
gen w_asian = asianwomens2022_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2022_is_rval
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2022_is_rvallfulltimein
gen w_white = whitewomens2022_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2022_is_rvallf
gen w_multi = twoormoreraceswomens2022_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
 
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2022.dta", replace
clear
*******************************************************************************
* 2023
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2023.dta"

*
gen m_natam =  v45
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian =  asianmens2023_isallfulltimeinstr
gen w_asian = asianwomens2023_isallfulltimeins
gen t_asian =  (m_asian + w_asian)
*
gen m_black = v49
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp = hispanicorlatinomens2023_isallfu
gen w_hisp = hispanicorlatinowomens2023_isall
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific = v53
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white = whitemens2023_isallfulltimeinstr
gen w_white = whitewomens2023_isallfulltimeins
gen t_white =  (m_white + w_white)
*
gen m_multi = twoormoreracesmens2023_isallfull
gen w_multi = twoormoreraceswomens2023_isallfu
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)

*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*

gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
*
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)

*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
*
keep unitid institutionname year t_total t_women t_men p_women p_men t_natam w_natam m_natam p_natam p_natam_m p_natam_w t_black w_black m_black p_black p_black_m p_black_w t_hisp w_hisp m_hisp p_hisp p_hisp_m p_hisp_w t_asian w_asian m_asian p_asian p_asian_m p_asian_w t_pacific w_pacific m_pacific p_pacific p_pacific_m p_pacific_w t_white w_white m_white p_white p_white_m p_white_w t_multi w_multi m_multi p_multi p_multi_m p_multi_w
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2023.dta", replace
clear

*******************************************************************************
*******************************************************************************
              **** Merging Cleaned Yearly Faculty Data *****
*******************************************************************************
*******************************************************************************

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2015.dta"
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2016.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2017.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2018.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2019.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2020.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2021.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2022.dta", nogenerate
*
merge m:m unitid year using "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2023.dta", nogenerate
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2015-2023 All Races.dta", replace
*
*******************************************************************************
*******************************************************************************
              **** Cleaning Combined Faculty Data *****
*******************************************************************************
*******************************************************************************

** Creating "other" racial category **


gen m_other = (m_natam + m_pacific + m_multi)
gen w_other = (w_natam + w_pacific + w_multi)
gen t_other = m_other + w_other
gen p_other =  (t_other/t_total)
gen p_other_w =  (w_other/t_total)
gen p_other_m =  (m_other/t_total)

gen missingfac =1 if t_total==.
recode missingfac (.=0)
egen missingfac_sum = total(missingfac), by(unitid)

drop if missingfac_sum>=7
*
drop m_natam w_natam p_natam_m p_natam p_natam_w m_multi w_multi p_multi_m p_multi p_multi_w m_pacific w_pacific p_pacific_m p_pacific p_pacific_w

gen i_diversity = 1 - (p_asian_m^2 + p_asian_w^2 + p_black_m^2 + p_black_w^2 + p_hisp_m^2 + p_hisp_w^2 + p_white_m^2 + p_white_w^2 + p_other_m^2+p_other_w^2)

save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Clean Faculty 2015-2023 Condensed Races.dta", replace
clear

*******************************************************************************
*******************************************************************************
                      **** Labeling Variables ****
*******************************************************************************
*******************************************************************************

use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Clean Faculty 2015-2023 Condensed Races.dta"

label variable year "Year"
label variable unitid "Institution ID"
*
label variable m_asian "Total Asian Men"
label variable w_asian "Total Asian Women"
label variable t_asian "Total Asian Faculty"
*
label variable m_black "Total Black Men"
label variable w_black "Total Black Women"
label variable t_black "Total Black Faculty"
*
label variable m_hisp "Total Hispanic Men"
label variable w_hisp "Total Hispanic Women"
label variable t_hisp "Total Hispanic Faculty"
*
label variable m_white "Total White Men"
label variable w_white "Total White Women"
label variable t_white "Total White Faculty"
*
label variable m_other "Total Other Race Men"
label variable w_other "Total Other Race Women"
label variable t_other "Total Other Race Faculty"
*
label variable t_women "Total Women Faculty"
label variable t_men "Total Men Faculty"
label variable t_total "Total Faculty"
*
*
label variable p_women "Proportion of Women Faculty Out of All Faculty"
label variable p_men "Proportion of Men Faculty Out of All Faculty"
*
*
label variable p_asian  "Proportion of Asian Faculty Out of All Faculty"
label variable p_asian_w "Proportion of Asian Women Out of All Faculty"
label variable p_asian_m "Proportion of Asian Men Out of All Faculty"
*
label variable p_black  "Proportion of Black Faculty Out of All Faculty"
label variable p_black_w "Proportion of Black Women Out of All Faculty"
label variable p_black_m "Proportion of Black Men Out of All Faculty"
*
label variable p_hisp  "Proportion of Hispanic Faculty Out of All Faculty"
label variable p_hisp_w "Proportion of Hispanic Women Out of All Faculty"
label variable p_hisp_m "Proportion of Hispanic Men Out of All Faculty"
*
label variable p_white  "Proportion of White Faculty Out of All Faculty"
label variable p_white_w "Proportion of White Women Out of All Faculty"
label variable p_white_m "Proportion of White Men Out of All Faculty"
*
label variable p_other  "Proportion of Other Race Faculty Out of All Faculty"
label variable p_other_w "Proportion of Other Race Women Out of All Faculty"
label variable p_other_m "Proportion of Other Race Men Out of All Faculty"
*
label variable i_diversity "Diversity Index"
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\1a Clean Faculty 2015-2023 Condensed Races.dta", replace

********************************************************************************
********************************************************************************
log close
clear


