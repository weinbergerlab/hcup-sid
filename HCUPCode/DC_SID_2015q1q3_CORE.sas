/*******************************************************************            
* Creation Date: 11/29/2017                                                     
*   DC_SID_2015q1q3_CORE.SAS:                                                   
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
DATA DC_SIDC_2015q1q3_CORE;                                                     
INFILE 'DC_SID_2015q1q3_CORE.ASC' FIRSTOBS=3 LRECL = 1741;                      
                                                                                
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
                                                                                
  DX_Admitting               LENGTH=$7                                          
  LABEL="Admitting Diagnosis Code"                                              
                                                                                
  DX1                        LENGTH=$7                                          
  LABEL="Diagnosis 1"                                                           
                                                                                
  DX2                        LENGTH=$7                                          
  LABEL="Diagnosis 2"                                                           
                                                                                
  DX3                        LENGTH=$7                                          
  LABEL="Diagnosis 3"                                                           
                                                                                
  DX4                        LENGTH=$7                                          
  LABEL="Diagnosis 4"                                                           
                                                                                
  DX5                        LENGTH=$7                                          
  LABEL="Diagnosis 5"                                                           
                                                                                
  DX6                        LENGTH=$7                                          
  LABEL="Diagnosis 6"                                                           
                                                                                
  DX7                        LENGTH=$7                                          
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                        LENGTH=$7                                          
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                        LENGTH=$7                                          
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10                       LENGTH=$7                                          
  LABEL="Diagnosis 10"                                                          
                                                                                
  DX11                       LENGTH=$7                                          
  LABEL="Diagnosis 11"                                                          
                                                                                
  DX12                       LENGTH=$7                                          
  LABEL="Diagnosis 12"                                                          
                                                                                
  DX13                       LENGTH=$7                                          
  LABEL="Diagnosis 13"                                                          
                                                                                
  DX14                       LENGTH=$7                                          
  LABEL="Diagnosis 14"                                                          
                                                                                
  DX15                       LENGTH=$7                                          
  LABEL="Diagnosis 15"                                                          
                                                                                
  DX16                       LENGTH=$7                                          
  LABEL="Diagnosis 16"                                                          
                                                                                
  DX17                       LENGTH=$7                                          
  LABEL="Diagnosis 17"                                                          
                                                                                
  DX18                       LENGTH=$7                                          
  LABEL="Diagnosis 18"                                                          
                                                                                
  DX19                       LENGTH=$7                                          
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20                       LENGTH=$7                                          
  LABEL="Diagnosis 20"                                                          
                                                                                
  DX21                       LENGTH=$7                                          
  LABEL="Diagnosis 21"                                                          
                                                                                
  DX22                       LENGTH=$7                                          
  LABEL="Diagnosis 22"                                                          
                                                                                
  DX23                       LENGTH=$7                                          
  LABEL="Diagnosis 23"                                                          
                                                                                
  DX24                       LENGTH=$7                                          
  LABEL="Diagnosis 24"                                                          
                                                                                
  DX25                       LENGTH=$7                                          
  LABEL="Diagnosis 25"                                                          
                                                                                
  DX26                       LENGTH=$7                                          
  LABEL="Diagnosis 26"                                                          
                                                                                
  DX27                       LENGTH=$7                                          
  LABEL="Diagnosis 27"                                                          
                                                                                
  DX28                       LENGTH=$7                                          
  LABEL="Diagnosis 28"                                                          
                                                                                
  DX29                       LENGTH=$7                                          
  LABEL="Diagnosis 29"                                                          
                                                                                
  DX30                       LENGTH=$7                                          
  LABEL="Diagnosis 30"                                                          
                                                                                
  DX31                       LENGTH=$7                                          
  LABEL="Diagnosis 31"                                                          
                                                                                
  DX32                       LENGTH=$7                                          
  LABEL="Diagnosis 32"                                                          
                                                                                
  DX33                       LENGTH=$7                                          
  LABEL="Diagnosis 33"                                                          
                                                                                
  DX34                       LENGTH=$7                                          
  LABEL="Diagnosis 34"                                                          
                                                                                
  DX35                       LENGTH=$7                                          
  LABEL="Diagnosis 35"                                                          
                                                                                
  DX36                       LENGTH=$7                                          
  LABEL="Diagnosis 36"                                                          
                                                                                
  DX37                       LENGTH=$7                                          
  LABEL="Diagnosis 37"                                                          
                                                                                
  DX38                       LENGTH=$7                                          
  LABEL="Diagnosis 38"                                                          
                                                                                
  DX39                       LENGTH=$7                                          
  LABEL="Diagnosis 39"                                                          
                                                                                
  DX40                       LENGTH=$7                                          
  LABEL="Diagnosis 40"                                                          
                                                                                
  DX41                       LENGTH=$7                                          
  LABEL="Diagnosis 41"                                                          
                                                                                
  DX42                       LENGTH=$7                                          
  LABEL="Diagnosis 42"                                                          
                                                                                
  DX43                       LENGTH=$7                                          
  LABEL="Diagnosis 43"                                                          
                                                                                
  DX44                       LENGTH=$7                                          
  LABEL="Diagnosis 44"                                                          
                                                                                
  DX45                       LENGTH=$7                                          
  LABEL="Diagnosis 45"                                                          
                                                                                
  DX46                       LENGTH=$7                                          
  LABEL="Diagnosis 46"                                                          
                                                                                
  DX47                       LENGTH=$7                                          
  LABEL="Diagnosis 47"                                                          
                                                                                
  DX48                       LENGTH=$7                                          
  LABEL="Diagnosis 48"                                                          
                                                                                
  DX49                       LENGTH=$7                                          
  LABEL="Diagnosis 49"                                                          
                                                                                
  DX50                       LENGTH=$7                                          
  LABEL="Diagnosis 50"                                                          
                                                                                
  DXCCS1                     LENGTH=4                                           
  LABEL="CCS: diagnosis 1"                                                      
                                                                                
  DXCCS2                     LENGTH=4                                           
  LABEL="CCS: diagnosis 2"                                                      
                                                                                
  DXCCS3                     LENGTH=4                                           
  LABEL="CCS: diagnosis 3"                                                      
                                                                                
  DXCCS4                     LENGTH=4                                           
  LABEL="CCS: diagnosis 4"                                                      
                                                                                
  DXCCS5                     LENGTH=4                                           
  LABEL="CCS: diagnosis 5"                                                      
                                                                                
  DXCCS6                     LENGTH=4                                           
  LABEL="CCS: diagnosis 6"                                                      
                                                                                
  DXCCS7                     LENGTH=4                                           
  LABEL="CCS: diagnosis 7"                                                      
                                                                                
  DXCCS8                     LENGTH=4                                           
  LABEL="CCS: diagnosis 8"                                                      
                                                                                
  DXCCS9                     LENGTH=4                                           
  LABEL="CCS: diagnosis 9"                                                      
                                                                                
  DXCCS10                    LENGTH=4                                           
  LABEL="CCS: diagnosis 10"                                                     
                                                                                
  DXCCS11                    LENGTH=4                                           
  LABEL="CCS: diagnosis 11"                                                     
                                                                                
  DXCCS12                    LENGTH=4                                           
  LABEL="CCS: diagnosis 12"                                                     
                                                                                
  DXCCS13                    LENGTH=4                                           
  LABEL="CCS: diagnosis 13"                                                     
                                                                                
  DXCCS14                    LENGTH=4                                           
  LABEL="CCS: diagnosis 14"                                                     
                                                                                
  DXCCS15                    LENGTH=4                                           
  LABEL="CCS: diagnosis 15"                                                     
                                                                                
  DXCCS16                    LENGTH=4                                           
  LABEL="CCS: diagnosis 16"                                                     
                                                                                
  DXCCS17                    LENGTH=4                                           
  LABEL="CCS: diagnosis 17"                                                     
                                                                                
  DXCCS18                    LENGTH=4                                           
  LABEL="CCS: diagnosis 18"                                                     
                                                                                
  DXCCS19                    LENGTH=4                                           
  LABEL="CCS: diagnosis 19"                                                     
                                                                                
  DXCCS20                    LENGTH=4                                           
  LABEL="CCS: diagnosis 20"                                                     
                                                                                
  DXCCS21                    LENGTH=4                                           
  LABEL="CCS: diagnosis 21"                                                     
                                                                                
  DXCCS22                    LENGTH=4                                           
  LABEL="CCS: diagnosis 22"                                                     
                                                                                
  DXCCS23                    LENGTH=4                                           
  LABEL="CCS: diagnosis 23"                                                     
                                                                                
  DXCCS24                    LENGTH=4                                           
  LABEL="CCS: diagnosis 24"                                                     
                                                                                
  DXCCS25                    LENGTH=4                                           
  LABEL="CCS: diagnosis 25"                                                     
                                                                                
  DXCCS26                    LENGTH=4                                           
  LABEL="CCS: diagnosis 26"                                                     
                                                                                
  DXCCS27                    LENGTH=4                                           
  LABEL="CCS: diagnosis 27"                                                     
                                                                                
  DXCCS28                    LENGTH=4                                           
  LABEL="CCS: diagnosis 28"                                                     
                                                                                
  DXCCS29                    LENGTH=4                                           
  LABEL="CCS: diagnosis 29"                                                     
                                                                                
  DXCCS30                    LENGTH=4                                           
  LABEL="CCS: diagnosis 30"                                                     
                                                                                
  DXCCS31                    LENGTH=4                                           
  LABEL="CCS: diagnosis 31"                                                     
                                                                                
  DXCCS32                    LENGTH=4                                           
  LABEL="CCS: diagnosis 32"                                                     
                                                                                
  DXCCS33                    LENGTH=4                                           
  LABEL="CCS: diagnosis 33"                                                     
                                                                                
  DXCCS34                    LENGTH=4                                           
  LABEL="CCS: diagnosis 34"                                                     
                                                                                
  DXCCS35                    LENGTH=4                                           
  LABEL="CCS: diagnosis 35"                                                     
                                                                                
  DXCCS36                    LENGTH=4                                           
  LABEL="CCS: diagnosis 36"                                                     
                                                                                
  DXCCS37                    LENGTH=4                                           
  LABEL="CCS: diagnosis 37"                                                     
                                                                                
  DXCCS38                    LENGTH=4                                           
  LABEL="CCS: diagnosis 38"                                                     
                                                                                
  DXCCS39                    LENGTH=4                                           
  LABEL="CCS: diagnosis 39"                                                     
                                                                                
  DXCCS40                    LENGTH=4                                           
  LABEL="CCS: diagnosis 40"                                                     
                                                                                
  DXCCS41                    LENGTH=4                                           
  LABEL="CCS: diagnosis 41"                                                     
                                                                                
  DXCCS42                    LENGTH=4                                           
  LABEL="CCS: diagnosis 42"                                                     
                                                                                
  DXCCS43                    LENGTH=4                                           
  LABEL="CCS: diagnosis 43"                                                     
                                                                                
  DXCCS44                    LENGTH=4                                           
  LABEL="CCS: diagnosis 44"                                                     
                                                                                
  DXCCS45                    LENGTH=4                                           
  LABEL="CCS: diagnosis 45"                                                     
                                                                                
  DXCCS46                    LENGTH=4                                           
  LABEL="CCS: diagnosis 46"                                                     
                                                                                
  DXCCS47                    LENGTH=4                                           
  LABEL="CCS: diagnosis 47"                                                     
                                                                                
  DXCCS48                    LENGTH=4                                           
  LABEL="CCS: diagnosis 48"                                                     
                                                                                
  DXCCS49                    LENGTH=4                                           
  LABEL="CCS: diagnosis 49"                                                     
                                                                                
  DXCCS50                    LENGTH=4                                           
  LABEL="CCS: diagnosis 50"                                                     
                                                                                
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
                                                                                
  E_CCS1                     LENGTH=3                                           
  LABEL="CCS: E Code 1"                                                         
                                                                                
  E_CCS2                     LENGTH=3                                           
  LABEL="CCS: E Code 2"                                                         
                                                                                
  E_CCS3                     LENGTH=3                                           
  LABEL="CCS: E Code 3"                                                         
                                                                                
  E_CCS4                     LENGTH=3                                           
  LABEL="CCS: E Code 4"                                                         
                                                                                
  E_CCS5                     LENGTH=3                                           
  LABEL="CCS: E Code 5"                                                         
                                                                                
  E_CCS6                     LENGTH=3                                           
  LABEL="CCS: E Code 6"                                                         
                                                                                
  E_CCS7                     LENGTH=3                                           
  LABEL="CCS: E Code 7"                                                         
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="E Code 1, present on admission indicator"                              
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="E Code 2, present on admission indicator"                              
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="E Code 3, present on admission indicator"                              
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="E Code 4, present on admission indicator"                              
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="E Code 5, present on admission indicator"                              
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="E Code 6, present on admission indicator"                              
                                                                                
  E_POA7                     LENGTH=$1                                          
  LABEL="E Code 7, present on admission indicator"                              
                                                                                
  ECODE1                     LENGTH=$7                                          
  LABEL="E code 1"                                                              
                                                                                
  ECODE2                     LENGTH=$7                                          
  LABEL="E code 2"                                                              
                                                                                
  ECODE3                     LENGTH=$7                                          
  LABEL="E code 3"                                                              
                                                                                
  ECODE4                     LENGTH=$7                                          
  LABEL="E code 4"                                                              
                                                                                
  ECODE5                     LENGTH=$7                                          
  LABEL="E code 5"                                                              
                                                                                
  ECODE6                     LENGTH=$7                                          
  LABEL="E code 6"                                                              
                                                                                
  ECODE7                     LENGTH=$7                                          
  LABEL="E code 7"                                                              
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
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
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                        LENGTH=3                                           
  LABEL="Number of procedures on this record"                                   
                                                                                
  ORPROC                     LENGTH=3                                           
  LABEL="Major operating room procedure indicator"                              
                                                                                
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
                                                                                
  PR1                        LENGTH=$7                                          
  LABEL="Procedure 1"                                                           
                                                                                
  PR2                        LENGTH=$7                                          
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                        LENGTH=$7                                          
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                        LENGTH=$7                                          
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                        LENGTH=$7                                          
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                        LENGTH=$7                                          
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                        LENGTH=$7                                          
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                        LENGTH=$7                                          
  LABEL="Procedure 8"                                                           
                                                                                
  PR9                        LENGTH=$7                                          
  LABEL="Procedure 9"                                                           
                                                                                
  PR10                       LENGTH=$7                                          
  LABEL="Procedure 10"                                                          
                                                                                
  PR11                       LENGTH=$7                                          
  LABEL="Procedure 11"                                                          
                                                                                
  PR12                       LENGTH=$7                                          
  LABEL="Procedure 12"                                                          
                                                                                
  PR13                       LENGTH=$7                                          
  LABEL="Procedure 13"                                                          
                                                                                
  PR14                       LENGTH=$7                                          
  LABEL="Procedure 14"                                                          
                                                                                
  PR15                       LENGTH=$7                                          
  LABEL="Procedure 15"                                                          
                                                                                
  PR16                       LENGTH=$7                                          
  LABEL="Procedure 16"                                                          
                                                                                
  PR17                       LENGTH=$7                                          
  LABEL="Procedure 17"                                                          
                                                                                
  PR18                       LENGTH=$7                                          
  LABEL="Procedure 18"                                                          
                                                                                
  PR19                       LENGTH=$7                                          
  LABEL="Procedure 19"                                                          
                                                                                
  PR20                       LENGTH=$7                                          
  LABEL="Procedure 20"                                                          
                                                                                
  PR21                       LENGTH=$7                                          
  LABEL="Procedure 21"                                                          
                                                                                
  PR22                       LENGTH=$7                                          
  LABEL="Procedure 22"                                                          
                                                                                
  PR23                       LENGTH=$7                                          
  LABEL="Procedure 23"                                                          
                                                                                
  PR24                       LENGTH=$7                                          
  LABEL="Procedure 24"                                                          
                                                                                
  PR25                       LENGTH=$7                                          
  LABEL="Procedure 25"                                                          
                                                                                
  PR26                       LENGTH=$7                                          
  LABEL="Procedure 26"                                                          
                                                                                
  PR27                       LENGTH=$7                                          
  LABEL="Procedure 27"                                                          
                                                                                
  PR28                       LENGTH=$7                                          
  LABEL="Procedure 28"                                                          
                                                                                
  PR29                       LENGTH=$7                                          
  LABEL="Procedure 29"                                                          
                                                                                
  PR30                       LENGTH=$7                                          
  LABEL="Procedure 30"                                                          
                                                                                
  PR31                       LENGTH=$7                                          
  LABEL="Procedure 31"                                                          
                                                                                
  PR32                       LENGTH=$7                                          
  LABEL="Procedure 32"                                                          
                                                                                
  PR33                       LENGTH=$7                                          
  LABEL="Procedure 33"                                                          
                                                                                
  PR34                       LENGTH=$7                                          
  LABEL="Procedure 34"                                                          
                                                                                
  PR35                       LENGTH=$7                                          
  LABEL="Procedure 35"                                                          
                                                                                
  PR36                       LENGTH=$7                                          
  LABEL="Procedure 36"                                                          
                                                                                
  PR37                       LENGTH=$7                                          
  LABEL="Procedure 37"                                                          
                                                                                
  PR38                       LENGTH=$7                                          
  LABEL="Procedure 38"                                                          
                                                                                
  PR39                       LENGTH=$7                                          
  LABEL="Procedure 39"                                                          
                                                                                
  PR40                       LENGTH=$7                                          
  LABEL="Procedure 40"                                                          
                                                                                
  PR41                       LENGTH=$7                                          
  LABEL="Procedure 41"                                                          
                                                                                
  PR42                       LENGTH=$7                                          
  LABEL="Procedure 42"                                                          
                                                                                
  PR43                       LENGTH=$7                                          
  LABEL="Procedure 43"                                                          
                                                                                
  PR44                       LENGTH=$7                                          
  LABEL="Procedure 44"                                                          
                                                                                
  PR45                       LENGTH=$7                                          
  LABEL="Procedure 45"                                                          
                                                                                
  PR46                       LENGTH=$7                                          
  LABEL="Procedure 46"                                                          
                                                                                
  PR47                       LENGTH=$7                                          
  LABEL="Procedure 47"                                                          
                                                                                
  PR48                       LENGTH=$7                                          
  LABEL="Procedure 48"                                                          
                                                                                
  PR49                       LENGTH=$7                                          
  LABEL="Procedure 49"                                                          
                                                                                
  PR50                       LENGTH=$7                                          
  LABEL="Procedure 50"                                                          
                                                                                
  PRCCS1                     LENGTH=3                                           
  LABEL="CCS: procedure 1"                                                      
                                                                                
  PRCCS2                     LENGTH=3                                           
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3                     LENGTH=3                                           
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4                     LENGTH=3                                           
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PRCCS5                     LENGTH=3                                           
  LABEL="CCS: procedure 5"                                                      
                                                                                
  PRCCS6                     LENGTH=3                                           
  LABEL="CCS: procedure 6"                                                      
                                                                                
  PRCCS7                     LENGTH=3                                           
  LABEL="CCS: procedure 7"                                                      
                                                                                
  PRCCS8                     LENGTH=3                                           
  LABEL="CCS: procedure 8"                                                      
                                                                                
  PRCCS9                     LENGTH=3                                           
  LABEL="CCS: procedure 9"                                                      
                                                                                
  PRCCS10                    LENGTH=3                                           
  LABEL="CCS: procedure 10"                                                     
                                                                                
  PRCCS11                    LENGTH=3                                           
  LABEL="CCS: procedure 11"                                                     
                                                                                
  PRCCS12                    LENGTH=3                                           
  LABEL="CCS: procedure 12"                                                     
                                                                                
  PRCCS13                    LENGTH=3                                           
  LABEL="CCS: procedure 13"                                                     
                                                                                
  PRCCS14                    LENGTH=3                                           
  LABEL="CCS: procedure 14"                                                     
                                                                                
  PRCCS15                    LENGTH=3                                           
  LABEL="CCS: procedure 15"                                                     
                                                                                
  PRCCS16                    LENGTH=3                                           
  LABEL="CCS: procedure 16"                                                     
                                                                                
  PRCCS17                    LENGTH=3                                           
  LABEL="CCS: procedure 17"                                                     
                                                                                
  PRCCS18                    LENGTH=3                                           
  LABEL="CCS: procedure 18"                                                     
                                                                                
  PRCCS19                    LENGTH=3                                           
  LABEL="CCS: procedure 19"                                                     
                                                                                
  PRCCS20                    LENGTH=3                                           
  LABEL="CCS: procedure 20"                                                     
                                                                                
  PRCCS21                    LENGTH=3                                           
  LABEL="CCS: procedure 21"                                                     
                                                                                
  PRCCS22                    LENGTH=3                                           
  LABEL="CCS: procedure 22"                                                     
                                                                                
  PRCCS23                    LENGTH=3                                           
  LABEL="CCS: procedure 23"                                                     
                                                                                
  PRCCS24                    LENGTH=3                                           
  LABEL="CCS: procedure 24"                                                     
                                                                                
  PRCCS25                    LENGTH=3                                           
  LABEL="CCS: procedure 25"                                                     
                                                                                
  PRCCS26                    LENGTH=3                                           
  LABEL="CCS: procedure 26"                                                     
                                                                                
  PRCCS27                    LENGTH=3                                           
  LABEL="CCS: procedure 27"                                                     
                                                                                
  PRCCS28                    LENGTH=3                                           
  LABEL="CCS: procedure 28"                                                     
                                                                                
  PRCCS29                    LENGTH=3                                           
  LABEL="CCS: procedure 29"                                                     
                                                                                
  PRCCS30                    LENGTH=3                                           
  LABEL="CCS: procedure 30"                                                     
                                                                                
  PRCCS31                    LENGTH=3                                           
  LABEL="CCS: procedure 31"                                                     
                                                                                
  PRCCS32                    LENGTH=3                                           
  LABEL="CCS: procedure 32"                                                     
                                                                                
  PRCCS33                    LENGTH=3                                           
  LABEL="CCS: procedure 33"                                                     
                                                                                
  PRCCS34                    LENGTH=3                                           
  LABEL="CCS: procedure 34"                                                     
                                                                                
  PRCCS35                    LENGTH=3                                           
  LABEL="CCS: procedure 35"                                                     
                                                                                
  PRCCS36                    LENGTH=3                                           
  LABEL="CCS: procedure 36"                                                     
                                                                                
  PRCCS37                    LENGTH=3                                           
  LABEL="CCS: procedure 37"                                                     
                                                                                
  PRCCS38                    LENGTH=3                                           
  LABEL="CCS: procedure 38"                                                     
                                                                                
  PRCCS39                    LENGTH=3                                           
  LABEL="CCS: procedure 39"                                                     
                                                                                
  PRCCS40                    LENGTH=3                                           
  LABEL="CCS: procedure 40"                                                     
                                                                                
  PRCCS41                    LENGTH=3                                           
  LABEL="CCS: procedure 41"                                                     
                                                                                
  PRCCS42                    LENGTH=3                                           
  LABEL="CCS: procedure 42"                                                     
                                                                                
  PRCCS43                    LENGTH=3                                           
  LABEL="CCS: procedure 43"                                                     
                                                                                
  PRCCS44                    LENGTH=3                                           
  LABEL="CCS: procedure 44"                                                     
                                                                                
  PRCCS45                    LENGTH=3                                           
  LABEL="CCS: procedure 45"                                                     
                                                                                
  PRCCS46                    LENGTH=3                                           
  LABEL="CCS: procedure 46"                                                     
                                                                                
  PRCCS47                    LENGTH=3                                           
  LABEL="CCS: procedure 47"                                                     
                                                                                
  PRCCS48                    LENGTH=3                                           
  LABEL="CCS: procedure 48"                                                     
                                                                                
  PRCCS49                    LENGTH=3                                           
  LABEL="CCS: procedure 49"                                                     
                                                                                
  PRCCS50                    LENGTH=3                                           
  LABEL="CCS: procedure 50"                                                     
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="Number of days from admission to PR2"                                  
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="Number of days from admission to PR3"                                  
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="Number of days from admission to PR4"                                  
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="Number of days from admission to PR5"                                  
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="Number of days from admission to PR6"                                  
                                                                                
  PRDAY7                     LENGTH=4                                           
  LABEL="Number of days from admission to PR7"                                  
                                                                                
  PRDAY8                     LENGTH=4                                           
  LABEL="Number of days from admission to PR8"                                  
                                                                                
  PRDAY9                     LENGTH=4                                           
  LABEL="Number of days from admission to PR9"                                  
                                                                                
  PRDAY10                    LENGTH=4                                           
  LABEL="Number of days from admission to PR10"                                 
                                                                                
  PRDAY11                    LENGTH=4                                           
  LABEL="Number of days from admission to PR11"                                 
                                                                                
  PRDAY12                    LENGTH=4                                           
  LABEL="Number of days from admission to PR12"                                 
                                                                                
  PRDAY13                    LENGTH=4                                           
  LABEL="Number of days from admission to PR13"                                 
                                                                                
  PRDAY14                    LENGTH=4                                           
  LABEL="Number of days from admission to PR14"                                 
                                                                                
  PRDAY15                    LENGTH=4                                           
  LABEL="Number of days from admission to PR15"                                 
                                                                                
  PRDAY16                    LENGTH=4                                           
  LABEL="Number of days from admission to PR16"                                 
                                                                                
  PRDAY17                    LENGTH=4                                           
  LABEL="Number of days from admission to PR17"                                 
                                                                                
  PRDAY18                    LENGTH=4                                           
  LABEL="Number of days from admission to PR18"                                 
                                                                                
  PRDAY19                    LENGTH=4                                           
  LABEL="Number of days from admission to PR19"                                 
                                                                                
  PRDAY20                    LENGTH=4                                           
  LABEL="Number of days from admission to PR20"                                 
                                                                                
  PRDAY21                    LENGTH=4                                           
  LABEL="Number of days from admission to PR21"                                 
                                                                                
  PRDAY22                    LENGTH=4                                           
  LABEL="Number of days from admission to PR22"                                 
                                                                                
  PRDAY23                    LENGTH=4                                           
  LABEL="Number of days from admission to PR23"                                 
                                                                                
  PRDAY24                    LENGTH=4                                           
  LABEL="Number of days from admission to PR24"                                 
                                                                                
  PRDAY25                    LENGTH=4                                           
  LABEL="Number of days from admission to PR25"                                 
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to PR26"                                 
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to PR27"                                 
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to PR28"                                 
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to PR29"                                 
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to PR30"                                 
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to PR31"                                 
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to PR32"                                 
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to PR33"                                 
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to PR34"                                 
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to PR35"                                 
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to PR36"                                 
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to PR37"                                 
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to PR38"                                 
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to PR39"                                 
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to PR40"                                 
                                                                                
  PRDAY41                    LENGTH=4                                           
  LABEL="Number of days from admission to PR41"                                 
                                                                                
  PRDAY42                    LENGTH=4                                           
  LABEL="Number of days from admission to PR42"                                 
                                                                                
  PRDAY43                    LENGTH=4                                           
  LABEL="Number of days from admission to PR43"                                 
                                                                                
  PRDAY44                    LENGTH=4                                           
  LABEL="Number of days from admission to PR44"                                 
                                                                                
  PRDAY45                    LENGTH=4                                           
  LABEL="Number of days from admission to PR45"                                 
                                                                                
  PRDAY46                    LENGTH=4                                           
  LABEL="Number of days from admission to PR46"                                 
                                                                                
  PRDAY47                    LENGTH=4                                           
  LABEL="Number of days from admission to PR47"                                 
                                                                                
  PRDAY48                    LENGTH=4                                           
  LABEL="Number of days from admission to PR48"                                 
                                                                                
  PRDAY49                    LENGTH=4                                           
  LABEL="Number of days from admission to PR49"                                 
                                                                                
  PRDAY50                    LENGTH=4                                           
  LABEL="Number of days from admission to PR50"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
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
                                                                                
  SERVICELINE                LENGTH=3                                           
  LABEL="Hospital Service Line"                                                 
                                                                                
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
      @55     DX_Admitting                  $CHAR7.                             
      @62     DX1                           $CHAR7.                             
      @69     DX2                           $CHAR7.                             
      @76     DX3                           $CHAR7.                             
      @83     DX4                           $CHAR7.                             
      @90     DX5                           $CHAR7.                             
      @97     DX6                           $CHAR7.                             
      @104    DX7                           $CHAR7.                             
      @111    DX8                           $CHAR7.                             
      @118    DX9                           $CHAR7.                             
      @125    DX10                          $CHAR7.                             
      @132    DX11                          $CHAR7.                             
      @139    DX12                          $CHAR7.                             
      @146    DX13                          $CHAR7.                             
      @153    DX14                          $CHAR7.                             
      @160    DX15                          $CHAR7.                             
      @167    DX16                          $CHAR7.                             
      @174    DX17                          $CHAR7.                             
      @181    DX18                          $CHAR7.                             
      @188    DX19                          $CHAR7.                             
      @195    DX20                          $CHAR7.                             
      @202    DX21                          $CHAR7.                             
      @209    DX22                          $CHAR7.                             
      @216    DX23                          $CHAR7.                             
      @223    DX24                          $CHAR7.                             
      @230    DX25                          $CHAR7.                             
      @237    DX26                          $CHAR7.                             
      @244    DX27                          $CHAR7.                             
      @251    DX28                          $CHAR7.                             
      @258    DX29                          $CHAR7.                             
      @265    DX30                          $CHAR7.                             
      @272    DX31                          $CHAR7.                             
      @279    DX32                          $CHAR7.                             
      @286    DX33                          $CHAR7.                             
      @293    DX34                          $CHAR7.                             
      @300    DX35                          $CHAR7.                             
      @307    DX36                          $CHAR7.                             
      @314    DX37                          $CHAR7.                             
      @321    DX38                          $CHAR7.                             
      @328    DX39                          $CHAR7.                             
      @335    DX40                          $CHAR7.                             
      @342    DX41                          $CHAR7.                             
      @349    DX42                          $CHAR7.                             
      @356    DX43                          $CHAR7.                             
      @363    DX44                          $CHAR7.                             
      @370    DX45                          $CHAR7.                             
      @377    DX46                          $CHAR7.                             
      @384    DX47                          $CHAR7.                             
      @391    DX48                          $CHAR7.                             
      @398    DX49                          $CHAR7.                             
      @405    DX50                          $CHAR7.                             
      @412    DXCCS1                        N4PF.                               
      @416    DXCCS2                        N4PF.                               
      @420    DXCCS3                        N4PF.                               
      @424    DXCCS4                        N4PF.                               
      @428    DXCCS5                        N4PF.                               
      @432    DXCCS6                        N4PF.                               
      @436    DXCCS7                        N4PF.                               
      @440    DXCCS8                        N4PF.                               
      @444    DXCCS9                        N4PF.                               
      @448    DXCCS10                       N4PF.                               
      @452    DXCCS11                       N4PF.                               
      @456    DXCCS12                       N4PF.                               
      @460    DXCCS13                       N4PF.                               
      @464    DXCCS14                       N4PF.                               
      @468    DXCCS15                       N4PF.                               
      @472    DXCCS16                       N4PF.                               
      @476    DXCCS17                       N4PF.                               
      @480    DXCCS18                       N4PF.                               
      @484    DXCCS19                       N4PF.                               
      @488    DXCCS20                       N4PF.                               
      @492    DXCCS21                       N4PF.                               
      @496    DXCCS22                       N4PF.                               
      @500    DXCCS23                       N4PF.                               
      @504    DXCCS24                       N4PF.                               
      @508    DXCCS25                       N4PF.                               
      @512    DXCCS26                       N4PF.                               
      @516    DXCCS27                       N4PF.                               
      @520    DXCCS28                       N4PF.                               
      @524    DXCCS29                       N4PF.                               
      @528    DXCCS30                       N4PF.                               
      @532    DXCCS31                       N4PF.                               
      @536    DXCCS32                       N4PF.                               
      @540    DXCCS33                       N4PF.                               
      @544    DXCCS34                       N4PF.                               
      @548    DXCCS35                       N4PF.                               
      @552    DXCCS36                       N4PF.                               
      @556    DXCCS37                       N4PF.                               
      @560    DXCCS38                       N4PF.                               
      @564    DXCCS39                       N4PF.                               
      @568    DXCCS40                       N4PF.                               
      @572    DXCCS41                       N4PF.                               
      @576    DXCCS42                       N4PF.                               
      @580    DXCCS43                       N4PF.                               
      @584    DXCCS44                       N4PF.                               
      @588    DXCCS45                       N4PF.                               
      @592    DXCCS46                       N4PF.                               
      @596    DXCCS47                       N4PF.                               
      @600    DXCCS48                       N4PF.                               
      @604    DXCCS49                       N4PF.                               
      @608    DXCCS50                       N4PF.                               
      @612    DXPOA1                        $CHAR1.                             
      @613    DXPOA2                        $CHAR1.                             
      @614    DXPOA3                        $CHAR1.                             
      @615    DXPOA4                        $CHAR1.                             
      @616    DXPOA5                        $CHAR1.                             
      @617    DXPOA6                        $CHAR1.                             
      @618    DXPOA7                        $CHAR1.                             
      @619    DXPOA8                        $CHAR1.                             
      @620    DXPOA9                        $CHAR1.                             
      @621    DXPOA10                       $CHAR1.                             
      @622    DXPOA11                       $CHAR1.                             
      @623    DXPOA12                       $CHAR1.                             
      @624    DXPOA13                       $CHAR1.                             
      @625    DXPOA14                       $CHAR1.                             
      @626    DXPOA15                       $CHAR1.                             
      @627    DXPOA16                       $CHAR1.                             
      @628    DXPOA17                       $CHAR1.                             
      @629    DXPOA18                       $CHAR1.                             
      @630    DXPOA19                       $CHAR1.                             
      @631    DXPOA20                       $CHAR1.                             
      @632    DXPOA21                       $CHAR1.                             
      @633    DXPOA22                       $CHAR1.                             
      @634    DXPOA23                       $CHAR1.                             
      @635    DXPOA24                       $CHAR1.                             
      @636    DXPOA25                       $CHAR1.                             
      @637    DXPOA26                       $CHAR1.                             
      @638    DXPOA27                       $CHAR1.                             
      @639    DXPOA28                       $CHAR1.                             
      @640    DXPOA29                       $CHAR1.                             
      @641    DXPOA30                       $CHAR1.                             
      @642    DXPOA31                       $CHAR1.                             
      @643    DXPOA32                       $CHAR1.                             
      @644    DXPOA33                       $CHAR1.                             
      @645    DXPOA34                       $CHAR1.                             
      @646    DXPOA35                       $CHAR1.                             
      @647    DXPOA36                       $CHAR1.                             
      @648    DXPOA37                       $CHAR1.                             
      @649    DXPOA38                       $CHAR1.                             
      @650    DXPOA39                       $CHAR1.                             
      @651    DXPOA40                       $CHAR1.                             
      @652    DXPOA41                       $CHAR1.                             
      @653    DXPOA42                       $CHAR1.                             
      @654    DXPOA43                       $CHAR1.                             
      @655    DXPOA44                       $CHAR1.                             
      @656    DXPOA45                       $CHAR1.                             
      @657    DXPOA46                       $CHAR1.                             
      @658    DXPOA47                       $CHAR1.                             
      @659    DXPOA48                       $CHAR1.                             
      @660    DXPOA49                       $CHAR1.                             
      @661    DXPOA50                       $CHAR1.                             
      @662    DXVER                         N3PF.                               
      @665    E_CCS1                        N4PF.                               
      @669    E_CCS2                        N4PF.                               
      @673    E_CCS3                        N4PF.                               
      @677    E_CCS4                        N4PF.                               
      @681    E_CCS5                        N4PF.                               
      @685    E_CCS6                        N4PF.                               
      @689    E_CCS7                        N4PF.                               
      @693    E_POA1                        $CHAR1.                             
      @694    E_POA2                        $CHAR1.                             
      @695    E_POA3                        $CHAR1.                             
      @696    E_POA4                        $CHAR1.                             
      @697    E_POA5                        $CHAR1.                             
      @698    E_POA6                        $CHAR1.                             
      @699    E_POA7                        $CHAR1.                             
      @700    ECODE1                        $CHAR7.                             
      @707    ECODE2                        $CHAR7.                             
      @714    ECODE3                        $CHAR7.                             
      @721    ECODE4                        $CHAR7.                             
      @728    ECODE5                        $CHAR7.                             
      @735    ECODE6                        $CHAR7.                             
      @742    ECODE7                        $CHAR7.                             
      @749    FEMALE                        N2PF.                               
      @751    HCUP_ED                       N2PF.                               
      @753    HCUP_OS                       N2PF.                               
      @755    HOSPBRTH                      N3PF.                               
      @758    HOSPST                        $CHAR2.                             
      @760    KEY                           15.                                 
      @775    LOS                           N5PF.                               
      @780    LOS_X                         N6PF.                               
      @786    MDC                           N2PF.                               
      @788    MDC_NoPOA                     N2PF.                               
      @790    MDC32                         N2PF.                               
      @792    MDNUM1_R                      N9PF.                               
      @801    MDNUM2_R                      N9PF.                               
      @810    MDNUM3_R                      N9PF.                               
      @819    MDNUM4_R                      N9PF.                               
      @828    MEDINCSTQ                     N2PF.                               
      @830    NCHRONIC                      N3PF.                               
      @833    NDX                           N3PF.                               
      @836    NECODE                        N2PF.                               
      @838    NEOMAT                        N2PF.                               
      @840    NPR                           N3PF.                               
      @843    ORPROC                        N2PF.                               
      @845    PAY1                          N2PF.                               
      @847    PAY1_X                        $CHAR8.                             
      @855    PAY2                          N2PF.                               
      @857    PAY2_X                        $CHAR8.                             
      @865    PAY3                          N2PF.                               
      @867    PAY3_X                        $CHAR8.                             
      @875    PL_CBSA                       N3PF.                               
      @878    PL_NCHS                       N2PF.                               
      @880    PL_RUCC                       N2PF.                               
      @882    PL_UIC                        N2PF.                               
      @884    PL_UR_CAT4                    N2PF.                               
      @886    POA_Disch_Edit1               N2PF.                               
      @888    POA_Disch_Edit2               N2PF.                               
      @890    POA_Hosp_Edit1                N2PF.                               
      @892    POA_Hosp_Edit2                N2PF.                               
      @894    POA_Hosp_Edit3                N2PF.                               
      @896    POA_Hosp_Edit3_Value          N8P2F.                              
      @904    PointOfOrigin_X               $CHAR3.                             
      @907    PointOfOriginUB04             $CHAR1.                             
      @908    PR1                           $CHAR7.                             
      @915    PR2                           $CHAR7.                             
      @922    PR3                           $CHAR7.                             
      @929    PR4                           $CHAR7.                             
      @936    PR5                           $CHAR7.                             
      @943    PR6                           $CHAR7.                             
      @950    PR7                           $CHAR7.                             
      @957    PR8                           $CHAR7.                             
      @964    PR9                           $CHAR7.                             
      @971    PR10                          $CHAR7.                             
      @978    PR11                          $CHAR7.                             
      @985    PR12                          $CHAR7.                             
      @992    PR13                          $CHAR7.                             
      @999    PR14                          $CHAR7.                             
      @1006   PR15                          $CHAR7.                             
      @1013   PR16                          $CHAR7.                             
      @1020   PR17                          $CHAR7.                             
      @1027   PR18                          $CHAR7.                             
      @1034   PR19                          $CHAR7.                             
      @1041   PR20                          $CHAR7.                             
      @1048   PR21                          $CHAR7.                             
      @1055   PR22                          $CHAR7.                             
      @1062   PR23                          $CHAR7.                             
      @1069   PR24                          $CHAR7.                             
      @1076   PR25                          $CHAR7.                             
      @1083   PR26                          $CHAR7.                             
      @1090   PR27                          $CHAR7.                             
      @1097   PR28                          $CHAR7.                             
      @1104   PR29                          $CHAR7.                             
      @1111   PR30                          $CHAR7.                             
      @1118   PR31                          $CHAR7.                             
      @1125   PR32                          $CHAR7.                             
      @1132   PR33                          $CHAR7.                             
      @1139   PR34                          $CHAR7.                             
      @1146   PR35                          $CHAR7.                             
      @1153   PR36                          $CHAR7.                             
      @1160   PR37                          $CHAR7.                             
      @1167   PR38                          $CHAR7.                             
      @1174   PR39                          $CHAR7.                             
      @1181   PR40                          $CHAR7.                             
      @1188   PR41                          $CHAR7.                             
      @1195   PR42                          $CHAR7.                             
      @1202   PR43                          $CHAR7.                             
      @1209   PR44                          $CHAR7.                             
      @1216   PR45                          $CHAR7.                             
      @1223   PR46                          $CHAR7.                             
      @1230   PR47                          $CHAR7.                             
      @1237   PR48                          $CHAR7.                             
      @1244   PR49                          $CHAR7.                             
      @1251   PR50                          $CHAR7.                             
      @1258   PRCCS1                        N3PF.                               
      @1261   PRCCS2                        N3PF.                               
      @1264   PRCCS3                        N3PF.                               
      @1267   PRCCS4                        N3PF.                               
      @1270   PRCCS5                        N3PF.                               
      @1273   PRCCS6                        N3PF.                               
      @1276   PRCCS7                        N3PF.                               
      @1279   PRCCS8                        N3PF.                               
      @1282   PRCCS9                        N3PF.                               
      @1285   PRCCS10                       N3PF.                               
      @1288   PRCCS11                       N3PF.                               
      @1291   PRCCS12                       N3PF.                               
      @1294   PRCCS13                       N3PF.                               
      @1297   PRCCS14                       N3PF.                               
      @1300   PRCCS15                       N3PF.                               
      @1303   PRCCS16                       N3PF.                               
      @1306   PRCCS17                       N3PF.                               
      @1309   PRCCS18                       N3PF.                               
      @1312   PRCCS19                       N3PF.                               
      @1315   PRCCS20                       N3PF.                               
      @1318   PRCCS21                       N3PF.                               
      @1321   PRCCS22                       N3PF.                               
      @1324   PRCCS23                       N3PF.                               
      @1327   PRCCS24                       N3PF.                               
      @1330   PRCCS25                       N3PF.                               
      @1333   PRCCS26                       N3PF.                               
      @1336   PRCCS27                       N3PF.                               
      @1339   PRCCS28                       N3PF.                               
      @1342   PRCCS29                       N3PF.                               
      @1345   PRCCS30                       N3PF.                               
      @1348   PRCCS31                       N3PF.                               
      @1351   PRCCS32                       N3PF.                               
      @1354   PRCCS33                       N3PF.                               
      @1357   PRCCS34                       N3PF.                               
      @1360   PRCCS35                       N3PF.                               
      @1363   PRCCS36                       N3PF.                               
      @1366   PRCCS37                       N3PF.                               
      @1369   PRCCS38                       N3PF.                               
      @1372   PRCCS39                       N3PF.                               
      @1375   PRCCS40                       N3PF.                               
      @1378   PRCCS41                       N3PF.                               
      @1381   PRCCS42                       N3PF.                               
      @1384   PRCCS43                       N3PF.                               
      @1387   PRCCS44                       N3PF.                               
      @1390   PRCCS45                       N3PF.                               
      @1393   PRCCS46                       N3PF.                               
      @1396   PRCCS47                       N3PF.                               
      @1399   PRCCS48                       N3PF.                               
      @1402   PRCCS49                       N3PF.                               
      @1405   PRCCS50                       N3PF.                               
      @1408   PRDAY1                        N5PF.                               
      @1413   PRDAY2                        N5PF.                               
      @1418   PRDAY3                        N5PF.                               
      @1423   PRDAY4                        N5PF.                               
      @1428   PRDAY5                        N5PF.                               
      @1433   PRDAY6                        N5PF.                               
      @1438   PRDAY7                        N5PF.                               
      @1443   PRDAY8                        N5PF.                               
      @1448   PRDAY9                        N5PF.                               
      @1453   PRDAY10                       N5PF.                               
      @1458   PRDAY11                       N5PF.                               
      @1463   PRDAY12                       N5PF.                               
      @1468   PRDAY13                       N5PF.                               
      @1473   PRDAY14                       N5PF.                               
      @1478   PRDAY15                       N5PF.                               
      @1483   PRDAY16                       N5PF.                               
      @1488   PRDAY17                       N5PF.                               
      @1493   PRDAY18                       N5PF.                               
      @1498   PRDAY19                       N5PF.                               
      @1503   PRDAY20                       N5PF.                               
      @1508   PRDAY21                       N5PF.                               
      @1513   PRDAY22                       N5PF.                               
      @1518   PRDAY23                       N5PF.                               
      @1523   PRDAY24                       N5PF.                               
      @1528   PRDAY25                       N5PF.                               
      @1533   PRDAY26                       N5PF.                               
      @1538   PRDAY27                       N5PF.                               
      @1543   PRDAY28                       N5PF.                               
      @1548   PRDAY29                       N5PF.                               
      @1553   PRDAY30                       N5PF.                               
      @1558   PRDAY31                       N5PF.                               
      @1563   PRDAY32                       N5PF.                               
      @1568   PRDAY33                       N5PF.                               
      @1573   PRDAY34                       N5PF.                               
      @1578   PRDAY35                       N5PF.                               
      @1583   PRDAY36                       N5PF.                               
      @1588   PRDAY37                       N5PF.                               
      @1593   PRDAY38                       N5PF.                               
      @1598   PRDAY39                       N5PF.                               
      @1603   PRDAY40                       N5PF.                               
      @1608   PRDAY41                       N5PF.                               
      @1613   PRDAY42                       N5PF.                               
      @1618   PRDAY43                       N5PF.                               
      @1623   PRDAY44                       N5PF.                               
      @1628   PRDAY45                       N5PF.                               
      @1633   PRDAY46                       N5PF.                               
      @1638   PRDAY47                       N5PF.                               
      @1643   PRDAY48                       N5PF.                               
      @1648   PRDAY49                       N5PF.                               
      @1653   PRDAY50                       N5PF.                               
      @1658   PROCTYPE                      N3PF.                               
      @1661   PRVER                         N3PF.                               
      @1664   PSTATE                        $CHAR2.                             
      @1666   PSTCO                         N5PF.                               
      @1671   PSTCO2                        N5PF.                               
      @1676   RACE                          N2PF.                               
      @1678   RACE_X                        $CHAR3.                             
      @1681   SERVICELINE                   N2PF.                               
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
