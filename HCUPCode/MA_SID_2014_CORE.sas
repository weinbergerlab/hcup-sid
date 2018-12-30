/*******************************************************************            
* Creation Date: 03/28/2017                                                     
*   MA_SID_2014_CORE.SAS:                                                       
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
DATA MA_SIDC_2014_CORE;                                                         
INFILE 'MA_SID_2014_CORE.ASC' FIRSTOBS=3 LRECL = 2702;                          
                                                                                
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
                                                                                
  ASOURCEUB92                LENGTH=$1                                          
  LABEL="Admission source (UB-92 standard coding)"                              
                                                                                
  ASOURCE_X                  LENGTH=$1                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DNR                        LENGTH=3                                           
  LABEL="Do not resuscitate indicator"                                          
                                                                                
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
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  DX_Admitting               LENGTH=$7                                          
  LABEL="Admitting Diagnosis Code"                                              
                                                                                
  DaysBetweenVisits          LENGTH=3                                           
  LABEL="Number of days between visits"                                         
                                                                                
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
                                                                                
  ECODE8                     LENGTH=$7                                          
  LABEL="E code 8"                                                              
                                                                                
  ECODE9                     LENGTH=$7                                          
  LABEL="E code 9"                                                              
                                                                                
  ECODE10                    LENGTH=$7                                          
  LABEL="E code 10"                                                             
                                                                                
  ECODE11                    LENGTH=$7                                          
  LABEL="E code 11"                                                             
                                                                                
  ECODE12                    LENGTH=$7                                          
  LABEL="E code 12"                                                             
                                                                                
  ECODE13                    LENGTH=$7                                          
  LABEL="E code 13"                                                             
                                                                                
  ECODE14                    LENGTH=$7                                          
  LABEL="E code 14"                                                             
                                                                                
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
                                                                                
  E_CCS12                    LENGTH=3                                           
  LABEL="CCS: E Code 12"                                                        
                                                                                
  E_CCS13                    LENGTH=3                                           
  LABEL="CCS: E Code 13"                                                        
                                                                                
  E_CCS14                    LENGTH=3                                           
  LABEL="CCS: E Code 14"                                                        
                                                                                
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
                                                                                
  E_POA12                    LENGTH=$1                                          
  LABEL="E Code 12, present on admission indicator"                             
                                                                                
  E_POA13                    LENGTH=$1                                          
  LABEL="E Code 13, present on admission indicator"                             
                                                                                
  E_POA14                    LENGTH=$1                                          
  LABEL="E Code 14, present on admission indicator"                             
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$15                                         
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
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
      @20     ASOURCEUB92                   $CHAR1.                             
      @21     ASOURCE_X                     $CHAR1.                             
      @22     ATYPE                         N2PF.                               
      @24     AWEEKEND                      N2PF.                               
      @26     BWT                           N4PF.                               
      @30     DIED                          N2PF.                               
      @32     DISPUB04                      N2PF.                               
      @34     DISPUNIFORM                   N2PF.                               
      @36     DISP_X                        $CHAR2.                             
      @38     DMONTH                        N2PF.                               
      @40     DNR                           N2PF.                               
      @42     DQTR                          N2PF.                               
      @44     DRG                           N3PF.                               
      @47     DRG24                         N3PF.                               
      @50     DRGVER                        N2PF.                               
      @52     DRG_NoPOA                     N3PF.                               
      @55     DSHOSPID                      $CHAR17.                            
      @72     DX1                           $CHAR7.                             
      @79     DX2                           $CHAR7.                             
      @86     DX3                           $CHAR7.                             
      @93     DX4                           $CHAR7.                             
      @100    DX5                           $CHAR7.                             
      @107    DX6                           $CHAR7.                             
      @114    DX7                           $CHAR7.                             
      @121    DX8                           $CHAR7.                             
      @128    DX9                           $CHAR7.                             
      @135    DX10                          $CHAR7.                             
      @142    DX11                          $CHAR7.                             
      @149    DX12                          $CHAR7.                             
      @156    DX13                          $CHAR7.                             
      @163    DX14                          $CHAR7.                             
      @170    DX15                          $CHAR7.                             
      @177    DX16                          $CHAR7.                             
      @184    DX17                          $CHAR7.                             
      @191    DX18                          $CHAR7.                             
      @198    DX19                          $CHAR7.                             
      @205    DX20                          $CHAR7.                             
      @212    DX21                          $CHAR7.                             
      @219    DX22                          $CHAR7.                             
      @226    DX23                          $CHAR7.                             
      @233    DX24                          $CHAR7.                             
      @240    DX25                          $CHAR7.                             
      @247    DX26                          $CHAR7.                             
      @254    DX27                          $CHAR7.                             
      @261    DX28                          $CHAR7.                             
      @268    DX29                          $CHAR7.                             
      @275    DX30                          $CHAR7.                             
      @282    DX31                          $CHAR7.                             
      @289    DX32                          $CHAR7.                             
      @296    DX33                          $CHAR7.                             
      @303    DX34                          $CHAR7.                             
      @310    DX35                          $CHAR7.                             
      @317    DX36                          $CHAR7.                             
      @324    DX37                          $CHAR7.                             
      @331    DX38                          $CHAR7.                             
      @338    DX39                          $CHAR7.                             
      @345    DX40                          $CHAR7.                             
      @352    DX41                          $CHAR7.                             
      @359    DX42                          $CHAR7.                             
      @366    DX43                          $CHAR7.                             
      @373    DX44                          $CHAR7.                             
      @380    DX45                          $CHAR7.                             
      @387    DX46                          $CHAR7.                             
      @394    DX47                          $CHAR7.                             
      @401    DX48                          $CHAR7.                             
      @408    DX49                          $CHAR7.                             
      @415    DX50                          $CHAR7.                             
      @422    DX51                          $CHAR7.                             
      @429    DX52                          $CHAR7.                             
      @436    DX53                          $CHAR7.                             
      @443    DX54                          $CHAR7.                             
      @450    DX55                          $CHAR7.                             
      @457    DX56                          $CHAR7.                             
      @464    DX57                          $CHAR7.                             
      @471    DX58                          $CHAR7.                             
      @478    DX59                          $CHAR7.                             
      @485    DX60                          $CHAR7.                             
      @492    DX61                          $CHAR7.                             
      @499    DX62                          $CHAR7.                             
      @506    DX63                          $CHAR7.                             
      @513    DX64                          $CHAR7.                             
      @520    DX65                          $CHAR7.                             
      @527    DX66                          $CHAR7.                             
      @534    DX67                          $CHAR7.                             
      @541    DX68                          $CHAR7.                             
      @548    DX69                          $CHAR7.                             
      @555    DX70                          $CHAR7.                             
      @562    DX71                          $CHAR7.                             
      @569    DXCCS1                        N4PF.                               
      @573    DXCCS2                        N4PF.                               
      @577    DXCCS3                        N4PF.                               
      @581    DXCCS4                        N4PF.                               
      @585    DXCCS5                        N4PF.                               
      @589    DXCCS6                        N4PF.                               
      @593    DXCCS7                        N4PF.                               
      @597    DXCCS8                        N4PF.                               
      @601    DXCCS9                        N4PF.                               
      @605    DXCCS10                       N4PF.                               
      @609    DXCCS11                       N4PF.                               
      @613    DXCCS12                       N4PF.                               
      @617    DXCCS13                       N4PF.                               
      @621    DXCCS14                       N4PF.                               
      @625    DXCCS15                       N4PF.                               
      @629    DXCCS16                       N4PF.                               
      @633    DXCCS17                       N4PF.                               
      @637    DXCCS18                       N4PF.                               
      @641    DXCCS19                       N4PF.                               
      @645    DXCCS20                       N4PF.                               
      @649    DXCCS21                       N4PF.                               
      @653    DXCCS22                       N4PF.                               
      @657    DXCCS23                       N4PF.                               
      @661    DXCCS24                       N4PF.                               
      @665    DXCCS25                       N4PF.                               
      @669    DXCCS26                       N4PF.                               
      @673    DXCCS27                       N4PF.                               
      @677    DXCCS28                       N4PF.                               
      @681    DXCCS29                       N4PF.                               
      @685    DXCCS30                       N4PF.                               
      @689    DXCCS31                       N4PF.                               
      @693    DXCCS32                       N4PF.                               
      @697    DXCCS33                       N4PF.                               
      @701    DXCCS34                       N4PF.                               
      @705    DXCCS35                       N4PF.                               
      @709    DXCCS36                       N4PF.                               
      @713    DXCCS37                       N4PF.                               
      @717    DXCCS38                       N4PF.                               
      @721    DXCCS39                       N4PF.                               
      @725    DXCCS40                       N4PF.                               
      @729    DXCCS41                       N4PF.                               
      @733    DXCCS42                       N4PF.                               
      @737    DXCCS43                       N4PF.                               
      @741    DXCCS44                       N4PF.                               
      @745    DXCCS45                       N4PF.                               
      @749    DXCCS46                       N4PF.                               
      @753    DXCCS47                       N4PF.                               
      @757    DXCCS48                       N4PF.                               
      @761    DXCCS49                       N4PF.                               
      @765    DXCCS50                       N4PF.                               
      @769    DXCCS51                       N4PF.                               
      @773    DXCCS52                       N4PF.                               
      @777    DXCCS53                       N4PF.                               
      @781    DXCCS54                       N4PF.                               
      @785    DXCCS55                       N4PF.                               
      @789    DXCCS56                       N4PF.                               
      @793    DXCCS57                       N4PF.                               
      @797    DXCCS58                       N4PF.                               
      @801    DXCCS59                       N4PF.                               
      @805    DXCCS60                       N4PF.                               
      @809    DXCCS61                       N4PF.                               
      @813    DXCCS62                       N4PF.                               
      @817    DXCCS63                       N4PF.                               
      @821    DXCCS64                       N4PF.                               
      @825    DXCCS65                       N4PF.                               
      @829    DXCCS66                       N4PF.                               
      @833    DXCCS67                       N4PF.                               
      @837    DXCCS68                       N4PF.                               
      @841    DXCCS69                       N4PF.                               
      @845    DXCCS70                       N4PF.                               
      @849    DXCCS71                       N4PF.                               
      @853    DXPOA1                        $CHAR1.                             
      @854    DXPOA2                        $CHAR1.                             
      @855    DXPOA3                        $CHAR1.                             
      @856    DXPOA4                        $CHAR1.                             
      @857    DXPOA5                        $CHAR1.                             
      @858    DXPOA6                        $CHAR1.                             
      @859    DXPOA7                        $CHAR1.                             
      @860    DXPOA8                        $CHAR1.                             
      @861    DXPOA9                        $CHAR1.                             
      @862    DXPOA10                       $CHAR1.                             
      @863    DXPOA11                       $CHAR1.                             
      @864    DXPOA12                       $CHAR1.                             
      @865    DXPOA13                       $CHAR1.                             
      @866    DXPOA14                       $CHAR1.                             
      @867    DXPOA15                       $CHAR1.                             
      @868    DXPOA16                       $CHAR1.                             
      @869    DXPOA17                       $CHAR1.                             
      @870    DXPOA18                       $CHAR1.                             
      @871    DXPOA19                       $CHAR1.                             
      @872    DXPOA20                       $CHAR1.                             
      @873    DXPOA21                       $CHAR1.                             
      @874    DXPOA22                       $CHAR1.                             
      @875    DXPOA23                       $CHAR1.                             
      @876    DXPOA24                       $CHAR1.                             
      @877    DXPOA25                       $CHAR1.                             
      @878    DXPOA26                       $CHAR1.                             
      @879    DXPOA27                       $CHAR1.                             
      @880    DXPOA28                       $CHAR1.                             
      @881    DXPOA29                       $CHAR1.                             
      @882    DXPOA30                       $CHAR1.                             
      @883    DXPOA31                       $CHAR1.                             
      @884    DXPOA32                       $CHAR1.                             
      @885    DXPOA33                       $CHAR1.                             
      @886    DXPOA34                       $CHAR1.                             
      @887    DXPOA35                       $CHAR1.                             
      @888    DXPOA36                       $CHAR1.                             
      @889    DXPOA37                       $CHAR1.                             
      @890    DXPOA38                       $CHAR1.                             
      @891    DXPOA39                       $CHAR1.                             
      @892    DXPOA40                       $CHAR1.                             
      @893    DXPOA41                       $CHAR1.                             
      @894    DXPOA42                       $CHAR1.                             
      @895    DXPOA43                       $CHAR1.                             
      @896    DXPOA44                       $CHAR1.                             
      @897    DXPOA45                       $CHAR1.                             
      @898    DXPOA46                       $CHAR1.                             
      @899    DXPOA47                       $CHAR1.                             
      @900    DXPOA48                       $CHAR1.                             
      @901    DXPOA49                       $CHAR1.                             
      @902    DXPOA50                       $CHAR1.                             
      @903    DXPOA51                       $CHAR1.                             
      @904    DXPOA52                       $CHAR1.                             
      @905    DXPOA53                       $CHAR1.                             
      @906    DXPOA54                       $CHAR1.                             
      @907    DXPOA55                       $CHAR1.                             
      @908    DXPOA56                       $CHAR1.                             
      @909    DXPOA57                       $CHAR1.                             
      @910    DXPOA58                       $CHAR1.                             
      @911    DXPOA59                       $CHAR1.                             
      @912    DXPOA60                       $CHAR1.                             
      @913    DXPOA61                       $CHAR1.                             
      @914    DXPOA62                       $CHAR1.                             
      @915    DXPOA63                       $CHAR1.                             
      @916    DXPOA64                       $CHAR1.                             
      @917    DXPOA65                       $CHAR1.                             
      @918    DXPOA66                       $CHAR1.                             
      @919    DXPOA67                       $CHAR1.                             
      @920    DXPOA68                       $CHAR1.                             
      @921    DXPOA69                       $CHAR1.                             
      @922    DXPOA70                       $CHAR1.                             
      @923    DXPOA71                       $CHAR1.                             
      @924    DXVER                         N3PF.                               
      @927    DX_Admitting                  $CHAR7.                             
      @934    DaysBetweenVisits             N4PF.                               
      @938    DaysToEvent                   N6PF.                               
      @944    ECODE1                        $CHAR7.                             
      @951    ECODE2                        $CHAR7.                             
      @958    ECODE3                        $CHAR7.                             
      @965    ECODE4                        $CHAR7.                             
      @972    ECODE5                        $CHAR7.                             
      @979    ECODE6                        $CHAR7.                             
      @986    ECODE7                        $CHAR7.                             
      @993    ECODE8                        $CHAR7.                             
      @1000   ECODE9                        $CHAR7.                             
      @1007   ECODE10                       $CHAR7.                             
      @1014   ECODE11                       $CHAR7.                             
      @1021   ECODE12                       $CHAR7.                             
      @1028   ECODE13                       $CHAR7.                             
      @1035   ECODE14                       $CHAR7.                             
      @1042   E_CCS1                        N4PF.                               
      @1046   E_CCS2                        N4PF.                               
      @1050   E_CCS3                        N4PF.                               
      @1054   E_CCS4                        N4PF.                               
      @1058   E_CCS5                        N4PF.                               
      @1062   E_CCS6                        N4PF.                               
      @1066   E_CCS7                        N4PF.                               
      @1070   E_CCS8                        N4PF.                               
      @1074   E_CCS9                        N4PF.                               
      @1078   E_CCS10                       N4PF.                               
      @1082   E_CCS11                       N4PF.                               
      @1086   E_CCS12                       N4PF.                               
      @1090   E_CCS13                       N4PF.                               
      @1094   E_CCS14                       N4PF.                               
      @1098   E_POA1                        $CHAR1.                             
      @1099   E_POA2                        $CHAR1.                             
      @1100   E_POA3                        $CHAR1.                             
      @1101   E_POA4                        $CHAR1.                             
      @1102   E_POA5                        $CHAR1.                             
      @1103   E_POA6                        $CHAR1.                             
      @1104   E_POA7                        $CHAR1.                             
      @1105   E_POA8                        $CHAR1.                             
      @1106   E_POA9                        $CHAR1.                             
      @1107   E_POA10                       $CHAR1.                             
      @1108   E_POA11                       $CHAR1.                             
      @1109   E_POA12                       $CHAR1.                             
      @1110   E_POA13                       $CHAR1.                             
      @1111   E_POA14                       $CHAR1.                             
      @1112   FEMALE                        N2PF.                               
      @1114   HCUP_ED                       N2PF.                               
      @1116   HCUP_OS                       N2PF.                               
      @1118   HISPANIC_X                    $CHAR15.                            
      @1133   HOSPBRTH                      N3PF.                               
      @1136   HOSPST                        $CHAR2.                             
      @1138   Homeless                      N2PF.                               
      @1140   KEY                           15.                                 
      @1155   LOS                           N5PF.                               
      @1160   LOS_X                         N6PF.                               
      @1166   MDC                           N2PF.                               
      @1168   MDC24                         N2PF.                               
      @1170   MDC_NoPOA                     N2PF.                               
      @1172   MEDINCSTQ                     N2PF.                               
      @1174   NCHRONIC                      N3PF.                               
      @1177   NDX                           N3PF.                               
      @1180   NECODE                        N2PF.                               
      @1182   NEOMAT                        N2PF.                               
      @1184   NPR                           N3PF.                               
      @1187   ORPROC                        N2PF.                               
      @1189   OS_TIME                       N11P2F.                             
      @1200   PAY1                          N2PF.                               
      @1202   PAY1_X                        $CHAR1.                             
      @1203   PAY2                          N2PF.                               
      @1205   PAY2_X                        $CHAR1.                             
      @1206   PAYER1_X                      $CHAR3.                             
      @1209   PAYER2_X                      $CHAR3.                             
      @1212   PL_CBSA                       N3PF.                               
      @1215   PL_UR_CAT4                    N2PF.                               
      @1217   POA_Disch_Edit1               N2PF.                               
      @1219   POA_Disch_Edit2               N2PF.                               
      @1221   POA_Hosp_Edit1                N2PF.                               
      @1223   POA_Hosp_Edit2                N2PF.                               
      @1225   POA_Hosp_Edit3                N2PF.                               
      @1227   POA_Hosp_Edit3_Value          N8P2F.                              
      @1235   PR1                           $CHAR7.                             
      @1242   PR2                           $CHAR7.                             
      @1249   PR3                           $CHAR7.                             
      @1256   PR4                           $CHAR7.                             
      @1263   PR5                           $CHAR7.                             
      @1270   PR6                           $CHAR7.                             
      @1277   PR7                           $CHAR7.                             
      @1284   PR8                           $CHAR7.                             
      @1291   PR9                           $CHAR7.                             
      @1298   PR10                          $CHAR7.                             
      @1305   PR11                          $CHAR7.                             
      @1312   PR12                          $CHAR7.                             
      @1319   PR13                          $CHAR7.                             
      @1326   PR14                          $CHAR7.                             
      @1333   PR15                          $CHAR7.                             
      @1340   PR16                          $CHAR7.                             
      @1347   PR17                          $CHAR7.                             
      @1354   PR18                          $CHAR7.                             
      @1361   PR19                          $CHAR7.                             
      @1368   PR20                          $CHAR7.                             
      @1375   PR21                          $CHAR7.                             
      @1382   PR22                          $CHAR7.                             
      @1389   PR23                          $CHAR7.                             
      @1396   PR24                          $CHAR7.                             
      @1403   PR25                          $CHAR7.                             
      @1410   PR26                          $CHAR7.                             
      @1417   PR27                          $CHAR7.                             
      @1424   PR28                          $CHAR7.                             
      @1431   PR29                          $CHAR7.                             
      @1438   PR30                          $CHAR7.                             
      @1445   PR31                          $CHAR7.                             
      @1452   PR32                          $CHAR7.                             
      @1459   PR33                          $CHAR7.                             
      @1466   PR34                          $CHAR7.                             
      @1473   PR35                          $CHAR7.                             
      @1480   PR36                          $CHAR7.                             
      @1487   PR37                          $CHAR7.                             
      @1494   PR38                          $CHAR7.                             
      @1501   PR39                          $CHAR7.                             
      @1508   PR40                          $CHAR7.                             
      @1515   PR41                          $CHAR7.                             
      @1522   PR42                          $CHAR7.                             
      @1529   PR43                          $CHAR7.                             
      @1536   PR44                          $CHAR7.                             
      @1543   PR45                          $CHAR7.                             
      @1550   PR46                          $CHAR7.                             
      @1557   PR47                          $CHAR7.                             
      @1564   PR48                          $CHAR7.                             
      @1571   PR49                          $CHAR7.                             
      @1578   PR50                          $CHAR7.                             
      @1585   PR51                          $CHAR7.                             
      @1592   PR52                          $CHAR7.                             
      @1599   PR53                          $CHAR7.                             
      @1606   PR54                          $CHAR7.                             
      @1613   PR55                          $CHAR7.                             
      @1620   PR56                          $CHAR7.                             
      @1627   PR57                          $CHAR7.                             
      @1634   PR58                          $CHAR7.                             
      @1641   PR59                          $CHAR7.                             
      @1648   PR60                          $CHAR7.                             
      @1655   PR61                          $CHAR7.                             
      @1662   PR62                          $CHAR7.                             
      @1669   PR63                          $CHAR7.                             
      @1676   PR64                          $CHAR7.                             
      @1683   PR65                          $CHAR7.                             
      @1690   PR66                          $CHAR7.                             
      @1697   PRCCS1                        N3PF.                               
      @1700   PRCCS2                        N3PF.                               
      @1703   PRCCS3                        N3PF.                               
      @1706   PRCCS4                        N3PF.                               
      @1709   PRCCS5                        N3PF.                               
      @1712   PRCCS6                        N3PF.                               
      @1715   PRCCS7                        N3PF.                               
      @1718   PRCCS8                        N3PF.                               
      @1721   PRCCS9                        N3PF.                               
      @1724   PRCCS10                       N3PF.                               
      @1727   PRCCS11                       N3PF.                               
      @1730   PRCCS12                       N3PF.                               
      @1733   PRCCS13                       N3PF.                               
      @1736   PRCCS14                       N3PF.                               
      @1739   PRCCS15                       N3PF.                               
      @1742   PRCCS16                       N3PF.                               
      @1745   PRCCS17                       N3PF.                               
      @1748   PRCCS18                       N3PF.                               
      @1751   PRCCS19                       N3PF.                               
      @1754   PRCCS20                       N3PF.                               
      @1757   PRCCS21                       N3PF.                               
      @1760   PRCCS22                       N3PF.                               
      @1763   PRCCS23                       N3PF.                               
      @1766   PRCCS24                       N3PF.                               
      @1769   PRCCS25                       N3PF.                               
      @1772   PRCCS26                       N3PF.                               
      @1775   PRCCS27                       N3PF.                               
      @1778   PRCCS28                       N3PF.                               
      @1781   PRCCS29                       N3PF.                               
      @1784   PRCCS30                       N3PF.                               
      @1787   PRCCS31                       N3PF.                               
      @1790   PRCCS32                       N3PF.                               
      @1793   PRCCS33                       N3PF.                               
      @1796   PRCCS34                       N3PF.                               
      @1799   PRCCS35                       N3PF.                               
      @1802   PRCCS36                       N3PF.                               
      @1805   PRCCS37                       N3PF.                               
      @1808   PRCCS38                       N3PF.                               
      @1811   PRCCS39                       N3PF.                               
      @1814   PRCCS40                       N3PF.                               
      @1817   PRCCS41                       N3PF.                               
      @1820   PRCCS42                       N3PF.                               
      @1823   PRCCS43                       N3PF.                               
      @1826   PRCCS44                       N3PF.                               
      @1829   PRCCS45                       N3PF.                               
      @1832   PRCCS46                       N3PF.                               
      @1835   PRCCS47                       N3PF.                               
      @1838   PRCCS48                       N3PF.                               
      @1841   PRCCS49                       N3PF.                               
      @1844   PRCCS50                       N3PF.                               
      @1847   PRCCS51                       N3PF.                               
      @1850   PRCCS52                       N3PF.                               
      @1853   PRCCS53                       N3PF.                               
      @1856   PRCCS54                       N3PF.                               
      @1859   PRCCS55                       N3PF.                               
      @1862   PRCCS56                       N3PF.                               
      @1865   PRCCS57                       N3PF.                               
      @1868   PRCCS58                       N3PF.                               
      @1871   PRCCS59                       N3PF.                               
      @1874   PRCCS60                       N3PF.                               
      @1877   PRCCS61                       N3PF.                               
      @1880   PRCCS62                       N3PF.                               
      @1883   PRCCS63                       N3PF.                               
      @1886   PRCCS64                       N3PF.                               
      @1889   PRCCS65                       N3PF.                               
      @1892   PRCCS66                       N3PF.                               
      @1895   PRDAY1                        N5PF.                               
      @1900   PRDAY2                        N5PF.                               
      @1905   PRDAY3                        N5PF.                               
      @1910   PRDAY4                        N5PF.                               
      @1915   PRDAY5                        N5PF.                               
      @1920   PRDAY6                        N5PF.                               
      @1925   PRDAY7                        N5PF.                               
      @1930   PRDAY8                        N5PF.                               
      @1935   PRDAY9                        N5PF.                               
      @1940   PRDAY10                       N5PF.                               
      @1945   PRDAY11                       N5PF.                               
      @1950   PRDAY12                       N5PF.                               
      @1955   PRDAY13                       N5PF.                               
      @1960   PRDAY14                       N5PF.                               
      @1965   PRDAY15                       N5PF.                               
      @1970   PRDAY16                       N5PF.                               
      @1975   PRDAY17                       N5PF.                               
      @1980   PRDAY18                       N5PF.                               
      @1985   PRDAY19                       N5PF.                               
      @1990   PRDAY20                       N5PF.                               
      @1995   PRDAY21                       N5PF.                               
      @2000   PRDAY22                       N5PF.                               
      @2005   PRDAY23                       N5PF.                               
      @2010   PRDAY24                       N5PF.                               
      @2015   PRDAY25                       N5PF.                               
      @2020   PRDAY26                       N5PF.                               
      @2025   PRDAY27                       N5PF.                               
      @2030   PRDAY28                       N5PF.                               
      @2035   PRDAY29                       N5PF.                               
      @2040   PRDAY30                       N5PF.                               
      @2045   PRDAY31                       N5PF.                               
      @2050   PRDAY32                       N5PF.                               
      @2055   PRDAY33                       N5PF.                               
      @2060   PRDAY34                       N5PF.                               
      @2065   PRDAY35                       N5PF.                               
      @2070   PRDAY36                       N5PF.                               
      @2075   PRDAY37                       N5PF.                               
      @2080   PRDAY38                       N5PF.                               
      @2085   PRDAY39                       N5PF.                               
      @2090   PRDAY40                       N5PF.                               
      @2095   PRDAY41                       N5PF.                               
      @2100   PRDAY42                       N5PF.                               
      @2105   PRDAY43                       N5PF.                               
      @2110   PRDAY44                       N5PF.                               
      @2115   PRDAY45                       N5PF.                               
      @2120   PRDAY46                       N5PF.                               
      @2125   PRDAY47                       N5PF.                               
      @2130   PRDAY48                       N5PF.                               
      @2135   PRDAY49                       N5PF.                               
      @2140   PRDAY50                       N5PF.                               
      @2145   PRDAY51                       N5PF.                               
      @2150   PRDAY52                       N5PF.                               
      @2155   PRDAY53                       N5PF.                               
      @2160   PRDAY54                       N5PF.                               
      @2165   PRDAY55                       N5PF.                               
      @2170   PRDAY56                       N5PF.                               
      @2175   PRDAY57                       N5PF.                               
      @2180   PRDAY58                       N5PF.                               
      @2185   PRDAY59                       N5PF.                               
      @2190   PRDAY60                       N5PF.                               
      @2195   PRDAY61                       N5PF.                               
      @2200   PRDAY62                       N5PF.                               
      @2205   PRDAY63                       N5PF.                               
      @2210   PRDAY64                       N5PF.                               
      @2215   PRDAY65                       N5PF.                               
      @2220   PRDAY66                       N5PF.                               
      @2225   PROCTYPE                      N3PF.                               
      @2228   PRVER                         N3PF.                               
      @2231   PSTATE                        $CHAR2.                             
      @2233   PSTCO2                        N5PF.                               
      @2238   RACE                          N2PF.                               
      @2240   RACE_X                        $CHAR13.                            
      @2253   SERVICELINE                   N2PF.                               
      @2255   TOTCHG                        N10PF.                              
      @2265   TOTCHG_X                      N15P2F.                             
      @2280   TRAN_IN                       N2PF.                               
      @2282   TRAN_OUT                      N2PF.                               
      @2284   VisitLink                     N9PF.                               
      @2293   YEAR                          N4PF.                               
      @2297   ZIP3                          $CHAR3.                             
      @2300   ZIPINC_QRTL                   N3PF.                               
      @2303   AYEAR                         N4PF.                               
      @2307   PRMONTH1                      N2PF.                               
      @2309   PRMONTH2                      N2PF.                               
      @2311   PRMONTH3                      N2PF.                               
      @2313   PRMONTH4                      N2PF.                               
      @2315   PRMONTH5                      N2PF.                               
      @2317   PRMONTH6                      N2PF.                               
      @2319   PRMONTH7                      N2PF.                               
      @2321   PRMONTH8                      N2PF.                               
      @2323   PRMONTH9                      N2PF.                               
      @2325   PRMONTH10                     N2PF.                               
      @2327   PRMONTH11                     N2PF.                               
      @2329   PRMONTH12                     N2PF.                               
      @2331   PRMONTH13                     N2PF.                               
      @2333   PRMONTH14                     N2PF.                               
      @2335   PRMONTH15                     N2PF.                               
      @2337   PRMONTH16                     N2PF.                               
      @2339   PRMONTH17                     N2PF.                               
      @2341   PRMONTH18                     N2PF.                               
      @2343   PRMONTH19                     N2PF.                               
      @2345   PRMONTH20                     N2PF.                               
      @2347   PRMONTH21                     N2PF.                               
      @2349   PRMONTH22                     N2PF.                               
      @2351   PRMONTH23                     N2PF.                               
      @2353   PRMONTH24                     N2PF.                               
      @2355   PRMONTH25                     N2PF.                               
      @2357   PRMONTH26                     N2PF.                               
      @2359   PRMONTH27                     N2PF.                               
      @2361   PRMONTH28                     N2PF.                               
      @2363   PRMONTH29                     N2PF.                               
      @2365   PRMONTH30                     N2PF.                               
      @2367   PRMONTH31                     N2PF.                               
      @2369   PRMONTH32                     N2PF.                               
      @2371   PRMONTH33                     N2PF.                               
      @2373   PRMONTH34                     N2PF.                               
      @2375   PRMONTH35                     N2PF.                               
      @2377   PRMONTH36                     N2PF.                               
      @2379   PRMONTH37                     N2PF.                               
      @2381   PRMONTH38                     N2PF.                               
      @2383   PRMONTH39                     N2PF.                               
      @2385   PRMONTH40                     N2PF.                               
      @2387   PRMONTH41                     N2PF.                               
      @2389   PRMONTH42                     N2PF.                               
      @2391   PRMONTH43                     N2PF.                               
      @2393   PRMONTH44                     N2PF.                               
      @2395   PRMONTH45                     N2PF.                               
      @2397   PRMONTH46                     N2PF.                               
      @2399   PRMONTH47                     N2PF.                               
      @2401   PRMONTH48                     N2PF.                               
      @2403   PRMONTH49                     N2PF.                               
      @2405   PRMONTH50                     N2PF.                               
      @2407   PRMONTH51                     N2PF.                               
      @2409   PRMONTH52                     N2PF.                               
      @2411   PRMONTH53                     N2PF.                               
      @2413   PRMONTH54                     N2PF.                               
      @2415   PRMONTH55                     N2PF.                               
      @2417   PRMONTH56                     N2PF.                               
      @2419   PRMONTH57                     N2PF.                               
      @2421   PRMONTH58                     N2PF.                               
      @2423   PRMONTH59                     N2PF.                               
      @2425   PRMONTH60                     N2PF.                               
      @2427   PRMONTH61                     N2PF.                               
      @2429   PRMONTH62                     N2PF.                               
      @2431   PRMONTH63                     N2PF.                               
      @2433   PRMONTH64                     N2PF.                               
      @2435   PRMONTH65                     N2PF.                               
      @2437   PRMONTH66                     N2PF.                               
      @2439   PRYEAR1                       N4PF.                               
      @2443   PRYEAR2                       N4PF.                               
      @2447   PRYEAR3                       N4PF.                               
      @2451   PRYEAR4                       N4PF.                               
      @2455   PRYEAR5                       N4PF.                               
      @2459   PRYEAR6                       N4PF.                               
      @2463   PRYEAR7                       N4PF.                               
      @2467   PRYEAR8                       N4PF.                               
      @2471   PRYEAR9                       N4PF.                               
      @2475   PRYEAR10                      N4PF.                               
      @2479   PRYEAR11                      N4PF.                               
      @2483   PRYEAR12                      N4PF.                               
      @2487   PRYEAR13                      N4PF.                               
      @2491   PRYEAR14                      N4PF.                               
      @2495   PRYEAR15                      N4PF.                               
      @2499   PRYEAR16                      N4PF.                               
      @2503   PRYEAR17                      N4PF.                               
      @2507   PRYEAR18                      N4PF.                               
      @2511   PRYEAR19                      N4PF.                               
      @2515   PRYEAR20                      N4PF.                               
      @2519   PRYEAR21                      N4PF.                               
      @2523   PRYEAR22                      N4PF.                               
      @2527   PRYEAR23                      N4PF.                               
      @2531   PRYEAR24                      N4PF.                               
      @2535   PRYEAR25                      N4PF.                               
      @2539   PRYEAR26                      N4PF.                               
      @2543   PRYEAR27                      N4PF.                               
      @2547   PRYEAR28                      N4PF.                               
      @2551   PRYEAR29                      N4PF.                               
      @2555   PRYEAR30                      N4PF.                               
      @2559   PRYEAR31                      N4PF.                               
      @2563   PRYEAR32                      N4PF.                               
      @2567   PRYEAR33                      N4PF.                               
      @2571   PRYEAR34                      N4PF.                               
      @2575   PRYEAR35                      N4PF.                               
      @2579   PRYEAR36                      N4PF.                               
      @2583   PRYEAR37                      N4PF.                               
      @2587   PRYEAR38                      N4PF.                               
      @2591   PRYEAR39                      N4PF.                               
      @2595   PRYEAR40                      N4PF.                               
      @2599   PRYEAR41                      N4PF.                               
      @2603   PRYEAR42                      N4PF.                               
      @2607   PRYEAR43                      N4PF.                               
      @2611   PRYEAR44                      N4PF.                               
      @2615   PRYEAR45                      N4PF.                               
      @2619   PRYEAR46                      N4PF.                               
      @2623   PRYEAR47                      N4PF.                               
      @2627   PRYEAR48                      N4PF.                               
      @2631   PRYEAR49                      N4PF.                               
      @2635   PRYEAR50                      N4PF.                               
      @2639   PRYEAR51                      N4PF.                               
      @2643   PRYEAR52                      N4PF.                               
      @2647   PRYEAR53                      N4PF.                               
      @2651   PRYEAR54                      N4PF.                               
      @2655   PRYEAR55                      N4PF.                               
      @2659   PRYEAR56                      N4PF.                               
      @2663   PRYEAR57                      N4PF.                               
      @2667   PRYEAR58                      N4PF.                               
      @2671   PRYEAR59                      N4PF.                               
      @2675   PRYEAR60                      N4PF.                               
      @2679   PRYEAR61                      N4PF.                               
      @2683   PRYEAR62                      N4PF.                               
      @2687   PRYEAR63                      N4PF.                               
      @2691   PRYEAR64                      N4PF.                               
      @2695   PRYEAR65                      N4PF.                               
      @2699   PRYEAR66                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
