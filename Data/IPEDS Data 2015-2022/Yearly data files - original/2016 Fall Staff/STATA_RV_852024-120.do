* Created: 8/5/2024 3:18:11 PM                             
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
insheet using "c:\cds\STATA_RV_852024-120.csv", clear
label data STATA_RV_852024_120
label variable unitid "UNITID"
label variable instnm "Institution Name"
label variable year "Survey year 2016"
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
label define label_siscat 100 "Instructional staff with faculty status", add
label define label_siscat 101 "Instructional staff, professors", add
label define label_siscat 102 "Instructional staff, associate professors", add
label define label_siscat 103 "Instructional staff, assistant professors", add
label define label_siscat 104 "Instructional staff, instructors", add
label define label_siscat 105 "Instructional staff, lecturers", add
label define label_siscat 106 "Instructional staff, no academic rank", add
label define label_siscat 200 "Tenured total", add
label define label_siscat 201 "Tenured, professors", add
label define label_siscat 202 "Tenured, associate professors", add
label define label_siscat 203 "Tenured, assistant professors", add
label define label_siscat 204 "Tenured, instructors", add
label define label_siscat 205 "Tenured, lecturers", add
label define label_siscat 206 "Tenured, no academic rank", add
label define label_siscat 300 "On-Tenure track total", add
label define label_siscat 301 "On-tenure track, professors", add
label define label_siscat 302 "On-tenure track, associate professors", add
label define label_siscat 303 "On-tenure track, assistant professors", add
label define label_siscat 304 "On-tenure track, instructors", add
label define label_siscat 305 "On-tenure track, lecturers", add
label define label_siscat 306 "On-tenure track, no academic rank", add
label define label_siscat 400 "Not on tenure track/No tenure system system total", add
label define label_siscat 401 "Not on tenure/no tenure system, professors", add
label define label_siscat 402 "Not on tenure/no tenure system, associate professors", add
label define label_siscat 403 "Not on tenure/no tenure system, assistant professors", add
label define label_siscat 404 "Not on tenure/no tenure system, instructors", add
label define label_siscat 405 "Not on tenure/no tenure system, lecturers", add
label define label_siscat 406 "Not on tenure/no tenure system, no academic rank", add
label define label_siscat 410 "Not on tenure track/no tenure system, multi-year and indefinite contracts, total", add
label define label_siscat 411 "Not on tenure track/no tenure system, multi-year and indefinite contracts, professors", add
label define label_siscat 412 "Not on tenure track/no tenure system, multi-year and indefinite contracts, asssociate professors", add
label define label_siscat 413 "Not on tenure track/no tenure system, multi-year and indefinite contracts, assistant professors", add
label define label_siscat 414 "Not on tenure track/no tenure system, multi-year and indefinite contracts, instructors", add
label define label_siscat 415 "Not on tenure track/no tenure system, multi-year and indefinite contracts contract,lecturers", add
label define label_siscat 416 "Not on tenure track/no tenure system, multi-year and indefinite contracts, no academic rank", add
label define label_siscat 420 "Not on tenure track/no tenure system, annual contract, total", add
label define label_siscat 421 "Not on tenure track/no tenure system, annual contract, professors", add
label define label_siscat 422 "Not on tenure track/no tenure system, annual contract, asssociate professors", add
label define label_siscat 423 "Not on tenure track/no tenure system, annual contract, assistant professors", add
label define label_siscat 424 "Not on tenure track/no tenure system, annual contract, instructors", add
label define label_siscat 425 "Not on tenure track/no tenure system, annual contract,lecturers", add
label define label_siscat 426 "Not on tenure track/no tenure system, annual contract, no academic rank", add
label define label_siscat 430 "Not on tenure track/no tenure system, less-than-annual contract, total", add
label define label_siscat 431 "Not on tenure track/no tenure system, less-than-annual contract, professors", add
label define label_siscat 432 "Not on tenure track/no tenure system, less-than-annual contract, asssociate professors", add
label define label_siscat 433 "Not on tenure track/no tenure system, less-than-annual contract, assistant professors", add
label define label_siscat 434 "Not on tenure track/no tenure system, less-than-annual contract, instructors", add
label define label_siscat 435 "Not on tenure track/no tenure system, less-than-annual contract,lecturers", add
label define label_siscat 436 "Not on tenure track/no tenure system, less-than-annual contract, no academic rank", add
label define label_siscat 440 "Not on tenure track/no tenure system, multi-year contract, total", add
label define label_siscat 441 "Not on tenure track/no tenure system, multi-year contract, professors", add
label define label_siscat 442 "Not on tenure track/no tenure system, multi-year contract, associate professors", add
label define label_siscat 443 "Not on tenure track/no tenure system, multi-year contract, assistant professors", add
label define label_siscat 444 "Not on tenure track/no tenure system, multi-year contract, instructors", add
label define label_siscat 445 "Not on tenure track/no tenure system, multi-year contract, lecturers", add
label define label_siscat 446 "Not on tenure track/no tenure system, multi-year contract, no academic rank", add
label define label_siscat 450 "Not on tenure track/no tenure system, indefinite contract, total", add
label define label_siscat 451 "Not on tenure track/no tenure system, indefinite contract, professors", add
label define label_siscat 452 "Not on tenure track/no tenure system, indefinite contract, associate professors", add
label define label_siscat 453 "Not on tenure track/no tenure system, indefinite contract, assistant professors", add
label define label_siscat 454 "Not on tenure track/no tenure system, indefinite contract, instructors", add
label define label_siscat 455 "Not on tenure track/no tenure system, indefinite contract, lecturers", add
label define label_siscat 456 "Not on tenure track/no tenure system, indefinite contract, no academic rank", add
label define label_siscat 500 "Without faculty status", add
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


save cdsfile_all_STATA_RV_852024-120.dta