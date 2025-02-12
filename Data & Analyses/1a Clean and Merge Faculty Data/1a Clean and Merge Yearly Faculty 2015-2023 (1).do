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
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2015_is_rvfulltimeinstr asianwomens2015_is_rvfulltimeins blackorafricanamericanmens2015_i blackorafricanamericanwomens2015 hispanicorlatinomens2015_is_rvfu hispanicorlatinowomens2015_is_rv nativehawaiianorotherpacificisla v12 whitemens2015_is_rvfulltimeinstr whitewomens2015_is_rvfulltimeins twoormoreracesmens2015_is_rvfull twoormoreraceswomens2015_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2015_is_rvallfulltimein asianwomens2015_is_rvallfulltime v49 v50 hispanicorlatinomens2015_is_rval v52 v53 v54 whitemens2015_is_rvallfulltimein whitewomens2015_is_rvallfulltime twoormoreracesmens2015_is_rvallf twoormoreraceswomens2015_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2015_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2015_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2015_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2015_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2015_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2015
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2015_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2015_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2015_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2015_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2015_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2015_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2015_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2015_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2015_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2015_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2015_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  sum(w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  sum(m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
*
gen t_tenured =  sum(m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  sum(m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  sum(m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2015.dta", replace
clear
*******************************************************************************
* 2016
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2016.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2016_is_rvfulltimeinstr asianwomens2016_is_rvfulltimeins blackorafricanamericanmens2016_i blackorafricanamericanwomens2016 hispanicorlatinomens2016_is_rvfu hispanicorlatinowomens2016_is_rv nativehawaiianorotherpacificisla v12 whitemens2016_is_rvfulltimeinstr whitewomens2016_is_rvfulltimeins twoormoreracesmens2016_is_rvfull twoormoreraceswomens2016_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2016_is_rvallfulltimein asianwomens2016_is_rvallfulltime v49 v50 hispanicorlatinomens2016_is_rval v52 v53 v54 whitemens2016_is_rvallfulltimein whitewomens2016_is_rvallfulltime twoormoreracesmens2016_is_rvallf twoormoreraceswomens2016_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2016_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2016_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2016_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2016_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2016_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2016
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2016_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2016_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2016_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2016_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2016_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2016_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2016_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2016_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2016_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2016_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2016_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2016.dta", replace
clear
*******************************************************************************
* 2017
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2017.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2017_is_rvfulltimeinstr asianwomens2017_is_rvfulltimeins blackorafricanamericanmens2017_i blackorafricanamericanwomens2017 hispanicorlatinomens2017_is_rvfu hispanicorlatinowomens2017_is_rv nativehawaiianorotherpacificisla v12 whitemens2017_is_rvfulltimeinstr whitewomens2017_is_rvfulltimeins twoormoreracesmens2017_is_rvfull twoormoreraceswomens2017_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2017_is_rvallfulltimein asianwomens2017_is_rvallfulltime v49 v50 hispanicorlatinomens2017_is_rval v52 v53 v54 whitemens2017_is_rvallfulltimein whitewomens2017_is_rvallfulltime twoormoreracesmens2017_is_rvallf twoormoreraceswomens2017_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2017_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2017_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2017_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2017_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2017_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2017
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2017_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2017_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2017_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2017_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2017_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2017_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2017_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2017_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2017_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2017_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2017_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2017.dta", replace
clear
*******************************************************************************
* 2018
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2018.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2018_is_rvfulltimeinstr asianwomens2018_is_rvfulltimeins blackorafricanamericanmens2018_i blackorafricanamericanwomens2018 hispanicorlatinomens2018_is_rvfu hispanicorlatinowomens2018_is_rv nativehawaiianorotherpacificisla v12 whitemens2018_is_rvfulltimeinstr whitewomens2018_is_rvfulltimeins twoormoreracesmens2018_is_rvfull twoormoreraceswomens2018_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2018_is_rvallfulltimein asianwomens2018_is_rvallfulltime v49 v50 hispanicorlatinomens2018_is_rval v52 v53 v54 whitemens2018_is_rvallfulltimein whitewomens2018_is_rvallfulltime twoormoreracesmens2018_is_rvallf twoormoreraceswomens2018_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2018_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2018_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2018_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2018_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2018_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2018
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2018_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2018_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2018_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2018_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2018_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2018_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2018_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2018_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2018_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2018_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2018_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2018.dta", replace
clear
*******************************************************************************
* 2019
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2019.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2019_is_rvfulltimeinstr asianwomens2019_is_rvfulltimeins blackorafricanamericanmens2019_i blackorafricanamericanwomens2019 hispanicorlatinomens2019_is_rvfu hispanicorlatinowomens2019_is_rv nativehawaiianorotherpacificisla v12 whitemens2019_is_rvfulltimeinstr whitewomens2019_is_rvfulltimeins twoormoreracesmens2019_is_rvfull twoormoreraceswomens2019_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2019_is_rvallfulltimein asianwomens2019_is_rvallfulltime v49 v50 hispanicorlatinomens2019_is_rval v52 v53 v54 whitemens2019_is_rvallfulltimein whitewomens2019_is_rvallfulltime twoormoreracesmens2019_is_rvallf twoormoreraceswomens2019_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2019_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2019_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2019_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2019_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2019_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2019
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2019_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2019_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2019_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2019_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2019_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2019_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2019_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2019_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2019_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2019_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2019_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2019.dta", replace
clear
*******************************************************************************
* 2020
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2020.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2020_is_rvfulltimeinstr asianwomens2020_is_rvfulltimeins blackorafricanamericanmens2020_i blackorafricanamericanwomens2020 hispanicorlatinomens2020_is_rvfu hispanicorlatinowomens2020_is_rv nativehawaiianorotherpacificisla v12 whitemens2020_is_rvfulltimeinstr whitewomens2020_is_rvfulltimeins twoormoreracesmens2020_is_rvfull twoormoreraceswomens2020_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2020_is_rvallfulltimein asianwomens2020_is_rvallfulltime v49 v50 hispanicorlatinomens2020_is_rval v52 v53 v54 whitemens2020_is_rvallfulltimein whitewomens2020_is_rvallfulltime twoormoreracesmens2020_is_rvallf twoormoreraceswomens2020_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2020_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2020_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2020_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2020_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2020_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2020
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2020_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2020_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2020_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2020_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2020_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2020_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2020_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2020_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2020_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2020_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2020_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2020.dta", replace
clear
*******************************************************************************
* 2021
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2021.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2021_is_rvfulltimeinstr asianwomens2021_is_rvfulltimeins blackorafricanamericanmens2021_i blackorafricanamericanwomens2021 hispanicorlatinomens2021_is_rvfu hispanicorlatinowomens2021_is_rv nativehawaiianorotherpacificisla v12 whitemens2021_is_rvfulltimeinstr whitewomens2021_is_rvfulltimeins twoormoreracesmens2021_is_rvfull twoormoreraceswomens2021_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2021_is_rvallfulltimein asianwomens2021_is_rvallfulltime v49 v50 hispanicorlatinomens2021_is_rval v52 v53 v54 whitemens2021_is_rvallfulltimein whitewomens2021_is_rvallfulltime twoormoreracesmens2021_is_rvallf twoormoreraceswomens2021_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2021_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2021_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2021_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2021_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2021_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2021
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2021_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2021_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2021_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2021_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2021_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2021_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2021_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2021_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2021_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2021_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2021_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2021.dta", replace
clear
*******************************************************************************
* 2022
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2022.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2022_is_rvfulltimeinstr asianwomens2022_is_rvfulltimeins blackorafricanamericanmens2022_i blackorafricanamericanwomens2022 hispanicorlatinomens2022_is_rvfu hispanicorlatinowomens2022_is_rv nativehawaiianorotherpacificisla v12 whitemens2022_is_rvfulltimeinstr whitewomens2022_is_rvfulltimeins twoormoreracesmens2022_is_rvfull twoormoreraceswomens2022_is_rvfu v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2022_is_rvallfulltimein asianwomens2022_is_rvallfulltime v49 v50 hispanicorlatinomens2022_is_rval v52 v53 v54 whitemens2022_is_rvallfulltimein whitewomens2022_is_rvallfulltime twoormoreracesmens2022_is_rvallf twoormoreraceswomens2022_is_rval v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2022_is_rvfulltimeinstr
gen m_asian_ntt =  v33
gen m_asian =  asianmens2022_is_rvallfulltimein
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2022_is_rvfulltimeins 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2022_is_rvallfulltime
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2022_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2022
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2022_is_rvfu
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2022_is_rval
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2022_is_rv
gen w_hisp_ntt = v38
gen w_hisp = v52
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2022_is_rvfulltimeinstr
gen m_white_ntt = v41
gen m_white = whitemens2022_is_rvallfulltimein
gen w_white_t = v28
gen w_white_tt = whitewomens2022_is_rvfulltimeins
gen w_white_ntt = v42
gen w_white = whitewomens2022_is_rvallfulltime
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2022_is_rvfull
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2022_is_rvallf
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2022_is_rvfu
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2022_is_rval
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_tt = ((w_asian_t + m_asian_t)/t_total)
gen p_asian_ntt = ((w_asian_t + m_asian_t)/t_total)
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = ((w_black_t + m_black_t)/t_total)
gen p_black_tt = ((w_black_t + m_black_t)/t_total)
gen p_black_ntt = ((w_black_t + m_black_t)/t_total)
*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_tt = ((w_hisp_t + m_hisp_t)/t_total)
gen p_hisp_ntt = ((w_hisp_t + m_hisp_t)/t_total)
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_tt = ((w_pacific_t + m_pacific_t)/t_total)
gen p_pacific_ntt = ((w_pacific_t + m_pacific_t)/t_total)
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = ((w_white_t + m_white_t)/t_total)
gen p_white_tt = ((w_white_t + m_white_t)/t_total)
gen p_white_ntt = ((w_white_t + m_white_t)/t_total)
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_tt = ((w_multi_t + m_multi_t)/t_total)
gen p_multi_ntt = ((w_multi_t + m_multi_t)/t_total)
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Clean Faculty 2022.dta", replace
clear
*******************************************************************************
* 2023
use "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\Yearly data\Faculty 2023.dta"
*
recode americanindianoralaskanativemens americanindianoralaskanativewome asianmens2023_isfulltimeinstruct asianwomens2023_isfulltimeinstru blackorafricanamericanmens2023_i blackorafricanamericanwomens2023 hispanicorlatinomens2023_isfullt hispanicorlatinowomens2023_isful nativehawaiianorotherpacificisla v12 whitemens2023_isfulltimeinstruct whitewomens2023_isfulltimeinstru twoormoreracesmens2023_isfulltim twoormoreraceswomens2023_isfullt v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45 v46 asianmens2023_isallfulltimeinstr asianwomens2023_isallfulltimeins v49 v50 hispanicorlatinomens2023_isallfu hispanicorlatinowomens2023_isall v53 v54 whitemens2023_isallfulltimeinstr whitewomens2023_isallfulltimeins twoormoreracesmens2023_isallfull twoormoreraceswomens2023_isallfu v59 (.=0)
*
gen m_natam_t =  v17
gen m_natam_tt =  americanindianoralaskanativemens
gen m_natam_ntt =  v31
gen m_natam =  v45
gen w_natam_t =  v18
gen w_natam_tt =  americanindianoralaskanativewome
gen w_natam_ntt =  v32
gen w_natam =  v46
gen t_natam =  (m_natam + w_natam)
*
gen m_asian_t =  v19
gen m_asian_tt =  asianmens2023_isfulltimeinstruct
gen m_asian_ntt =  v33
gen m_asian =  asianmens2023_isallfulltimeinstr
gen w_asian_t =  v20
gen w_asian_tt =  asianwomens2023_isfulltimeinstru 
gen w_asian_ntt =  v34
gen w_asian = asianwomens2023_isallfulltimeins
gen t_asian =  (m_asian + w_asian)
*
gen m_black_t = v21
gen m_black_tt = blackorafricanamericanmens2023_i
gen m_black_ntt = v35
gen m_black = v49
gen w_black_t = v22
gen w_black_tt = blackorafricanamericanwomens2023
gen w_black_ntt = v36
gen w_black = v50
gen t_black =  (m_black + w_black)
*
gen m_hisp_t = v23
gen m_hisp_tt = hispanicorlatinomens2023_isfullt
gen m_hisp_ntt = v37
gen m_hisp = hispanicorlatinomens2023_isallfu
gen w_hisp_t = v24
gen w_hisp_tt = hispanicorlatinowomens2023_isful
gen w_hisp_ntt = v38
gen w_hisp = hispanicorlatinowomens2023_isall
gen t_hisp =  (m_hisp + w_hisp)
*
gen m_pacific_t = v25
gen m_pacific_tt = nativehawaiianorotherpacificisla
gen m_pacific_ntt = v39
gen m_pacific = v53
gen w_pacific_t = v40
gen w_pacific_tt = v26
gen w_pacific_ntt = v12
gen w_pacific = v54
gen t_pacific =  (m_pacific + w_pacific)
*
gen m_white_t = v27
gen m_white_tt = whitemens2023_isfulltimeinstruct
gen m_white_ntt = v41
gen m_white = whitemens2023_isallfulltimeinstr
gen w_white_t = v28
gen w_white_tt = whitewomens2023_isfulltimeinstru
gen w_white_ntt = v42
gen w_white = whitewomens2023_isallfulltimeins
gen t_white =  (m_white + w_white)
*
gen m_multi_t = v29
gen m_multi_tt = twoormoreracesmens2023_isfulltim
gen m_multi_ntt = v43
gen m_multi = twoormoreracesmens2023_isallfull
gen w_multi_t = v30
gen w_multi_tt = twoormoreraceswomens2023_isfullt
gen w_multi_ntt = v44
gen w_multi = twoormoreraceswomens2023_isallfu
gen t_multi =  (m_multi + w_multi)
*
gen t_women =  (w_natam + w_asian + w_black + w_hisp + w_pacific + w_white + w_multi)
gen t_men =  (m_natam + m_asian + m_black + m_hisp + m_pacific + m_white + m_multi)
gen t_total =  (t_men + t_women)
drop if t_total<3
*
gen t_tenured =  (m_natam_t + w_natam_t + m_asian_t + w_asian_t + m_black_t + w_black_t + m_hisp_t + w_hisp_t + m_pacific_t + w_pacific_t + m_white_t + w_white_t + m_multi_t)
gen t_tenuretrack =  (m_natam_tt + w_natam_tt + m_asian_tt + w_asian_tt + m_black_tt + w_black_tt + m_hisp_tt + w_hisp_tt + m_pacific_tt + w_pacific_tt + m_white_tt + w_white_tt + m_multi_tt + w_multi_tt)
gen t_notontt =  (m_natam_ntt + w_natam_ntt + m_asian_ntt + w_asian_ntt + m_black_ntt + w_black_ntt + m_hisp_ntt + w_hisp_ntt + m_pacific_ntt + w_pacific_ntt + m_white_ntt + w_white_ntt + m_multi_ntt + w_multi_ntt)
*
gen p_women =  (t_women/t_total)
gen p_men =  (t_men/t_total)
*
gen p_tenured =  (t_tenured/t_total)
gen p_tenuretrack =  (t_tenuretrack/t_total)
gen p_notontt =  (t_notontt/t_total)
*
gen p_natam =  (t_natam/t_total)
gen p_natam_w =  (w_natam/t_total)
gen p_natam_m =  (m_natam/t_total)
gen p_natam_w_t = (w_natam_t/t_total)
gen p_natam_w_tt = (w_natam_tt/t_total)
gen p_natam_w_ntt = (w_natam_ntt/t_total)
gen p_natam_m_t = (m_natam_t/t_total)
gen p_natam_m_tt = (m_natam_tt/t_total)
gen p_natam_m_ntt = (m_natam_ntt/t_total)
gen p_natam_t = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_tt = ((w_natam_t + m_natam_t)/t_total)
gen p_natam_ntt = ((w_natam_t + m_natam_t)/t_total)
*
gen p_asian =  (t_asian/t_total)
gen p_asian_w =  (w_asian/t_total)
gen p_asian_m =  (m_asian/t_total)
gen p_asian_w_t = (w_asian_t/t_total)
gen p_asian_w_tt = (w_asian_tt/t_total)
gen p_asian_w_ntt = (w_asian_ntt/t_total)
gen p_asian_m_t = (m_asian_t/t_total)
gen p_asian_m_tt = (m_asian_tt/t_total)
gen p_asian_m_ntt = (m_asian_ntt/t_total)
gen p_asian_t = (w_asian_t + m_asian_t)/t_total
gen p_asian_tt = (w_asian_tt + m_asian_tt)/t_total
gen p_asian_ntt = (w_asian_ntt + m_asian_ntt)/t_total
*
*
gen p_black =  (t_black/t_total)
gen p_black_w =  (w_black/t_total)
gen p_black_m =  (m_black/t_total)
gen p_black_w_t = (w_black_t/t_total)
gen p_black_w_tt = (w_black_tt/t_total)
gen p_black_w_ntt = (w_black_ntt/t_total)
gen p_black_m_t = (m_black_t/t_total)
gen p_black_m_tt = (m_black_tt/t_total)
gen p_black_m_ntt = (m_black_ntt/t_total)
gen p_black_t = (w_black_t + m_black_t)/t_total
gen p_black_tt = (w_black_tt + m_black_tt)/t_total
gen p_black_ntt = (w_black_ntt + m_black_ntt)/t_total

*
gen p_hisp =  (t_hisp/t_total)
gen p_hisp_w =  (w_hisp/t_total)
gen p_hisp_m =  (m_hisp/t_total)
gen p_hisp_w_t = (w_hisp_t/t_total)
gen p_hisp_w_tt = (w_hisp_tt/t_total)
gen p_hisp_w_ntt = (w_hisp_ntt/t_total)
gen p_hisp_m_t = (m_hisp_t/t_total)
gen p_hisp_m_tt = (m_hisp_tt/t_total)
gen p_hisp_m_ntt = (m_hisp_ntt/t_total)
gen p_hisp_t = (w_hisp_t + m_hisp_t)/t_total
gen p_hisp_tt = (w_hisp_tt + m_hisp_tt)/t_total
gen p_hisp_ntt = (w_hisp_ntt + m_hisp_ntt)/t_total
*
gen p_pacific =  (t_pacific/t_total)
gen p_pacific_w =  (w_pacific/t_total)
gen p_pacific_m =  (m_pacific/t_total)
gen p_pacific_w_t = (w_pacific_t/t_total)
gen p_pacific_w_tt = (w_pacific_tt/t_total)
gen p_pacific_w_ntt = (w_pacific_ntt/t_total)
gen p_pacific_m_t = (m_pacific_t/t_total)
gen p_pacific_m_tt = (m_pacific_tt/t_total)
gen p_pacific_m_ntt = (m_pacific_ntt/t_total)
gen p_pacific_t = (w_pacific_t + m_pacific_t)/t_total
gen p_pacific_tt = (w_pacific_tt + m_pacific_tt)/t_total
gen p_pacific_ntt = (w_pacific_ntt + m_pacific_ntt)/t_total
*
gen p_white =  (t_white/t_total)
gen p_white_w =  (w_white/t_total)
gen p_white_m =  (m_white/t_total)
gen p_white_w_t = (w_white_t/t_total)
gen p_white_w_tt = (w_white_tt/t_total)
gen p_white_w_ntt = (w_white_ntt/t_total)
gen p_white_m_t = (m_white_t/t_total)
gen p_white_m_tt = (m_white_tt/t_total)
gen p_white_m_ntt = (m_white_ntt/t_total)
gen p_white_t = (w_white_t + m_white_t)/t_total
gen p_white_tt = (w_white_tt + m_white_tt)/t_total
gen p_white_ntt = (w_white_ntt + m_white_ntt)/t_total
*
gen p_multi =  (t_multi/t_total)
gen p_multi_w =  (w_multi/t_total)
gen p_multi_m =  (m_multi/t_total)
gen p_multi_w_t = (w_multi_t/t_total)
gen p_multi_w_tt = (w_multi_tt/t_total)
gen p_multi_w_ntt = (w_multi_ntt/t_total)
gen p_multi_m_t = (m_multi_t/t_total)
gen p_multi_m_tt = (m_multi_tt/t_total)
gen p_multi_m_ntt = (m_multi_ntt/t_total)
gen p_multi_t = (w_multi_t + m_multi_t)/t_total
gen p_multi_tt = (w_multi_tt + m_multi_tt)/t_total
gen p_multi_ntt = (w_multi_ntt + m_multi_ntt)/t_total
*
keep unitid institutionname year m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam m_asian_t m_asian_tt m_asian_ntt m_asian w_asian_t w_asian_tt w_asian_ntt w_asian t_asian m_black_t m_black_tt m_black_ntt m_black w_black_t w_black_tt w_black_ntt w_black t_black m_hisp_t m_hisp_tt m_hisp_ntt m_hisp w_hisp_t w_hisp_tt w_hisp_ntt w_hisp t_hisp m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific m_white_t m_white_tt m_white_ntt m_white w_white_t w_white_tt w_white_ntt w_white t_white m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi t_women t_men t_total t_tenured t_tenuretrack t_notontt p_women p_men p_tenured p_tenuretrack p_notontt p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt p_asian p_asian_w p_asian_m p_asian_w_t p_asian_w_tt p_asian_w_ntt p_asian_m_t p_asian_m_tt p_asian_m_ntt p_asian_t p_asian_tt p_asian_ntt p_black p_black_w p_black_m p_black_w_t p_black_w_tt p_black_w_ntt p_black_m_t p_black_m_tt p_black_m_ntt p_black_t p_black_tt p_black_ntt p_hisp p_hisp_w p_hisp_m p_hisp_w_t p_hisp_w_tt p_hisp_w_ntt p_hisp_m_t p_hisp_m_tt p_hisp_m_ntt p_hisp_t p_hisp_tt p_hisp_ntt p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt p_white p_white_w p_white_m p_white_w_t p_white_w_tt p_white_w_ntt p_white_m_t p_white_m_tt p_white_m_ntt p_white_t p_white_tt p_white_ntt p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt
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
gen m_other_t = (m_natam_t + m_pacific_t + m_multi_t)
gen m_other_tt = (m_natam_tt + m_pacific_tt + m_multi_tt)
gen m_other_ntt = (m_natam_ntt + m_pacific_ntt + m_multi_ntt)
gen m_other = (m_other_t + m_other_tt + m_other_ntt)
gen w_other_t = (w_natam_t + w_pacific_t + w_multi_t)
gen w_other_tt = (w_natam_tt + w_pacific_tt + w_multi_tt)
gen w_other_ntt = (w_natam_ntt + w_pacific_ntt + w_multi_ntt)
gen w_other = (w_other_t + w_other_tt + w_other_ntt)
gen t_other = m_other + w_other
gen p_other =  (t_other/t_total)
gen p_other_w =  (w_other/t_total)
gen p_other_m =  (m_other/t_total)
gen p_other_w_t = (w_other_t/t_total)
gen p_other_w_tt = (w_other_tt/t_total)
gen p_other_w_ntt = (w_other_ntt/t_total)
gen p_other_m_t = (m_other_t/t_total)
gen p_other_m_tt = (m_other_tt/t_total)
gen p_other_m_ntt = (m_other_ntt/t_total)
gen p_other_t = (w_other_t + m_other_t)/t_total
gen p_other_tt = (w_other_tt + m_other_tt)/t_total
gen p_other_ntt = (w_other_ntt + m_other_ntt)/t_total
*
drop m_natam_t m_natam_tt m_natam_ntt m_natam w_natam_t w_natam_tt w_natam_ntt w_natam t_natam p_natam p_natam_w p_natam_m p_natam_w_t p_natam_w_tt p_natam_w_ntt p_natam_m_t p_natam_m_tt p_natam_m_ntt p_natam_t p_natam_tt p_natam_ntt m_pacific_t m_pacific_tt m_pacific_ntt m_pacific w_pacific_t w_pacific_tt w_pacific_ntt w_pacific t_pacific p_pacific p_pacific_w p_pacific_m p_pacific_w_t p_pacific_w_tt p_pacific_w_ntt p_pacific_m_t p_pacific_m_tt p_pacific_m_ntt p_pacific_t p_pacific_tt p_pacific_ntt m_multi_t m_multi_tt m_multi_ntt m_multi w_multi_t w_multi_tt w_multi_ntt w_multi t_multi p_multi p_multi_w p_multi_m p_multi_w_t p_multi_w_tt p_multi_w_ntt p_multi_m_t p_multi_m_tt p_multi_m_ntt p_multi_t p_multi_tt p_multi_ntt

gen i_diversity = 1 - (p_asian^2 + p_black^2 + p_hisp^2 + p_white^2 + p_other^2)

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
label variable m_asian_t "Total Tenured Asian Men"
label variable m_asian_tt "Total Tenture-Track Asian Men"
label variable m_asian_ntt "Total Non-Tenure-Track Asian Men"
label variable m_asian "Total Asian Men"
label variable w_asian_t "Total Tenured Asian Women"
label variable w_asian_tt "Total Tenured Asian Women"
label variable w_asian_ntt "Total Tenure-Track Asian Women"
label variable w_asian "Total Non-Tenure-Track Asian Women"
label variable t_asian "Total Asian Women"
*
label variable m_black_t "Total Tenured Black Men"
label variable m_black_tt "Total Tenture-Track Black Men"
label variable m_black_ntt "Total Non-Tenure-Track Black Men"
label variable m_black "Total Black Men"
label variable w_black_t "Total Tenured Black Women"
label variable w_black_tt "Total Tenured Black Women"
label variable w_black_ntt "Total Tenure-Track Black Women"
label variable w_black "Total Non-Tenure-Track Black Women"
label variable t_black "Total Black Women"
*
label variable m_hisp_t "Total Tenured Hispanic Men"
label variable m_hisp_tt "Total Tenture-Track Hispanic Men"
label variable m_hisp_ntt "Total Non-Tenure-Track Hispanic Men"
label variable m_hisp "Total Hispanic Men"
label variable w_hisp_t "Total Tenured Hispanic Women"
label variable w_hisp_tt "Total Tenured Hispanic Women"
label variable w_hisp_ntt "Total Tenure-Track Hispanic Women"
label variable w_hisp "Total Non-Tenure-Track Hispanic Women"
label variable t_hisp "Total Hispanic Women"
*
label variable m_white_t "Total Tenured White Men"
label variable m_white_tt "Total Tenture-Track White Men"
label variable m_white_ntt "Total Non-Tenure-Track White Men"
label variable m_white "Total White Men"
label variable w_white_t "Total Tenured White Women"
label variable w_white_tt "Total Tenured White Women"
label variable w_white_ntt "Total Tenure-Track White Women"
label variable w_white "Total Non-Tenure-Track White Women"
label variable t_white "Total White Women"
*
label variable m_other_t "Total Tenured Other Race Men"
label variable m_other_tt "Total Tenture-Track Other Race Men"
label variable m_other_ntt "Total Non-Tenure-Track Other Race Men"
label variable m_other "Total Other Race Men"
label variable w_other_t "Total Tenured Other Race Women"
label variable w_other_tt "Total Tenured Other Race Women"
label variable w_other_ntt "Total Tenure-Track Other Race Women"
label variable w_other "Total Non-Tenure-Track Other Race Women"
label variable t_other "Total Other Race Women"
*
label variable t_women "Total Women Faculty"
label variable t_men "Total Men Faculty"
label variable t_total "Total Faculty"
*
label variable t_tenured "Total Tenured Faculty"
label variable t_tenuretrack "Total Tenure-Track Faculty"
label variable t_notontt "Total Non-Tenure-Track Faculty"
*
label variable p_women "Proportion of Women Faculty Out of All Faculty"
label variable p_men "Proportion of Men Faculty Out of All Faculty"
*
label variable p_tenured "Proportion of Tenured Faculty Out of All Faculty"
label variable p_tenuretrack "Proportion of Tenure-Track Faculty Out of All Faculty"
label variable p_notontt "Proportion of Non-Tenure-Track Faculty Out of All Faculty"
*
label variable p_asian  "Proportion of Asian Faculty Out of All Faculty"
label variable p_asian_w "Proportion of Asian Women Out of All Faculty"
label variable p_asian_m "Proportion of Asian Men Out of All Faculty"
label variable p_asian_w_t "Proportion of Tenured Asian Women Out of All Faculty"
label variable p_asian_w_tt "Proportion of Tenure-Track Asian Women Out of All Faculty"
label variable p_asian_w_ntt "Proportion of Non-Tenure-Track Asian Women Out of All Faculty"
label variable p_asian_m_t "Proportion of Tenured Asian Men Out of All Faculty"
label variable p_asian_m_tt "Proportion of Tenure-Track Asian Men Out of All Faculty"
label variable p_asian_m_ntt "Proportion of Non-Tenure-Track Asian Men Out of All Faculty"
label variable p_asian_t "Proportion of Tenured Asian Faculty Out of All Faculty"
label variable p_asian_tt "Proportion of Tenure-Track Asian Faculty Out of All Faculty"
label variable p_asian_ntt "Proportion of Non-Tenure-Track Asian Faculty Out of All Faculty"
*
label variable p_black  "Proportion of Black Faculty Out of All Faculty"
label variable p_black_w "Proportion of Black Women Out of All Faculty"
label variable p_black_m "Proportion of Black Men Out of All Faculty"
label variable p_black_w_t "Proportion of Tenured Black Women Out of All Faculty"
label variable p_black_w_tt "Proportion of Tenure-Track Black Women Out of All Faculty"
label variable p_black_w_ntt "Proportion of Non-Tenure-Track Black Women Out of All Faculty"
label variable p_black_m_t "Proportion of Tenured Black Men Out of All Faculty"
label variable p_black_m_tt "Proportion of Tenure-Track Black Men Out of All Faculty"
label variable p_black_m_ntt "Proportion of Non-Tenure-Track Black Men Out of All Faculty"
label variable p_black_t "Proportion of Tenured Black Faculty Out of All Faculty"
label variable p_black_tt "Proportion of Tenure-Track Black Faculty Out of All Faculty"
label variable p_black_ntt "Proportion of Non-Tenure-Track Black Faculty Out of All Faculty"
*
label variable p_hisp  "Proportion of Hispanic Faculty Out of All Faculty"
label variable p_hisp_w "Proportion of Hispanic Women Out of All Faculty"
label variable p_hisp_m "Proportion of Hispanic Men Out of All Faculty"
label variable p_hisp_w_t "Proportion of Tenured Hispanic Women Out of All Faculty"
label variable p_hisp_w_tt "Proportion of Tenure-Track Hispanic Women Out of All Faculty"
label variable p_hisp_w_ntt "Proportion of Non-Tenure-Track Hispanic Women Out of All Faculty"
label variable p_hisp_m_t "Proportion of Tenured Hispanic Men Out of All Faculty"
label variable p_hisp_m_tt "Proportion of Tenure-Track Hispanic Men Out of All Faculty"
label variable p_hisp_m_ntt "Proportion of Non-Tenure-Track Hispanic Men Out of All Faculty"
label variable p_hisp_t "Proportion of Tenured Hispanic Faculty Out of All Faculty"
label variable p_hisp_tt "Proportion of Tenure-Track Hispanic Faculty Out of All Faculty"
label variable p_hisp_ntt "Proportion of Non-Tenure-Track Hispanic Faculty Out of All Faculty"
*
label variable p_white  "Proportion of White Faculty Out of All Faculty"
label variable p_white_w "Proportion of White Women Out of All Faculty"
label variable p_white_m "Proportion of White Men Out of All Faculty"
label variable p_white_w_t "Proportion of Tenured White Women Out of All Faculty"
label variable p_white_w_tt "Proportion of Tenure-Track White Women Out of All Faculty"
label variable p_white_w_ntt "Proportion of Non-Tenure-Track White Women Out of All Faculty"
label variable p_white_m_t "Proportion of Tenured White Men Out of All Faculty"
label variable p_white_m_tt "Proportion of Tenure-Track White Men Out of All Faculty"
label variable p_white_m_ntt "Proportion of Non-Tenure-Track White Men Out of All Faculty"
label variable p_white_t "Proportion of Tenured White Faculty Out of All Faculty"
label variable p_white_tt "Proportion of Tenure-Track White Faculty Out of All Faculty"
label variable p_white_ntt "Proportion of Non-Tenure-Track White Faculty Out of All Faculty"
*
label variable p_other  "Proportion of Other Race Faculty Out of All Faculty"
label variable p_other_w "Proportion of Other Race Women Out of All Faculty"
label variable p_other_m "Proportion of Other Race Men Out of All Faculty"
label variable p_other_w_t "Proportion of Tenured Other Race Women Out of All Faculty"
label variable p_other_w_tt "Proportion of Tenure-Track Other Race Women Out of All Faculty"
label variable p_other_w_ntt "Proportion of Non-Tenure-Track Other Race Women Out of All Faculty"
label variable p_other_m_t "Proportion of Tenured Other Race Men Out of All Faculty"
label variable p_other_m_tt "Proportion of Tenure-Track Other Race Men Out of All Faculty"
label variable p_other_m_ntt "Proportion of Non-Tenure-Track Other Race Men Out of All Faculty"
label variable p_other_t "Proportion of Tenured Other Race Faculty Out of All Faculty"
label variable p_other_tt "Proportion of Tenure-Track Other Race Faculty Out of All Faculty"
label variable p_other_ntt "Proportion of Non-Tenure-Track Other Race Faculty Out of All Faculty"
*
label variable i_diversity "Diversity Index"
*
save "\\smb-isl01.fsu.edu\citrix\tal15b\Documents\diss\IPEDS\IPEDS 2015 through 2023\Faculty\1a Clean Faculty 2015-2023 Condensed Races.dta", replace
clear
********************************************************************************
********************************************************************************
log close



