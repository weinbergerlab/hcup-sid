/*******************************************************************            
* Creation Date: 08/27/2015                                                     
*   IA_SID_2014_CORE.SAS:                                                       
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
DATA IA_SIDC_2014_CORE;                                                         
INFILE 'IA_SID_2014_CORE.ASC' FIRSTOBS=3 LRECL = 2029;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
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
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$4                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG24                      LENGTH=3                                           
  LABEL="DRG, version 24"                                                       
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
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
                                                                                
  DX_Admitting               LENGTH=$7                                          
  LABEL="Admitting Diagnosis Code"                                              
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  HospitalUnit               LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indicator that patient was discharged from a special unit within an acute care 
hospital (reported by source)"                                                  
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC24                      LENGTH=3                                           
  LABEL="MDC, version 24"                                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MDNUM3_R                   LENGTH=5                                           
  LABEL="Physician 3 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
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
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$4                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$4                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$4                                          
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
  LABEL="Indication that a discharge has POA missing on all nonexempt diagnoses"
                                                                                
  POA_Disch_Edit2            LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that a discharge has POA missing on all nonexempt secondary diagnose
s"                                                                              
                                                                                
  POA_Hosp_Edit1             LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that a hospital has POA reported as Y on all diagnoses on all discha
rges"                                                                           
                                                                                
  POA_Hosp_Edit2             LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that a hospital has POA reported as missing on all non-Medicare disc
harges"                                                                         
                                                                                
  POA_Hosp_Edit3             LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that a hospital reported POA as missing on all nonexempt diagnoses f
or 15 percent or more of discharges"                                            
                                                                                
  POA_Hosp_Edit3_Value       LENGTH=8                                           
  LABEL=                                                                        
  "Percentage of discharges with all nonexempt diagnoses missing POA indicators"
                                                                                
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
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$4                                          
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
                                                                                
  VisitLink                  LENGTH=8                                           
  LABEL="Visit linkage variable"                                                
                                                                                
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
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AMONTH                        N2PF.                               
      @12     ATYPE                         N2PF.                               
      @14     AWEEKEND                      N2PF.                               
      @16     DIED                          N2PF.                               
      @18     DISPUB04                      N2PF.                               
      @20     DISPUNIFORM                   N2PF.                               
      @22     DISP_X                        $CHAR4.                             
      @26     DMONTH                        N2PF.                               
      @28     DQTR                          N2PF.                               
      @30     DRG                           N3PF.                               
      @33     DRG24                         N3PF.                               
      @36     DRGVER                        N2PF.                               
      @38     DRG_NoPOA                     N3PF.                               
      @41     DX1                           $CHAR7.                             
      @48     DX2                           $CHAR7.                             
      @55     DX3                           $CHAR7.                             
      @62     DX4                           $CHAR7.                             
      @69     DX5                           $CHAR7.                             
      @76     DX6                           $CHAR7.                             
      @83     DX7                           $CHAR7.                             
      @90     DX8                           $CHAR7.                             
      @97     DX9                           $CHAR7.                             
      @104    DX10                          $CHAR7.                             
      @111    DX11                          $CHAR7.                             
      @118    DX12                          $CHAR7.                             
      @125    DX13                          $CHAR7.                             
      @132    DX14                          $CHAR7.                             
      @139    DX15                          $CHAR7.                             
      @146    DX16                          $CHAR7.                             
      @153    DX17                          $CHAR7.                             
      @160    DX18                          $CHAR7.                             
      @167    DX19                          $CHAR7.                             
      @174    DX20                          $CHAR7.                             
      @181    DX21                          $CHAR7.                             
      @188    DX22                          $CHAR7.                             
      @195    DX23                          $CHAR7.                             
      @202    DX24                          $CHAR7.                             
      @209    DX25                          $CHAR7.                             
      @216    DX26                          $CHAR7.                             
      @223    DX27                          $CHAR7.                             
      @230    DX28                          $CHAR7.                             
      @237    DX29                          $CHAR7.                             
      @244    DX30                          $CHAR7.                             
      @251    DX31                          $CHAR7.                             
      @258    DX32                          $CHAR7.                             
      @265    DX33                          $CHAR7.                             
      @272    DX34                          $CHAR7.                             
      @279    DX35                          $CHAR7.                             
      @286    DX36                          $CHAR7.                             
      @293    DX37                          $CHAR7.                             
      @300    DX38                          $CHAR7.                             
      @307    DX39                          $CHAR7.                             
      @314    DX40                          $CHAR7.                             
      @321    DX41                          $CHAR7.                             
      @328    DX42                          $CHAR7.                             
      @335    DX43                          $CHAR7.                             
      @342    DX44                          $CHAR7.                             
      @349    DX45                          $CHAR7.                             
      @356    DX46                          $CHAR7.                             
      @363    DX47                          $CHAR7.                             
      @370    DX48                          $CHAR7.                             
      @377    DX49                          $CHAR7.                             
      @384    DX50                          $CHAR7.                             
      @391    DXCCS1                        N4PF.                               
      @395    DXCCS2                        N4PF.                               
      @399    DXCCS3                        N4PF.                               
      @403    DXCCS4                        N4PF.                               
      @407    DXCCS5                        N4PF.                               
      @411    DXCCS6                        N4PF.                               
      @415    DXCCS7                        N4PF.                               
      @419    DXCCS8                        N4PF.                               
      @423    DXCCS9                        N4PF.                               
      @427    DXCCS10                       N4PF.                               
      @431    DXCCS11                       N4PF.                               
      @435    DXCCS12                       N4PF.                               
      @439    DXCCS13                       N4PF.                               
      @443    DXCCS14                       N4PF.                               
      @447    DXCCS15                       N4PF.                               
      @451    DXCCS16                       N4PF.                               
      @455    DXCCS17                       N4PF.                               
      @459    DXCCS18                       N4PF.                               
      @463    DXCCS19                       N4PF.                               
      @467    DXCCS20                       N4PF.                               
      @471    DXCCS21                       N4PF.                               
      @475    DXCCS22                       N4PF.                               
      @479    DXCCS23                       N4PF.                               
      @483    DXCCS24                       N4PF.                               
      @487    DXCCS25                       N4PF.                               
      @491    DXCCS26                       N4PF.                               
      @495    DXCCS27                       N4PF.                               
      @499    DXCCS28                       N4PF.                               
      @503    DXCCS29                       N4PF.                               
      @507    DXCCS30                       N4PF.                               
      @511    DXCCS31                       N4PF.                               
      @515    DXCCS32                       N4PF.                               
      @519    DXCCS33                       N4PF.                               
      @523    DXCCS34                       N4PF.                               
      @527    DXCCS35                       N4PF.                               
      @531    DXCCS36                       N4PF.                               
      @535    DXCCS37                       N4PF.                               
      @539    DXCCS38                       N4PF.                               
      @543    DXCCS39                       N4PF.                               
      @547    DXCCS40                       N4PF.                               
      @551    DXCCS41                       N4PF.                               
      @555    DXCCS42                       N4PF.                               
      @559    DXCCS43                       N4PF.                               
      @563    DXCCS44                       N4PF.                               
      @567    DXCCS45                       N4PF.                               
      @571    DXCCS46                       N4PF.                               
      @575    DXCCS47                       N4PF.                               
      @579    DXCCS48                       N4PF.                               
      @583    DXCCS49                       N4PF.                               
      @587    DXCCS50                       N4PF.                               
      @591    DXPOA1                        $CHAR1.                             
      @592    DXPOA2                        $CHAR1.                             
      @593    DXPOA3                        $CHAR1.                             
      @594    DXPOA4                        $CHAR1.                             
      @595    DXPOA5                        $CHAR1.                             
      @596    DXPOA6                        $CHAR1.                             
      @597    DXPOA7                        $CHAR1.                             
      @598    DXPOA8                        $CHAR1.                             
      @599    DXPOA9                        $CHAR1.                             
      @600    DXPOA10                       $CHAR1.                             
      @601    DXPOA11                       $CHAR1.                             
      @602    DXPOA12                       $CHAR1.                             
      @603    DXPOA13                       $CHAR1.                             
      @604    DXPOA14                       $CHAR1.                             
      @605    DXPOA15                       $CHAR1.                             
      @606    DXPOA16                       $CHAR1.                             
      @607    DXPOA17                       $CHAR1.                             
      @608    DXPOA18                       $CHAR1.                             
      @609    DXPOA19                       $CHAR1.                             
      @610    DXPOA20                       $CHAR1.                             
      @611    DXPOA21                       $CHAR1.                             
      @612    DXPOA22                       $CHAR1.                             
      @613    DXPOA23                       $CHAR1.                             
      @614    DXPOA24                       $CHAR1.                             
      @615    DXPOA25                       $CHAR1.                             
      @616    DXPOA26                       $CHAR1.                             
      @617    DXPOA27                       $CHAR1.                             
      @618    DXPOA28                       $CHAR1.                             
      @619    DXPOA29                       $CHAR1.                             
      @620    DXPOA30                       $CHAR1.                             
      @621    DXPOA31                       $CHAR1.                             
      @622    DXPOA32                       $CHAR1.                             
      @623    DXPOA33                       $CHAR1.                             
      @624    DXPOA34                       $CHAR1.                             
      @625    DXPOA35                       $CHAR1.                             
      @626    DXPOA36                       $CHAR1.                             
      @627    DXPOA37                       $CHAR1.                             
      @628    DXPOA38                       $CHAR1.                             
      @629    DXPOA39                       $CHAR1.                             
      @630    DXPOA40                       $CHAR1.                             
      @631    DXPOA41                       $CHAR1.                             
      @632    DXPOA42                       $CHAR1.                             
      @633    DXPOA43                       $CHAR1.                             
      @634    DXPOA44                       $CHAR1.                             
      @635    DXPOA45                       $CHAR1.                             
      @636    DXPOA46                       $CHAR1.                             
      @637    DXPOA47                       $CHAR1.                             
      @638    DXPOA48                       $CHAR1.                             
      @639    DXPOA49                       $CHAR1.                             
      @640    DXPOA50                       $CHAR1.                             
      @641    DXVER                         N3PF.                               
      @644    DX_Admitting                  $CHAR7.                             
      @651    DaysToEvent                   N6PF.                               
      @657    ECODE1                        $CHAR7.                             
      @664    ECODE2                        $CHAR7.                             
      @671    ECODE3                        $CHAR7.                             
      @678    ECODE4                        $CHAR7.                             
      @685    ECODE5                        $CHAR7.                             
      @692    ECODE6                        $CHAR7.                             
      @699    ECODE7                        $CHAR7.                             
      @706    E_CCS1                        N4PF.                               
      @710    E_CCS2                        N4PF.                               
      @714    E_CCS3                        N4PF.                               
      @718    E_CCS4                        N4PF.                               
      @722    E_CCS5                        N4PF.                               
      @726    E_CCS6                        N4PF.                               
      @730    E_CCS7                        N4PF.                               
      @734    E_POA1                        $CHAR1.                             
      @735    E_POA2                        $CHAR1.                             
      @736    E_POA3                        $CHAR1.                             
      @737    E_POA4                        $CHAR1.                             
      @738    E_POA5                        $CHAR1.                             
      @739    E_POA6                        $CHAR1.                             
      @740    E_POA7                        $CHAR1.                             
      @741    FEMALE                        N2PF.                               
      @743    HCUP_ED                       N2PF.                               
      @745    HCUP_OS                       N2PF.                               
      @747    HISPANIC_X                    $CHAR1.                             
      @748    HOSPBRTH                      N3PF.                               
      @751    HOSPST                        $CHAR2.                             
      @753    HospitalUnit                  N2PF.                               
      @755    KEY                           15.                                 
      @770    LOS                           N5PF.                               
      @775    LOS_X                         N6PF.                               
      @781    MDC                           N2PF.                               
      @783    MDC24                         N2PF.                               
      @785    MDC_NoPOA                     N2PF.                               
      @787    MDNUM1_R                      N9PF.                               
      @796    MDNUM2_R                      N9PF.                               
      @805    MDNUM3_R                      N9PF.                               
      @814    MEDINCSTQ                     N2PF.                               
      @816    MRN_R                         N9PF.                               
      @825    NCHRONIC                      N3PF.                               
      @828    NDX                           N3PF.                               
      @831    NECODE                        N2PF.                               
      @833    NEOMAT                        N2PF.                               
      @835    NPR                           N3PF.                               
      @838    ORPROC                        N2PF.                               
      @840    P7EDSRC_X                     $CHAR2.                             
      @842    PAY1                          N2PF.                               
      @844    PAY1_X                        $CHAR4.                             
      @848    PAY2                          N2PF.                               
      @850    PAY2_X                        $CHAR4.                             
      @854    PAY3                          N2PF.                               
      @856    PAY3_X                        $CHAR4.                             
      @860    PL_CBSA                       N3PF.                               
      @863    PL_NCHS                       N2PF.                               
      @865    PL_RUCC                       N2PF.                               
      @867    PL_UIC                        N2PF.                               
      @869    PL_UR_CAT4                    N2PF.                               
      @871    POA_Disch_Edit1               N2PF.                               
      @873    POA_Disch_Edit2               N2PF.                               
      @875    POA_Hosp_Edit1                N2PF.                               
      @877    POA_Hosp_Edit2                N2PF.                               
      @879    POA_Hosp_Edit3                N2PF.                               
      @881    POA_Hosp_Edit3_Value          N8P2F.                              
      @889    PR1                           $CHAR7.                             
      @896    PR2                           $CHAR7.                             
      @903    PR3                           $CHAR7.                             
      @910    PR4                           $CHAR7.                             
      @917    PR5                           $CHAR7.                             
      @924    PR6                           $CHAR7.                             
      @931    PR7                           $CHAR7.                             
      @938    PR8                           $CHAR7.                             
      @945    PR9                           $CHAR7.                             
      @952    PR10                          $CHAR7.                             
      @959    PR11                          $CHAR7.                             
      @966    PR12                          $CHAR7.                             
      @973    PR13                          $CHAR7.                             
      @980    PR14                          $CHAR7.                             
      @987    PR15                          $CHAR7.                             
      @994    PR16                          $CHAR7.                             
      @1001   PR17                          $CHAR7.                             
      @1008   PR18                          $CHAR7.                             
      @1015   PR19                          $CHAR7.                             
      @1022   PR20                          $CHAR7.                             
      @1029   PR21                          $CHAR7.                             
      @1036   PR22                          $CHAR7.                             
      @1043   PR23                          $CHAR7.                             
      @1050   PR24                          $CHAR7.                             
      @1057   PR25                          $CHAR7.                             
      @1064   PR26                          $CHAR7.                             
      @1071   PR27                          $CHAR7.                             
      @1078   PR28                          $CHAR7.                             
      @1085   PR29                          $CHAR7.                             
      @1092   PR30                          $CHAR7.                             
      @1099   PR31                          $CHAR7.                             
      @1106   PR32                          $CHAR7.                             
      @1113   PR33                          $CHAR7.                             
      @1120   PR34                          $CHAR7.                             
      @1127   PR35                          $CHAR7.                             
      @1134   PR36                          $CHAR7.                             
      @1141   PR37                          $CHAR7.                             
      @1148   PR38                          $CHAR7.                             
      @1155   PR39                          $CHAR7.                             
      @1162   PR40                          $CHAR7.                             
      @1169   PR41                          $CHAR7.                             
      @1176   PR42                          $CHAR7.                             
      @1183   PR43                          $CHAR7.                             
      @1190   PR44                          $CHAR7.                             
      @1197   PR45                          $CHAR7.                             
      @1204   PR46                          $CHAR7.                             
      @1211   PR47                          $CHAR7.                             
      @1218   PR48                          $CHAR7.                             
      @1225   PR49                          $CHAR7.                             
      @1232   PR50                          $CHAR7.                             
      @1239   PRCCS1                        N3PF.                               
      @1242   PRCCS2                        N3PF.                               
      @1245   PRCCS3                        N3PF.                               
      @1248   PRCCS4                        N3PF.                               
      @1251   PRCCS5                        N3PF.                               
      @1254   PRCCS6                        N3PF.                               
      @1257   PRCCS7                        N3PF.                               
      @1260   PRCCS8                        N3PF.                               
      @1263   PRCCS9                        N3PF.                               
      @1266   PRCCS10                       N3PF.                               
      @1269   PRCCS11                       N3PF.                               
      @1272   PRCCS12                       N3PF.                               
      @1275   PRCCS13                       N3PF.                               
      @1278   PRCCS14                       N3PF.                               
      @1281   PRCCS15                       N3PF.                               
      @1284   PRCCS16                       N3PF.                               
      @1287   PRCCS17                       N3PF.                               
      @1290   PRCCS18                       N3PF.                               
      @1293   PRCCS19                       N3PF.                               
      @1296   PRCCS20                       N3PF.                               
      @1299   PRCCS21                       N3PF.                               
      @1302   PRCCS22                       N3PF.                               
      @1305   PRCCS23                       N3PF.                               
      @1308   PRCCS24                       N3PF.                               
      @1311   PRCCS25                       N3PF.                               
      @1314   PRCCS26                       N3PF.                               
      @1317   PRCCS27                       N3PF.                               
      @1320   PRCCS28                       N3PF.                               
      @1323   PRCCS29                       N3PF.                               
      @1326   PRCCS30                       N3PF.                               
      @1329   PRCCS31                       N3PF.                               
      @1332   PRCCS32                       N3PF.                               
      @1335   PRCCS33                       N3PF.                               
      @1338   PRCCS34                       N3PF.                               
      @1341   PRCCS35                       N3PF.                               
      @1344   PRCCS36                       N3PF.                               
      @1347   PRCCS37                       N3PF.                               
      @1350   PRCCS38                       N3PF.                               
      @1353   PRCCS39                       N3PF.                               
      @1356   PRCCS40                       N3PF.                               
      @1359   PRCCS41                       N3PF.                               
      @1362   PRCCS42                       N3PF.                               
      @1365   PRCCS43                       N3PF.                               
      @1368   PRCCS44                       N3PF.                               
      @1371   PRCCS45                       N3PF.                               
      @1374   PRCCS46                       N3PF.                               
      @1377   PRCCS47                       N3PF.                               
      @1380   PRCCS48                       N3PF.                               
      @1383   PRCCS49                       N3PF.                               
      @1386   PRCCS50                       N3PF.                               
      @1389   PRDAY1                        N5PF.                               
      @1394   PRDAY2                        N5PF.                               
      @1399   PRDAY3                        N5PF.                               
      @1404   PRDAY4                        N5PF.                               
      @1409   PRDAY5                        N5PF.                               
      @1414   PRDAY6                        N5PF.                               
      @1419   PRDAY7                        N5PF.                               
      @1424   PRDAY8                        N5PF.                               
      @1429   PRDAY9                        N5PF.                               
      @1434   PRDAY10                       N5PF.                               
      @1439   PRDAY11                       N5PF.                               
      @1444   PRDAY12                       N5PF.                               
      @1449   PRDAY13                       N5PF.                               
      @1454   PRDAY14                       N5PF.                               
      @1459   PRDAY15                       N5PF.                               
      @1464   PRDAY16                       N5PF.                               
      @1469   PRDAY17                       N5PF.                               
      @1474   PRDAY18                       N5PF.                               
      @1479   PRDAY19                       N5PF.                               
      @1484   PRDAY20                       N5PF.                               
      @1489   PRDAY21                       N5PF.                               
      @1494   PRDAY22                       N5PF.                               
      @1499   PRDAY23                       N5PF.                               
      @1504   PRDAY24                       N5PF.                               
      @1509   PRDAY25                       N5PF.                               
      @1514   PRDAY26                       N5PF.                               
      @1519   PRDAY27                       N5PF.                               
      @1524   PRDAY28                       N5PF.                               
      @1529   PRDAY29                       N5PF.                               
      @1534   PRDAY30                       N5PF.                               
      @1539   PRDAY31                       N5PF.                               
      @1544   PRDAY32                       N5PF.                               
      @1549   PRDAY33                       N5PF.                               
      @1554   PRDAY34                       N5PF.                               
      @1559   PRDAY35                       N5PF.                               
      @1564   PRDAY36                       N5PF.                               
      @1569   PRDAY37                       N5PF.                               
      @1574   PRDAY38                       N5PF.                               
      @1579   PRDAY39                       N5PF.                               
      @1584   PRDAY40                       N5PF.                               
      @1589   PRDAY41                       N5PF.                               
      @1594   PRDAY42                       N5PF.                               
      @1599   PRDAY43                       N5PF.                               
      @1604   PRDAY44                       N5PF.                               
      @1609   PRDAY45                       N5PF.                               
      @1614   PRDAY46                       N5PF.                               
      @1619   PRDAY47                       N5PF.                               
      @1624   PRDAY48                       N5PF.                               
      @1629   PRDAY49                       N5PF.                               
      @1634   PRDAY50                       N5PF.                               
      @1639   PROCTYPE                      N3PF.                               
      @1642   PRVER                         N3PF.                               
      @1645   PSTATE                        $CHAR2.                             
      @1647   PSTCO                         N5PF.                               
      @1652   PSTCO2                        N5PF.                               
      @1657   PointOfOriginUB04             $CHAR1.                             
      @1658   PointOfOrigin_X               $CHAR1.                             
      @1659   RACE                          N2PF.                               
      @1661   RACE_X                        $CHAR4.                             
      @1665   SERVICELINE                   N2PF.                               
      @1667   TOTCHG                        N10PF.                              
      @1677   TOTCHG_X                      N15P2F.                             
      @1692   TRAN_IN                       N2PF.                               
      @1694   TRAN_OUT                      N2PF.                               
      @1696   VisitLink                     N9PF.                               
      @1705   YEAR                          N4PF.                               
      @1709   ZIP                           $CHAR5.                             
      @1714   ZIP3                          $CHAR3.                             
      @1717   ZIPINC_QRTL                   N3PF.                               
      @1720   AYEAR                         N4PF.                               
      @1724   BMONTH                        N2PF.                               
      @1726   BYEAR                         N4PF.                               
      @1730   PRMONTH1                      N2PF.                               
      @1732   PRMONTH2                      N2PF.                               
      @1734   PRMONTH3                      N2PF.                               
      @1736   PRMONTH4                      N2PF.                               
      @1738   PRMONTH5                      N2PF.                               
      @1740   PRMONTH6                      N2PF.                               
      @1742   PRMONTH7                      N2PF.                               
      @1744   PRMONTH8                      N2PF.                               
      @1746   PRMONTH9                      N2PF.                               
      @1748   PRMONTH10                     N2PF.                               
      @1750   PRMONTH11                     N2PF.                               
      @1752   PRMONTH12                     N2PF.                               
      @1754   PRMONTH13                     N2PF.                               
      @1756   PRMONTH14                     N2PF.                               
      @1758   PRMONTH15                     N2PF.                               
      @1760   PRMONTH16                     N2PF.                               
      @1762   PRMONTH17                     N2PF.                               
      @1764   PRMONTH18                     N2PF.                               
      @1766   PRMONTH19                     N2PF.                               
      @1768   PRMONTH20                     N2PF.                               
      @1770   PRMONTH21                     N2PF.                               
      @1772   PRMONTH22                     N2PF.                               
      @1774   PRMONTH23                     N2PF.                               
      @1776   PRMONTH24                     N2PF.                               
      @1778   PRMONTH25                     N2PF.                               
      @1780   PRMONTH26                     N2PF.                               
      @1782   PRMONTH27                     N2PF.                               
      @1784   PRMONTH28                     N2PF.                               
      @1786   PRMONTH29                     N2PF.                               
      @1788   PRMONTH30                     N2PF.                               
      @1790   PRMONTH31                     N2PF.                               
      @1792   PRMONTH32                     N2PF.                               
      @1794   PRMONTH33                     N2PF.                               
      @1796   PRMONTH34                     N2PF.                               
      @1798   PRMONTH35                     N2PF.                               
      @1800   PRMONTH36                     N2PF.                               
      @1802   PRMONTH37                     N2PF.                               
      @1804   PRMONTH38                     N2PF.                               
      @1806   PRMONTH39                     N2PF.                               
      @1808   PRMONTH40                     N2PF.                               
      @1810   PRMONTH41                     N2PF.                               
      @1812   PRMONTH42                     N2PF.                               
      @1814   PRMONTH43                     N2PF.                               
      @1816   PRMONTH44                     N2PF.                               
      @1818   PRMONTH45                     N2PF.                               
      @1820   PRMONTH46                     N2PF.                               
      @1822   PRMONTH47                     N2PF.                               
      @1824   PRMONTH48                     N2PF.                               
      @1826   PRMONTH49                     N2PF.                               
      @1828   PRMONTH50                     N2PF.                               
      @1830   PRYEAR1                       N4PF.                               
      @1834   PRYEAR2                       N4PF.                               
      @1838   PRYEAR3                       N4PF.                               
      @1842   PRYEAR4                       N4PF.                               
      @1846   PRYEAR5                       N4PF.                               
      @1850   PRYEAR6                       N4PF.                               
      @1854   PRYEAR7                       N4PF.                               
      @1858   PRYEAR8                       N4PF.                               
      @1862   PRYEAR9                       N4PF.                               
      @1866   PRYEAR10                      N4PF.                               
      @1870   PRYEAR11                      N4PF.                               
      @1874   PRYEAR12                      N4PF.                               
      @1878   PRYEAR13                      N4PF.                               
      @1882   PRYEAR14                      N4PF.                               
      @1886   PRYEAR15                      N4PF.                               
      @1890   PRYEAR16                      N4PF.                               
      @1894   PRYEAR17                      N4PF.                               
      @1898   PRYEAR18                      N4PF.                               
      @1902   PRYEAR19                      N4PF.                               
      @1906   PRYEAR20                      N4PF.                               
      @1910   PRYEAR21                      N4PF.                               
      @1914   PRYEAR22                      N4PF.                               
      @1918   PRYEAR23                      N4PF.                               
      @1922   PRYEAR24                      N4PF.                               
      @1926   PRYEAR25                      N4PF.                               
      @1930   PRYEAR26                      N4PF.                               
      @1934   PRYEAR27                      N4PF.                               
      @1938   PRYEAR28                      N4PF.                               
      @1942   PRYEAR29                      N4PF.                               
      @1946   PRYEAR30                      N4PF.                               
      @1950   PRYEAR31                      N4PF.                               
      @1954   PRYEAR32                      N4PF.                               
      @1958   PRYEAR33                      N4PF.                               
      @1962   PRYEAR34                      N4PF.                               
      @1966   PRYEAR35                      N4PF.                               
      @1970   PRYEAR36                      N4PF.                               
      @1974   PRYEAR37                      N4PF.                               
      @1978   PRYEAR38                      N4PF.                               
      @1982   PRYEAR39                      N4PF.                               
      @1986   PRYEAR40                      N4PF.                               
      @1990   PRYEAR41                      N4PF.                               
      @1994   PRYEAR42                      N4PF.                               
      @1998   PRYEAR43                      N4PF.                               
      @2002   PRYEAR44                      N4PF.                               
      @2006   PRYEAR45                      N4PF.                               
      @2010   PRYEAR46                      N4PF.                               
      @2014   PRYEAR47                      N4PF.                               
      @2018   PRYEAR48                      N4PF.                               
      @2022   PRYEAR49                      N4PF.                               
      @2026   PRYEAR50                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
