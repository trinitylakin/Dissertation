* Created: 8/5/2024 3:20:58 PM                             
* Modify the path below to point to your data file.		
* The specified subdirectory was not created on			
* your computer. You will need to do this.				
*														
* This read program must be ran against the specified	
* data file. This file is specified in the program		
* and must be saved separately.							
*														
* This program does not provide tab or summaries for all	
* variables.                                             
*														
* There may be missing data for some institutions due    
* to the merge used to create this file.					
*														
* This program does not include reserved values in its   
* calculations for missing values.			            
*														
* You may need to adjust your memory settings depending  
* upon the number of variables and records.				
*														
* The save command may need to be modified per user		
* requirements.											
*														
* For long lists of value labels, the titles may be		
* shortened per program requirements.                    
*	
insheet using "c:\cds\STATA_RV_852024-449.csv", clear
label data STATA_RV_852024_449
label variable unitid "UNITID"
label variable instnm "Institution Name"
label variable year "Survey year 2021"
label variable siscat "Instructional staff category"
label variable hraianm "American Indian or Alaska Native men"
label variable hraianw "American Indian or Alaska Native women"
label variable hrasiam "Asian men"
label variable hrasiaw "Asian women"
label variable hrbkaam "Black or African American men"
label variable hrbkaaw "Black or African American women"
label variable hrhispm "Hispanic or Latino men"
label variable hrhispw "Hispanic or Latino women"
label variable hrnhpim "Native Hawaiian or Other Pacific Islander men"
label variable hrnhpiw "Native Hawaiian or Other Pacific Islander women"
label variable hrwhitm "White men"
label variable hrwhitw "White women"
label variable hr2morm "Two or more races men"
label variable hr2morw "Two or more races women"
label variable hrunknm "Race/ethnicity unknown men"
label variable hrunknw "Race/ethnicity unknown women"
label variable idx_hr "ID of institution where data are reported for the Human Resource component"

label define label_siscat 1 "All full-time instructional staff"
label define label_siscat 100 "Full-time instructional with faculty status", add
label define label_siscat 101 "Full-time instructional professors", add
label define label_siscat 102 "Full-time instructional associate professors", add
label define label_siscat 103 "Full-time instructional assistant professors", add
label define label_siscat 104 "Full-time instructional instructors", add
label define label_siscat 105 "Full-time instructional lecturers", add
label define label_siscat 106 "Full-time instructional no academic rank", add
label define label_siscat 200 "Full-time instructional tenured total", add
label define label_siscat 201 "Full-time instructional tenured, professors", add
label define label_siscat 202 "Full-time instructional tenured, associate professors", add
label define label_siscat 203 "Full-time instructional tenured, assistant professors", add
label define label_siscat 204 "Full-time instructional tenured, instructors", add
label define label_siscat 205 "Full-time instructional tenured, lecturers", add
label define label_siscat 206 "Full-time instructional tenured, no academic rank", add
label define label_siscat 300 "Full-time instructional on-tenure track total", add
label define label_siscat 301 "Full-time instructional on-tenure track, professors", add
label define label_siscat 302 "Full-time instructional on-tenure track, associate professors", add
label define label_siscat 303 "Full-time instructional on-tenure track, assistant professors", add
label define label_siscat 304 "Full-time instructional on-tenure track, instructors", add
label define label_siscat 305 "Full-time instructional on-tenure track, lecturers", add
label define label_siscat 306 "Full-time instructional on-tenure track, no academic rank", add
label define label_siscat 400 "Full-time instructional not on tenure track/no tenure system system total", add
label define label_siscat 401 "Full-time instructional not on tenure/no tenure system, professors", add
label define label_siscat 402 "Full-time instructional not on tenure/no tenure system, associate professors", add
label define label_siscat 403 "Full-time instructional not on tenure/no tenure system, assistant professors", add
label define label_siscat 404 "Full-time instructional not on tenure/no tenure system, instructors", add
label define label_siscat 405 "Full-time instructional not on tenure/no tenure system, lecturers", add
label define label_siscat 406 "Full-time instructional not on tenure/no tenure system, no academic rank", add
label define label_siscat 410 "Full-time instructional not on tenure track/no tenure system, multi-year and indefinite contracts, total", add
label define label_siscat 411 "Full-time instructional not on tenure track/no tenure system, multi-year and indefinite contracts, professors", add
label define label_siscat 412 "Full-time instructional not on tenure track/no tenure system, multi-year and indefinite contracts, asssociate professors", add
label define label_siscat 413 "Full-time instructional not on tenure track/no tenure system, multi-year and indefinite contracts, assistant professors", add
label define label_siscat 414 "Full-time instructional not on tenure track/no tenure system, multi-year and indefinite contracts, instructors", add
label define label_siscat 415 "Full-time instructional not on tenure track/no tenure system, multi-year and indefinite contracts contract,lecturers", add
label define label_siscat 416 "Full-time instructional not on tenure track/no tenure system, multi-year and indefinite contracts, no academic rank", add
label define label_siscat 420 "Full-time instructional not on tenure track/no tenure system, annual contract, total", add
label define label_siscat 421 "Full-time instructional not on tenure track/no tenure system, annual contract, professors", add
label define label_siscat 422 "Full-time instructional not on tenure track/no tenure system, annual contract, asssociate professors", add
label define label_siscat 423 "Full-time instructional not on tenure track/no tenure system, annual contract, assistant professors", add
label define label_siscat 424 "Full-time instructional not on tenure track/no tenure system, annual contract, instructors", add
label define label_siscat 425 "Full-time instructional not on tenure track/no tenure system, annual contract,lecturers", add
label define label_siscat 426 "Full-time instructional not on tenure track/no tenure system, annual contract, no academic rank", add
label define label_siscat 430 "Full-time instructional not on tenure track/no tenure system, less-than-annual contract, total", add
label define label_siscat 431 "Full-time instructional not on tenure track/no tenure system, less-than-annual contract, professors", add
label define label_siscat 432 "Full-time instructional not on tenure track/no tenure system, less-than-annual contract, asssociate professors", add
label define label_siscat 433 "Full-time instructional not on tenure track/no tenure system, less-than-annual contract, assistant professors", add
label define label_siscat 434 "Full-time instructional not on tenure track/no tenure system, less-than-annual contract, instructors", add
label define label_siscat 435 "Full-time instructional not on tenure track/no tenure system, less-than-annual contract,lecturers", add
label define label_siscat 436 "Full-time instructional not on tenure track/no tenure system, less-than-annual contract, no academic rank", add
label define label_siscat 440 "Full-time instructional not on tenure track/no tenure system, multi-year contract, total", add
label define label_siscat 441 "Full-time instructional not on tenure track/no tenure system, multi-year contract, professors", add
label define label_siscat 442 "Full-time instructional not on tenure track/no tenure system, multi-year contract, associate professors", add
label define label_siscat 443 "Full-time instructional not on tenure track/no tenure system, multi-year contract, assistant professors", add
label define label_siscat 444 "Full-time instructional not on tenure track/no tenure system, multi-year contract, instructors", add
label define label_siscat 445 "Full-time instructional not on tenure track/no tenure system, multi-year contract, lecturers", add
label define label_siscat 446 "Full-time instructional not on tenure track/no tenure system, multi-year contract, no academic rank", add
label define label_siscat 450 "Full-time instructional not on tenure track/no tenure system, multi-year contract, total", add
label define label_siscat 451 "Full-time instructional not on tenure track/no tenure system, indefinite contract, professors", add
label define label_siscat 452 "Full-time instructional not on tenure track/no tenure system, indefinite contract, associate professors", add
label define label_siscat 453 "Full-time instructional not on tenure track/no tenure system, indefinite contract, assistant professors", add
label define label_siscat 454 "Full-time instructional not on tenure track/no tenure system, indefinite contract, instructors", add
label define label_siscat 455 "Full-time instructional not on tenure track/no tenure system, indefinite contract, lecturers", add
label define label_siscat 456 "Full-time instructional not on tenure track/no tenure system, indefinite contract, no academic rank", add
label define label_siscat 500 "Full-time instructional without faculty status", add
label values siscat label_siscat

tab siscat

summarize hraianm
summarize hraianw
summarize hrasiam
summarize hrasiaw
summarize hrbkaam
summarize hrbkaaw
summarize hrhispm
summarize hrhispw
summarize hrnhpim
summarize hrnhpiw
summarize hrwhitm
summarize hrwhitw
summarize hr2morm
summarize hr2morw
summarize hrunknm
summarize hrunknw
summarize idx_hr


save cdsfile_all_STATA_RV_852024-449.dta