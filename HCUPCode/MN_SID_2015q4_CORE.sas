/*******************************************************************            
* Creation Date: 03/28/2017                                                     
*   MN_SID_2015q4_CORE.SAS:                                                     
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
DATA MN_SIDC_2015q4_CORE;                                                       
INFILE 'MN_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 2010;                        
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  ADRG                       LENGTH=3                                           
  LABEL="All Patient Refined DRG"                                               
                                                                                
  ADRGRISKMORTALITY          LENGTH=3                                           
  LABEL="All Patient Refined DRG mortality risk"                                
                                                                                
  ADRGSEV                    LENGTH=3                                           
  LABEL="All Patient Refined DRG severity level"                                
                                                                                
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Admission Hour"                                                        
                                                                                
  AMDC                       LENGTH=3                                           
  LABEL="All Patient Refined MDC"                                               
                                                                                
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
                                                                                
  DRG32                      LENGTH=3                                           
  LABEL="DRG, version 32"                                                       
                                                                                
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
                                                                                
  DXPOA31                    LENGTH=$1                                          
  LABEL="Diagnosis 31, present on admission indicator"                          
                                                                                
  DXPOA32                    LENGTH=$1                                          
  LABEL="Diagnosis 32, present on admission indicator"                          
                                                                                
  DXPOA33                    LENGTH=$1                                          
  LABEL="Diagnosis 33, present on admission indicator"                          
                                                                                
  DXPOA34                    LENGTH=$1                                          
  LABEL="Diagnosis 34, present on admission indicator"                          
                                                                                
  DXPOA35                    LENGTH=$1                                          
  LABEL="Diagnosis 35, present on admission indicator"                          
                                                                                
  DXPOA36                    LENGTH=$1                                          
  LABEL="Diagnosis 36, present on admission indicator"                          
                                                                                
  DXPOA37                    LENGTH=$1                                          
  LABEL="Diagnosis 37, present on admission indicator"                          
                                                                                
  DXPOA38                    LENGTH=$1                                          
  LABEL="Diagnosis 38, present on admission indicator"                          
                                                                                
  DXPOA39                    LENGTH=$1                                          
  LABEL="Diagnosis 39, present on admission indicator"                          
                                                                                
  DXPOA40                    LENGTH=$1                                          
  LABEL="Diagnosis 40, present on admission indicator"                          
                                                                                
  DXPOA41                    LENGTH=$1                                          
  LABEL="Diagnosis 41, present on admission indicator"                          
                                                                                
  DXPOA42                    LENGTH=$1                                          
  LABEL="Diagnosis 42, present on admission indicator"                          
                                                                                
  DXPOA43                    LENGTH=$1                                          
  LABEL="Diagnosis 43, present on admission indicator"                          
                                                                                
  DXPOA44                    LENGTH=$1                                          
  LABEL="Diagnosis 44, present on admission indicator"                          
                                                                                
  DXPOA45                    LENGTH=$1                                          
  LABEL="Diagnosis 45, present on admission indicator"                          
                                                                                
  DXPOA46                    LENGTH=$1                                          
  LABEL="Diagnosis 46, present on admission indicator"                          
                                                                                
  DXPOA47                    LENGTH=$1                                          
  LABEL="Diagnosis 47, present on admission indicator"                          
                                                                                
  DXPOA48                    LENGTH=$1                                          
  LABEL="Diagnosis 48, present on admission indicator"                          
                                                                                
  DXPOA49                    LENGTH=$1                                          
  LABEL="Diagnosis 49, present on admission indicator"                          
                                                                                
  DXPOA50                    LENGTH=$1                                          
  LABEL="Diagnosis 50, present on admission indicator"                          
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="E Cause 1, present on admission indicator"                             
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="E Cause 2, present on admission indicator"                             
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="E Cause 3, present on admission indicator"                             
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="E Cause 4, present on admission indicator"                             
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="E Cause 5, present on admission indicator"                             
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="E Cause 6, present on admission indicator"                             
                                                                                
  E_POA7                     LENGTH=$1                                          
  LABEL="E Cause 7, present on admission indicator"                             
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  I10_DX_Admitting           LENGTH=$7                                          
  LABEL="ICD-10-CM Admitting Diagnosis Code"                                    
                                                                                
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
                                                                                
  I10_DX31                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 31"                                                
                                                                                
  I10_DX32                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 32"                                                
                                                                                
  I10_DX33                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 33"                                                
                                                                                
  I10_DX34                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 34"                                                
                                                                                
  I10_DX35                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 35"                                                
                                                                                
  I10_DX36                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 36"                                                
                                                                                
  I10_DX37                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 37"                                                
                                                                                
  I10_DX38                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 38"                                                
                                                                                
  I10_DX39                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 39"                                                
                                                                                
  I10_DX40                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 40"                                                
                                                                                
  I10_DX41                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 41"                                                
                                                                                
  I10_DX42                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 42"                                                
                                                                                
  I10_DX43                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 43"                                                
                                                                                
  I10_DX44                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 44"                                                
                                                                                
  I10_DX45                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 45"                                                
                                                                                
  I10_DX46                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 46"                                                
                                                                                
  I10_DX47                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 47"                                                
                                                                                
  I10_DX48                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 48"                                                
                                                                                
  I10_DX49                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 49"                                                
                                                                                
  I10_DX50                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 50"                                                
                                                                                
  I10_DXCCS1                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 1"                                            
                                                                                
  I10_DXCCS2                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 2"                                            
                                                                                
  I10_DXCCS3                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 3"                                            
                                                                                
  I10_DXCCS4                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 4"                                            
                                                                                
  I10_DXCCS5                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 5"                                            
                                                                                
  I10_DXCCS6                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 6"                                            
                                                                                
  I10_DXCCS7                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 7"                                            
                                                                                
  I10_DXCCS8                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 8"                                            
                                                                                
  I10_DXCCS9                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 9"                                            
                                                                                
  I10_DXCCS10                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 10"                                           
                                                                                
  I10_DXCCS11                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 11"                                           
                                                                                
  I10_DXCCS12                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 12"                                           
                                                                                
  I10_DXCCS13                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 13"                                           
                                                                                
  I10_DXCCS14                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 14"                                           
                                                                                
  I10_DXCCS15                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 15"                                           
                                                                                
  I10_DXCCS16                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 16"                                           
                                                                                
  I10_DXCCS17                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 17"                                           
                                                                                
  I10_DXCCS18                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 18"                                           
                                                                                
  I10_DXCCS19                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 19"                                           
                                                                                
  I10_DXCCS20                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 20"                                           
                                                                                
  I10_DXCCS21                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 21"                                           
                                                                                
  I10_DXCCS22                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 22"                                           
                                                                                
  I10_DXCCS23                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 23"                                           
                                                                                
  I10_DXCCS24                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 24"                                           
                                                                                
  I10_DXCCS25                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 25"                                           
                                                                                
  I10_DXCCS26                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 26"                                           
                                                                                
  I10_DXCCS27                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 27"                                           
                                                                                
  I10_DXCCS28                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 28"                                           
                                                                                
  I10_DXCCS29                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 29"                                           
                                                                                
  I10_DXCCS30                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 30"                                           
                                                                                
  I10_DXCCS31                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 31"                                           
                                                                                
  I10_DXCCS32                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 32"                                           
                                                                                
  I10_DXCCS33                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 33"                                           
                                                                                
  I10_DXCCS34                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 34"                                           
                                                                                
  I10_DXCCS35                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 35"                                           
                                                                                
  I10_DXCCS36                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 36"                                           
                                                                                
  I10_DXCCS37                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 37"                                           
                                                                                
  I10_DXCCS38                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 38"                                           
                                                                                
  I10_DXCCS39                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 39"                                           
                                                                                
  I10_DXCCS40                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 40"                                           
                                                                                
  I10_DXCCS41                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 41"                                           
                                                                                
  I10_DXCCS42                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 42"                                           
                                                                                
  I10_DXCCS43                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 43"                                           
                                                                                
  I10_DXCCS44                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 44"                                           
                                                                                
  I10_DXCCS45                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 45"                                           
                                                                                
  I10_DXCCS46                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 46"                                           
                                                                                
  I10_DXCCS47                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 47"                                           
                                                                                
  I10_DXCCS48                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 48"                                           
                                                                                
  I10_DXCCS49                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 49"                                           
                                                                                
  I10_DXCCS50                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 50"                                           
                                                                                
  I10_ECAUSE1                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 1"                                                   
                                                                                
  I10_ECAUSE2                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 2"                                                   
                                                                                
  I10_ECAUSE3                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 3"                                                   
                                                                                
  I10_ECAUSE4                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 4"                                                   
                                                                                
  I10_ECAUSE5                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 5"                                                   
                                                                                
  I10_ECAUSE6                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 6"                                                   
                                                                                
  I10_ECAUSE7                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 7"                                                   
                                                                                
  I10_ECauseCCS1             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 1"                                              
                                                                                
  I10_ECauseCCS2             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 2"                                              
                                                                                
  I10_ECauseCCS3             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 3"                                              
                                                                                
  I10_ECauseCCS4             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 4"                                              
                                                                                
  I10_ECauseCCS5             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 5"                                              
                                                                                
  I10_ECauseCCS6             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 6"                                              
                                                                                
  I10_ECauseCCS7             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 7"                                              
                                                                                
  I10_HOSPBRTH               LENGTH=3                                           
  LABEL="ICD-10-CM Indicator of birth in this hospital"                         
                                                                                
  I10_NCHRONIC               LENGTH=3                                           
  LABEL="ICD-10-CM Number of chronic conditions"                                
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NECAUSE                LENGTH=3                                           
  LABEL="ICD-10-CM Number of E Causes on this record"                           
                                                                                
  I10_NEOMAT                 LENGTH=3                                           
  LABEL="ICD-10-CM/PCS Neonatal and/or maternal I10_DX and/or I10_PR"           
                                                                                
  I10_NPR                    LENGTH=3                                           
  LABEL="ICD-10-PCS Number of procedures on this record"                        
                                                                                
  I10_ORPROC                 LENGTH=3                                           
  LABEL="ICD-10-PCS Major operating room procedure indicator"                   
                                                                                
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
                                                                                
  I10_PR26                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 26"                                               
                                                                                
  I10_PR27                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 27"                                               
                                                                                
  I10_PR28                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 28"                                               
                                                                                
  I10_PR29                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 29"                                               
                                                                                
  I10_PR30                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 30"                                               
                                                                                
  I10_PR31                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 31"                                               
                                                                                
  I10_PR32                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 32"                                               
                                                                                
  I10_PR33                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 33"                                               
                                                                                
  I10_PR34                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 34"                                               
                                                                                
  I10_PR35                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 35"                                               
                                                                                
  I10_PR36                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 36"                                               
                                                                                
  I10_PR37                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 37"                                               
                                                                                
  I10_PR38                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 38"                                               
                                                                                
  I10_PR39                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 39"                                               
                                                                                
  I10_PR40                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 40"                                               
                                                                                
  I10_PR41                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 41"                                               
                                                                                
  I10_PR42                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 42"                                               
                                                                                
  I10_PR43                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 43"                                               
                                                                                
  I10_PR44                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 44"                                               
                                                                                
  I10_PR45                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 45"                                               
                                                                                
  I10_PR46                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 46"                                               
                                                                                
  I10_PR47                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 47"                                               
                                                                                
  I10_PR48                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 48"                                               
                                                                                
  I10_PR49                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 49"                                               
                                                                                
  I10_PR50                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 50"                                               
                                                                                
  I10_PRCCS1                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 1"                                           
                                                                                
  I10_PRCCS2                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 2"                                           
                                                                                
  I10_PRCCS3                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 3"                                           
                                                                                
  I10_PRCCS4                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 4"                                           
                                                                                
  I10_PRCCS5                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 5"                                           
                                                                                
  I10_PRCCS6                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 6"                                           
                                                                                
  I10_PRCCS7                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 7"                                           
                                                                                
  I10_PRCCS8                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 8"                                           
                                                                                
  I10_PRCCS9                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 9"                                           
                                                                                
  I10_PRCCS10                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 10"                                          
                                                                                
  I10_PRCCS11                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 11"                                          
                                                                                
  I10_PRCCS12                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 12"                                          
                                                                                
  I10_PRCCS13                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 13"                                          
                                                                                
  I10_PRCCS14                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 14"                                          
                                                                                
  I10_PRCCS15                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 15"                                          
                                                                                
  I10_PRCCS16                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 16"                                          
                                                                                
  I10_PRCCS17                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 17"                                          
                                                                                
  I10_PRCCS18                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 18"                                          
                                                                                
  I10_PRCCS19                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 19"                                          
                                                                                
  I10_PRCCS20                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 20"                                          
                                                                                
  I10_PRCCS21                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 21"                                          
                                                                                
  I10_PRCCS22                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 22"                                          
                                                                                
  I10_PRCCS23                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 23"                                          
                                                                                
  I10_PRCCS24                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 24"                                          
                                                                                
  I10_PRCCS25                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 25"                                          
                                                                                
  I10_PRCCS26                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 26"                                          
                                                                                
  I10_PRCCS27                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 27"                                          
                                                                                
  I10_PRCCS28                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 28"                                          
                                                                                
  I10_PRCCS29                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 29"                                          
                                                                                
  I10_PRCCS30                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 30"                                          
                                                                                
  I10_PRCCS31                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 31"                                          
                                                                                
  I10_PRCCS32                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 32"                                          
                                                                                
  I10_PRCCS33                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 33"                                          
                                                                                
  I10_PRCCS34                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 34"                                          
                                                                                
  I10_PRCCS35                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 35"                                          
                                                                                
  I10_PRCCS36                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 36"                                          
                                                                                
  I10_PRCCS37                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 37"                                          
                                                                                
  I10_PRCCS38                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 38"                                          
                                                                                
  I10_PRCCS39                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 39"                                          
                                                                                
  I10_PRCCS40                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 40"                                          
                                                                                
  I10_PRCCS41                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 41"                                          
                                                                                
  I10_PRCCS42                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 42"                                          
                                                                                
  I10_PRCCS43                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 43"                                          
                                                                                
  I10_PRCCS44                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 44"                                          
                                                                                
  I10_PRCCS45                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 45"                                          
                                                                                
  I10_PRCCS46                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 46"                                          
                                                                                
  I10_PRCCS47                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 47"                                          
                                                                                
  I10_PRCCS48                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 48"                                          
                                                                                
  I10_PRCCS49                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 49"                                          
                                                                                
  I10_PRCCS50                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 50"                                          
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
  I10_SERVICELINE            LENGTH=3                                           
  LABEL="ICD-10-CM/PCS Hospital Service Line"                                   
                                                                                
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
                                                                                
  MDC32                      LENGTH=3                                           
  LABEL="MDC, version 32"                                                       
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$7                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$7                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$7                                          
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
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR26"                             
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR27"                             
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR28"                             
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR29"                             
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR30"                             
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR31"                             
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR32"                             
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR33"                             
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR34"                             
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR35"                             
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR36"                             
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR37"                             
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR38"                             
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR39"                             
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR40"                             
                                                                                
  PRDAY41                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR41"                             
                                                                                
  PRDAY42                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR42"                             
                                                                                
  PRDAY43                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR43"                             
                                                                                
  PRDAY44                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR44"                             
                                                                                
  PRDAY45                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR45"                             
                                                                                
  PRDAY46                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR46"                             
                                                                                
  PRDAY47                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR47"                             
                                                                                
  PRDAY48                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR48"                             
                                                                                
  PRDAY49                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR49"                             
                                                                                
  PRDAY50                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR50"                             
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
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
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
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
                                                                                
  PRMONTH26                  LENGTH=3                                           
  LABEL="Month of procedure 26"                                                 
                                                                                
  PRMONTH27                  LENGTH=3                                           
  LABEL="Month of procedure 27"                                                 
                                                                                
  PRMONTH28                  LENGTH=3                                           
  LABEL="Month of procedure 28"                                                 
                                                                                
  PRMONTH29                  LENGTH=3                                           
  LABEL="Month of procedure 29"                                                 
                                                                                
  PRMONTH30                  LENGTH=3                                           
  LABEL="Month of procedure 30"                                                 
                                                                                
  PRMONTH31                  LENGTH=3                                           
  LABEL="Month of procedure 31"                                                 
                                                                                
  PRMONTH32                  LENGTH=3                                           
  LABEL="Month of procedure 32"                                                 
                                                                                
  PRMONTH33                  LENGTH=3                                           
  LABEL="Month of procedure 33"                                                 
                                                                                
  PRMONTH34                  LENGTH=3                                           
  LABEL="Month of procedure 34"                                                 
                                                                                
  PRMONTH35                  LENGTH=3                                           
  LABEL="Month of procedure 35"                                                 
                                                                                
  PRMONTH36                  LENGTH=3                                           
  LABEL="Month of procedure 36"                                                 
                                                                                
  PRMONTH37                  LENGTH=3                                           
  LABEL="Month of procedure 37"                                                 
                                                                                
  PRMONTH38                  LENGTH=3                                           
  LABEL="Month of procedure 38"                                                 
                                                                                
  PRMONTH39                  LENGTH=3                                           
  LABEL="Month of procedure 39"                                                 
                                                                                
  PRMONTH40                  LENGTH=3                                           
  LABEL="Month of procedure 40"                                                 
                                                                                
  PRMONTH41                  LENGTH=3                                           
  LABEL="Month of procedure 41"                                                 
                                                                                
  PRMONTH42                  LENGTH=3                                           
  LABEL="Month of procedure 42"                                                 
                                                                                
  PRMONTH43                  LENGTH=3                                           
  LABEL="Month of procedure 43"                                                 
                                                                                
  PRMONTH44                  LENGTH=3                                           
  LABEL="Month of procedure 44"                                                 
                                                                                
  PRMONTH45                  LENGTH=3                                           
  LABEL="Month of procedure 45"                                                 
                                                                                
  PRMONTH46                  LENGTH=3                                           
  LABEL="Month of procedure 46"                                                 
                                                                                
  PRMONTH47                  LENGTH=3                                           
  LABEL="Month of procedure 47"                                                 
                                                                                
  PRMONTH48                  LENGTH=3                                           
  LABEL="Month of procedure 48"                                                 
                                                                                
  PRMONTH49                  LENGTH=3                                           
  LABEL="Month of procedure 49"                                                 
                                                                                
  PRMONTH50                  LENGTH=3                                           
  LABEL="Month of procedure 50"                                                 
                                                                                
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
                                                                                
  PRYEAR26                   LENGTH=3                                           
  LABEL="Year of procedure 26"                                                  
                                                                                
  PRYEAR27                   LENGTH=3                                           
  LABEL="Year of procedure 27"                                                  
                                                                                
  PRYEAR28                   LENGTH=3                                           
  LABEL="Year of procedure 28"                                                  
                                                                                
  PRYEAR29                   LENGTH=3                                           
  LABEL="Year of procedure 29"                                                  
                                                                                
  PRYEAR30                   LENGTH=3                                           
  LABEL="Year of procedure 30"                                                  
                                                                                
  PRYEAR31                   LENGTH=3                                           
  LABEL="Year of procedure 31"                                                  
                                                                                
  PRYEAR32                   LENGTH=3                                           
  LABEL="Year of procedure 32"                                                  
                                                                                
  PRYEAR33                   LENGTH=3                                           
  LABEL="Year of procedure 33"                                                  
                                                                                
  PRYEAR34                   LENGTH=3                                           
  LABEL="Year of procedure 34"                                                  
                                                                                
  PRYEAR35                   LENGTH=3                                           
  LABEL="Year of procedure 35"                                                  
                                                                                
  PRYEAR36                   LENGTH=3                                           
  LABEL="Year of procedure 36"                                                  
                                                                                
  PRYEAR37                   LENGTH=3                                           
  LABEL="Year of procedure 37"                                                  
                                                                                
  PRYEAR38                   LENGTH=3                                           
  LABEL="Year of procedure 38"                                                  
                                                                                
  PRYEAR39                   LENGTH=3                                           
  LABEL="Year of procedure 39"                                                  
                                                                                
  PRYEAR40                   LENGTH=3                                           
  LABEL="Year of procedure 40"                                                  
                                                                                
  PRYEAR41                   LENGTH=3                                           
  LABEL="Year of procedure 41"                                                  
                                                                                
  PRYEAR42                   LENGTH=3                                           
  LABEL="Year of procedure 42"                                                  
                                                                                
  PRYEAR43                   LENGTH=3                                           
  LABEL="Year of procedure 43"                                                  
                                                                                
  PRYEAR44                   LENGTH=3                                           
  LABEL="Year of procedure 44"                                                  
                                                                                
  PRYEAR45                   LENGTH=3                                           
  LABEL="Year of procedure 45"                                                  
                                                                                
  PRYEAR46                   LENGTH=3                                           
  LABEL="Year of procedure 46"                                                  
                                                                                
  PRYEAR47                   LENGTH=3                                           
  LABEL="Year of procedure 47"                                                  
                                                                                
  PRYEAR48                   LENGTH=3                                           
  LABEL="Year of procedure 48"                                                  
                                                                                
  PRYEAR49                   LENGTH=3                                           
  LABEL="Year of procedure 49"                                                  
                                                                                
  PRYEAR50                   LENGTH=3                                           
  LABEL="Year of procedure 50"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      ADRG                          N3PF.                               
      @4      ADRGRISKMORTALITY             N2PF.                               
      @6      ADRGSEV                       N2PF.                               
      @8      AGE                           N3PF.                               
      @11     AGEDAY                        N3PF.                               
      @14     AGEMONTH                      N3PF.                               
      @17     AHOUR                         N4PF.                               
      @21     AMDC                          N2PF.                               
      @23     AMONTH                        N2PF.                               
      @25     ATYPE                         N2PF.                               
      @27     AWEEKEND                      N2PF.                               
      @29     BILLTYPE                      $CHAR4.                             
      @33     DHOUR                         N4PF.                               
      @37     DIED                          N2PF.                               
      @39     DISP_X                        $CHAR2.                             
      @41     DISPUB04                      N2PF.                               
      @43     DISPUNIFORM                   N2PF.                               
      @45     DMONTH                        N2PF.                               
      @47     DQTR                          N2PF.                               
      @49     DRG                           N3PF.                               
      @52     DRG_NoPOA                     N3PF.                               
      @55     DRG32                         N3PF.                               
      @58     DRGVER                        N2PF.                               
      @60     DXPOA1                        $CHAR1.                             
      @61     DXPOA2                        $CHAR1.                             
      @62     DXPOA3                        $CHAR1.                             
      @63     DXPOA4                        $CHAR1.                             
      @64     DXPOA5                        $CHAR1.                             
      @65     DXPOA6                        $CHAR1.                             
      @66     DXPOA7                        $CHAR1.                             
      @67     DXPOA8                        $CHAR1.                             
      @68     DXPOA9                        $CHAR1.                             
      @69     DXPOA10                       $CHAR1.                             
      @70     DXPOA11                       $CHAR1.                             
      @71     DXPOA12                       $CHAR1.                             
      @72     DXPOA13                       $CHAR1.                             
      @73     DXPOA14                       $CHAR1.                             
      @74     DXPOA15                       $CHAR1.                             
      @75     DXPOA16                       $CHAR1.                             
      @76     DXPOA17                       $CHAR1.                             
      @77     DXPOA18                       $CHAR1.                             
      @78     DXPOA19                       $CHAR1.                             
      @79     DXPOA20                       $CHAR1.                             
      @80     DXPOA21                       $CHAR1.                             
      @81     DXPOA22                       $CHAR1.                             
      @82     DXPOA23                       $CHAR1.                             
      @83     DXPOA24                       $CHAR1.                             
      @84     DXPOA25                       $CHAR1.                             
      @85     DXPOA26                       $CHAR1.                             
      @86     DXPOA27                       $CHAR1.                             
      @87     DXPOA28                       $CHAR1.                             
      @88     DXPOA29                       $CHAR1.                             
      @89     DXPOA30                       $CHAR1.                             
      @90     DXPOA31                       $CHAR1.                             
      @91     DXPOA32                       $CHAR1.                             
      @92     DXPOA33                       $CHAR1.                             
      @93     DXPOA34                       $CHAR1.                             
      @94     DXPOA35                       $CHAR1.                             
      @95     DXPOA36                       $CHAR1.                             
      @96     DXPOA37                       $CHAR1.                             
      @97     DXPOA38                       $CHAR1.                             
      @98     DXPOA39                       $CHAR1.                             
      @99     DXPOA40                       $CHAR1.                             
      @100    DXPOA41                       $CHAR1.                             
      @101    DXPOA42                       $CHAR1.                             
      @102    DXPOA43                       $CHAR1.                             
      @103    DXPOA44                       $CHAR1.                             
      @104    DXPOA45                       $CHAR1.                             
      @105    DXPOA46                       $CHAR1.                             
      @106    DXPOA47                       $CHAR1.                             
      @107    DXPOA48                       $CHAR1.                             
      @108    DXPOA49                       $CHAR1.                             
      @109    DXPOA50                       $CHAR1.                             
      @110    DXVER                         N3PF.                               
      @113    E_POA1                        $CHAR1.                             
      @114    E_POA2                        $CHAR1.                             
      @115    E_POA3                        $CHAR1.                             
      @116    E_POA4                        $CHAR1.                             
      @117    E_POA5                        $CHAR1.                             
      @118    E_POA6                        $CHAR1.                             
      @119    E_POA7                        $CHAR1.                             
      @120    FEMALE                        N2PF.                               
      @122    HCUP_ED                       N2PF.                               
      @124    HCUP_OS                       N2PF.                               
      @126    HOSPST                        $CHAR2.                             
      @128    I10_DX_Admitting              $CHAR7.                             
      @135    I10_DX1                       $CHAR7.                             
      @142    I10_DX2                       $CHAR7.                             
      @149    I10_DX3                       $CHAR7.                             
      @156    I10_DX4                       $CHAR7.                             
      @163    I10_DX5                       $CHAR7.                             
      @170    I10_DX6                       $CHAR7.                             
      @177    I10_DX7                       $CHAR7.                             
      @184    I10_DX8                       $CHAR7.                             
      @191    I10_DX9                       $CHAR7.                             
      @198    I10_DX10                      $CHAR7.                             
      @205    I10_DX11                      $CHAR7.                             
      @212    I10_DX12                      $CHAR7.                             
      @219    I10_DX13                      $CHAR7.                             
      @226    I10_DX14                      $CHAR7.                             
      @233    I10_DX15                      $CHAR7.                             
      @240    I10_DX16                      $CHAR7.                             
      @247    I10_DX17                      $CHAR7.                             
      @254    I10_DX18                      $CHAR7.                             
      @261    I10_DX19                      $CHAR7.                             
      @268    I10_DX20                      $CHAR7.                             
      @275    I10_DX21                      $CHAR7.                             
      @282    I10_DX22                      $CHAR7.                             
      @289    I10_DX23                      $CHAR7.                             
      @296    I10_DX24                      $CHAR7.                             
      @303    I10_DX25                      $CHAR7.                             
      @310    I10_DX26                      $CHAR7.                             
      @317    I10_DX27                      $CHAR7.                             
      @324    I10_DX28                      $CHAR7.                             
      @331    I10_DX29                      $CHAR7.                             
      @338    I10_DX30                      $CHAR7.                             
      @345    I10_DX31                      $CHAR7.                             
      @352    I10_DX32                      $CHAR7.                             
      @359    I10_DX33                      $CHAR7.                             
      @366    I10_DX34                      $CHAR7.                             
      @373    I10_DX35                      $CHAR7.                             
      @380    I10_DX36                      $CHAR7.                             
      @387    I10_DX37                      $CHAR7.                             
      @394    I10_DX38                      $CHAR7.                             
      @401    I10_DX39                      $CHAR7.                             
      @408    I10_DX40                      $CHAR7.                             
      @415    I10_DX41                      $CHAR7.                             
      @422    I10_DX42                      $CHAR7.                             
      @429    I10_DX43                      $CHAR7.                             
      @436    I10_DX44                      $CHAR7.                             
      @443    I10_DX45                      $CHAR7.                             
      @450    I10_DX46                      $CHAR7.                             
      @457    I10_DX47                      $CHAR7.                             
      @464    I10_DX48                      $CHAR7.                             
      @471    I10_DX49                      $CHAR7.                             
      @478    I10_DX50                      $CHAR7.                             
      @485    I10_DXCCS1                    N4PF.                               
      @489    I10_DXCCS2                    N4PF.                               
      @493    I10_DXCCS3                    N4PF.                               
      @497    I10_DXCCS4                    N4PF.                               
      @501    I10_DXCCS5                    N4PF.                               
      @505    I10_DXCCS6                    N4PF.                               
      @509    I10_DXCCS7                    N4PF.                               
      @513    I10_DXCCS8                    N4PF.                               
      @517    I10_DXCCS9                    N4PF.                               
      @521    I10_DXCCS10                   N4PF.                               
      @525    I10_DXCCS11                   N4PF.                               
      @529    I10_DXCCS12                   N4PF.                               
      @533    I10_DXCCS13                   N4PF.                               
      @537    I10_DXCCS14                   N4PF.                               
      @541    I10_DXCCS15                   N4PF.                               
      @545    I10_DXCCS16                   N4PF.                               
      @549    I10_DXCCS17                   N4PF.                               
      @553    I10_DXCCS18                   N4PF.                               
      @557    I10_DXCCS19                   N4PF.                               
      @561    I10_DXCCS20                   N4PF.                               
      @565    I10_DXCCS21                   N4PF.                               
      @569    I10_DXCCS22                   N4PF.                               
      @573    I10_DXCCS23                   N4PF.                               
      @577    I10_DXCCS24                   N4PF.                               
      @581    I10_DXCCS25                   N4PF.                               
      @585    I10_DXCCS26                   N4PF.                               
      @589    I10_DXCCS27                   N4PF.                               
      @593    I10_DXCCS28                   N4PF.                               
      @597    I10_DXCCS29                   N4PF.                               
      @601    I10_DXCCS30                   N4PF.                               
      @605    I10_DXCCS31                   N4PF.                               
      @609    I10_DXCCS32                   N4PF.                               
      @613    I10_DXCCS33                   N4PF.                               
      @617    I10_DXCCS34                   N4PF.                               
      @621    I10_DXCCS35                   N4PF.                               
      @625    I10_DXCCS36                   N4PF.                               
      @629    I10_DXCCS37                   N4PF.                               
      @633    I10_DXCCS38                   N4PF.                               
      @637    I10_DXCCS39                   N4PF.                               
      @641    I10_DXCCS40                   N4PF.                               
      @645    I10_DXCCS41                   N4PF.                               
      @649    I10_DXCCS42                   N4PF.                               
      @653    I10_DXCCS43                   N4PF.                               
      @657    I10_DXCCS44                   N4PF.                               
      @661    I10_DXCCS45                   N4PF.                               
      @665    I10_DXCCS46                   N4PF.                               
      @669    I10_DXCCS47                   N4PF.                               
      @673    I10_DXCCS48                   N4PF.                               
      @677    I10_DXCCS49                   N4PF.                               
      @681    I10_DXCCS50                   N4PF.                               
      @685    I10_ECAUSE1                   $CHAR7.                             
      @692    I10_ECAUSE2                   $CHAR7.                             
      @699    I10_ECAUSE3                   $CHAR7.                             
      @706    I10_ECAUSE4                   $CHAR7.                             
      @713    I10_ECAUSE5                   $CHAR7.                             
      @720    I10_ECAUSE6                   $CHAR7.                             
      @727    I10_ECAUSE7                   $CHAR7.                             
      @734    I10_ECauseCCS1                N4PF.                               
      @738    I10_ECauseCCS2                N4PF.                               
      @742    I10_ECauseCCS3                N4PF.                               
      @746    I10_ECauseCCS4                N4PF.                               
      @750    I10_ECauseCCS5                N4PF.                               
      @754    I10_ECauseCCS6                N4PF.                               
      @758    I10_ECauseCCS7                N4PF.                               
      @762    I10_HOSPBRTH                  N3PF.                               
      @765    I10_NCHRONIC                  N3PF.                               
      @768    I10_NDX                       N3PF.                               
      @771    I10_NECAUSE                   N2PF.                               
      @773    I10_NEOMAT                    N2PF.                               
      @775    I10_NPR                       N3PF.                               
      @778    I10_ORPROC                    N2PF.                               
      @780    I10_PR1                       $CHAR7.                             
      @787    I10_PR2                       $CHAR7.                             
      @794    I10_PR3                       $CHAR7.                             
      @801    I10_PR4                       $CHAR7.                             
      @808    I10_PR5                       $CHAR7.                             
      @815    I10_PR6                       $CHAR7.                             
      @822    I10_PR7                       $CHAR7.                             
      @829    I10_PR8                       $CHAR7.                             
      @836    I10_PR9                       $CHAR7.                             
      @843    I10_PR10                      $CHAR7.                             
      @850    I10_PR11                      $CHAR7.                             
      @857    I10_PR12                      $CHAR7.                             
      @864    I10_PR13                      $CHAR7.                             
      @871    I10_PR14                      $CHAR7.                             
      @878    I10_PR15                      $CHAR7.                             
      @885    I10_PR16                      $CHAR7.                             
      @892    I10_PR17                      $CHAR7.                             
      @899    I10_PR18                      $CHAR7.                             
      @906    I10_PR19                      $CHAR7.                             
      @913    I10_PR20                      $CHAR7.                             
      @920    I10_PR21                      $CHAR7.                             
      @927    I10_PR22                      $CHAR7.                             
      @934    I10_PR23                      $CHAR7.                             
      @941    I10_PR24                      $CHAR7.                             
      @948    I10_PR25                      $CHAR7.                             
      @955    I10_PR26                      $CHAR7.                             
      @962    I10_PR27                      $CHAR7.                             
      @969    I10_PR28                      $CHAR7.                             
      @976    I10_PR29                      $CHAR7.                             
      @983    I10_PR30                      $CHAR7.                             
      @990    I10_PR31                      $CHAR7.                             
      @997    I10_PR32                      $CHAR7.                             
      @1004   I10_PR33                      $CHAR7.                             
      @1011   I10_PR34                      $CHAR7.                             
      @1018   I10_PR35                      $CHAR7.                             
      @1025   I10_PR36                      $CHAR7.                             
      @1032   I10_PR37                      $CHAR7.                             
      @1039   I10_PR38                      $CHAR7.                             
      @1046   I10_PR39                      $CHAR7.                             
      @1053   I10_PR40                      $CHAR7.                             
      @1060   I10_PR41                      $CHAR7.                             
      @1067   I10_PR42                      $CHAR7.                             
      @1074   I10_PR43                      $CHAR7.                             
      @1081   I10_PR44                      $CHAR7.                             
      @1088   I10_PR45                      $CHAR7.                             
      @1095   I10_PR46                      $CHAR7.                             
      @1102   I10_PR47                      $CHAR7.                             
      @1109   I10_PR48                      $CHAR7.                             
      @1116   I10_PR49                      $CHAR7.                             
      @1123   I10_PR50                      $CHAR7.                             
      @1130   I10_PRCCS1                    N3PF.                               
      @1133   I10_PRCCS2                    N3PF.                               
      @1136   I10_PRCCS3                    N3PF.                               
      @1139   I10_PRCCS4                    N3PF.                               
      @1142   I10_PRCCS5                    N3PF.                               
      @1145   I10_PRCCS6                    N3PF.                               
      @1148   I10_PRCCS7                    N3PF.                               
      @1151   I10_PRCCS8                    N3PF.                               
      @1154   I10_PRCCS9                    N3PF.                               
      @1157   I10_PRCCS10                   N3PF.                               
      @1160   I10_PRCCS11                   N3PF.                               
      @1163   I10_PRCCS12                   N3PF.                               
      @1166   I10_PRCCS13                   N3PF.                               
      @1169   I10_PRCCS14                   N3PF.                               
      @1172   I10_PRCCS15                   N3PF.                               
      @1175   I10_PRCCS16                   N3PF.                               
      @1178   I10_PRCCS17                   N3PF.                               
      @1181   I10_PRCCS18                   N3PF.                               
      @1184   I10_PRCCS19                   N3PF.                               
      @1187   I10_PRCCS20                   N3PF.                               
      @1190   I10_PRCCS21                   N3PF.                               
      @1193   I10_PRCCS22                   N3PF.                               
      @1196   I10_PRCCS23                   N3PF.                               
      @1199   I10_PRCCS24                   N3PF.                               
      @1202   I10_PRCCS25                   N3PF.                               
      @1205   I10_PRCCS26                   N3PF.                               
      @1208   I10_PRCCS27                   N3PF.                               
      @1211   I10_PRCCS28                   N3PF.                               
      @1214   I10_PRCCS29                   N3PF.                               
      @1217   I10_PRCCS30                   N3PF.                               
      @1220   I10_PRCCS31                   N3PF.                               
      @1223   I10_PRCCS32                   N3PF.                               
      @1226   I10_PRCCS33                   N3PF.                               
      @1229   I10_PRCCS34                   N3PF.                               
      @1232   I10_PRCCS35                   N3PF.                               
      @1235   I10_PRCCS36                   N3PF.                               
      @1238   I10_PRCCS37                   N3PF.                               
      @1241   I10_PRCCS38                   N3PF.                               
      @1244   I10_PRCCS39                   N3PF.                               
      @1247   I10_PRCCS40                   N3PF.                               
      @1250   I10_PRCCS41                   N3PF.                               
      @1253   I10_PRCCS42                   N3PF.                               
      @1256   I10_PRCCS43                   N3PF.                               
      @1259   I10_PRCCS44                   N3PF.                               
      @1262   I10_PRCCS45                   N3PF.                               
      @1265   I10_PRCCS46                   N3PF.                               
      @1268   I10_PRCCS47                   N3PF.                               
      @1271   I10_PRCCS48                   N3PF.                               
      @1274   I10_PRCCS49                   N3PF.                               
      @1277   I10_PRCCS50                   N3PF.                               
      @1280   I10_PROCTYPE                  N3PF.                               
      @1283   I10_SERVICELINE               N2PF.                               
      @1285   KEY                           15.                                 
      @1300   LOS                           N5PF.                               
      @1305   LOS_X                         N6PF.                               
      @1311   MDC                           N2PF.                               
      @1313   MDC_NoPOA                     N2PF.                               
      @1315   MDC32                         N2PF.                               
      @1317   MEDINCSTQ                     N2PF.                               
      @1319   MRN_R                         N9PF.                               
      @1328   OS_TIME                       N11P2F.                             
      @1339   PAY1                          N2PF.                               
      @1341   PAY1_X                        $CHAR7.                             
      @1348   PAY2                          N2PF.                               
      @1350   PAY2_X                        $CHAR7.                             
      @1357   PAY3                          N2PF.                               
      @1359   PAY3_X                        $CHAR7.                             
      @1366   PL_CBSA                       N3PF.                               
      @1369   PL_NCHS                       N2PF.                               
      @1371   PL_RUCC                       N2PF.                               
      @1373   PL_UIC                        N2PF.                               
      @1375   PL_UR_CAT4                    N2PF.                               
      @1377   POA_Disch_Edit1               N2PF.                               
      @1379   POA_Disch_Edit2               N2PF.                               
      @1381   POA_Hosp_Edit1                N2PF.                               
      @1383   POA_Hosp_Edit2                N2PF.                               
      @1385   POA_Hosp_Edit3                N2PF.                               
      @1387   POA_Hosp_Edit3_Value          N8P2F.                              
      @1395   PointOfOrigin_X               $CHAR1.                             
      @1396   PointOfOriginUB04             $CHAR1.                             
      @1397   PRDAY1                        N5PF.                               
      @1402   PRDAY2                        N5PF.                               
      @1407   PRDAY3                        N5PF.                               
      @1412   PRDAY4                        N5PF.                               
      @1417   PRDAY5                        N5PF.                               
      @1422   PRDAY6                        N5PF.                               
      @1427   PRDAY7                        N5PF.                               
      @1432   PRDAY8                        N5PF.                               
      @1437   PRDAY9                        N5PF.                               
      @1442   PRDAY10                       N5PF.                               
      @1447   PRDAY11                       N5PF.                               
      @1452   PRDAY12                       N5PF.                               
      @1457   PRDAY13                       N5PF.                               
      @1462   PRDAY14                       N5PF.                               
      @1467   PRDAY15                       N5PF.                               
      @1472   PRDAY16                       N5PF.                               
      @1477   PRDAY17                       N5PF.                               
      @1482   PRDAY18                       N5PF.                               
      @1487   PRDAY19                       N5PF.                               
      @1492   PRDAY20                       N5PF.                               
      @1497   PRDAY21                       N5PF.                               
      @1502   PRDAY22                       N5PF.                               
      @1507   PRDAY23                       N5PF.                               
      @1512   PRDAY24                       N5PF.                               
      @1517   PRDAY25                       N5PF.                               
      @1522   PRDAY26                       N5PF.                               
      @1527   PRDAY27                       N5PF.                               
      @1532   PRDAY28                       N5PF.                               
      @1537   PRDAY29                       N5PF.                               
      @1542   PRDAY30                       N5PF.                               
      @1547   PRDAY31                       N5PF.                               
      @1552   PRDAY32                       N5PF.                               
      @1557   PRDAY33                       N5PF.                               
      @1562   PRDAY34                       N5PF.                               
      @1567   PRDAY35                       N5PF.                               
      @1572   PRDAY36                       N5PF.                               
      @1577   PRDAY37                       N5PF.                               
      @1582   PRDAY38                       N5PF.                               
      @1587   PRDAY39                       N5PF.                               
      @1592   PRDAY40                       N5PF.                               
      @1597   PRDAY41                       N5PF.                               
      @1602   PRDAY42                       N5PF.                               
      @1607   PRDAY43                       N5PF.                               
      @1612   PRDAY44                       N5PF.                               
      @1617   PRDAY45                       N5PF.                               
      @1622   PRDAY46                       N5PF.                               
      @1627   PRDAY47                       N5PF.                               
      @1632   PRDAY48                       N5PF.                               
      @1637   PRDAY49                       N5PF.                               
      @1642   PRDAY50                       N5PF.                               
      @1647   PRVER                         N3PF.                               
      @1650   PSTATE                        $CHAR2.                             
      @1652   PSTCO2                        N5PF.                               
      @1657   TOTCHG                        N10PF.                              
      @1667   TOTCHG_X                      N15P2F.                             
      @1682   TRAN_IN                       N2PF.                               
      @1684   TRAN_OUT                      N2PF.                               
      @1686   YEAR                          N4PF.                               
      @1690   ZIP                           $CHAR5.                             
      @1695   ZIP3                          $CHAR3.                             
      @1698   ZIPINC_QRTL                   N3PF.                               
      @1701   AYEAR                         N4PF.                               
      @1705   BMONTH                        N2PF.                               
      @1707   BYEAR                         N4PF.                               
      @1711   PRMONTH1                      N2PF.                               
      @1713   PRMONTH2                      N2PF.                               
      @1715   PRMONTH3                      N2PF.                               
      @1717   PRMONTH4                      N2PF.                               
      @1719   PRMONTH5                      N2PF.                               
      @1721   PRMONTH6                      N2PF.                               
      @1723   PRMONTH7                      N2PF.                               
      @1725   PRMONTH8                      N2PF.                               
      @1727   PRMONTH9                      N2PF.                               
      @1729   PRMONTH10                     N2PF.                               
      @1731   PRMONTH11                     N2PF.                               
      @1733   PRMONTH12                     N2PF.                               
      @1735   PRMONTH13                     N2PF.                               
      @1737   PRMONTH14                     N2PF.                               
      @1739   PRMONTH15                     N2PF.                               
      @1741   PRMONTH16                     N2PF.                               
      @1743   PRMONTH17                     N2PF.                               
      @1745   PRMONTH18                     N2PF.                               
      @1747   PRMONTH19                     N2PF.                               
      @1749   PRMONTH20                     N2PF.                               
      @1751   PRMONTH21                     N2PF.                               
      @1753   PRMONTH22                     N2PF.                               
      @1755   PRMONTH23                     N2PF.                               
      @1757   PRMONTH24                     N2PF.                               
      @1759   PRMONTH25                     N2PF.                               
      @1761   PRMONTH26                     N2PF.                               
      @1763   PRMONTH27                     N2PF.                               
      @1765   PRMONTH28                     N2PF.                               
      @1767   PRMONTH29                     N2PF.                               
      @1769   PRMONTH30                     N2PF.                               
      @1771   PRMONTH31                     N2PF.                               
      @1773   PRMONTH32                     N2PF.                               
      @1775   PRMONTH33                     N2PF.                               
      @1777   PRMONTH34                     N2PF.                               
      @1779   PRMONTH35                     N2PF.                               
      @1781   PRMONTH36                     N2PF.                               
      @1783   PRMONTH37                     N2PF.                               
      @1785   PRMONTH38                     N2PF.                               
      @1787   PRMONTH39                     N2PF.                               
      @1789   PRMONTH40                     N2PF.                               
      @1791   PRMONTH41                     N2PF.                               
      @1793   PRMONTH42                     N2PF.                               
      @1795   PRMONTH43                     N2PF.                               
      @1797   PRMONTH44                     N2PF.                               
      @1799   PRMONTH45                     N2PF.                               
      @1801   PRMONTH46                     N2PF.                               
      @1803   PRMONTH47                     N2PF.                               
      @1805   PRMONTH48                     N2PF.                               
      @1807   PRMONTH49                     N2PF.                               
      @1809   PRMONTH50                     N2PF.                               
      @1811   PRYEAR1                       N4PF.                               
      @1815   PRYEAR2                       N4PF.                               
      @1819   PRYEAR3                       N4PF.                               
      @1823   PRYEAR4                       N4PF.                               
      @1827   PRYEAR5                       N4PF.                               
      @1831   PRYEAR6                       N4PF.                               
      @1835   PRYEAR7                       N4PF.                               
      @1839   PRYEAR8                       N4PF.                               
      @1843   PRYEAR9                       N4PF.                               
      @1847   PRYEAR10                      N4PF.                               
      @1851   PRYEAR11                      N4PF.                               
      @1855   PRYEAR12                      N4PF.                               
      @1859   PRYEAR13                      N4PF.                               
      @1863   PRYEAR14                      N4PF.                               
      @1867   PRYEAR15                      N4PF.                               
      @1871   PRYEAR16                      N4PF.                               
      @1875   PRYEAR17                      N4PF.                               
      @1879   PRYEAR18                      N4PF.                               
      @1883   PRYEAR19                      N4PF.                               
      @1887   PRYEAR20                      N4PF.                               
      @1891   PRYEAR21                      N4PF.                               
      @1895   PRYEAR22                      N4PF.                               
      @1899   PRYEAR23                      N4PF.                               
      @1903   PRYEAR24                      N4PF.                               
      @1907   PRYEAR25                      N4PF.                               
      @1911   PRYEAR26                      N4PF.                               
      @1915   PRYEAR27                      N4PF.                               
      @1919   PRYEAR28                      N4PF.                               
      @1923   PRYEAR29                      N4PF.                               
      @1927   PRYEAR30                      N4PF.                               
      @1931   PRYEAR31                      N4PF.                               
      @1935   PRYEAR32                      N4PF.                               
      @1939   PRYEAR33                      N4PF.                               
      @1943   PRYEAR34                      N4PF.                               
      @1947   PRYEAR35                      N4PF.                               
      @1951   PRYEAR36                      N4PF.                               
      @1955   PRYEAR37                      N4PF.                               
      @1959   PRYEAR38                      N4PF.                               
      @1963   PRYEAR39                      N4PF.                               
      @1967   PRYEAR40                      N4PF.                               
      @1971   PRYEAR41                      N4PF.                               
      @1975   PRYEAR42                      N4PF.                               
      @1979   PRYEAR43                      N4PF.                               
      @1983   PRYEAR44                      N4PF.                               
      @1987   PRYEAR45                      N4PF.                               
      @1991   PRYEAR46                      N4PF.                               
      @1995   PRYEAR47                      N4PF.                               
      @1999   PRYEAR48                      N4PF.                               
      @2003   PRYEAR49                      N4PF.                               
      @2007   PRYEAR50                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
