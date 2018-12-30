/*******************************************************************            
* Creation Date: 11/29/2017                                                     
*   DC_SID_2015q4_CORE.SAS:                                                     
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
DATA DC_SIDC_2015q4_CORE;                                                       
INFILE 'DC_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 1741;                        
                                                                                
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
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
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
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MDNUM3_R                   LENGTH=5                                           
  LABEL="Physician 3 number (re-identified)"                                    
                                                                                
  MDNUM4_R                   LENGTH=5                                           
  LABEL="Physician 4 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$8                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$8                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$8                                          
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
                                                                                
  PointOfOrigin_X            LENGTH=$3                                          
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
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$3                                          
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
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
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
      @24     BWT                           N4PF.                               
      @28     DHOUR                         N4PF.                               
      @32     DIED                          N2PF.                               
      @34     DISP_X                        $CHAR2.                             
      @36     DISPUB04                      N2PF.                               
      @38     DISPUNIFORM                   N2PF.                               
      @40     DMONTH                        N2PF.                               
      @42     DQTR                          N2PF.                               
      @44     DRG                           N3PF.                               
      @47     DRG_NoPOA                     N3PF.                               
      @50     DRG32                         N3PF.                               
      @53     DRGVER                        N2PF.                               
      @55     DXPOA1                        $CHAR1.                             
      @56     DXPOA2                        $CHAR1.                             
      @57     DXPOA3                        $CHAR1.                             
      @58     DXPOA4                        $CHAR1.                             
      @59     DXPOA5                        $CHAR1.                             
      @60     DXPOA6                        $CHAR1.                             
      @61     DXPOA7                        $CHAR1.                             
      @62     DXPOA8                        $CHAR1.                             
      @63     DXPOA9                        $CHAR1.                             
      @64     DXPOA10                       $CHAR1.                             
      @65     DXPOA11                       $CHAR1.                             
      @66     DXPOA12                       $CHAR1.                             
      @67     DXPOA13                       $CHAR1.                             
      @68     DXPOA14                       $CHAR1.                             
      @69     DXPOA15                       $CHAR1.                             
      @70     DXPOA16                       $CHAR1.                             
      @71     DXPOA17                       $CHAR1.                             
      @72     DXPOA18                       $CHAR1.                             
      @73     DXPOA19                       $CHAR1.                             
      @74     DXPOA20                       $CHAR1.                             
      @75     DXPOA21                       $CHAR1.                             
      @76     DXPOA22                       $CHAR1.                             
      @77     DXPOA23                       $CHAR1.                             
      @78     DXPOA24                       $CHAR1.                             
      @79     DXPOA25                       $CHAR1.                             
      @80     DXPOA26                       $CHAR1.                             
      @81     DXPOA27                       $CHAR1.                             
      @82     DXPOA28                       $CHAR1.                             
      @83     DXPOA29                       $CHAR1.                             
      @84     DXPOA30                       $CHAR1.                             
      @85     DXPOA31                       $CHAR1.                             
      @86     DXPOA32                       $CHAR1.                             
      @87     DXPOA33                       $CHAR1.                             
      @88     DXPOA34                       $CHAR1.                             
      @89     DXPOA35                       $CHAR1.                             
      @90     DXPOA36                       $CHAR1.                             
      @91     DXPOA37                       $CHAR1.                             
      @92     DXPOA38                       $CHAR1.                             
      @93     DXPOA39                       $CHAR1.                             
      @94     DXPOA40                       $CHAR1.                             
      @95     DXPOA41                       $CHAR1.                             
      @96     DXPOA42                       $CHAR1.                             
      @97     DXPOA43                       $CHAR1.                             
      @98     DXPOA44                       $CHAR1.                             
      @99     DXPOA45                       $CHAR1.                             
      @100    DXPOA46                       $CHAR1.                             
      @101    DXPOA47                       $CHAR1.                             
      @102    DXPOA48                       $CHAR1.                             
      @103    DXPOA49                       $CHAR1.                             
      @104    DXPOA50                       $CHAR1.                             
      @105    DXVER                         N3PF.                               
      @108    E_POA1                        $CHAR1.                             
      @109    E_POA2                        $CHAR1.                             
      @110    E_POA3                        $CHAR1.                             
      @111    E_POA4                        $CHAR1.                             
      @112    E_POA5                        $CHAR1.                             
      @113    E_POA6                        $CHAR1.                             
      @114    E_POA7                        $CHAR1.                             
      @115    FEMALE                        N2PF.                               
      @117    HCUP_ED                       N2PF.                               
      @119    HCUP_OS                       N2PF.                               
      @121    HOSPST                        $CHAR2.                             
      @123    I10_DX_Admitting              $CHAR7.                             
      @130    I10_DX1                       $CHAR7.                             
      @137    I10_DX2                       $CHAR7.                             
      @144    I10_DX3                       $CHAR7.                             
      @151    I10_DX4                       $CHAR7.                             
      @158    I10_DX5                       $CHAR7.                             
      @165    I10_DX6                       $CHAR7.                             
      @172    I10_DX7                       $CHAR7.                             
      @179    I10_DX8                       $CHAR7.                             
      @186    I10_DX9                       $CHAR7.                             
      @193    I10_DX10                      $CHAR7.                             
      @200    I10_DX11                      $CHAR7.                             
      @207    I10_DX12                      $CHAR7.                             
      @214    I10_DX13                      $CHAR7.                             
      @221    I10_DX14                      $CHAR7.                             
      @228    I10_DX15                      $CHAR7.                             
      @235    I10_DX16                      $CHAR7.                             
      @242    I10_DX17                      $CHAR7.                             
      @249    I10_DX18                      $CHAR7.                             
      @256    I10_DX19                      $CHAR7.                             
      @263    I10_DX20                      $CHAR7.                             
      @270    I10_DX21                      $CHAR7.                             
      @277    I10_DX22                      $CHAR7.                             
      @284    I10_DX23                      $CHAR7.                             
      @291    I10_DX24                      $CHAR7.                             
      @298    I10_DX25                      $CHAR7.                             
      @305    I10_DX26                      $CHAR7.                             
      @312    I10_DX27                      $CHAR7.                             
      @319    I10_DX28                      $CHAR7.                             
      @326    I10_DX29                      $CHAR7.                             
      @333    I10_DX30                      $CHAR7.                             
      @340    I10_DX31                      $CHAR7.                             
      @347    I10_DX32                      $CHAR7.                             
      @354    I10_DX33                      $CHAR7.                             
      @361    I10_DX34                      $CHAR7.                             
      @368    I10_DX35                      $CHAR7.                             
      @375    I10_DX36                      $CHAR7.                             
      @382    I10_DX37                      $CHAR7.                             
      @389    I10_DX38                      $CHAR7.                             
      @396    I10_DX39                      $CHAR7.                             
      @403    I10_DX40                      $CHAR7.                             
      @410    I10_DX41                      $CHAR7.                             
      @417    I10_DX42                      $CHAR7.                             
      @424    I10_DX43                      $CHAR7.                             
      @431    I10_DX44                      $CHAR7.                             
      @438    I10_DX45                      $CHAR7.                             
      @445    I10_DX46                      $CHAR7.                             
      @452    I10_DX47                      $CHAR7.                             
      @459    I10_DX48                      $CHAR7.                             
      @466    I10_DX49                      $CHAR7.                             
      @473    I10_DX50                      $CHAR7.                             
      @480    I10_DXCCS1                    N4PF.                               
      @484    I10_DXCCS2                    N4PF.                               
      @488    I10_DXCCS3                    N4PF.                               
      @492    I10_DXCCS4                    N4PF.                               
      @496    I10_DXCCS5                    N4PF.                               
      @500    I10_DXCCS6                    N4PF.                               
      @504    I10_DXCCS7                    N4PF.                               
      @508    I10_DXCCS8                    N4PF.                               
      @512    I10_DXCCS9                    N4PF.                               
      @516    I10_DXCCS10                   N4PF.                               
      @520    I10_DXCCS11                   N4PF.                               
      @524    I10_DXCCS12                   N4PF.                               
      @528    I10_DXCCS13                   N4PF.                               
      @532    I10_DXCCS14                   N4PF.                               
      @536    I10_DXCCS15                   N4PF.                               
      @540    I10_DXCCS16                   N4PF.                               
      @544    I10_DXCCS17                   N4PF.                               
      @548    I10_DXCCS18                   N4PF.                               
      @552    I10_DXCCS19                   N4PF.                               
      @556    I10_DXCCS20                   N4PF.                               
      @560    I10_DXCCS21                   N4PF.                               
      @564    I10_DXCCS22                   N4PF.                               
      @568    I10_DXCCS23                   N4PF.                               
      @572    I10_DXCCS24                   N4PF.                               
      @576    I10_DXCCS25                   N4PF.                               
      @580    I10_DXCCS26                   N4PF.                               
      @584    I10_DXCCS27                   N4PF.                               
      @588    I10_DXCCS28                   N4PF.                               
      @592    I10_DXCCS29                   N4PF.                               
      @596    I10_DXCCS30                   N4PF.                               
      @600    I10_DXCCS31                   N4PF.                               
      @604    I10_DXCCS32                   N4PF.                               
      @608    I10_DXCCS33                   N4PF.                               
      @612    I10_DXCCS34                   N4PF.                               
      @616    I10_DXCCS35                   N4PF.                               
      @620    I10_DXCCS36                   N4PF.                               
      @624    I10_DXCCS37                   N4PF.                               
      @628    I10_DXCCS38                   N4PF.                               
      @632    I10_DXCCS39                   N4PF.                               
      @636    I10_DXCCS40                   N4PF.                               
      @640    I10_DXCCS41                   N4PF.                               
      @644    I10_DXCCS42                   N4PF.                               
      @648    I10_DXCCS43                   N4PF.                               
      @652    I10_DXCCS44                   N4PF.                               
      @656    I10_DXCCS45                   N4PF.                               
      @660    I10_DXCCS46                   N4PF.                               
      @664    I10_DXCCS47                   N4PF.                               
      @668    I10_DXCCS48                   N4PF.                               
      @672    I10_DXCCS49                   N4PF.                               
      @676    I10_DXCCS50                   N4PF.                               
      @680    I10_ECAUSE1                   $CHAR7.                             
      @687    I10_ECAUSE2                   $CHAR7.                             
      @694    I10_ECAUSE3                   $CHAR7.                             
      @701    I10_ECAUSE4                   $CHAR7.                             
      @708    I10_ECAUSE5                   $CHAR7.                             
      @715    I10_ECAUSE6                   $CHAR7.                             
      @722    I10_ECAUSE7                   $CHAR7.                             
      @729    I10_ECauseCCS1                N4PF.                               
      @733    I10_ECauseCCS2                N4PF.                               
      @737    I10_ECauseCCS3                N4PF.                               
      @741    I10_ECauseCCS4                N4PF.                               
      @745    I10_ECauseCCS5                N4PF.                               
      @749    I10_ECauseCCS6                N4PF.                               
      @753    I10_ECauseCCS7                N4PF.                               
      @757    I10_HOSPBRTH                  N3PF.                               
      @760    I10_NCHRONIC                  N3PF.                               
      @763    I10_NDX                       N3PF.                               
      @766    I10_NECAUSE                   N2PF.                               
      @768    I10_NEOMAT                    N2PF.                               
      @770    I10_NPR                       N3PF.                               
      @773    I10_ORPROC                    N2PF.                               
      @775    I10_PR1                       $CHAR7.                             
      @782    I10_PR2                       $CHAR7.                             
      @789    I10_PR3                       $CHAR7.                             
      @796    I10_PR4                       $CHAR7.                             
      @803    I10_PR5                       $CHAR7.                             
      @810    I10_PR6                       $CHAR7.                             
      @817    I10_PR7                       $CHAR7.                             
      @824    I10_PR8                       $CHAR7.                             
      @831    I10_PR9                       $CHAR7.                             
      @838    I10_PR10                      $CHAR7.                             
      @845    I10_PR11                      $CHAR7.                             
      @852    I10_PR12                      $CHAR7.                             
      @859    I10_PR13                      $CHAR7.                             
      @866    I10_PR14                      $CHAR7.                             
      @873    I10_PR15                      $CHAR7.                             
      @880    I10_PR16                      $CHAR7.                             
      @887    I10_PR17                      $CHAR7.                             
      @894    I10_PR18                      $CHAR7.                             
      @901    I10_PR19                      $CHAR7.                             
      @908    I10_PR20                      $CHAR7.                             
      @915    I10_PR21                      $CHAR7.                             
      @922    I10_PR22                      $CHAR7.                             
      @929    I10_PR23                      $CHAR7.                             
      @936    I10_PR24                      $CHAR7.                             
      @943    I10_PR25                      $CHAR7.                             
      @950    I10_PR26                      $CHAR7.                             
      @957    I10_PR27                      $CHAR7.                             
      @964    I10_PR28                      $CHAR7.                             
      @971    I10_PR29                      $CHAR7.                             
      @978    I10_PR30                      $CHAR7.                             
      @985    I10_PR31                      $CHAR7.                             
      @992    I10_PR32                      $CHAR7.                             
      @999    I10_PR33                      $CHAR7.                             
      @1006   I10_PR34                      $CHAR7.                             
      @1013   I10_PR35                      $CHAR7.                             
      @1020   I10_PR36                      $CHAR7.                             
      @1027   I10_PR37                      $CHAR7.                             
      @1034   I10_PR38                      $CHAR7.                             
      @1041   I10_PR39                      $CHAR7.                             
      @1048   I10_PR40                      $CHAR7.                             
      @1055   I10_PR41                      $CHAR7.                             
      @1062   I10_PR42                      $CHAR7.                             
      @1069   I10_PR43                      $CHAR7.                             
      @1076   I10_PR44                      $CHAR7.                             
      @1083   I10_PR45                      $CHAR7.                             
      @1090   I10_PR46                      $CHAR7.                             
      @1097   I10_PR47                      $CHAR7.                             
      @1104   I10_PR48                      $CHAR7.                             
      @1111   I10_PR49                      $CHAR7.                             
      @1118   I10_PR50                      $CHAR7.                             
      @1125   I10_PRCCS1                    N3PF.                               
      @1128   I10_PRCCS2                    N3PF.                               
      @1131   I10_PRCCS3                    N3PF.                               
      @1134   I10_PRCCS4                    N3PF.                               
      @1137   I10_PRCCS5                    N3PF.                               
      @1140   I10_PRCCS6                    N3PF.                               
      @1143   I10_PRCCS7                    N3PF.                               
      @1146   I10_PRCCS8                    N3PF.                               
      @1149   I10_PRCCS9                    N3PF.                               
      @1152   I10_PRCCS10                   N3PF.                               
      @1155   I10_PRCCS11                   N3PF.                               
      @1158   I10_PRCCS12                   N3PF.                               
      @1161   I10_PRCCS13                   N3PF.                               
      @1164   I10_PRCCS14                   N3PF.                               
      @1167   I10_PRCCS15                   N3PF.                               
      @1170   I10_PRCCS16                   N3PF.                               
      @1173   I10_PRCCS17                   N3PF.                               
      @1176   I10_PRCCS18                   N3PF.                               
      @1179   I10_PRCCS19                   N3PF.                               
      @1182   I10_PRCCS20                   N3PF.                               
      @1185   I10_PRCCS21                   N3PF.                               
      @1188   I10_PRCCS22                   N3PF.                               
      @1191   I10_PRCCS23                   N3PF.                               
      @1194   I10_PRCCS24                   N3PF.                               
      @1197   I10_PRCCS25                   N3PF.                               
      @1200   I10_PRCCS26                   N3PF.                               
      @1203   I10_PRCCS27                   N3PF.                               
      @1206   I10_PRCCS28                   N3PF.                               
      @1209   I10_PRCCS29                   N3PF.                               
      @1212   I10_PRCCS30                   N3PF.                               
      @1215   I10_PRCCS31                   N3PF.                               
      @1218   I10_PRCCS32                   N3PF.                               
      @1221   I10_PRCCS33                   N3PF.                               
      @1224   I10_PRCCS34                   N3PF.                               
      @1227   I10_PRCCS35                   N3PF.                               
      @1230   I10_PRCCS36                   N3PF.                               
      @1233   I10_PRCCS37                   N3PF.                               
      @1236   I10_PRCCS38                   N3PF.                               
      @1239   I10_PRCCS39                   N3PF.                               
      @1242   I10_PRCCS40                   N3PF.                               
      @1245   I10_PRCCS41                   N3PF.                               
      @1248   I10_PRCCS42                   N3PF.                               
      @1251   I10_PRCCS43                   N3PF.                               
      @1254   I10_PRCCS44                   N3PF.                               
      @1257   I10_PRCCS45                   N3PF.                               
      @1260   I10_PRCCS46                   N3PF.                               
      @1263   I10_PRCCS47                   N3PF.                               
      @1266   I10_PRCCS48                   N3PF.                               
      @1269   I10_PRCCS49                   N3PF.                               
      @1272   I10_PRCCS50                   N3PF.                               
      @1275   I10_PROCTYPE                  N3PF.                               
      @1278   I10_SERVICELINE               N2PF.                               
      @1280   KEY                           15.                                 
      @1295   LOS                           N5PF.                               
      @1300   LOS_X                         N6PF.                               
      @1306   MDC                           N2PF.                               
      @1308   MDC_NoPOA                     N2PF.                               
      @1310   MDC32                         N2PF.                               
      @1312   MDNUM1_R                      N9PF.                               
      @1321   MDNUM2_R                      N9PF.                               
      @1330   MDNUM3_R                      N9PF.                               
      @1339   MDNUM4_R                      N9PF.                               
      @1348   MEDINCSTQ                     N2PF.                               
      @1350   PAY1                          N2PF.                               
      @1352   PAY1_X                        $CHAR8.                             
      @1360   PAY2                          N2PF.                               
      @1362   PAY2_X                        $CHAR8.                             
      @1370   PAY3                          N2PF.                               
      @1372   PAY3_X                        $CHAR8.                             
      @1380   PL_CBSA                       N3PF.                               
      @1383   PL_NCHS                       N2PF.                               
      @1385   PL_RUCC                       N2PF.                               
      @1387   PL_UIC                        N2PF.                               
      @1389   PL_UR_CAT4                    N2PF.                               
      @1391   POA_Disch_Edit1               N2PF.                               
      @1393   POA_Disch_Edit2               N2PF.                               
      @1395   POA_Hosp_Edit1                N2PF.                               
      @1397   POA_Hosp_Edit2                N2PF.                               
      @1399   POA_Hosp_Edit3                N2PF.                               
      @1401   POA_Hosp_Edit3_Value          N8P2F.                              
      @1409   PointOfOrigin_X               $CHAR3.                             
      @1412   PointOfOriginUB04             $CHAR1.                             
      @1413   PRDAY1                        N5PF.                               
      @1418   PRDAY2                        N5PF.                               
      @1423   PRDAY3                        N5PF.                               
      @1428   PRDAY4                        N5PF.                               
      @1433   PRDAY5                        N5PF.                               
      @1438   PRDAY6                        N5PF.                               
      @1443   PRDAY7                        N5PF.                               
      @1448   PRDAY8                        N5PF.                               
      @1453   PRDAY9                        N5PF.                               
      @1458   PRDAY10                       N5PF.                               
      @1463   PRDAY11                       N5PF.                               
      @1468   PRDAY12                       N5PF.                               
      @1473   PRDAY13                       N5PF.                               
      @1478   PRDAY14                       N5PF.                               
      @1483   PRDAY15                       N5PF.                               
      @1488   PRDAY16                       N5PF.                               
      @1493   PRDAY17                       N5PF.                               
      @1498   PRDAY18                       N5PF.                               
      @1503   PRDAY19                       N5PF.                               
      @1508   PRDAY20                       N5PF.                               
      @1513   PRDAY21                       N5PF.                               
      @1518   PRDAY22                       N5PF.                               
      @1523   PRDAY23                       N5PF.                               
      @1528   PRDAY24                       N5PF.                               
      @1533   PRDAY25                       N5PF.                               
      @1538   PRDAY26                       N5PF.                               
      @1543   PRDAY27                       N5PF.                               
      @1548   PRDAY28                       N5PF.                               
      @1553   PRDAY29                       N5PF.                               
      @1558   PRDAY30                       N5PF.                               
      @1563   PRDAY31                       N5PF.                               
      @1568   PRDAY32                       N5PF.                               
      @1573   PRDAY33                       N5PF.                               
      @1578   PRDAY34                       N5PF.                               
      @1583   PRDAY35                       N5PF.                               
      @1588   PRDAY36                       N5PF.                               
      @1593   PRDAY37                       N5PF.                               
      @1598   PRDAY38                       N5PF.                               
      @1603   PRDAY39                       N5PF.                               
      @1608   PRDAY40                       N5PF.                               
      @1613   PRDAY41                       N5PF.                               
      @1618   PRDAY42                       N5PF.                               
      @1623   PRDAY43                       N5PF.                               
      @1628   PRDAY44                       N5PF.                               
      @1633   PRDAY45                       N5PF.                               
      @1638   PRDAY46                       N5PF.                               
      @1643   PRDAY47                       N5PF.                               
      @1648   PRDAY48                       N5PF.                               
      @1653   PRDAY49                       N5PF.                               
      @1658   PRDAY50                       N5PF.                               
      @1663   PRVER                         N3PF.                               
      @1666   PSTATE                        $CHAR2.                             
      @1668   PSTCO                         N5PF.                               
      @1673   PSTCO2                        N5PF.                               
      @1678   RACE                          N2PF.                               
      @1680   RACE_X                        $CHAR3.                             
      @1683   TOTCHG                        N10PF.                              
      @1693   TOTCHG_X                      N15P2F.                             
      @1708   TRAN_IN                       N2PF.                               
      @1710   TRAN_OUT                      N2PF.                               
      @1712   YEAR                          N4PF.                               
      @1716   ZIP                           $CHAR5.                             
      @1721   ZIP3                          $CHAR3.                             
      @1724   ZIPINC_QRTL                   N3PF.                               
      @1727   HOSPID                        N5PF.                               
      @1732   AYEAR                         N4PF.                               
      @1736   BMONTH                        N2PF.                               
      @1738   BYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
