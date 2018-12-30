/*******************************************************************            
* Creation Date: 01/04/2018                                                     
*   MA_SID_2015q1q3_CORE.SAS:                                                   
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
DATA MA_SIDC_2015q1q3_CORE;                                                     
INFILE 'MA_SID_2015q1q3_CORE.ASC' FIRSTOBS=3 LRECL = 2668;                      
                                                                                
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
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMDC                       LENGTH=3                                           
  LABEL="All Patient Refined MDC"                                               
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X                  LENGTH=$1                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
  ASOURCEUB92                LENGTH=$1                                          
  LABEL="Admission source (UB-92 standard coding)"                              
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
  DaysBetweenVisits          LENGTH=3                                           
  LABEL="Number of days between visits"                                         
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
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
                                                                                
  DNR                        LENGTH=3                                           
  LABEL="Do not resuscitate indicator"                                          
                                                                                
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
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  DX51                       LENGTH=$7                                          
  LABEL="Diagnosis 51"                                                          
                                                                                
  DX52                       LENGTH=$7                                          
  LABEL="Diagnosis 52"                                                          
                                                                                
  DX53                       LENGTH=$7                                          
  LABEL="Diagnosis 53"                                                          
                                                                                
  DX54                       LENGTH=$7                                          
  LABEL="Diagnosis 54"                                                          
                                                                                
  DX55                       LENGTH=$7                                          
  LABEL="Diagnosis 55"                                                          
                                                                                
  DX56                       LENGTH=$7                                          
  LABEL="Diagnosis 56"                                                          
                                                                                
  DX57                       LENGTH=$7                                          
  LABEL="Diagnosis 57"                                                          
                                                                                
  DX58                       LENGTH=$7                                          
  LABEL="Diagnosis 58"                                                          
                                                                                
  DX59                       LENGTH=$7                                          
  LABEL="Diagnosis 59"                                                          
                                                                                
  DX60                       LENGTH=$7                                          
  LABEL="Diagnosis 60"                                                          
                                                                                
  DX61                       LENGTH=$7                                          
  LABEL="Diagnosis 61"                                                          
                                                                                
  DX62                       LENGTH=$7                                          
  LABEL="Diagnosis 62"                                                          
                                                                                
  DX63                       LENGTH=$7                                          
  LABEL="Diagnosis 63"                                                          
                                                                                
  DX64                       LENGTH=$7                                          
  LABEL="Diagnosis 64"                                                          
                                                                                
  DX65                       LENGTH=$7                                          
  LABEL="Diagnosis 65"                                                          
                                                                                
  DX66                       LENGTH=$7                                          
  LABEL="Diagnosis 66"                                                          
                                                                                
  DX67                       LENGTH=$7                                          
  LABEL="Diagnosis 67"                                                          
                                                                                
  DX68                       LENGTH=$7                                          
  LABEL="Diagnosis 68"                                                          
                                                                                
  DX69                       LENGTH=$7                                          
  LABEL="Diagnosis 69"                                                          
                                                                                
  DX70                       LENGTH=$7                                          
  LABEL="Diagnosis 70"                                                          
                                                                                
  DX71                       LENGTH=$7                                          
  LABEL="Diagnosis 71"                                                          
                                                                                
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
                                                                                
  DXCCS51                    LENGTH=4                                           
  LABEL="CCS: diagnosis 51"                                                     
                                                                                
  DXCCS52                    LENGTH=4                                           
  LABEL="CCS: diagnosis 52"                                                     
                                                                                
  DXCCS53                    LENGTH=4                                           
  LABEL="CCS: diagnosis 53"                                                     
                                                                                
  DXCCS54                    LENGTH=4                                           
  LABEL="CCS: diagnosis 54"                                                     
                                                                                
  DXCCS55                    LENGTH=4                                           
  LABEL="CCS: diagnosis 55"                                                     
                                                                                
  DXCCS56                    LENGTH=4                                           
  LABEL="CCS: diagnosis 56"                                                     
                                                                                
  DXCCS57                    LENGTH=4                                           
  LABEL="CCS: diagnosis 57"                                                     
                                                                                
  DXCCS58                    LENGTH=4                                           
  LABEL="CCS: diagnosis 58"                                                     
                                                                                
  DXCCS59                    LENGTH=4                                           
  LABEL="CCS: diagnosis 59"                                                     
                                                                                
  DXCCS60                    LENGTH=4                                           
  LABEL="CCS: diagnosis 60"                                                     
                                                                                
  DXCCS61                    LENGTH=4                                           
  LABEL="CCS: diagnosis 61"                                                     
                                                                                
  DXCCS62                    LENGTH=4                                           
  LABEL="CCS: diagnosis 62"                                                     
                                                                                
  DXCCS63                    LENGTH=4                                           
  LABEL="CCS: diagnosis 63"                                                     
                                                                                
  DXCCS64                    LENGTH=4                                           
  LABEL="CCS: diagnosis 64"                                                     
                                                                                
  DXCCS65                    LENGTH=4                                           
  LABEL="CCS: diagnosis 65"                                                     
                                                                                
  DXCCS66                    LENGTH=4                                           
  LABEL="CCS: diagnosis 66"                                                     
                                                                                
  DXCCS67                    LENGTH=4                                           
  LABEL="CCS: diagnosis 67"                                                     
                                                                                
  DXCCS68                    LENGTH=4                                           
  LABEL="CCS: diagnosis 68"                                                     
                                                                                
  DXCCS69                    LENGTH=4                                           
  LABEL="CCS: diagnosis 69"                                                     
                                                                                
  DXCCS70                    LENGTH=4                                           
  LABEL="CCS: diagnosis 70"                                                     
                                                                                
  DXCCS71                    LENGTH=4                                           
  LABEL="CCS: diagnosis 71"                                                     
                                                                                
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
                                                                                
  DXPOA51                    LENGTH=$1                                          
  LABEL="Diagnosis 51, present on admission indicator"                          
                                                                                
  DXPOA52                    LENGTH=$1                                          
  LABEL="Diagnosis 52, present on admission indicator"                          
                                                                                
  DXPOA53                    LENGTH=$1                                          
  LABEL="Diagnosis 53, present on admission indicator"                          
                                                                                
  DXPOA54                    LENGTH=$1                                          
  LABEL="Diagnosis 54, present on admission indicator"                          
                                                                                
  DXPOA55                    LENGTH=$1                                          
  LABEL="Diagnosis 55, present on admission indicator"                          
                                                                                
  DXPOA56                    LENGTH=$1                                          
  LABEL="Diagnosis 56, present on admission indicator"                          
                                                                                
  DXPOA57                    LENGTH=$1                                          
  LABEL="Diagnosis 57, present on admission indicator"                          
                                                                                
  DXPOA58                    LENGTH=$1                                          
  LABEL="Diagnosis 58, present on admission indicator"                          
                                                                                
  DXPOA59                    LENGTH=$1                                          
  LABEL="Diagnosis 59, present on admission indicator"                          
                                                                                
  DXPOA60                    LENGTH=$1                                          
  LABEL="Diagnosis 60, present on admission indicator"                          
                                                                                
  DXPOA61                    LENGTH=$1                                          
  LABEL="Diagnosis 61, present on admission indicator"                          
                                                                                
  DXPOA62                    LENGTH=$1                                          
  LABEL="Diagnosis 62, present on admission indicator"                          
                                                                                
  DXPOA63                    LENGTH=$1                                          
  LABEL="Diagnosis 63, present on admission indicator"                          
                                                                                
  DXPOA64                    LENGTH=$1                                          
  LABEL="Diagnosis 64, present on admission indicator"                          
                                                                                
  DXPOA65                    LENGTH=$1                                          
  LABEL="Diagnosis 65, present on admission indicator"                          
                                                                                
  DXPOA66                    LENGTH=$1                                          
  LABEL="Diagnosis 66, present on admission indicator"                          
                                                                                
  DXPOA67                    LENGTH=$1                                          
  LABEL="Diagnosis 67, present on admission indicator"                          
                                                                                
  DXPOA68                    LENGTH=$1                                          
  LABEL="Diagnosis 68, present on admission indicator"                          
                                                                                
  DXPOA69                    LENGTH=$1                                          
  LABEL="Diagnosis 69, present on admission indicator"                          
                                                                                
  DXPOA70                    LENGTH=$1                                          
  LABEL="Diagnosis 70, present on admission indicator"                          
                                                                                
  DXPOA71                    LENGTH=$1                                          
  LABEL="Diagnosis 71, present on admission indicator"                          
                                                                                
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
                                                                                
  E_CCS8                     LENGTH=3                                           
  LABEL="CCS: E Code 8"                                                         
                                                                                
  E_CCS9                     LENGTH=3                                           
  LABEL="CCS: E Code 9"                                                         
                                                                                
  E_CCS10                    LENGTH=3                                           
  LABEL="CCS: E Code 10"                                                        
                                                                                
  E_CCS11                    LENGTH=3                                           
  LABEL="CCS: E Code 11"                                                        
                                                                                
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
                                                                                
  E_POA8                     LENGTH=$1                                          
  LABEL="E Code 8, present on admission indicator"                              
                                                                                
  E_POA9                     LENGTH=$1                                          
  LABEL="E Code 9, present on admission indicator"                              
                                                                                
  E_POA10                    LENGTH=$1                                          
  LABEL="E Code 10, present on admission indicator"                             
                                                                                
  E_POA11                    LENGTH=$1                                          
  LABEL="E Code 11, present on admission indicator"                             
                                                                                
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
                                                                                
  ECODE8                     LENGTH=$7                                          
  LABEL="E code 8"                                                              
                                                                                
  ECODE9                     LENGTH=$7                                          
  LABEL="E code 9"                                                              
                                                                                
  ECODE10                    LENGTH=$7                                          
  LABEL="E code 10"                                                             
                                                                                
  ECODE11                    LENGTH=$7                                          
  LABEL="E code 11"                                                             
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$15                                         
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
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
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$1                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$1                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAYER1_X                   LENGTH=$3                                          
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PAYER2_X                   LENGTH=$3                                          
  LABEL="Secondary expected payer plan identifier (as received from source)"    
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
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
                                                                                
  PR51                       LENGTH=$7                                          
  LABEL="Procedure 51"                                                          
                                                                                
  PR52                       LENGTH=$7                                          
  LABEL="Procedure 52"                                                          
                                                                                
  PR53                       LENGTH=$7                                          
  LABEL="Procedure 53"                                                          
                                                                                
  PR54                       LENGTH=$7                                          
  LABEL="Procedure 54"                                                          
                                                                                
  PR55                       LENGTH=$7                                          
  LABEL="Procedure 55"                                                          
                                                                                
  PR56                       LENGTH=$7                                          
  LABEL="Procedure 56"                                                          
                                                                                
  PR57                       LENGTH=$7                                          
  LABEL="Procedure 57"                                                          
                                                                                
  PR58                       LENGTH=$7                                          
  LABEL="Procedure 58"                                                          
                                                                                
  PR59                       LENGTH=$7                                          
  LABEL="Procedure 59"                                                          
                                                                                
  PR60                       LENGTH=$7                                          
  LABEL="Procedure 60"                                                          
                                                                                
  PR61                       LENGTH=$7                                          
  LABEL="Procedure 61"                                                          
                                                                                
  PR62                       LENGTH=$7                                          
  LABEL="Procedure 62"                                                          
                                                                                
  PR63                       LENGTH=$7                                          
  LABEL="Procedure 63"                                                          
                                                                                
  PR64                       LENGTH=$7                                          
  LABEL="Procedure 64"                                                          
                                                                                
  PR65                       LENGTH=$7                                          
  LABEL="Procedure 65"                                                          
                                                                                
  PR66                       LENGTH=$7                                          
  LABEL="Procedure 66"                                                          
                                                                                
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
                                                                                
  PRCCS51                    LENGTH=3                                           
  LABEL="CCS: procedure 51"                                                     
                                                                                
  PRCCS52                    LENGTH=3                                           
  LABEL="CCS: procedure 52"                                                     
                                                                                
  PRCCS53                    LENGTH=3                                           
  LABEL="CCS: procedure 53"                                                     
                                                                                
  PRCCS54                    LENGTH=3                                           
  LABEL="CCS: procedure 54"                                                     
                                                                                
  PRCCS55                    LENGTH=3                                           
  LABEL="CCS: procedure 55"                                                     
                                                                                
  PRCCS56                    LENGTH=3                                           
  LABEL="CCS: procedure 56"                                                     
                                                                                
  PRCCS57                    LENGTH=3                                           
  LABEL="CCS: procedure 57"                                                     
                                                                                
  PRCCS58                    LENGTH=3                                           
  LABEL="CCS: procedure 58"                                                     
                                                                                
  PRCCS59                    LENGTH=3                                           
  LABEL="CCS: procedure 59"                                                     
                                                                                
  PRCCS60                    LENGTH=3                                           
  LABEL="CCS: procedure 60"                                                     
                                                                                
  PRCCS61                    LENGTH=3                                           
  LABEL="CCS: procedure 61"                                                     
                                                                                
  PRCCS62                    LENGTH=3                                           
  LABEL="CCS: procedure 62"                                                     
                                                                                
  PRCCS63                    LENGTH=3                                           
  LABEL="CCS: procedure 63"                                                     
                                                                                
  PRCCS64                    LENGTH=3                                           
  LABEL="CCS: procedure 64"                                                     
                                                                                
  PRCCS65                    LENGTH=3                                           
  LABEL="CCS: procedure 65"                                                     
                                                                                
  PRCCS66                    LENGTH=3                                           
  LABEL="CCS: procedure 66"                                                     
                                                                                
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
                                                                                
  PRDAY51                    LENGTH=4                                           
  LABEL="Number of days from admission to PR51"                                 
                                                                                
  PRDAY52                    LENGTH=4                                           
  LABEL="Number of days from admission to PR52"                                 
                                                                                
  PRDAY53                    LENGTH=4                                           
  LABEL="Number of days from admission to PR53"                                 
                                                                                
  PRDAY54                    LENGTH=4                                           
  LABEL="Number of days from admission to PR54"                                 
                                                                                
  PRDAY55                    LENGTH=4                                           
  LABEL="Number of days from admission to PR55"                                 
                                                                                
  PRDAY56                    LENGTH=4                                           
  LABEL="Number of days from admission to PR56"                                 
                                                                                
  PRDAY57                    LENGTH=4                                           
  LABEL="Number of days from admission to PR57"                                 
                                                                                
  PRDAY58                    LENGTH=4                                           
  LABEL="Number of days from admission to PR58"                                 
                                                                                
  PRDAY59                    LENGTH=4                                           
  LABEL="Number of days from admission to PR59"                                 
                                                                                
  PRDAY60                    LENGTH=4                                           
  LABEL="Number of days from admission to PR60"                                 
                                                                                
  PRDAY61                    LENGTH=4                                           
  LABEL="Number of days from admission to PR61"                                 
                                                                                
  PRDAY62                    LENGTH=4                                           
  LABEL="Number of days from admission to PR62"                                 
                                                                                
  PRDAY63                    LENGTH=4                                           
  LABEL="Number of days from admission to PR63"                                 
                                                                                
  PRDAY64                    LENGTH=4                                           
  LABEL="Number of days from admission to PR64"                                 
                                                                                
  PRDAY65                    LENGTH=4                                           
  LABEL="Number of days from admission to PR65"                                 
                                                                                
  PRDAY66                    LENGTH=4                                           
  LABEL="Number of days from admission to PR66"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$13                                         
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
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
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
                                                                                
  PRMONTH51                  LENGTH=3                                           
  LABEL="Month of procedure 51"                                                 
                                                                                
  PRMONTH52                  LENGTH=3                                           
  LABEL="Month of procedure 52"                                                 
                                                                                
  PRMONTH53                  LENGTH=3                                           
  LABEL="Month of procedure 53"                                                 
                                                                                
  PRMONTH54                  LENGTH=3                                           
  LABEL="Month of procedure 54"                                                 
                                                                                
  PRMONTH55                  LENGTH=3                                           
  LABEL="Month of procedure 55"                                                 
                                                                                
  PRMONTH56                  LENGTH=3                                           
  LABEL="Month of procedure 56"                                                 
                                                                                
  PRMONTH57                  LENGTH=3                                           
  LABEL="Month of procedure 57"                                                 
                                                                                
  PRMONTH58                  LENGTH=3                                           
  LABEL="Month of procedure 58"                                                 
                                                                                
  PRMONTH59                  LENGTH=3                                           
  LABEL="Month of procedure 59"                                                 
                                                                                
  PRMONTH60                  LENGTH=3                                           
  LABEL="Month of procedure 60"                                                 
                                                                                
  PRMONTH61                  LENGTH=3                                           
  LABEL="Month of procedure 61"                                                 
                                                                                
  PRMONTH62                  LENGTH=3                                           
  LABEL="Month of procedure 62"                                                 
                                                                                
  PRMONTH63                  LENGTH=3                                           
  LABEL="Month of procedure 63"                                                 
                                                                                
  PRMONTH64                  LENGTH=3                                           
  LABEL="Month of procedure 64"                                                 
                                                                                
  PRMONTH65                  LENGTH=3                                           
  LABEL="Month of procedure 65"                                                 
                                                                                
  PRMONTH66                  LENGTH=3                                           
  LABEL="Month of procedure 66"                                                 
                                                                                
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
                                                                                
  PRYEAR51                   LENGTH=3                                           
  LABEL="Year of procedure 51"                                                  
                                                                                
  PRYEAR52                   LENGTH=3                                           
  LABEL="Year of procedure 52"                                                  
                                                                                
  PRYEAR53                   LENGTH=3                                           
  LABEL="Year of procedure 53"                                                  
                                                                                
  PRYEAR54                   LENGTH=3                                           
  LABEL="Year of procedure 54"                                                  
                                                                                
  PRYEAR55                   LENGTH=3                                           
  LABEL="Year of procedure 55"                                                  
                                                                                
  PRYEAR56                   LENGTH=3                                           
  LABEL="Year of procedure 56"                                                  
                                                                                
  PRYEAR57                   LENGTH=3                                           
  LABEL="Year of procedure 57"                                                  
                                                                                
  PRYEAR58                   LENGTH=3                                           
  LABEL="Year of procedure 58"                                                  
                                                                                
  PRYEAR59                   LENGTH=3                                           
  LABEL="Year of procedure 59"                                                  
                                                                                
  PRYEAR60                   LENGTH=3                                           
  LABEL="Year of procedure 60"                                                  
                                                                                
  PRYEAR61                   LENGTH=3                                           
  LABEL="Year of procedure 61"                                                  
                                                                                
  PRYEAR62                   LENGTH=3                                           
  LABEL="Year of procedure 62"                                                  
                                                                                
  PRYEAR63                   LENGTH=3                                           
  LABEL="Year of procedure 63"                                                  
                                                                                
  PRYEAR64                   LENGTH=3                                           
  LABEL="Year of procedure 64"                                                  
                                                                                
  PRYEAR65                   LENGTH=3                                           
  LABEL="Year of procedure 65"                                                  
                                                                                
  PRYEAR66                   LENGTH=3                                           
  LABEL="Year of procedure 66"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      ADRG                          N3PF.                               
      @4      ADRGRISKMORTALITY             N2PF.                               
      @6      ADRGSEV                       N2PF.                               
      @8      AGE                           N3PF.                               
      @11     AGEMONTH                      N3PF.                               
      @14     AMDC                          N2PF.                               
      @16     AMONTH                        N2PF.                               
      @18     ASOURCE                       N2PF.                               
      @20     ASOURCE_X                     $CHAR1.                             
      @21     ASOURCEUB92                   $CHAR1.                             
      @22     ATYPE                         N2PF.                               
      @24     AWEEKEND                      N2PF.                               
      @26     BWT                           N4PF.                               
      @30     DaysBetweenVisits             N4PF.                               
      @34     DaysToEvent                   N6PF.                               
      @40     DIED                          N2PF.                               
      @42     DISP_X                        $CHAR2.                             
      @44     DISPUB04                      N2PF.                               
      @46     DISPUNIFORM                   N2PF.                               
      @48     DMONTH                        N2PF.                               
      @50     DNR                           N2PF.                               
      @52     DQTR                          N2PF.                               
      @54     DRG                           N3PF.                               
      @57     DRG_NoPOA                     N3PF.                               
      @60     DRG32                         N3PF.                               
      @63     DRGVER                        N2PF.                               
      @65     DSHOSPID                      $CHAR17.                            
      @82     DX_Admitting                  $CHAR7.                             
      @89     DX1                           $CHAR7.                             
      @96     DX2                           $CHAR7.                             
      @103    DX3                           $CHAR7.                             
      @110    DX4                           $CHAR7.                             
      @117    DX5                           $CHAR7.                             
      @124    DX6                           $CHAR7.                             
      @131    DX7                           $CHAR7.                             
      @138    DX8                           $CHAR7.                             
      @145    DX9                           $CHAR7.                             
      @152    DX10                          $CHAR7.                             
      @159    DX11                          $CHAR7.                             
      @166    DX12                          $CHAR7.                             
      @173    DX13                          $CHAR7.                             
      @180    DX14                          $CHAR7.                             
      @187    DX15                          $CHAR7.                             
      @194    DX16                          $CHAR7.                             
      @201    DX17                          $CHAR7.                             
      @208    DX18                          $CHAR7.                             
      @215    DX19                          $CHAR7.                             
      @222    DX20                          $CHAR7.                             
      @229    DX21                          $CHAR7.                             
      @236    DX22                          $CHAR7.                             
      @243    DX23                          $CHAR7.                             
      @250    DX24                          $CHAR7.                             
      @257    DX25                          $CHAR7.                             
      @264    DX26                          $CHAR7.                             
      @271    DX27                          $CHAR7.                             
      @278    DX28                          $CHAR7.                             
      @285    DX29                          $CHAR7.                             
      @292    DX30                          $CHAR7.                             
      @299    DX31                          $CHAR7.                             
      @306    DX32                          $CHAR7.                             
      @313    DX33                          $CHAR7.                             
      @320    DX34                          $CHAR7.                             
      @327    DX35                          $CHAR7.                             
      @334    DX36                          $CHAR7.                             
      @341    DX37                          $CHAR7.                             
      @348    DX38                          $CHAR7.                             
      @355    DX39                          $CHAR7.                             
      @362    DX40                          $CHAR7.                             
      @369    DX41                          $CHAR7.                             
      @376    DX42                          $CHAR7.                             
      @383    DX43                          $CHAR7.                             
      @390    DX44                          $CHAR7.                             
      @397    DX45                          $CHAR7.                             
      @404    DX46                          $CHAR7.                             
      @411    DX47                          $CHAR7.                             
      @418    DX48                          $CHAR7.                             
      @425    DX49                          $CHAR7.                             
      @432    DX50                          $CHAR7.                             
      @439    DX51                          $CHAR7.                             
      @446    DX52                          $CHAR7.                             
      @453    DX53                          $CHAR7.                             
      @460    DX54                          $CHAR7.                             
      @467    DX55                          $CHAR7.                             
      @474    DX56                          $CHAR7.                             
      @481    DX57                          $CHAR7.                             
      @488    DX58                          $CHAR7.                             
      @495    DX59                          $CHAR7.                             
      @502    DX60                          $CHAR7.                             
      @509    DX61                          $CHAR7.                             
      @516    DX62                          $CHAR7.                             
      @523    DX63                          $CHAR7.                             
      @530    DX64                          $CHAR7.                             
      @537    DX65                          $CHAR7.                             
      @544    DX66                          $CHAR7.                             
      @551    DX67                          $CHAR7.                             
      @558    DX68                          $CHAR7.                             
      @565    DX69                          $CHAR7.                             
      @572    DX70                          $CHAR7.                             
      @579    DX71                          $CHAR7.                             
      @586    DXCCS1                        N4PF.                               
      @590    DXCCS2                        N4PF.                               
      @594    DXCCS3                        N4PF.                               
      @598    DXCCS4                        N4PF.                               
      @602    DXCCS5                        N4PF.                               
      @606    DXCCS6                        N4PF.                               
      @610    DXCCS7                        N4PF.                               
      @614    DXCCS8                        N4PF.                               
      @618    DXCCS9                        N4PF.                               
      @622    DXCCS10                       N4PF.                               
      @626    DXCCS11                       N4PF.                               
      @630    DXCCS12                       N4PF.                               
      @634    DXCCS13                       N4PF.                               
      @638    DXCCS14                       N4PF.                               
      @642    DXCCS15                       N4PF.                               
      @646    DXCCS16                       N4PF.                               
      @650    DXCCS17                       N4PF.                               
      @654    DXCCS18                       N4PF.                               
      @658    DXCCS19                       N4PF.                               
      @662    DXCCS20                       N4PF.                               
      @666    DXCCS21                       N4PF.                               
      @670    DXCCS22                       N4PF.                               
      @674    DXCCS23                       N4PF.                               
      @678    DXCCS24                       N4PF.                               
      @682    DXCCS25                       N4PF.                               
      @686    DXCCS26                       N4PF.                               
      @690    DXCCS27                       N4PF.                               
      @694    DXCCS28                       N4PF.                               
      @698    DXCCS29                       N4PF.                               
      @702    DXCCS30                       N4PF.                               
      @706    DXCCS31                       N4PF.                               
      @710    DXCCS32                       N4PF.                               
      @714    DXCCS33                       N4PF.                               
      @718    DXCCS34                       N4PF.                               
      @722    DXCCS35                       N4PF.                               
      @726    DXCCS36                       N4PF.                               
      @730    DXCCS37                       N4PF.                               
      @734    DXCCS38                       N4PF.                               
      @738    DXCCS39                       N4PF.                               
      @742    DXCCS40                       N4PF.                               
      @746    DXCCS41                       N4PF.                               
      @750    DXCCS42                       N4PF.                               
      @754    DXCCS43                       N4PF.                               
      @758    DXCCS44                       N4PF.                               
      @762    DXCCS45                       N4PF.                               
      @766    DXCCS46                       N4PF.                               
      @770    DXCCS47                       N4PF.                               
      @774    DXCCS48                       N4PF.                               
      @778    DXCCS49                       N4PF.                               
      @782    DXCCS50                       N4PF.                               
      @786    DXCCS51                       N4PF.                               
      @790    DXCCS52                       N4PF.                               
      @794    DXCCS53                       N4PF.                               
      @798    DXCCS54                       N4PF.                               
      @802    DXCCS55                       N4PF.                               
      @806    DXCCS56                       N4PF.                               
      @810    DXCCS57                       N4PF.                               
      @814    DXCCS58                       N4PF.                               
      @818    DXCCS59                       N4PF.                               
      @822    DXCCS60                       N4PF.                               
      @826    DXCCS61                       N4PF.                               
      @830    DXCCS62                       N4PF.                               
      @834    DXCCS63                       N4PF.                               
      @838    DXCCS64                       N4PF.                               
      @842    DXCCS65                       N4PF.                               
      @846    DXCCS66                       N4PF.                               
      @850    DXCCS67                       N4PF.                               
      @854    DXCCS68                       N4PF.                               
      @858    DXCCS69                       N4PF.                               
      @862    DXCCS70                       N4PF.                               
      @866    DXCCS71                       N4PF.                               
      @870    DXPOA1                        $CHAR1.                             
      @871    DXPOA2                        $CHAR1.                             
      @872    DXPOA3                        $CHAR1.                             
      @873    DXPOA4                        $CHAR1.                             
      @874    DXPOA5                        $CHAR1.                             
      @875    DXPOA6                        $CHAR1.                             
      @876    DXPOA7                        $CHAR1.                             
      @877    DXPOA8                        $CHAR1.                             
      @878    DXPOA9                        $CHAR1.                             
      @879    DXPOA10                       $CHAR1.                             
      @880    DXPOA11                       $CHAR1.                             
      @881    DXPOA12                       $CHAR1.                             
      @882    DXPOA13                       $CHAR1.                             
      @883    DXPOA14                       $CHAR1.                             
      @884    DXPOA15                       $CHAR1.                             
      @885    DXPOA16                       $CHAR1.                             
      @886    DXPOA17                       $CHAR1.                             
      @887    DXPOA18                       $CHAR1.                             
      @888    DXPOA19                       $CHAR1.                             
      @889    DXPOA20                       $CHAR1.                             
      @890    DXPOA21                       $CHAR1.                             
      @891    DXPOA22                       $CHAR1.                             
      @892    DXPOA23                       $CHAR1.                             
      @893    DXPOA24                       $CHAR1.                             
      @894    DXPOA25                       $CHAR1.                             
      @895    DXPOA26                       $CHAR1.                             
      @896    DXPOA27                       $CHAR1.                             
      @897    DXPOA28                       $CHAR1.                             
      @898    DXPOA29                       $CHAR1.                             
      @899    DXPOA30                       $CHAR1.                             
      @900    DXPOA31                       $CHAR1.                             
      @901    DXPOA32                       $CHAR1.                             
      @902    DXPOA33                       $CHAR1.                             
      @903    DXPOA34                       $CHAR1.                             
      @904    DXPOA35                       $CHAR1.                             
      @905    DXPOA36                       $CHAR1.                             
      @906    DXPOA37                       $CHAR1.                             
      @907    DXPOA38                       $CHAR1.                             
      @908    DXPOA39                       $CHAR1.                             
      @909    DXPOA40                       $CHAR1.                             
      @910    DXPOA41                       $CHAR1.                             
      @911    DXPOA42                       $CHAR1.                             
      @912    DXPOA43                       $CHAR1.                             
      @913    DXPOA44                       $CHAR1.                             
      @914    DXPOA45                       $CHAR1.                             
      @915    DXPOA46                       $CHAR1.                             
      @916    DXPOA47                       $CHAR1.                             
      @917    DXPOA48                       $CHAR1.                             
      @918    DXPOA49                       $CHAR1.                             
      @919    DXPOA50                       $CHAR1.                             
      @920    DXPOA51                       $CHAR1.                             
      @921    DXPOA52                       $CHAR1.                             
      @922    DXPOA53                       $CHAR1.                             
      @923    DXPOA54                       $CHAR1.                             
      @924    DXPOA55                       $CHAR1.                             
      @925    DXPOA56                       $CHAR1.                             
      @926    DXPOA57                       $CHAR1.                             
      @927    DXPOA58                       $CHAR1.                             
      @928    DXPOA59                       $CHAR1.                             
      @929    DXPOA60                       $CHAR1.                             
      @930    DXPOA61                       $CHAR1.                             
      @931    DXPOA62                       $CHAR1.                             
      @932    DXPOA63                       $CHAR1.                             
      @933    DXPOA64                       $CHAR1.                             
      @934    DXPOA65                       $CHAR1.                             
      @935    DXPOA66                       $CHAR1.                             
      @936    DXPOA67                       $CHAR1.                             
      @937    DXPOA68                       $CHAR1.                             
      @938    DXPOA69                       $CHAR1.                             
      @939    DXPOA70                       $CHAR1.                             
      @940    DXPOA71                       $CHAR1.                             
      @941    DXVER                         N3PF.                               
      @944    E_CCS1                        N4PF.                               
      @948    E_CCS2                        N4PF.                               
      @952    E_CCS3                        N4PF.                               
      @956    E_CCS4                        N4PF.                               
      @960    E_CCS5                        N4PF.                               
      @964    E_CCS6                        N4PF.                               
      @968    E_CCS7                        N4PF.                               
      @972    E_CCS8                        N4PF.                               
      @976    E_CCS9                        N4PF.                               
      @980    E_CCS10                       N4PF.                               
      @984    E_CCS11                       N4PF.                               
      @988    E_POA1                        $CHAR1.                             
      @989    E_POA2                        $CHAR1.                             
      @990    E_POA3                        $CHAR1.                             
      @991    E_POA4                        $CHAR1.                             
      @992    E_POA5                        $CHAR1.                             
      @993    E_POA6                        $CHAR1.                             
      @994    E_POA7                        $CHAR1.                             
      @995    E_POA8                        $CHAR1.                             
      @996    E_POA9                        $CHAR1.                             
      @997    E_POA10                       $CHAR1.                             
      @998    E_POA11                       $CHAR1.                             
      @999    ECODE1                        $CHAR7.                             
      @1006   ECODE2                        $CHAR7.                             
      @1013   ECODE3                        $CHAR7.                             
      @1020   ECODE4                        $CHAR7.                             
      @1027   ECODE5                        $CHAR7.                             
      @1034   ECODE6                        $CHAR7.                             
      @1041   ECODE7                        $CHAR7.                             
      @1048   ECODE8                        $CHAR7.                             
      @1055   ECODE9                        $CHAR7.                             
      @1062   ECODE10                       $CHAR7.                             
      @1069   ECODE11                       $CHAR7.                             
      @1076   FEMALE                        N2PF.                               
      @1078   HCUP_ED                       N2PF.                               
      @1080   HCUP_OS                       N2PF.                               
      @1082   HISPANIC                      N2PF.                               
      @1084   HISPANIC_X                    $CHAR15.                            
      @1099   Homeless                      N2PF.                               
      @1101   HOSPBRTH                      N3PF.                               
      @1104   HOSPST                        $CHAR2.                             
      @1106   KEY                           15.                                 
      @1121   LOS                           N5PF.                               
      @1126   LOS_X                         N6PF.                               
      @1132   MDC                           N2PF.                               
      @1134   MDC_NoPOA                     N2PF.                               
      @1136   MDC32                         N2PF.                               
      @1138   MEDINCSTQ                     N2PF.                               
      @1140   NCHRONIC                      N3PF.                               
      @1143   NDX                           N3PF.                               
      @1146   NECODE                        N2PF.                               
      @1148   NEOMAT                        N2PF.                               
      @1150   NPR                           N3PF.                               
      @1153   ORPROC                        N2PF.                               
      @1155   OS_TIME                       N11P2F.                             
      @1166   PAY1                          N2PF.                               
      @1168   PAY1_X                        $CHAR1.                             
      @1169   PAY2                          N2PF.                               
      @1171   PAY2_X                        $CHAR1.                             
      @1172   PAYER1_X                      $CHAR3.                             
      @1175   PAYER2_X                      $CHAR3.                             
      @1178   PL_CBSA                       N3PF.                               
      @1181   PL_UR_CAT4                    N2PF.                               
      @1183   POA_Disch_Edit1               N2PF.                               
      @1185   POA_Disch_Edit2               N2PF.                               
      @1187   POA_Hosp_Edit1                N2PF.                               
      @1189   POA_Hosp_Edit2                N2PF.                               
      @1191   POA_Hosp_Edit3                N2PF.                               
      @1193   POA_Hosp_Edit3_Value          N8P2F.                              
      @1201   PR1                           $CHAR7.                             
      @1208   PR2                           $CHAR7.                             
      @1215   PR3                           $CHAR7.                             
      @1222   PR4                           $CHAR7.                             
      @1229   PR5                           $CHAR7.                             
      @1236   PR6                           $CHAR7.                             
      @1243   PR7                           $CHAR7.                             
      @1250   PR8                           $CHAR7.                             
      @1257   PR9                           $CHAR7.                             
      @1264   PR10                          $CHAR7.                             
      @1271   PR11                          $CHAR7.                             
      @1278   PR12                          $CHAR7.                             
      @1285   PR13                          $CHAR7.                             
      @1292   PR14                          $CHAR7.                             
      @1299   PR15                          $CHAR7.                             
      @1306   PR16                          $CHAR7.                             
      @1313   PR17                          $CHAR7.                             
      @1320   PR18                          $CHAR7.                             
      @1327   PR19                          $CHAR7.                             
      @1334   PR20                          $CHAR7.                             
      @1341   PR21                          $CHAR7.                             
      @1348   PR22                          $CHAR7.                             
      @1355   PR23                          $CHAR7.                             
      @1362   PR24                          $CHAR7.                             
      @1369   PR25                          $CHAR7.                             
      @1376   PR26                          $CHAR7.                             
      @1383   PR27                          $CHAR7.                             
      @1390   PR28                          $CHAR7.                             
      @1397   PR29                          $CHAR7.                             
      @1404   PR30                          $CHAR7.                             
      @1411   PR31                          $CHAR7.                             
      @1418   PR32                          $CHAR7.                             
      @1425   PR33                          $CHAR7.                             
      @1432   PR34                          $CHAR7.                             
      @1439   PR35                          $CHAR7.                             
      @1446   PR36                          $CHAR7.                             
      @1453   PR37                          $CHAR7.                             
      @1460   PR38                          $CHAR7.                             
      @1467   PR39                          $CHAR7.                             
      @1474   PR40                          $CHAR7.                             
      @1481   PR41                          $CHAR7.                             
      @1488   PR42                          $CHAR7.                             
      @1495   PR43                          $CHAR7.                             
      @1502   PR44                          $CHAR7.                             
      @1509   PR45                          $CHAR7.                             
      @1516   PR46                          $CHAR7.                             
      @1523   PR47                          $CHAR7.                             
      @1530   PR48                          $CHAR7.                             
      @1537   PR49                          $CHAR7.                             
      @1544   PR50                          $CHAR7.                             
      @1551   PR51                          $CHAR7.                             
      @1558   PR52                          $CHAR7.                             
      @1565   PR53                          $CHAR7.                             
      @1572   PR54                          $CHAR7.                             
      @1579   PR55                          $CHAR7.                             
      @1586   PR56                          $CHAR7.                             
      @1593   PR57                          $CHAR7.                             
      @1600   PR58                          $CHAR7.                             
      @1607   PR59                          $CHAR7.                             
      @1614   PR60                          $CHAR7.                             
      @1621   PR61                          $CHAR7.                             
      @1628   PR62                          $CHAR7.                             
      @1635   PR63                          $CHAR7.                             
      @1642   PR64                          $CHAR7.                             
      @1649   PR65                          $CHAR7.                             
      @1656   PR66                          $CHAR7.                             
      @1663   PRCCS1                        N3PF.                               
      @1666   PRCCS2                        N3PF.                               
      @1669   PRCCS3                        N3PF.                               
      @1672   PRCCS4                        N3PF.                               
      @1675   PRCCS5                        N3PF.                               
      @1678   PRCCS6                        N3PF.                               
      @1681   PRCCS7                        N3PF.                               
      @1684   PRCCS8                        N3PF.                               
      @1687   PRCCS9                        N3PF.                               
      @1690   PRCCS10                       N3PF.                               
      @1693   PRCCS11                       N3PF.                               
      @1696   PRCCS12                       N3PF.                               
      @1699   PRCCS13                       N3PF.                               
      @1702   PRCCS14                       N3PF.                               
      @1705   PRCCS15                       N3PF.                               
      @1708   PRCCS16                       N3PF.                               
      @1711   PRCCS17                       N3PF.                               
      @1714   PRCCS18                       N3PF.                               
      @1717   PRCCS19                       N3PF.                               
      @1720   PRCCS20                       N3PF.                               
      @1723   PRCCS21                       N3PF.                               
      @1726   PRCCS22                       N3PF.                               
      @1729   PRCCS23                       N3PF.                               
      @1732   PRCCS24                       N3PF.                               
      @1735   PRCCS25                       N3PF.                               
      @1738   PRCCS26                       N3PF.                               
      @1741   PRCCS27                       N3PF.                               
      @1744   PRCCS28                       N3PF.                               
      @1747   PRCCS29                       N3PF.                               
      @1750   PRCCS30                       N3PF.                               
      @1753   PRCCS31                       N3PF.                               
      @1756   PRCCS32                       N3PF.                               
      @1759   PRCCS33                       N3PF.                               
      @1762   PRCCS34                       N3PF.                               
      @1765   PRCCS35                       N3PF.                               
      @1768   PRCCS36                       N3PF.                               
      @1771   PRCCS37                       N3PF.                               
      @1774   PRCCS38                       N3PF.                               
      @1777   PRCCS39                       N3PF.                               
      @1780   PRCCS40                       N3PF.                               
      @1783   PRCCS41                       N3PF.                               
      @1786   PRCCS42                       N3PF.                               
      @1789   PRCCS43                       N3PF.                               
      @1792   PRCCS44                       N3PF.                               
      @1795   PRCCS45                       N3PF.                               
      @1798   PRCCS46                       N3PF.                               
      @1801   PRCCS47                       N3PF.                               
      @1804   PRCCS48                       N3PF.                               
      @1807   PRCCS49                       N3PF.                               
      @1810   PRCCS50                       N3PF.                               
      @1813   PRCCS51                       N3PF.                               
      @1816   PRCCS52                       N3PF.                               
      @1819   PRCCS53                       N3PF.                               
      @1822   PRCCS54                       N3PF.                               
      @1825   PRCCS55                       N3PF.                               
      @1828   PRCCS56                       N3PF.                               
      @1831   PRCCS57                       N3PF.                               
      @1834   PRCCS58                       N3PF.                               
      @1837   PRCCS59                       N3PF.                               
      @1840   PRCCS60                       N3PF.                               
      @1843   PRCCS61                       N3PF.                               
      @1846   PRCCS62                       N3PF.                               
      @1849   PRCCS63                       N3PF.                               
      @1852   PRCCS64                       N3PF.                               
      @1855   PRCCS65                       N3PF.                               
      @1858   PRCCS66                       N3PF.                               
      @1861   PRDAY1                        N5PF.                               
      @1866   PRDAY2                        N5PF.                               
      @1871   PRDAY3                        N5PF.                               
      @1876   PRDAY4                        N5PF.                               
      @1881   PRDAY5                        N5PF.                               
      @1886   PRDAY6                        N5PF.                               
      @1891   PRDAY7                        N5PF.                               
      @1896   PRDAY8                        N5PF.                               
      @1901   PRDAY9                        N5PF.                               
      @1906   PRDAY10                       N5PF.                               
      @1911   PRDAY11                       N5PF.                               
      @1916   PRDAY12                       N5PF.                               
      @1921   PRDAY13                       N5PF.                               
      @1926   PRDAY14                       N5PF.                               
      @1931   PRDAY15                       N5PF.                               
      @1936   PRDAY16                       N5PF.                               
      @1941   PRDAY17                       N5PF.                               
      @1946   PRDAY18                       N5PF.                               
      @1951   PRDAY19                       N5PF.                               
      @1956   PRDAY20                       N5PF.                               
      @1961   PRDAY21                       N5PF.                               
      @1966   PRDAY22                       N5PF.                               
      @1971   PRDAY23                       N5PF.                               
      @1976   PRDAY24                       N5PF.                               
      @1981   PRDAY25                       N5PF.                               
      @1986   PRDAY26                       N5PF.                               
      @1991   PRDAY27                       N5PF.                               
      @1996   PRDAY28                       N5PF.                               
      @2001   PRDAY29                       N5PF.                               
      @2006   PRDAY30                       N5PF.                               
      @2011   PRDAY31                       N5PF.                               
      @2016   PRDAY32                       N5PF.                               
      @2021   PRDAY33                       N5PF.                               
      @2026   PRDAY34                       N5PF.                               
      @2031   PRDAY35                       N5PF.                               
      @2036   PRDAY36                       N5PF.                               
      @2041   PRDAY37                       N5PF.                               
      @2046   PRDAY38                       N5PF.                               
      @2051   PRDAY39                       N5PF.                               
      @2056   PRDAY40                       N5PF.                               
      @2061   PRDAY41                       N5PF.                               
      @2066   PRDAY42                       N5PF.                               
      @2071   PRDAY43                       N5PF.                               
      @2076   PRDAY44                       N5PF.                               
      @2081   PRDAY45                       N5PF.                               
      @2086   PRDAY46                       N5PF.                               
      @2091   PRDAY47                       N5PF.                               
      @2096   PRDAY48                       N5PF.                               
      @2101   PRDAY49                       N5PF.                               
      @2106   PRDAY50                       N5PF.                               
      @2111   PRDAY51                       N5PF.                               
      @2116   PRDAY52                       N5PF.                               
      @2121   PRDAY53                       N5PF.                               
      @2126   PRDAY54                       N5PF.                               
      @2131   PRDAY55                       N5PF.                               
      @2136   PRDAY56                       N5PF.                               
      @2141   PRDAY57                       N5PF.                               
      @2146   PRDAY58                       N5PF.                               
      @2151   PRDAY59                       N5PF.                               
      @2156   PRDAY60                       N5PF.                               
      @2161   PRDAY61                       N5PF.                               
      @2166   PRDAY62                       N5PF.                               
      @2171   PRDAY63                       N5PF.                               
      @2176   PRDAY64                       N5PF.                               
      @2181   PRDAY65                       N5PF.                               
      @2186   PRDAY66                       N5PF.                               
      @2191   PROCTYPE                      N3PF.                               
      @2194   PRVER                         N3PF.                               
      @2197   PSTATE                        $CHAR2.                             
      @2199   PSTCO2                        N5PF.                               
      @2204   RACE                          N2PF.                               
      @2206   RACE_X                        $CHAR13.                            
      @2219   SERVICELINE                   N2PF.                               
      @2221   TOTCHG                        N10PF.                              
      @2231   TOTCHG_X                      N15P2F.                             
      @2246   TRAN_IN                       N2PF.                               
      @2248   TRAN_OUT                      N2PF.                               
      @2250   VisitLink                     N9PF.                               
      @2259   YEAR                          N4PF.                               
      @2263   ZIP3                          $CHAR3.                             
      @2266   ZIPINC_QRTL                   N3PF.                               
      @2269   AYEAR                         N4PF.                               
      @2273   PRMONTH1                      N2PF.                               
      @2275   PRMONTH2                      N2PF.                               
      @2277   PRMONTH3                      N2PF.                               
      @2279   PRMONTH4                      N2PF.                               
      @2281   PRMONTH5                      N2PF.                               
      @2283   PRMONTH6                      N2PF.                               
      @2285   PRMONTH7                      N2PF.                               
      @2287   PRMONTH8                      N2PF.                               
      @2289   PRMONTH9                      N2PF.                               
      @2291   PRMONTH10                     N2PF.                               
      @2293   PRMONTH11                     N2PF.                               
      @2295   PRMONTH12                     N2PF.                               
      @2297   PRMONTH13                     N2PF.                               
      @2299   PRMONTH14                     N2PF.                               
      @2301   PRMONTH15                     N2PF.                               
      @2303   PRMONTH16                     N2PF.                               
      @2305   PRMONTH17                     N2PF.                               
      @2307   PRMONTH18                     N2PF.                               
      @2309   PRMONTH19                     N2PF.                               
      @2311   PRMONTH20                     N2PF.                               
      @2313   PRMONTH21                     N2PF.                               
      @2315   PRMONTH22                     N2PF.                               
      @2317   PRMONTH23                     N2PF.                               
      @2319   PRMONTH24                     N2PF.                               
      @2321   PRMONTH25                     N2PF.                               
      @2323   PRMONTH26                     N2PF.                               
      @2325   PRMONTH27                     N2PF.                               
      @2327   PRMONTH28                     N2PF.                               
      @2329   PRMONTH29                     N2PF.                               
      @2331   PRMONTH30                     N2PF.                               
      @2333   PRMONTH31                     N2PF.                               
      @2335   PRMONTH32                     N2PF.                               
      @2337   PRMONTH33                     N2PF.                               
      @2339   PRMONTH34                     N2PF.                               
      @2341   PRMONTH35                     N2PF.                               
      @2343   PRMONTH36                     N2PF.                               
      @2345   PRMONTH37                     N2PF.                               
      @2347   PRMONTH38                     N2PF.                               
      @2349   PRMONTH39                     N2PF.                               
      @2351   PRMONTH40                     N2PF.                               
      @2353   PRMONTH41                     N2PF.                               
      @2355   PRMONTH42                     N2PF.                               
      @2357   PRMONTH43                     N2PF.                               
      @2359   PRMONTH44                     N2PF.                               
      @2361   PRMONTH45                     N2PF.                               
      @2363   PRMONTH46                     N2PF.                               
      @2365   PRMONTH47                     N2PF.                               
      @2367   PRMONTH48                     N2PF.                               
      @2369   PRMONTH49                     N2PF.                               
      @2371   PRMONTH50                     N2PF.                               
      @2373   PRMONTH51                     N2PF.                               
      @2375   PRMONTH52                     N2PF.                               
      @2377   PRMONTH53                     N2PF.                               
      @2379   PRMONTH54                     N2PF.                               
      @2381   PRMONTH55                     N2PF.                               
      @2383   PRMONTH56                     N2PF.                               
      @2385   PRMONTH57                     N2PF.                               
      @2387   PRMONTH58                     N2PF.                               
      @2389   PRMONTH59                     N2PF.                               
      @2391   PRMONTH60                     N2PF.                               
      @2393   PRMONTH61                     N2PF.                               
      @2395   PRMONTH62                     N2PF.                               
      @2397   PRMONTH63                     N2PF.                               
      @2399   PRMONTH64                     N2PF.                               
      @2401   PRMONTH65                     N2PF.                               
      @2403   PRMONTH66                     N2PF.                               
      @2405   PRYEAR1                       N4PF.                               
      @2409   PRYEAR2                       N4PF.                               
      @2413   PRYEAR3                       N4PF.                               
      @2417   PRYEAR4                       N4PF.                               
      @2421   PRYEAR5                       N4PF.                               
      @2425   PRYEAR6                       N4PF.                               
      @2429   PRYEAR7                       N4PF.                               
      @2433   PRYEAR8                       N4PF.                               
      @2437   PRYEAR9                       N4PF.                               
      @2441   PRYEAR10                      N4PF.                               
      @2445   PRYEAR11                      N4PF.                               
      @2449   PRYEAR12                      N4PF.                               
      @2453   PRYEAR13                      N4PF.                               
      @2457   PRYEAR14                      N4PF.                               
      @2461   PRYEAR15                      N4PF.                               
      @2465   PRYEAR16                      N4PF.                               
      @2469   PRYEAR17                      N4PF.                               
      @2473   PRYEAR18                      N4PF.                               
      @2477   PRYEAR19                      N4PF.                               
      @2481   PRYEAR20                      N4PF.                               
      @2485   PRYEAR21                      N4PF.                               
      @2489   PRYEAR22                      N4PF.                               
      @2493   PRYEAR23                      N4PF.                               
      @2497   PRYEAR24                      N4PF.                               
      @2501   PRYEAR25                      N4PF.                               
      @2505   PRYEAR26                      N4PF.                               
      @2509   PRYEAR27                      N4PF.                               
      @2513   PRYEAR28                      N4PF.                               
      @2517   PRYEAR29                      N4PF.                               
      @2521   PRYEAR30                      N4PF.                               
      @2525   PRYEAR31                      N4PF.                               
      @2529   PRYEAR32                      N4PF.                               
      @2533   PRYEAR33                      N4PF.                               
      @2537   PRYEAR34                      N4PF.                               
      @2541   PRYEAR35                      N4PF.                               
      @2545   PRYEAR36                      N4PF.                               
      @2549   PRYEAR37                      N4PF.                               
      @2553   PRYEAR38                      N4PF.                               
      @2557   PRYEAR39                      N4PF.                               
      @2561   PRYEAR40                      N4PF.                               
      @2565   PRYEAR41                      N4PF.                               
      @2569   PRYEAR42                      N4PF.                               
      @2573   PRYEAR43                      N4PF.                               
      @2577   PRYEAR44                      N4PF.                               
      @2581   PRYEAR45                      N4PF.                               
      @2585   PRYEAR46                      N4PF.                               
      @2589   PRYEAR47                      N4PF.                               
      @2593   PRYEAR48                      N4PF.                               
      @2597   PRYEAR49                      N4PF.                               
      @2601   PRYEAR50                      N4PF.                               
      @2605   PRYEAR51                      N4PF.                               
      @2609   PRYEAR52                      N4PF.                               
      @2613   PRYEAR53                      N4PF.                               
      @2617   PRYEAR54                      N4PF.                               
      @2621   PRYEAR55                      N4PF.                               
      @2625   PRYEAR56                      N4PF.                               
      @2629   PRYEAR57                      N4PF.                               
      @2633   PRYEAR58                      N4PF.                               
      @2637   PRYEAR59                      N4PF.                               
      @2641   PRYEAR60                      N4PF.                               
      @2645   PRYEAR61                      N4PF.                               
      @2649   PRYEAR62                      N4PF.                               
      @2653   PRYEAR63                      N4PF.                               
      @2657   PRYEAR64                      N4PF.                               
      @2661   PRYEAR65                      N4PF.                               
      @2665   PRYEAR66                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
