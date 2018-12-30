/*******************************************************************            
* Creation Date: 07/25/2018                                                     
*   KS_SID_2016_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CORE FILE INTO SAS                                        
*******************************************************************/            
                                                                                
                                                                                
***************************************************************;                
* ----------------------------------------------------------- *;                
* |  NOTICE: Use of HCUP data constitutes acceptance of the | *;                
* |  terms and conditions of the HCUP Data Use Agreement.   | *;                
* ----------------------------------------------------------- *;                
***************************************************************;                
                                                                                
                                                                                
***********************************************;                                
*  Create SAS informats for missing values     ;                                
***********************************************;                                
PROC FORMAT;                                                                    
  INVALUE N2PF                                                                  
    '-9' = .                                                                    
    '-8' = .A                                                                   
    '-6' = .C                                                                   
    '-5' = .N                                                                   
    OTHER = (|2.|)                                                              
  ;                                                                             
  INVALUE N3PF                                                                  
    '-99' = .                                                                   
    '-88' = .A                                                                  
    '-66' = .C                                                                  
    OTHER = (|3.|)                                                              
  ;                                                                             
  INVALUE N4PF                                                                  
    '-999' = .                                                                  
    '-888' = .A                                                                 
    '-666' = .C                                                                 
    OTHER = (|4.|)                                                              
  ;                                                                             
  INVALUE N4P1F                                                                 
    '-9.9' = .                                                                  
    '-8.8' = .A                                                                 
    '-6.6' = .C                                                                 
    OTHER = (|4.1|)                                                             
  ;                                                                             
  INVALUE N5PF                                                                  
    '-9999' = .                                                                 
    '-8888' = .A                                                                
    '-6666' = .C                                                                
    OTHER = (|5.|)                                                              
  ;                                                                             
  INVALUE N5P2F                                                                 
    '-9.99' = .                                                                 
    '-8.88' = .A                                                                
    '-6.66' = .C                                                                
    OTHER = (|5.2|)                                                             
  ;                                                                             
  INVALUE N6PF                                                                  
    '-99999' = .                                                                
    '-88888' = .A                                                               
    '-66666' = .C                                                               
    OTHER = (|6.|)                                                              
  ;                                                                             
  INVALUE N6P2F                                                                 
    '-99.99' = .                                                                
    '-88.88' = .A                                                               
    '-66.66' = .C                                                               
    OTHER = (|6.2|)                                                             
  ;                                                                             
  INVALUE N7P2F                                                                 
    '-999.99' = .                                                               
    '-888.88' = .A                                                              
    '-666.66' = .C                                                              
    OTHER = (|7.2|)                                                             
  ;                                                                             
  INVALUE N7P4F                                                                 
    '-9.9999' = .                                                               
    '-8.8888' = .A                                                              
    '-6.6666' = .C                                                              
    OTHER = (|7.4|)                                                             
  ;                                                                             
  INVALUE N8PF                                                                  
    '-9999999' = .                                                              
    '-8888888' = .A                                                             
    '-6666666' = .C                                                             
    OTHER = (|8.|)                                                              
  ;                                                                             
  INVALUE N8P2F                                                                 
    '-9999.99' = .                                                              
    '-8888.88' = .A                                                             
    '-6666.66' = .C                                                             
    OTHER = (|8.2|)                                                             
  ;                                                                             
  INVALUE N9PF                                                                  
    '-99999999' = .                                                             
    '-88888888' = .A                                                            
    '-66666666' = .C                                                            
    OTHER = (|9.|)                                                              
  ;                                                                             
  INVALUE N9P2F                                                                 
    '-99999.99' = .                                                             
    '-88888.88' = .A                                                            
    '-66666.66' = .C                                                            
    OTHER = (|9.2|)                                                             
  ;                                                                             
  INVALUE N10PF                                                                 
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|10.|)                                                             
  ;                                                                             
  INVALUE N10P4F                                                                
    '-9999.9999' = .                                                            
    '-8888.8888' = .A                                                           
    '-6666.6666' = .C                                                           
    OTHER = (|10.4|)                                                            
  ;                                                                             
  INVALUE N10P5F                                                                
    '-999.99999' = .                                                            
    '-888.88888' = .A                                                           
    '-666.66666' = .C                                                           
    OTHER = (|10.5|)                                                            
  ;                                                                             
  INVALUE DATE10F                                                               
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|MMDDYY10.|)                                                       
  ;                                                                             
  INVALUE N11PF                                                                 
    '-9999999999' = .                                                           
    '-8888888888' = .A                                                          
    '-6666666666' = .C                                                          
    OTHER = (|11.|)                                                             
  ;                                                                             
  INVALUE N11P2F                                                                
    '-9999999.99' = .                                                           
    '-8888888.88' = .A                                                          
    '-6666666.66' = .C                                                          
    OTHER = (|11.2|)                                                            
  ;                                                                             
  INVALUE N12P2F                                                                
    '-99999999.99' = .                                                          
    '-88888888.88' = .A                                                         
    '-66666666.66' = .C                                                         
    OTHER = (|12.2|)                                                            
  ;                                                                             
  INVALUE N12P5F                                                                
    '-99999.99999' = .                                                          
    '-88888.88888' = .A                                                         
    '-66666.66666' = .C                                                         
    OTHER = (|12.5|)                                                            
  ;                                                                             
  INVALUE N13PF                                                                 
    '-999999999999' = .                                                         
    '-888888888888' = .A                                                        
    '-666666666666' = .C                                                        
    OTHER = (|13.|)                                                             
  ;                                                                             
  INVALUE N15P2F                                                                
    '-99999999999.99' = .                                                       
    '-88888888888.88' = .A                                                      
    '-66666666666.66' = .C                                                      
    OTHER = (|15.2|)                                                            
  ;                                                                             
  RUN;                                                                          
                                                                                
                                                                                
*******************************;                                                
*  Data Step                  *;                                                
*******************************;                                                
DATA KS_SIDC_2016_CORE;                                                         
INFILE 'KS_SID_2016_CORE.ASC' FIRSTOBS=3 LRECL = 1077;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Admission Hour"                                                        
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="Type of bill, UB-04 coding"                                            
                                                                                
  DHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Discharge Hour"                                                        
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DXPOA1                     LENGTH=$1                                          
  LABEL="Diagnosis 1, present on admission indicator"                           
                                                                                
  DXPOA2                     LENGTH=$1                                          
  LABEL="Diagnosis 2, present on admission indicator"                           
                                                                                
  DXPOA3                     LENGTH=$1                                          
  LABEL="Diagnosis 3, present on admission indicator"                           
                                                                                
  DXPOA4                     LENGTH=$1                                          
  LABEL="Diagnosis 4, present on admission indicator"                           
                                                                                
  DXPOA5                     LENGTH=$1                                          
  LABEL="Diagnosis 5, present on admission indicator"                           
                                                                                
  DXPOA6                     LENGTH=$1                                          
  LABEL="Diagnosis 6, present on admission indicator"                           
                                                                                
  DXPOA7                     LENGTH=$1                                          
  LABEL="Diagnosis 7, present on admission indicator"                           
                                                                                
  DXPOA8                     LENGTH=$1                                          
  LABEL="Diagnosis 8, present on admission indicator"                           
                                                                                
  DXPOA9                     LENGTH=$1                                          
  LABEL="Diagnosis 9, present on admission indicator"                           
                                                                                
  DXPOA10                    LENGTH=$1                                          
  LABEL="Diagnosis 10, present on admission indicator"                          
                                                                                
  DXPOA11                    LENGTH=$1                                          
  LABEL="Diagnosis 11, present on admission indicator"                          
                                                                                
  DXPOA12                    LENGTH=$1                                          
  LABEL="Diagnosis 12, present on admission indicator"                          
                                                                                
  DXPOA13                    LENGTH=$1                                          
  LABEL="Diagnosis 13, present on admission indicator"                          
                                                                                
  DXPOA14                    LENGTH=$1                                          
  LABEL="Diagnosis 14, present on admission indicator"                          
                                                                                
  DXPOA15                    LENGTH=$1                                          
  LABEL="Diagnosis 15, present on admission indicator"                          
                                                                                
  DXPOA16                    LENGTH=$1                                          
  LABEL="Diagnosis 16, present on admission indicator"                          
                                                                                
  DXPOA17                    LENGTH=$1                                          
  LABEL="Diagnosis 17, present on admission indicator"                          
                                                                                
  DXPOA18                    LENGTH=$1                                          
  LABEL="Diagnosis 18, present on admission indicator"                          
                                                                                
  DXPOA19                    LENGTH=$1                                          
  LABEL="Diagnosis 19, present on admission indicator"                          
                                                                                
  DXPOA20                    LENGTH=$1                                          
  LABEL="Diagnosis 20, present on admission indicator"                          
                                                                                
  DXPOA21                    LENGTH=$1                                          
  LABEL="Diagnosis 21, present on admission indicator"                          
                                                                                
  DXPOA22                    LENGTH=$1                                          
  LABEL="Diagnosis 22, present on admission indicator"                          
                                                                                
  DXPOA23                    LENGTH=$1                                          
  LABEL="Diagnosis 23, present on admission indicator"                          
                                                                                
  DXPOA24                    LENGTH=$1                                          
  LABEL="Diagnosis 24, present on admission indicator"                          
                                                                                
  DXPOA25                    LENGTH=$1                                          
  LABEL="Diagnosis 25, present on admission indicator"                          
                                                                                
  DXPOA26                    LENGTH=$1                                          
  LABEL="Diagnosis 26, present on admission indicator"                          
                                                                                
  DXPOA27                    LENGTH=$1                                          
  LABEL="Diagnosis 27, present on admission indicator"                          
                                                                                
  DXPOA28                    LENGTH=$1                                          
  LABEL="Diagnosis 28, present on admission indicator"                          
                                                                                
  DXPOA29                    LENGTH=$1                                          
  LABEL="Diagnosis 29, present on admission indicator"                          
                                                                                
  DXPOA30                    LENGTH=$1                                          
  LABEL="Diagnosis 30, present on admission indicator"                          
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="External cause 1, present on admission indicator"                      
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="External cause 2, present on admission indicator"                      
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="External cause 3, present on admission indicator"                      
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="External cause 4, present on admission indicator"                      
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="External cause 5, present on admission indicator"                      
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="External cause 6, present on admission indicator"                      
                                                                                
  E_POA7                     LENGTH=$1                                          
  LABEL="External cause 7, present on admission indicator"                      
                                                                                
  E_POA8                     LENGTH=$1                                          
  LABEL="External cause 8, present on admission indicator"                      
                                                                                
  E_POA9                     LENGTH=$1                                          
  LABEL="External cause 9, present on admission indicator"                      
                                                                                
  E_POA10                    LENGTH=$1                                          
  LABEL="External cause 10, present on admission indicator"                     
                                                                                
  E_POA11                    LENGTH=$1                                          
  LABEL="External cause 11, present on admission indicator"                     
                                                                                
  E_POA12                    LENGTH=$1                                          
  LABEL="External cause 12, present on admission indicator"                     
                                                                                
  E_POA13                    LENGTH=$1                                          
  LABEL="External cause 13, present on admission indicator"                     
                                                                                
  E_POA14                    LENGTH=$1                                          
  LABEL="External cause 14, present on admission indicator"                     
                                                                                
  E_POA15                    LENGTH=$1                                          
  LABEL="External cause 15, present on admission indicator"                     
                                                                                
  E_POA16                    LENGTH=$1                                          
  LABEL="External cause 16, present on admission indicator"                     
                                                                                
  E_POA17                    LENGTH=$1                                          
  LABEL="External cause 17, present on admission indicator"                     
                                                                                
  E_POA18                    LENGTH=$1                                          
  LABEL="External cause 18, present on admission indicator"                     
                                                                                
  E_POA19                    LENGTH=$1                                          
  LABEL="External cause 19, present on admission indicator"                     
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HospitalUnit               LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Patient was discharged from a special unit within an acute care hospital (repor
ted by source)"                                                                 
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  I10_DX1                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 1"                                                 
                                                                                
  I10_DX2                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 2"                                                 
                                                                                
  I10_DX3                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 3"                                                 
                                                                                
  I10_DX4                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 4"                                                 
                                                                                
  I10_DX5                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 5"                                                 
                                                                                
  I10_DX6                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 6"                                                 
                                                                                
  I10_DX7                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 7"                                                 
                                                                                
  I10_DX8                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 8"                                                 
                                                                                
  I10_DX9                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 9"                                                 
                                                                                
  I10_DX10                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 10"                                                
                                                                                
  I10_DX11                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 11"                                                
                                                                                
  I10_DX12                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 12"                                                
                                                                                
  I10_DX13                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 13"                                                
                                                                                
  I10_DX14                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 14"                                                
                                                                                
  I10_DX15                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 15"                                                
                                                                                
  I10_DX16                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 16"                                                
                                                                                
  I10_DX17                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 17"                                                
                                                                                
  I10_DX18                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 18"                                                
                                                                                
  I10_DX19                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 19"                                                
                                                                                
  I10_DX20                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 20"                                                
                                                                                
  I10_DX21                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 21"                                                
                                                                                
  I10_DX22                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 22"                                                
                                                                                
  I10_DX23                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 23"                                                
                                                                                
  I10_DX24                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 24"                                                
                                                                                
  I10_DX25                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 25"                                                
                                                                                
  I10_DX26                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 26"                                                
                                                                                
  I10_DX27                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 27"                                                
                                                                                
  I10_DX28                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 28"                                                
                                                                                
  I10_DX29                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 29"                                                
                                                                                
  I10_DX30                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 30"                                                
                                                                                
  I10_ECAUSE1                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 1"                                            
                                                                                
  I10_ECAUSE2                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 2"                                            
                                                                                
  I10_ECAUSE3                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 3"                                            
                                                                                
  I10_ECAUSE4                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 4"                                            
                                                                                
  I10_ECAUSE5                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 5"                                            
                                                                                
  I10_ECAUSE6                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 6"                                            
                                                                                
  I10_ECAUSE7                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 7"                                            
                                                                                
  I10_ECAUSE8                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 8"                                            
                                                                                
  I10_ECAUSE9                LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 9"                                            
                                                                                
  I10_ECAUSE10               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 10"                                           
                                                                                
  I10_ECAUSE11               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 11"                                           
                                                                                
  I10_ECAUSE12               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 12"                                           
                                                                                
  I10_ECAUSE13               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 13"                                           
                                                                                
  I10_ECAUSE14               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 14"                                           
                                                                                
  I10_ECAUSE15               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 15"                                           
                                                                                
  I10_ECAUSE16               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 16"                                           
                                                                                
  I10_ECAUSE17               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 17"                                           
                                                                                
  I10_ECAUSE18               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 18"                                           
                                                                                
  I10_ECAUSE19               LENGTH=$7                                          
  LABEL="ICD-10-CM External cause 19"                                           
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NECAUSE                LENGTH=3                                           
  LABEL="ICD-10-CM Number of External cause codes on this record"               
                                                                                
  I10_NPR                    LENGTH=3                                           
  LABEL="ICD-10-PCS Number of procedures on this record"                        
                                                                                
  I10_PR1                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 1"                                                
                                                                                
  I10_PR2                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 2"                                                
                                                                                
  I10_PR3                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 3"                                                
                                                                                
  I10_PR4                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 4"                                                
                                                                                
  I10_PR5                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 5"                                                
                                                                                
  I10_PR6                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 6"                                                
                                                                                
  I10_PR7                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 7"                                                
                                                                                
  I10_PR8                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 8"                                                
                                                                                
  I10_PR9                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 9"                                                
                                                                                
  I10_PR10                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 10"                                               
                                                                                
  I10_PR11                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 11"                                               
                                                                                
  I10_PR12                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 12"                                               
                                                                                
  I10_PR13                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 13"                                               
                                                                                
  I10_PR14                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 14"                                               
                                                                                
  I10_PR15                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 15"                                               
                                                                                
  I10_PR16                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 16"                                               
                                                                                
  I10_PR17                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 17"                                               
                                                                                
  I10_PR18                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 18"                                               
                                                                                
  I10_PR19                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 19"                                               
                                                                                
  I10_PR20                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 20"                                               
                                                                                
  I10_PR21                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 21"                                               
                                                                                
  I10_PR22                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 22"                                               
                                                                                
  I10_PR23                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 23"                                               
                                                                                
  I10_PR24                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 24"                                               
                                                                                
  I10_PR25                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 25"                                               
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$3                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$3                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$3                                          
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
  PL_UIC                     LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  POA_Disch_Edit1            LENGTH=3                                           
  LABEL="Discharge has POA missing on all nonexempt diagnoses"                  
                                                                                
  POA_Disch_Edit2            LENGTH=3                                           
  LABEL="Discharge has POA missing on all nonexempt secondary diagnoses"        
                                                                                
  POA_Hosp_Edit1             LENGTH=3                                           
  LABEL="Hospital reported POA as Y on all diagnoses on all discharges"         
                                                                                
  POA_Hosp_Edit2             LENGTH=3                                           
  LABEL="Hospital reported POA as missing on all non-Medicare discharges"       
                                                                                
  POA_Hosp_Edit3             LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Hospital reported POA as missing on all nonexempt diagnoses for 15% or more of 
discharges"                                                                     
                                                                                
  POA_Hosp_Edit3_Value       LENGTH=8                                           
  LABEL=                                                                        
  "Percentage of discharges with all nonexempt diagnoses missing POA indicators"
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR1"                              
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR2"                              
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR3"                              
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR4"                              
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR5"                              
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR6"                              
                                                                                
  PRDAY7                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR7"                              
                                                                                
  PRDAY8                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR8"                              
                                                                                
  PRDAY9                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR9"                              
                                                                                
  PRDAY10                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR10"                             
                                                                                
  PRDAY11                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR11"                             
                                                                                
  PRDAY12                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR12"                             
                                                                                
  PRDAY13                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR13"                             
                                                                                
  PRDAY14                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR14"                             
                                                                                
  PRDAY15                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR15"                             
                                                                                
  PRDAY16                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR16"                             
                                                                                
  PRDAY17                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR17"                             
                                                                                
  PRDAY18                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR18"                             
                                                                                
  PRDAY19                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR19"                             
                                                                                
  PRDAY20                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR20"                             
                                                                                
  PRDAY21                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR21"                             
                                                                                
  PRDAY22                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR22"                             
                                                                                
  PRDAY23                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR23"                             
                                                                                
  PRDAY24                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR24"                             
                                                                                
  PRDAY25                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR25"                             
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$1                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  TRAN_IN                    LENGTH=3                                           
  LABEL="Transfer in indicator"                                                 
                                                                                
  TRAN_OUT                   LENGTH=3                                           
  LABEL="Transfer out indicator"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
  BMONTH                     LENGTH=3                                           
  LABEL="Birth month"                                                           
                                                                                
  BYEAR                      LENGTH=3                                           
  LABEL="Birth year"                                                            
                                                                                
  PRMONTH1                   LENGTH=3                                           
  LABEL="Month of procedure 1"                                                  
                                                                                
  PRMONTH2                   LENGTH=3                                           
  LABEL="Month of procedure 2"                                                  
                                                                                
  PRMONTH3                   LENGTH=3                                           
  LABEL="Month of procedure 3"                                                  
                                                                                
  PRMONTH4                   LENGTH=3                                           
  LABEL="Month of procedure 4"                                                  
                                                                                
  PRMONTH5                   LENGTH=3                                           
  LABEL="Month of procedure 5"                                                  
                                                                                
  PRMONTH6                   LENGTH=3                                           
  LABEL="Month of procedure 6"                                                  
                                                                                
  PRMONTH7                   LENGTH=3                                           
  LABEL="Month of procedure 7"                                                  
                                                                                
  PRMONTH8                   LENGTH=3                                           
  LABEL="Month of procedure 8"                                                  
                                                                                
  PRMONTH9                   LENGTH=3                                           
  LABEL="Month of procedure 9"                                                  
                                                                                
  PRMONTH10                  LENGTH=3                                           
  LABEL="Month of procedure 10"                                                 
                                                                                
  PRMONTH11                  LENGTH=3                                           
  LABEL="Month of procedure 11"                                                 
                                                                                
  PRMONTH12                  LENGTH=3                                           
  LABEL="Month of procedure 12"                                                 
                                                                                
  PRMONTH13                  LENGTH=3                                           
  LABEL="Month of procedure 13"                                                 
                                                                                
  PRMONTH14                  LENGTH=3                                           
  LABEL="Month of procedure 14"                                                 
                                                                                
  PRMONTH15                  LENGTH=3                                           
  LABEL="Month of procedure 15"                                                 
                                                                                
  PRMONTH16                  LENGTH=3                                           
  LABEL="Month of procedure 16"                                                 
                                                                                
  PRMONTH17                  LENGTH=3                                           
  LABEL="Month of procedure 17"                                                 
                                                                                
  PRMONTH18                  LENGTH=3                                           
  LABEL="Month of procedure 18"                                                 
                                                                                
  PRMONTH19                  LENGTH=3                                           
  LABEL="Month of procedure 19"                                                 
                                                                                
  PRMONTH20                  LENGTH=3                                           
  LABEL="Month of procedure 20"                                                 
                                                                                
  PRMONTH21                  LENGTH=3                                           
  LABEL="Month of procedure 21"                                                 
                                                                                
  PRMONTH22                  LENGTH=3                                           
  LABEL="Month of procedure 22"                                                 
                                                                                
  PRMONTH23                  LENGTH=3                                           
  LABEL="Month of procedure 23"                                                 
                                                                                
  PRMONTH24                  LENGTH=3                                           
  LABEL="Month of procedure 24"                                                 
                                                                                
  PRMONTH25                  LENGTH=3                                           
  LABEL="Month of procedure 25"                                                 
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
                                                                                
  PRYEAR2                    LENGTH=3                                           
  LABEL="Year of procedure 2"                                                   
                                                                                
  PRYEAR3                    LENGTH=3                                           
  LABEL="Year of procedure 3"                                                   
                                                                                
  PRYEAR4                    LENGTH=3                                           
  LABEL="Year of procedure 4"                                                   
                                                                                
  PRYEAR5                    LENGTH=3                                           
  LABEL="Year of procedure 5"                                                   
                                                                                
  PRYEAR6                    LENGTH=3                                           
  LABEL="Year of procedure 6"                                                   
                                                                                
  PRYEAR7                    LENGTH=3                                           
  LABEL="Year of procedure 7"                                                   
                                                                                
  PRYEAR8                    LENGTH=3                                           
  LABEL="Year of procedure 8"                                                   
                                                                                
  PRYEAR9                    LENGTH=3                                           
  LABEL="Year of procedure 9"                                                   
                                                                                
  PRYEAR10                   LENGTH=3                                           
  LABEL="Year of procedure 10"                                                  
                                                                                
  PRYEAR11                   LENGTH=3                                           
  LABEL="Year of procedure 11"                                                  
                                                                                
  PRYEAR12                   LENGTH=3                                           
  LABEL="Year of procedure 12"                                                  
                                                                                
  PRYEAR13                   LENGTH=3                                           
  LABEL="Year of procedure 13"                                                  
                                                                                
  PRYEAR14                   LENGTH=3                                           
  LABEL="Year of procedure 14"                                                  
                                                                                
  PRYEAR15                   LENGTH=3                                           
  LABEL="Year of procedure 15"                                                  
                                                                                
  PRYEAR16                   LENGTH=3                                           
  LABEL="Year of procedure 16"                                                  
                                                                                
  PRYEAR17                   LENGTH=3                                           
  LABEL="Year of procedure 17"                                                  
                                                                                
  PRYEAR18                   LENGTH=3                                           
  LABEL="Year of procedure 18"                                                  
                                                                                
  PRYEAR19                   LENGTH=3                                           
  LABEL="Year of procedure 19"                                                  
                                                                                
  PRYEAR20                   LENGTH=3                                           
  LABEL="Year of procedure 20"                                                  
                                                                                
  PRYEAR21                   LENGTH=3                                           
  LABEL="Year of procedure 21"                                                  
                                                                                
  PRYEAR22                   LENGTH=3                                           
  LABEL="Year of procedure 22"                                                  
                                                                                
  PRYEAR23                   LENGTH=3                                           
  LABEL="Year of procedure 23"                                                  
                                                                                
  PRYEAR24                   LENGTH=3                                           
  LABEL="Year of procedure 24"                                                  
                                                                                
  PRYEAR25                   LENGTH=3                                           
  LABEL="Year of procedure 25"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AHOUR                         N4PF.                               
      @14     AMONTH                        N2PF.                               
      @16     ATYPE                         N2PF.                               
      @18     AWEEKEND                      N2PF.                               
      @20     BILLTYPE                      $CHAR4.                             
      @24     DHOUR                         N4PF.                               
      @28     DIED                          N2PF.                               
      @30     DISP_X                        $CHAR2.                             
      @32     DISPUB04                      N2PF.                               
      @34     DISPUNIFORM                   N2PF.                               
      @36     DMONTH                        N2PF.                               
      @38     DQTR                          N2PF.                               
      @40     DRG                           N3PF.                               
      @43     DRG_NoPOA                     N3PF.                               
      @46     DRGVER                        N2PF.                               
      @48     DXPOA1                        $CHAR1.                             
      @49     DXPOA2                        $CHAR1.                             
      @50     DXPOA3                        $CHAR1.                             
      @51     DXPOA4                        $CHAR1.                             
      @52     DXPOA5                        $CHAR1.                             
      @53     DXPOA6                        $CHAR1.                             
      @54     DXPOA7                        $CHAR1.                             
      @55     DXPOA8                        $CHAR1.                             
      @56     DXPOA9                        $CHAR1.                             
      @57     DXPOA10                       $CHAR1.                             
      @58     DXPOA11                       $CHAR1.                             
      @59     DXPOA12                       $CHAR1.                             
      @60     DXPOA13                       $CHAR1.                             
      @61     DXPOA14                       $CHAR1.                             
      @62     DXPOA15                       $CHAR1.                             
      @63     DXPOA16                       $CHAR1.                             
      @64     DXPOA17                       $CHAR1.                             
      @65     DXPOA18                       $CHAR1.                             
      @66     DXPOA19                       $CHAR1.                             
      @67     DXPOA20                       $CHAR1.                             
      @68     DXPOA21                       $CHAR1.                             
      @69     DXPOA22                       $CHAR1.                             
      @70     DXPOA23                       $CHAR1.                             
      @71     DXPOA24                       $CHAR1.                             
      @72     DXPOA25                       $CHAR1.                             
      @73     DXPOA26                       $CHAR1.                             
      @74     DXPOA27                       $CHAR1.                             
      @75     DXPOA28                       $CHAR1.                             
      @76     DXPOA29                       $CHAR1.                             
      @77     DXPOA30                       $CHAR1.                             
      @78     DXVER                         N3PF.                               
      @81     E_POA1                        $CHAR1.                             
      @82     E_POA2                        $CHAR1.                             
      @83     E_POA3                        $CHAR1.                             
      @84     E_POA4                        $CHAR1.                             
      @85     E_POA5                        $CHAR1.                             
      @86     E_POA6                        $CHAR1.                             
      @87     E_POA7                        $CHAR1.                             
      @88     E_POA8                        $CHAR1.                             
      @89     E_POA9                        $CHAR1.                             
      @90     E_POA10                       $CHAR1.                             
      @91     E_POA11                       $CHAR1.                             
      @92     E_POA12                       $CHAR1.                             
      @93     E_POA13                       $CHAR1.                             
      @94     E_POA14                       $CHAR1.                             
      @95     E_POA15                       $CHAR1.                             
      @96     E_POA16                       $CHAR1.                             
      @97     E_POA17                       $CHAR1.                             
      @98     E_POA18                       $CHAR1.                             
      @99     E_POA19                       $CHAR1.                             
      @100    FEMALE                        N2PF.                               
      @102    HCUP_ED                       N2PF.                               
      @104    HCUP_OS                       N2PF.                               
      @106    HISPANIC                      N2PF.                               
      @108    HISPANIC_X                    $CHAR1.                             
      @109    HospitalUnit                  N2PF.                               
      @111    HOSPST                        $CHAR2.                             
      @113    I10_DX1                       $CHAR7.                             
      @120    I10_DX2                       $CHAR7.                             
      @127    I10_DX3                       $CHAR7.                             
      @134    I10_DX4                       $CHAR7.                             
      @141    I10_DX5                       $CHAR7.                             
      @148    I10_DX6                       $CHAR7.                             
      @155    I10_DX7                       $CHAR7.                             
      @162    I10_DX8                       $CHAR7.                             
      @169    I10_DX9                       $CHAR7.                             
      @176    I10_DX10                      $CHAR7.                             
      @183    I10_DX11                      $CHAR7.                             
      @190    I10_DX12                      $CHAR7.                             
      @197    I10_DX13                      $CHAR7.                             
      @204    I10_DX14                      $CHAR7.                             
      @211    I10_DX15                      $CHAR7.                             
      @218    I10_DX16                      $CHAR7.                             
      @225    I10_DX17                      $CHAR7.                             
      @232    I10_DX18                      $CHAR7.                             
      @239    I10_DX19                      $CHAR7.                             
      @246    I10_DX20                      $CHAR7.                             
      @253    I10_DX21                      $CHAR7.                             
      @260    I10_DX22                      $CHAR7.                             
      @267    I10_DX23                      $CHAR7.                             
      @274    I10_DX24                      $CHAR7.                             
      @281    I10_DX25                      $CHAR7.                             
      @288    I10_DX26                      $CHAR7.                             
      @295    I10_DX27                      $CHAR7.                             
      @302    I10_DX28                      $CHAR7.                             
      @309    I10_DX29                      $CHAR7.                             
      @316    I10_DX30                      $CHAR7.                             
      @323    I10_ECAUSE1                   $CHAR7.                             
      @330    I10_ECAUSE2                   $CHAR7.                             
      @337    I10_ECAUSE3                   $CHAR7.                             
      @344    I10_ECAUSE4                   $CHAR7.                             
      @351    I10_ECAUSE5                   $CHAR7.                             
      @358    I10_ECAUSE6                   $CHAR7.                             
      @365    I10_ECAUSE7                   $CHAR7.                             
      @372    I10_ECAUSE8                   $CHAR7.                             
      @379    I10_ECAUSE9                   $CHAR7.                             
      @386    I10_ECAUSE10                  $CHAR7.                             
      @393    I10_ECAUSE11                  $CHAR7.                             
      @400    I10_ECAUSE12                  $CHAR7.                             
      @407    I10_ECAUSE13                  $CHAR7.                             
      @414    I10_ECAUSE14                  $CHAR7.                             
      @421    I10_ECAUSE15                  $CHAR7.                             
      @428    I10_ECAUSE16                  $CHAR7.                             
      @435    I10_ECAUSE17                  $CHAR7.                             
      @442    I10_ECAUSE18                  $CHAR7.                             
      @449    I10_ECAUSE19                  $CHAR7.                             
      @456    I10_NDX                       N3PF.                               
      @459    I10_NECAUSE                   N2PF.                               
      @461    I10_NPR                       N3PF.                               
      @464    I10_PR1                       $CHAR7.                             
      @471    I10_PR2                       $CHAR7.                             
      @478    I10_PR3                       $CHAR7.                             
      @485    I10_PR4                       $CHAR7.                             
      @492    I10_PR5                       $CHAR7.                             
      @499    I10_PR6                       $CHAR7.                             
      @506    I10_PR7                       $CHAR7.                             
      @513    I10_PR8                       $CHAR7.                             
      @520    I10_PR9                       $CHAR7.                             
      @527    I10_PR10                      $CHAR7.                             
      @534    I10_PR11                      $CHAR7.                             
      @541    I10_PR12                      $CHAR7.                             
      @548    I10_PR13                      $CHAR7.                             
      @555    I10_PR14                      $CHAR7.                             
      @562    I10_PR15                      $CHAR7.                             
      @569    I10_PR16                      $CHAR7.                             
      @576    I10_PR17                      $CHAR7.                             
      @583    I10_PR18                      $CHAR7.                             
      @590    I10_PR19                      $CHAR7.                             
      @597    I10_PR20                      $CHAR7.                             
      @604    I10_PR21                      $CHAR7.                             
      @611    I10_PR22                      $CHAR7.                             
      @618    I10_PR23                      $CHAR7.                             
      @625    I10_PR24                      $CHAR7.                             
      @632    I10_PR25                      $CHAR7.                             
      @639    I10_PROCTYPE                  N3PF.                               
      @642    KEY                           15.                                 
      @657    LOS                           N5PF.                               
      @662    LOS_X                         N6PF.                               
      @668    MDC                           N2PF.                               
      @670    MDC_NoPOA                     N2PF.                               
      @672    MEDINCSTQ                     N2PF.                               
      @674    OS_TIME                       N11P2F.                             
      @685    PAY1                          N2PF.                               
      @687    PAY1_X                        $CHAR3.                             
      @690    PAY2                          N2PF.                               
      @692    PAY2_X                        $CHAR3.                             
      @695    PAY3                          N2PF.                               
      @697    PAY3_X                        $CHAR3.                             
      @700    PL_CBSA                       N3PF.                               
      @703    PL_NCHS                       N2PF.                               
      @705    PL_RUCC                       N2PF.                               
      @707    PL_UIC                        N2PF.                               
      @709    PL_UR_CAT4                    N2PF.                               
      @711    POA_Disch_Edit1               N2PF.                               
      @713    POA_Disch_Edit2               N2PF.                               
      @715    POA_Hosp_Edit1                N2PF.                               
      @717    POA_Hosp_Edit2                N2PF.                               
      @719    POA_Hosp_Edit3                N2PF.                               
      @721    POA_Hosp_Edit3_Value          N8P2F.                              
      @729    PointOfOrigin_X               $CHAR1.                             
      @730    PointOfOriginUB04             $CHAR1.                             
      @731    PRDAY1                        N5PF.                               
      @736    PRDAY2                        N5PF.                               
      @741    PRDAY3                        N5PF.                               
      @746    PRDAY4                        N5PF.                               
      @751    PRDAY5                        N5PF.                               
      @756    PRDAY6                        N5PF.                               
      @761    PRDAY7                        N5PF.                               
      @766    PRDAY8                        N5PF.                               
      @771    PRDAY9                        N5PF.                               
      @776    PRDAY10                       N5PF.                               
      @781    PRDAY11                       N5PF.                               
      @786    PRDAY12                       N5PF.                               
      @791    PRDAY13                       N5PF.                               
      @796    PRDAY14                       N5PF.                               
      @801    PRDAY15                       N5PF.                               
      @806    PRDAY16                       N5PF.                               
      @811    PRDAY17                       N5PF.                               
      @816    PRDAY18                       N5PF.                               
      @821    PRDAY19                       N5PF.                               
      @826    PRDAY20                       N5PF.                               
      @831    PRDAY21                       N5PF.                               
      @836    PRDAY22                       N5PF.                               
      @841    PRDAY23                       N5PF.                               
      @846    PRDAY24                       N5PF.                               
      @851    PRDAY25                       N5PF.                               
      @856    PRVER                         N3PF.                               
      @859    PSTATE                        $CHAR2.                             
      @861    PSTCO                         N5PF.                               
      @866    PSTCO2                        N5PF.                               
      @871    RACE                          N2PF.                               
      @873    RACE_X                        $CHAR1.                             
      @874    TOTCHG                        N10PF.                              
      @884    TOTCHG_X                      N15P2F.                             
      @899    TRAN_IN                       N2PF.                               
      @901    TRAN_OUT                      N2PF.                               
      @903    YEAR                          N4PF.                               
      @907    ZIP3                          $CHAR3.                             
      @910    ZIPINC_QRTL                   N3PF.                               
      @913    HOSPID                        N5PF.                               
      @918    AYEAR                         N4PF.                               
      @922    BMONTH                        N2PF.                               
      @924    BYEAR                         N4PF.                               
      @928    PRMONTH1                      N2PF.                               
      @930    PRMONTH2                      N2PF.                               
      @932    PRMONTH3                      N2PF.                               
      @934    PRMONTH4                      N2PF.                               
      @936    PRMONTH5                      N2PF.                               
      @938    PRMONTH6                      N2PF.                               
      @940    PRMONTH7                      N2PF.                               
      @942    PRMONTH8                      N2PF.                               
      @944    PRMONTH9                      N2PF.                               
      @946    PRMONTH10                     N2PF.                               
      @948    PRMONTH11                     N2PF.                               
      @950    PRMONTH12                     N2PF.                               
      @952    PRMONTH13                     N2PF.                               
      @954    PRMONTH14                     N2PF.                               
      @956    PRMONTH15                     N2PF.                               
      @958    PRMONTH16                     N2PF.                               
      @960    PRMONTH17                     N2PF.                               
      @962    PRMONTH18                     N2PF.                               
      @964    PRMONTH19                     N2PF.                               
      @966    PRMONTH20                     N2PF.                               
      @968    PRMONTH21                     N2PF.                               
      @970    PRMONTH22                     N2PF.                               
      @972    PRMONTH23                     N2PF.                               
      @974    PRMONTH24                     N2PF.                               
      @976    PRMONTH25                     N2PF.                               
      @978    PRYEAR1                       N4PF.                               
      @982    PRYEAR2                       N4PF.                               
      @986    PRYEAR3                       N4PF.                               
      @990    PRYEAR4                       N4PF.                               
      @994    PRYEAR5                       N4PF.                               
      @998    PRYEAR6                       N4PF.                               
      @1002   PRYEAR7                       N4PF.                               
      @1006   PRYEAR8                       N4PF.                               
      @1010   PRYEAR9                       N4PF.                               
      @1014   PRYEAR10                      N4PF.                               
      @1018   PRYEAR11                      N4PF.                               
      @1022   PRYEAR12                      N4PF.                               
      @1026   PRYEAR13                      N4PF.                               
      @1030   PRYEAR14                      N4PF.                               
      @1034   PRYEAR15                      N4PF.                               
      @1038   PRYEAR16                      N4PF.                               
      @1042   PRYEAR17                      N4PF.                               
      @1046   PRYEAR18                      N4PF.                               
      @1050   PRYEAR19                      N4PF.                               
      @1054   PRYEAR20                      N4PF.                               
      @1058   PRYEAR21                      N4PF.                               
      @1062   PRYEAR22                      N4PF.                               
      @1066   PRYEAR23                      N4PF.                               
      @1070   PRYEAR24                      N4PF.                               
      @1074   PRYEAR25                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
