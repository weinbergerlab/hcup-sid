/*******************************************************************            
* Creation Date: 07/05/2017                                                     
*   HI_SID_2015q4_CORE.SAS:                                                     
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
DATA HI_SIDC_2015q4_CORE;                                                       
INFILE 'HI_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 1544;                        
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
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
                                                                                
  E_POA8                     LENGTH=$1                                          
  LABEL="E Cause 8, present on admission indicator"                             
                                                                                
  E_POA9                     LENGTH=$1                                          
  LABEL="E Cause 9, present on admission indicator"                             
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
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
                                                                                
  I10_ECAUSE8                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 8"                                                   
                                                                                
  I10_ECAUSE9                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 9"                                                   
                                                                                
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
                                                                                
  I10_ECauseCCS8             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 8"                                              
                                                                                
  I10_ECauseCCS9             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 9"                                              
                                                                                
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
                                                                                
  MOMNUM_R                   LENGTH=5                                           
  LABEL="Mother's number (re-identified)"                                       
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
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
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$2                                          
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
                                                                                
  AGEGROUP                   LENGTH=3                                           
  LABEL="Age Group"                                                             
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGEDAY                        N3PF.                               
      @4      AGEMONTH                      N3PF.                               
      @7      AMONTH                        N2PF.                               
      @9      ATYPE                         N2PF.                               
      @11     AWEEKEND                      N2PF.                               
      @13     BWT                           N4PF.                               
      @17     DIED                          N2PF.                               
      @19     DISP_X                        $CHAR2.                             
      @21     DISPUB04                      N2PF.                               
      @23     DISPUNIFORM                   N2PF.                               
      @25     DMONTH                        N2PF.                               
      @27     DQTR                          N2PF.                               
      @29     DRG                           N3PF.                               
      @32     DRG_NoPOA                     N3PF.                               
      @35     DRG32                         N3PF.                               
      @38     DRGVER                        N2PF.                               
      @40     DXPOA1                        $CHAR1.                             
      @41     DXPOA2                        $CHAR1.                             
      @42     DXPOA3                        $CHAR1.                             
      @43     DXPOA4                        $CHAR1.                             
      @44     DXPOA5                        $CHAR1.                             
      @45     DXPOA6                        $CHAR1.                             
      @46     DXPOA7                        $CHAR1.                             
      @47     DXPOA8                        $CHAR1.                             
      @48     DXPOA9                        $CHAR1.                             
      @49     DXPOA10                       $CHAR1.                             
      @50     DXPOA11                       $CHAR1.                             
      @51     DXPOA12                       $CHAR1.                             
      @52     DXPOA13                       $CHAR1.                             
      @53     DXPOA14                       $CHAR1.                             
      @54     DXPOA15                       $CHAR1.                             
      @55     DXPOA16                       $CHAR1.                             
      @56     DXPOA17                       $CHAR1.                             
      @57     DXPOA18                       $CHAR1.                             
      @58     DXPOA19                       $CHAR1.                             
      @59     DXPOA20                       $CHAR1.                             
      @60     DXPOA21                       $CHAR1.                             
      @61     DXPOA22                       $CHAR1.                             
      @62     DXPOA23                       $CHAR1.                             
      @63     DXPOA24                       $CHAR1.                             
      @64     DXPOA25                       $CHAR1.                             
      @65     DXPOA26                       $CHAR1.                             
      @66     DXPOA27                       $CHAR1.                             
      @67     DXPOA28                       $CHAR1.                             
      @68     DXPOA29                       $CHAR1.                             
      @69     DXPOA30                       $CHAR1.                             
      @70     DXPOA31                       $CHAR1.                             
      @71     DXPOA32                       $CHAR1.                             
      @72     DXPOA33                       $CHAR1.                             
      @73     DXPOA34                       $CHAR1.                             
      @74     DXPOA35                       $CHAR1.                             
      @75     DXPOA36                       $CHAR1.                             
      @76     DXPOA37                       $CHAR1.                             
      @77     DXPOA38                       $CHAR1.                             
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
      @90     FEMALE                        N2PF.                               
      @92     HCUP_ED                       N2PF.                               
      @94     HCUP_OS                       N2PF.                               
      @96     HOSPST                        $CHAR2.                             
      @98     I10_DX1                       $CHAR7.                             
      @105    I10_DX2                       $CHAR7.                             
      @112    I10_DX3                       $CHAR7.                             
      @119    I10_DX4                       $CHAR7.                             
      @126    I10_DX5                       $CHAR7.                             
      @133    I10_DX6                       $CHAR7.                             
      @140    I10_DX7                       $CHAR7.                             
      @147    I10_DX8                       $CHAR7.                             
      @154    I10_DX9                       $CHAR7.                             
      @161    I10_DX10                      $CHAR7.                             
      @168    I10_DX11                      $CHAR7.                             
      @175    I10_DX12                      $CHAR7.                             
      @182    I10_DX13                      $CHAR7.                             
      @189    I10_DX14                      $CHAR7.                             
      @196    I10_DX15                      $CHAR7.                             
      @203    I10_DX16                      $CHAR7.                             
      @210    I10_DX17                      $CHAR7.                             
      @217    I10_DX18                      $CHAR7.                             
      @224    I10_DX19                      $CHAR7.                             
      @231    I10_DX20                      $CHAR7.                             
      @238    I10_DX21                      $CHAR7.                             
      @245    I10_DX22                      $CHAR7.                             
      @252    I10_DX23                      $CHAR7.                             
      @259    I10_DX24                      $CHAR7.                             
      @266    I10_DX25                      $CHAR7.                             
      @273    I10_DX26                      $CHAR7.                             
      @280    I10_DX27                      $CHAR7.                             
      @287    I10_DX28                      $CHAR7.                             
      @294    I10_DX29                      $CHAR7.                             
      @301    I10_DX30                      $CHAR7.                             
      @308    I10_DX31                      $CHAR7.                             
      @315    I10_DX32                      $CHAR7.                             
      @322    I10_DX33                      $CHAR7.                             
      @329    I10_DX34                      $CHAR7.                             
      @336    I10_DX35                      $CHAR7.                             
      @343    I10_DX36                      $CHAR7.                             
      @350    I10_DX37                      $CHAR7.                             
      @357    I10_DX38                      $CHAR7.                             
      @364    I10_DXCCS1                    N4PF.                               
      @368    I10_DXCCS2                    N4PF.                               
      @372    I10_DXCCS3                    N4PF.                               
      @376    I10_DXCCS4                    N4PF.                               
      @380    I10_DXCCS5                    N4PF.                               
      @384    I10_DXCCS6                    N4PF.                               
      @388    I10_DXCCS7                    N4PF.                               
      @392    I10_DXCCS8                    N4PF.                               
      @396    I10_DXCCS9                    N4PF.                               
      @400    I10_DXCCS10                   N4PF.                               
      @404    I10_DXCCS11                   N4PF.                               
      @408    I10_DXCCS12                   N4PF.                               
      @412    I10_DXCCS13                   N4PF.                               
      @416    I10_DXCCS14                   N4PF.                               
      @420    I10_DXCCS15                   N4PF.                               
      @424    I10_DXCCS16                   N4PF.                               
      @428    I10_DXCCS17                   N4PF.                               
      @432    I10_DXCCS18                   N4PF.                               
      @436    I10_DXCCS19                   N4PF.                               
      @440    I10_DXCCS20                   N4PF.                               
      @444    I10_DXCCS21                   N4PF.                               
      @448    I10_DXCCS22                   N4PF.                               
      @452    I10_DXCCS23                   N4PF.                               
      @456    I10_DXCCS24                   N4PF.                               
      @460    I10_DXCCS25                   N4PF.                               
      @464    I10_DXCCS26                   N4PF.                               
      @468    I10_DXCCS27                   N4PF.                               
      @472    I10_DXCCS28                   N4PF.                               
      @476    I10_DXCCS29                   N4PF.                               
      @480    I10_DXCCS30                   N4PF.                               
      @484    I10_DXCCS31                   N4PF.                               
      @488    I10_DXCCS32                   N4PF.                               
      @492    I10_DXCCS33                   N4PF.                               
      @496    I10_DXCCS34                   N4PF.                               
      @500    I10_DXCCS35                   N4PF.                               
      @504    I10_DXCCS36                   N4PF.                               
      @508    I10_DXCCS37                   N4PF.                               
      @512    I10_DXCCS38                   N4PF.                               
      @516    I10_ECAUSE1                   $CHAR7.                             
      @523    I10_ECAUSE2                   $CHAR7.                             
      @530    I10_ECAUSE3                   $CHAR7.                             
      @537    I10_ECAUSE4                   $CHAR7.                             
      @544    I10_ECAUSE5                   $CHAR7.                             
      @551    I10_ECAUSE6                   $CHAR7.                             
      @558    I10_ECAUSE7                   $CHAR7.                             
      @565    I10_ECAUSE8                   $CHAR7.                             
      @572    I10_ECAUSE9                   $CHAR7.                             
      @579    I10_ECauseCCS1                N4PF.                               
      @583    I10_ECauseCCS2                N4PF.                               
      @587    I10_ECauseCCS3                N4PF.                               
      @591    I10_ECauseCCS4                N4PF.                               
      @595    I10_ECauseCCS5                N4PF.                               
      @599    I10_ECauseCCS6                N4PF.                               
      @603    I10_ECauseCCS7                N4PF.                               
      @607    I10_ECauseCCS8                N4PF.                               
      @611    I10_ECauseCCS9                N4PF.                               
      @615    I10_HOSPBRTH                  N3PF.                               
      @618    I10_NCHRONIC                  N3PF.                               
      @621    I10_NDX                       N3PF.                               
      @624    I10_NECAUSE                   N2PF.                               
      @626    I10_NEOMAT                    N2PF.                               
      @628    I10_NPR                       N3PF.                               
      @631    I10_ORPROC                    N2PF.                               
      @633    I10_PR1                       $CHAR7.                             
      @640    I10_PR2                       $CHAR7.                             
      @647    I10_PR3                       $CHAR7.                             
      @654    I10_PR4                       $CHAR7.                             
      @661    I10_PR5                       $CHAR7.                             
      @668    I10_PR6                       $CHAR7.                             
      @675    I10_PR7                       $CHAR7.                             
      @682    I10_PR8                       $CHAR7.                             
      @689    I10_PR9                       $CHAR7.                             
      @696    I10_PR10                      $CHAR7.                             
      @703    I10_PR11                      $CHAR7.                             
      @710    I10_PR12                      $CHAR7.                             
      @717    I10_PR13                      $CHAR7.                             
      @724    I10_PR14                      $CHAR7.                             
      @731    I10_PR15                      $CHAR7.                             
      @738    I10_PR16                      $CHAR7.                             
      @745    I10_PR17                      $CHAR7.                             
      @752    I10_PR18                      $CHAR7.                             
      @759    I10_PR19                      $CHAR7.                             
      @766    I10_PR20                      $CHAR7.                             
      @773    I10_PR21                      $CHAR7.                             
      @780    I10_PR22                      $CHAR7.                             
      @787    I10_PR23                      $CHAR7.                             
      @794    I10_PR24                      $CHAR7.                             
      @801    I10_PR25                      $CHAR7.                             
      @808    I10_PR26                      $CHAR7.                             
      @815    I10_PR27                      $CHAR7.                             
      @822    I10_PR28                      $CHAR7.                             
      @829    I10_PR29                      $CHAR7.                             
      @836    I10_PR30                      $CHAR7.                             
      @843    I10_PR31                      $CHAR7.                             
      @850    I10_PR32                      $CHAR7.                             
      @857    I10_PR33                      $CHAR7.                             
      @864    I10_PR34                      $CHAR7.                             
      @871    I10_PR35                      $CHAR7.                             
      @878    I10_PRCCS1                    N3PF.                               
      @881    I10_PRCCS2                    N3PF.                               
      @884    I10_PRCCS3                    N3PF.                               
      @887    I10_PRCCS4                    N3PF.                               
      @890    I10_PRCCS5                    N3PF.                               
      @893    I10_PRCCS6                    N3PF.                               
      @896    I10_PRCCS7                    N3PF.                               
      @899    I10_PRCCS8                    N3PF.                               
      @902    I10_PRCCS9                    N3PF.                               
      @905    I10_PRCCS10                   N3PF.                               
      @908    I10_PRCCS11                   N3PF.                               
      @911    I10_PRCCS12                   N3PF.                               
      @914    I10_PRCCS13                   N3PF.                               
      @917    I10_PRCCS14                   N3PF.                               
      @920    I10_PRCCS15                   N3PF.                               
      @923    I10_PRCCS16                   N3PF.                               
      @926    I10_PRCCS17                   N3PF.                               
      @929    I10_PRCCS18                   N3PF.                               
      @932    I10_PRCCS19                   N3PF.                               
      @935    I10_PRCCS20                   N3PF.                               
      @938    I10_PRCCS21                   N3PF.                               
      @941    I10_PRCCS22                   N3PF.                               
      @944    I10_PRCCS23                   N3PF.                               
      @947    I10_PRCCS24                   N3PF.                               
      @950    I10_PRCCS25                   N3PF.                               
      @953    I10_PRCCS26                   N3PF.                               
      @956    I10_PRCCS27                   N3PF.                               
      @959    I10_PRCCS28                   N3PF.                               
      @962    I10_PRCCS29                   N3PF.                               
      @965    I10_PRCCS30                   N3PF.                               
      @968    I10_PRCCS31                   N3PF.                               
      @971    I10_PRCCS32                   N3PF.                               
      @974    I10_PRCCS33                   N3PF.                               
      @977    I10_PRCCS34                   N3PF.                               
      @980    I10_PRCCS35                   N3PF.                               
      @983    I10_PROCTYPE                  N3PF.                               
      @986    I10_SERVICELINE               N2PF.                               
      @988    KEY                           15.                                 
      @1003   LOS                           N5PF.                               
      @1008   LOS_X                         N6PF.                               
      @1014   MDC                           N2PF.                               
      @1016   MDC_NoPOA                     N2PF.                               
      @1018   MDC32                         N2PF.                               
      @1020   MEDINCSTQ                     N2PF.                               
      @1022   MOMNUM_R                      N9PF.                               
      @1031   MRN_R                         N9PF.                               
      @1040   OS_TIME                       N11P2F.                             
      @1051   PAY1                          N2PF.                               
      @1053   PAY1_X                        $CHAR2.                             
      @1055   PL_CBSA                       N3PF.                               
      @1058   PL_NCHS                       N2PF.                               
      @1060   PL_RUCC                       N2PF.                               
      @1062   PL_UIC                        N2PF.                               
      @1064   PL_UR_CAT4                    N2PF.                               
      @1066   POA_Disch_Edit1               N2PF.                               
      @1068   POA_Disch_Edit2               N2PF.                               
      @1070   POA_Hosp_Edit1                N2PF.                               
      @1072   POA_Hosp_Edit2                N2PF.                               
      @1074   POA_Hosp_Edit3                N2PF.                               
      @1076   POA_Hosp_Edit3_Value          N8P2F.                              
      @1084   PointOfOrigin_X               $CHAR1.                             
      @1085   PointOfOriginUB04             $CHAR1.                             
      @1086   PRDAY1                        N5PF.                               
      @1091   PRDAY2                        N5PF.                               
      @1096   PRDAY3                        N5PF.                               
      @1101   PRDAY4                        N5PF.                               
      @1106   PRDAY5                        N5PF.                               
      @1111   PRDAY6                        N5PF.                               
      @1116   PRDAY7                        N5PF.                               
      @1121   PRDAY8                        N5PF.                               
      @1126   PRDAY9                        N5PF.                               
      @1131   PRDAY10                       N5PF.                               
      @1136   PRDAY11                       N5PF.                               
      @1141   PRDAY12                       N5PF.                               
      @1146   PRDAY13                       N5PF.                               
      @1151   PRDAY14                       N5PF.                               
      @1156   PRDAY15                       N5PF.                               
      @1161   PRDAY16                       N5PF.                               
      @1166   PRDAY17                       N5PF.                               
      @1171   PRDAY18                       N5PF.                               
      @1176   PRDAY19                       N5PF.                               
      @1181   PRDAY20                       N5PF.                               
      @1186   PRDAY21                       N5PF.                               
      @1191   PRDAY22                       N5PF.                               
      @1196   PRDAY23                       N5PF.                               
      @1201   PRDAY24                       N5PF.                               
      @1206   PRDAY25                       N5PF.                               
      @1211   PRDAY26                       N5PF.                               
      @1216   PRDAY27                       N5PF.                               
      @1221   PRDAY28                       N5PF.                               
      @1226   PRDAY29                       N5PF.                               
      @1231   PRDAY30                       N5PF.                               
      @1236   PRDAY31                       N5PF.                               
      @1241   PRDAY32                       N5PF.                               
      @1246   PRDAY33                       N5PF.                               
      @1251   PRDAY34                       N5PF.                               
      @1256   PRDAY35                       N5PF.                               
      @1261   PrimLang                      $CHAR3.                             
      @1264   PRVER                         N3PF.                               
      @1267   PSTATE                        $CHAR2.                             
      @1269   PSTCO2                        N5PF.                               
      @1274   RACE                          N2PF.                               
      @1276   RACE_X                        $CHAR2.                             
      @1278   TOTCHG                        N10PF.                              
      @1288   TOTCHG_X                      N15P2F.                             
      @1303   TRAN_IN                       N2PF.                               
      @1305   TRAN_OUT                      N2PF.                               
      @1307   YEAR                          N4PF.                               
      @1311   ZIP3                          $CHAR3.                             
      @1314   ZIPINC_QRTL                   N3PF.                               
      @1317   HOSPID                        N5PF.                               
      @1322   AGEGROUP                      N3PF.                               
      @1325   AYEAR                         N4PF.                               
      @1329   BMONTH                        N2PF.                               
      @1331   BYEAR                         N4PF.                               
      @1335   PRMONTH1                      N2PF.                               
      @1337   PRMONTH2                      N2PF.                               
      @1339   PRMONTH3                      N2PF.                               
      @1341   PRMONTH4                      N2PF.                               
      @1343   PRMONTH5                      N2PF.                               
      @1345   PRMONTH6                      N2PF.                               
      @1347   PRMONTH7                      N2PF.                               
      @1349   PRMONTH8                      N2PF.                               
      @1351   PRMONTH9                      N2PF.                               
      @1353   PRMONTH10                     N2PF.                               
      @1355   PRMONTH11                     N2PF.                               
      @1357   PRMONTH12                     N2PF.                               
      @1359   PRMONTH13                     N2PF.                               
      @1361   PRMONTH14                     N2PF.                               
      @1363   PRMONTH15                     N2PF.                               
      @1365   PRMONTH16                     N2PF.                               
      @1367   PRMONTH17                     N2PF.                               
      @1369   PRMONTH18                     N2PF.                               
      @1371   PRMONTH19                     N2PF.                               
      @1373   PRMONTH20                     N2PF.                               
      @1375   PRMONTH21                     N2PF.                               
      @1377   PRMONTH22                     N2PF.                               
      @1379   PRMONTH23                     N2PF.                               
      @1381   PRMONTH24                     N2PF.                               
      @1383   PRMONTH25                     N2PF.                               
      @1385   PRMONTH26                     N2PF.                               
      @1387   PRMONTH27                     N2PF.                               
      @1389   PRMONTH28                     N2PF.                               
      @1391   PRMONTH29                     N2PF.                               
      @1393   PRMONTH30                     N2PF.                               
      @1395   PRMONTH31                     N2PF.                               
      @1397   PRMONTH32                     N2PF.                               
      @1399   PRMONTH33                     N2PF.                               
      @1401   PRMONTH34                     N2PF.                               
      @1403   PRMONTH35                     N2PF.                               
      @1405   PRYEAR1                       N4PF.                               
      @1409   PRYEAR2                       N4PF.                               
      @1413   PRYEAR3                       N4PF.                               
      @1417   PRYEAR4                       N4PF.                               
      @1421   PRYEAR5                       N4PF.                               
      @1425   PRYEAR6                       N4PF.                               
      @1429   PRYEAR7                       N4PF.                               
      @1433   PRYEAR8                       N4PF.                               
      @1437   PRYEAR9                       N4PF.                               
      @1441   PRYEAR10                      N4PF.                               
      @1445   PRYEAR11                      N4PF.                               
      @1449   PRYEAR12                      N4PF.                               
      @1453   PRYEAR13                      N4PF.                               
      @1457   PRYEAR14                      N4PF.                               
      @1461   PRYEAR15                      N4PF.                               
      @1465   PRYEAR16                      N4PF.                               
      @1469   PRYEAR17                      N4PF.                               
      @1473   PRYEAR18                      N4PF.                               
      @1477   PRYEAR19                      N4PF.                               
      @1481   PRYEAR20                      N4PF.                               
      @1485   PRYEAR21                      N4PF.                               
      @1489   PRYEAR22                      N4PF.                               
      @1493   PRYEAR23                      N4PF.                               
      @1497   PRYEAR24                      N4PF.                               
      @1501   PRYEAR25                      N4PF.                               
      @1505   PRYEAR26                      N4PF.                               
      @1509   PRYEAR27                      N4PF.                               
      @1513   PRYEAR28                      N4PF.                               
      @1517   PRYEAR29                      N4PF.                               
      @1521   PRYEAR30                      N4PF.                               
      @1525   PRYEAR31                      N4PF.                               
      @1529   PRYEAR32                      N4PF.                               
      @1533   PRYEAR33                      N4PF.                               
      @1537   PRYEAR34                      N4PF.                               
      @1541   PRYEAR35                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
