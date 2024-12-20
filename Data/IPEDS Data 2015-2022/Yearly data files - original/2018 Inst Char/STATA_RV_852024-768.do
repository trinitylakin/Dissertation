* Created: 8/5/2024 3:19:02 PM                             
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
insheet using "c:\cds\STATA_RV_852024-768.csv", clear
label data STATA_RV_852024_768
label variable unitid "UNITID"
label variable instnm "Institution Name"
label variable year "Survey year 2018"
label variable instnm "Institution (entity) name"
label variable ialias "Institution name alias"
label variable zip "ZIP code"
label variable instsize "Institution size category"
label variable stabbr "State abbreviation"
label variable control "Control of institution"
label variable deggrant "Degree-granting status"
label variable hbcu "Historically Black College or University"
label variable locale "Degree of urbanization (Urban-centric locale)"
label variable c15basic "Carnegie Classification 2015: Basic"

label define label_instsize 1 "Under 1,000"
label values instsize label_instsize
label define label_instsize 2 "1,000 - 4,999", add
label values instsize label_instsize
label define label_instsize 3 "5,000 - 9,999", add
label values instsize label_instsize
label define label_instsize 4 "10,000 - 19,999", add
label values instsize label_instsize
label define label_instsize 5 "20,000 and above", add
label values instsize label_instsize
label define label_instsize -1 "Not reported", add
label values instsize label_instsize
label define label_instsize -2 "Not applicable", add
label values instsize label_instsize
/* label define label_stabbr AL "Alabama"
label values stabbr label_stabbr
label define label_stabbr AK "Alaska", add
label values stabbr label_stabbr
label define label_stabbr AZ "Arizona", add
label values stabbr label_stabbr
label define label_stabbr AR "Arkansas", add
label values stabbr label_stabbr
label define label_stabbr CA "California", add
label values stabbr label_stabbr
label define label_stabbr CO "Colorado", add
label values stabbr label_stabbr
label define label_stabbr CT "Connecticut", add
label values stabbr label_stabbr
label define label_stabbr DE "Delaware", add
label values stabbr label_stabbr
label define label_stabbr DC "District of Columbia", add
label values stabbr label_stabbr
label define label_stabbr FL "Florida", add
label values stabbr label_stabbr
label define label_stabbr GA "Georgia", add
label values stabbr label_stabbr
label define label_stabbr HI "Hawaii", add
label values stabbr label_stabbr
label define label_stabbr ID "Idaho", add
label values stabbr label_stabbr
label define label_stabbr IL "Illinois", add
label values stabbr label_stabbr
label define label_stabbr IN "Indiana", add
label values stabbr label_stabbr
label define label_stabbr IA "Iowa", add
label values stabbr label_stabbr
label define label_stabbr KS "Kansas", add
label values stabbr label_stabbr
label define label_stabbr KY "Kentucky", add
label values stabbr label_stabbr
label define label_stabbr LA "Louisiana", add
label values stabbr label_stabbr
label define label_stabbr ME "Maine", add
label values stabbr label_stabbr
label define label_stabbr MD "Maryland", add
label values stabbr label_stabbr
label define label_stabbr MA "Massachusetts", add
label values stabbr label_stabbr
label define label_stabbr MI "Michigan", add
label values stabbr label_stabbr
label define label_stabbr MN "Minnesota", add
label values stabbr label_stabbr
label define label_stabbr MS "Mississippi", add
label values stabbr label_stabbr
label define label_stabbr MO "Missouri", add
label values stabbr label_stabbr
label define label_stabbr MT "Montana", add
label values stabbr label_stabbr
label define label_stabbr NE "Nebraska", add
label values stabbr label_stabbr
label define label_stabbr NV "Nevada", add
label values stabbr label_stabbr
label define label_stabbr NH "New Hampshire", add
label values stabbr label_stabbr
label define label_stabbr NJ "New Jersey", add
label values stabbr label_stabbr
label define label_stabbr NM "New Mexico", add
label values stabbr label_stabbr
label define label_stabbr NY "New York", add
label values stabbr label_stabbr
label define label_stabbr NC "North Carolina", add
label values stabbr label_stabbr
label define label_stabbr ND "North Dakota", add
label values stabbr label_stabbr
label define label_stabbr OH "Ohio", add
label values stabbr label_stabbr
label define label_stabbr OK "Oklahoma", add
label values stabbr label_stabbr
label define label_stabbr OR "Oregon", add
label values stabbr label_stabbr
label define label_stabbr PA "Pennsylvania", add
label values stabbr label_stabbr
label define label_stabbr RI "Rhode Island", add
label values stabbr label_stabbr
label define label_stabbr SC "South Carolina", add
label values stabbr label_stabbr
label define label_stabbr SD "South Dakota", add
label values stabbr label_stabbr
label define label_stabbr TN "Tennessee", add
label values stabbr label_stabbr
label define label_stabbr TX "Texas", add
label values stabbr label_stabbr
label define label_stabbr UT "Utah", add
label values stabbr label_stabbr
label define label_stabbr VT "Vermont", add
label values stabbr label_stabbr
label define label_stabbr VA "Virginia", add
label values stabbr label_stabbr
label define label_stabbr WA "Washington", add
label values stabbr label_stabbr
label define label_stabbr WV "West Virginia", add
label values stabbr label_stabbr
label define label_stabbr WI "Wisconsin", add
label values stabbr label_stabbr
label define label_stabbr WY "Wyoming", add
label values stabbr label_stabbr
label define label_stabbr AS "American Samoa", add
label values stabbr label_stabbr
label define label_stabbr FM "Federated States of Micronesia", add
label values stabbr label_stabbr
label define label_stabbr GU "Guam", add
label values stabbr label_stabbr
label define label_stabbr MH "Marshall Islands", add
label values stabbr label_stabbr
label define label_stabbr MP "Northern Marianas", add
label values stabbr label_stabbr
label define label_stabbr PW "Palau", add
label values stabbr label_stabbr
label define label_stabbr PR "Puerto Rico", add
label values stabbr label_stabbr
label define label_stabbr VI "Virgin Islands", add
label values stabbr label_stabbr
 */
label define label_control 1 "Public"
label values control label_control
label define label_control 2 "Private not-for-profit", add
label values control label_control
label define label_control 3 "Private for-profit", add
label values control label_control
label define label_control -3 "{Not available}", add
label values control label_control
label define label_deggrant 1 "Degree-granting"
label values deggrant label_deggrant
label define label_deggrant 2 "Nondegree-granting, primarily postsecondary", add
label values deggrant label_deggrant
label define label_deggrant -3 "{Not available}", add
label values deggrant label_deggrant
label define label_hbcu 1 "Yes"
label values hbcu label_hbcu
label define label_hbcu 2 "No", add
label values hbcu label_hbcu
label define label_locale 11 "City: Large"
label values locale label_locale
label define label_locale 12 "City: Midsize", add
label values locale label_locale
label define label_locale 13 "City: Small", add
label values locale label_locale
label define label_locale 21 "Suburb: Large", add
label values locale label_locale
label define label_locale 22 "Suburb: Midsize", add
label values locale label_locale
label define label_locale 23 "Suburb: Small", add
label values locale label_locale
label define label_locale 31 "Town: Fringe", add
label values locale label_locale
label define label_locale 32 "Town: Distant", add
label values locale label_locale
label define label_locale 33 "Town: Remote", add
label values locale label_locale
label define label_locale 41 "Rural: Fringe", add
label values locale label_locale
label define label_locale 42 "Rural: Distant", add
label values locale label_locale
label define label_locale 43 "Rural: Remote", add
label values locale label_locale
label define label_locale -3 "{Not available}", add
label values locale label_locale
label define label_c15basic 1 "Associate''s Colleges: High Transfer-High Traditional"
label values c15basic label_c15basic
label define label_c15basic 2 "Associate''s Colleges: High Transfer-Mixed Traditional/Nontraditional", add
label values c15basic label_c15basic
label define label_c15basic 3 "Associate''s Colleges: High Transfer-High Nontraditional", add
label values c15basic label_c15basic
label define label_c15basic 4 "Associate''s Colleges: Mixed Transfer/Career & Technical-High Traditional", add
label values c15basic label_c15basic
label define label_c15basic 5 "Associate''s Colleges: Mixed Transfer/Career & Technical-Mixed Traditional/Nontraditional", add
label values c15basic label_c15basic
label define label_c15basic 6 "Associate''s Colleges: Mixed Transfer/Career & Technical-High Nontraditional", add
label values c15basic label_c15basic
label define label_c15basic 7 "Associate''s Colleges: High Career & Technical-High Traditional", add
label values c15basic label_c15basic
label define label_c15basic 8 "Associate''s Colleges: High Career & Technical-Mixed Traditional/Nontraditional", add
label values c15basic label_c15basic
label define label_c15basic 9 "Associate''s Colleges: High Career & Technical-High Nontraditional", add
label values c15basic label_c15basic
label define label_c15basic 10 "Special Focus Two-Year: Health Professions", add
label values c15basic label_c15basic
label define label_c15basic 11 "Special Focus Two-Year: Technical Professions", add
label values c15basic label_c15basic
label define label_c15basic 12 "Special Focus Two-Year: Arts & Design", add
label values c15basic label_c15basic
label define label_c15basic 13 "Special Focus Two-Year: Other Fields", add
label values c15basic label_c15basic
label define label_c15basic 14 "Baccalaureate/Associate''s Colleges: Associate''s Dominant", add
label values c15basic label_c15basic
label define label_c15basic 15 "Doctoral Universities: Highest Research Activity", add
label values c15basic label_c15basic
label define label_c15basic 16 "Doctoral Universities: Higher Research Activity", add
label values c15basic label_c15basic
label define label_c15basic 17 "Doctoral Universities: Moderate Research Activity", add
label values c15basic label_c15basic
label define label_c15basic 18 "Master''s Colleges & Universities: Larger Programs", add
label values c15basic label_c15basic
label define label_c15basic 19 "Master''s Colleges & Universities: Medium Programs", add
label values c15basic label_c15basic
label define label_c15basic 20 "Master''s Colleges & Universities: Small Programs", add
label values c15basic label_c15basic
label define label_c15basic 21 "Baccalaureate Colleges: Arts & Sciences Focus", add
label values c15basic label_c15basic
label define label_c15basic 22 "Baccalaureate Colleges: Diverse Fields", add
label values c15basic label_c15basic
label define label_c15basic 23 "Baccalaureate/Associate''s Colleges: Mixed Baccalaureate/Associate''s", add
label values c15basic label_c15basic
label define label_c15basic 24 "Special Focus Four-Year: Faith-Related Institutions", add
label values c15basic label_c15basic
label define label_c15basic 25 "Special Focus Four-Year: Medical Schools & Centers", add
label values c15basic label_c15basic
label define label_c15basic 26 "Special Focus Four-Year: Other Health Professions Schools", add
label values c15basic label_c15basic
label define label_c15basic 27 "Special Focus Four-Year: Engineering Schools", add
label values c15basic label_c15basic
label define label_c15basic 28 "Special Focus Four-Year: Other Technology-Related Schools", add
label values c15basic label_c15basic
label define label_c15basic 29 "Special Focus Four-Year: Business & Management Schools", add
label values c15basic label_c15basic
label define label_c15basic 30 "Special Focus Four-Year: Arts, Music & Design Schools", add
label values c15basic label_c15basic
label define label_c15basic 31 "Special Focus Four-Year: Law Schools", add
label values c15basic label_c15basic
label define label_c15basic 32 "Special Focus Four-Year: Other Special Focus Institutions", add
label values c15basic label_c15basic
label define label_c15basic 33 "Tribal Colleges", add
label values c15basic label_c15basic
label define label_c15basic 0 "(Not classified)", add
label values c15basic label_c15basic
label define label_c15basic -2 "Not applicable, not in Carnegie universe (not accredited or nondegree-granting)", add
label values c15basic label_c15basic

tab instsize
tab stabbr
tab control
tab deggrant
tab hbcu
tab locale
tab c15basic



save cdsfile_all_STATA_RV_852024-768.dta