/*******************************************************************            
* Creation Date: 02/03/2017                                                     
*   WI_SID_2015q4_CORE.SAS:                                                     
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
DATA WI_SIDC_2015q4_CORE;                                                       
INFILE 'WI_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 2154;                        
                                                                                
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
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="Type of bill, UB-04 coding"                                            
                                                                                
  CPT1                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 1"                                            
                                                                                
  CPT2                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 2"                                            
                                                                                
  CPT3                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 3"                                            
                                                                                
  CPT4                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 4"                                            
                                                                                
  CPT5                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 5"                                            
                                                                                
  CPT6                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 6"                                            
                                                                                
  CPT7                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 7"                                            
                                                                                
  CPT8                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 8"                                            
                                                                                
  CPT9                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 9"                                            
                                                                                
  CPT10                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 10"                                           
                                                                                
  CPT11                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 11"                                           
                                                                                
  CPT12                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 12"                                           
                                                                                
  CPT13                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 13"                                           
                                                                                
  CPT14                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 14"                                           
                                                                                
  CPT15                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 15"                                           
                                                                                
  CPT16                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 16"                                           
                                                                                
  CPT17                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 17"                                           
                                                                                
  CPT18                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 18"                                           
                                                                                
  CPT19                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 19"                                           
                                                                                
  CPT20                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 20"                                           
                                                                                
  CPT21                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 21"                                           
                                                                                
  CPT22                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 22"                                           
                                                                                
  CPT23                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 23"                                           
                                                                                
  CPT24                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 24"                                           
                                                                                
  CPT25                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 25"                                           
                                                                                
  CPT26                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 26"                                           
                                                                                
  CPT27                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 27"                                           
                                                                                
  CPT28                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 28"                                           
                                                                                
  CPT29                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 29"                                           
                                                                                
  CPT30                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 30"                                           
                                                                                
  CPT31                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 31"                                           
                                                                                
  CPT32                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 32"                                           
                                                                                
  CPT33                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 33"                                           
                                                                                
  CPT34                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 34"                                           
                                                                                
  CPT35                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 35"                                           
                                                                                
  CPT36                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 36"                                           
                                                                                
  CPT37                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 37"                                           
                                                                                
  CPT38                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 38"                                           
                                                                                
  CPT39                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 39"                                           
                                                                                
  CPT40                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 40"                                           
                                                                                
  CPT41                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 41"                                           
                                                                                
  CPT42                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 42"                                           
                                                                                
  CPT43                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 43"                                           
                                                                                
  CPT44                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 44"                                           
                                                                                
  CPT45                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 45"                                           
                                                                                
  CPT46                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 46"                                           
                                                                                
  CPT47                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 47"                                           
                                                                                
  CPT48                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 48"                                           
                                                                                
  CPT49                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 49"                                           
                                                                                
  CPT50                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 50"                                           
                                                                                
  CPT51                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 51"                                           
                                                                                
  CPT52                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 52"                                           
                                                                                
  CPT53                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 53"                                           
                                                                                
  CPTCCS1                    LENGTH=4                                           
  LABEL="CCS: CPT 1"                                                            
                                                                                
  CPTCCS2                    LENGTH=4                                           
  LABEL="CCS: CPT 2"                                                            
                                                                                
  CPTCCS3                    LENGTH=4                                           
  LABEL="CCS: CPT 3"                                                            
                                                                                
  CPTCCS4                    LENGTH=4                                           
  LABEL="CCS: CPT 4"                                                            
                                                                                
  CPTCCS5                    LENGTH=4                                           
  LABEL="CCS: CPT 5"                                                            
                                                                                
  CPTCCS6                    LENGTH=4                                           
  LABEL="CCS: CPT 6"                                                            
                                                                                
  CPTCCS7                    LENGTH=4                                           
  LABEL="CCS: CPT 7"                                                            
                                                                                
  CPTCCS8                    LENGTH=4                                           
  LABEL="CCS: CPT 8"                                                            
                                                                                
  CPTCCS9                    LENGTH=4                                           
  LABEL="CCS: CPT 9"                                                            
                                                                                
  CPTCCS10                   LENGTH=4                                           
  LABEL="CCS: CPT 10"                                                           
                                                                                
  CPTCCS11                   LENGTH=4                                           
  LABEL="CCS: CPT 11"                                                           
                                                                                
  CPTCCS12                   LENGTH=4                                           
  LABEL="CCS: CPT 12"                                                           
                                                                                
  CPTCCS13                   LENGTH=4                                           
  LABEL="CCS: CPT 13"                                                           
                                                                                
  CPTCCS14                   LENGTH=4                                           
  LABEL="CCS: CPT 14"                                                           
                                                                                
  CPTCCS15                   LENGTH=4                                           
  LABEL="CCS: CPT 15"                                                           
                                                                                
  CPTCCS16                   LENGTH=4                                           
  LABEL="CCS: CPT 16"                                                           
                                                                                
  CPTCCS17                   LENGTH=4                                           
  LABEL="CCS: CPT 17"                                                           
                                                                                
  CPTCCS18                   LENGTH=4                                           
  LABEL="CCS: CPT 18"                                                           
                                                                                
  CPTCCS19                   LENGTH=4                                           
  LABEL="CCS: CPT 19"                                                           
                                                                                
  CPTCCS20                   LENGTH=4                                           
  LABEL="CCS: CPT 20"                                                           
                                                                                
  CPTCCS21                   LENGTH=4                                           
  LABEL="CCS: CPT 21"                                                           
                                                                                
  CPTCCS22                   LENGTH=4                                           
  LABEL="CCS: CPT 22"                                                           
                                                                                
  CPTCCS23                   LENGTH=4                                           
  LABEL="CCS: CPT 23"                                                           
                                                                                
  CPTCCS24                   LENGTH=4                                           
  LABEL="CCS: CPT 24"                                                           
                                                                                
  CPTCCS25                   LENGTH=4                                           
  LABEL="CCS: CPT 25"                                                           
                                                                                
  CPTCCS26                   LENGTH=4                                           
  LABEL="CCS: CPT 26"                                                           
                                                                                
  CPTCCS27                   LENGTH=4                                           
  LABEL="CCS: CPT 27"                                                           
                                                                                
  CPTCCS28                   LENGTH=4                                           
  LABEL="CCS: CPT 28"                                                           
                                                                                
  CPTCCS29                   LENGTH=4                                           
  LABEL="CCS: CPT 29"                                                           
                                                                                
  CPTCCS30                   LENGTH=4                                           
  LABEL="CCS: CPT 30"                                                           
                                                                                
  CPTCCS31                   LENGTH=4                                           
  LABEL="CCS: CPT 31"                                                           
                                                                                
  CPTCCS32                   LENGTH=4                                           
  LABEL="CCS: CPT 32"                                                           
                                                                                
  CPTCCS33                   LENGTH=4                                           
  LABEL="CCS: CPT 33"                                                           
                                                                                
  CPTCCS34                   LENGTH=4                                           
  LABEL="CCS: CPT 34"                                                           
                                                                                
  CPTCCS35                   LENGTH=4                                           
  LABEL="CCS: CPT 35"                                                           
                                                                                
  CPTCCS36                   LENGTH=4                                           
  LABEL="CCS: CPT 36"                                                           
                                                                                
  CPTCCS37                   LENGTH=4                                           
  LABEL="CCS: CPT 37"                                                           
                                                                                
  CPTCCS38                   LENGTH=4                                           
  LABEL="CCS: CPT 38"                                                           
                                                                                
  CPTCCS39                   LENGTH=4                                           
  LABEL="CCS: CPT 39"                                                           
                                                                                
  CPTCCS40                   LENGTH=4                                           
  LABEL="CCS: CPT 40"                                                           
                                                                                
  CPTCCS41                   LENGTH=4                                           
  LABEL="CCS: CPT 41"                                                           
                                                                                
  CPTCCS42                   LENGTH=4                                           
  LABEL="CCS: CPT 42"                                                           
                                                                                
  CPTCCS43                   LENGTH=4                                           
  LABEL="CCS: CPT 43"                                                           
                                                                                
  CPTCCS44                   LENGTH=4                                           
  LABEL="CCS: CPT 44"                                                           
                                                                                
  CPTCCS45                   LENGTH=4                                           
  LABEL="CCS: CPT 45"                                                           
                                                                                
  CPTCCS46                   LENGTH=4                                           
  LABEL="CCS: CPT 46"                                                           
                                                                                
  CPTCCS47                   LENGTH=4                                           
  LABEL="CCS: CPT 47"                                                           
                                                                                
  CPTCCS48                   LENGTH=4                                           
  LABEL="CCS: CPT 48"                                                           
                                                                                
  CPTCCS49                   LENGTH=4                                           
  LABEL="CCS: CPT 49"                                                           
                                                                                
  CPTCCS50                   LENGTH=4                                           
  LABEL="CCS: CPT 50"                                                           
                                                                                
  CPTCCS51                   LENGTH=4                                           
  LABEL="CCS: CPT 51"                                                           
                                                                                
  CPTCCS52                   LENGTH=4                                           
  LABEL="CCS: CPT 52"                                                           
                                                                                
  CPTCCS53                   LENGTH=4                                           
  LABEL="CCS: CPT 53"                                                           
                                                                                
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
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  HOSP_NPI                   LENGTH=$10                                         
  LABEL="Hospital NPI"                                                          
                                                                                
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
                                                                                
  I10_DX51                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 51"                                                
                                                                                
  I10_DX52                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 52"                                                
                                                                                
  I10_DX53                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 53"                                                
                                                                                
  I10_DX54                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 54"                                                
                                                                                
  I10_DX55                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 55"                                                
                                                                                
  I10_DX56                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 56"                                                
                                                                                
  I10_DX57                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 57"                                                
                                                                                
  I10_DX58                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 58"                                                
                                                                                
  I10_DX59                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 59"                                                
                                                                                
  I10_DX60                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 60"                                                
                                                                                
  I10_DX61                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 61"                                                
                                                                                
  I10_DX62                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 62"                                                
                                                                                
  I10_DX63                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 63"                                                
                                                                                
  I10_DX64                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 64"                                                
                                                                                
  I10_DX65                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 65"                                                
                                                                                
  I10_DX66                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 66"                                                
                                                                                
  I10_DX67                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 67"                                                
                                                                                
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
                                                                                
  I10_DXCCS51                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 51"                                           
                                                                                
  I10_DXCCS52                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 52"                                           
                                                                                
  I10_DXCCS53                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 53"                                           
                                                                                
  I10_DXCCS54                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 54"                                           
                                                                                
  I10_DXCCS55                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 55"                                           
                                                                                
  I10_DXCCS56                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 56"                                           
                                                                                
  I10_DXCCS57                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 57"                                           
                                                                                
  I10_DXCCS58                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 58"                                           
                                                                                
  I10_DXCCS59                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 59"                                           
                                                                                
  I10_DXCCS60                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 60"                                           
                                                                                
  I10_DXCCS61                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 61"                                           
                                                                                
  I10_DXCCS62                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 62"                                           
                                                                                
  I10_DXCCS63                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 63"                                           
                                                                                
  I10_DXCCS64                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 64"                                           
                                                                                
  I10_DXCCS65                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 65"                                           
                                                                                
  I10_DXCCS66                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 66"                                           
                                                                                
  I10_DXCCS67                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 67"                                           
                                                                                
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
                                                                                
  MDSPEC1                    LENGTH=$3                                          
  LABEL="Physician 1 specialty (as received from source)"                       
                                                                                
  MDSPEC2                    LENGTH=$3                                          
  LABEL="Physician 2 specialty (as received from source)"                       
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$5                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$5                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
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
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AMONTH                        N2PF.                               
      @12     ATYPE                         N2PF.                               
      @14     AWEEKEND                      N2PF.                               
      @16     BILLTYPE                      $CHAR4.                             
      @20     CPT1                          $CHAR5.                             
      @25     CPT2                          $CHAR5.                             
      @30     CPT3                          $CHAR5.                             
      @35     CPT4                          $CHAR5.                             
      @40     CPT5                          $CHAR5.                             
      @45     CPT6                          $CHAR5.                             
      @50     CPT7                          $CHAR5.                             
      @55     CPT8                          $CHAR5.                             
      @60     CPT9                          $CHAR5.                             
      @65     CPT10                         $CHAR5.                             
      @70     CPT11                         $CHAR5.                             
      @75     CPT12                         $CHAR5.                             
      @80     CPT13                         $CHAR5.                             
      @85     CPT14                         $CHAR5.                             
      @90     CPT15                         $CHAR5.                             
      @95     CPT16                         $CHAR5.                             
      @100    CPT17                         $CHAR5.                             
      @105    CPT18                         $CHAR5.                             
      @110    CPT19                         $CHAR5.                             
      @115    CPT20                         $CHAR5.                             
      @120    CPT21                         $CHAR5.                             
      @125    CPT22                         $CHAR5.                             
      @130    CPT23                         $CHAR5.                             
      @135    CPT24                         $CHAR5.                             
      @140    CPT25                         $CHAR5.                             
      @145    CPT26                         $CHAR5.                             
      @150    CPT27                         $CHAR5.                             
      @155    CPT28                         $CHAR5.                             
      @160    CPT29                         $CHAR5.                             
      @165    CPT30                         $CHAR5.                             
      @170    CPT31                         $CHAR5.                             
      @175    CPT32                         $CHAR5.                             
      @180    CPT33                         $CHAR5.                             
      @185    CPT34                         $CHAR5.                             
      @190    CPT35                         $CHAR5.                             
      @195    CPT36                         $CHAR5.                             
      @200    CPT37                         $CHAR5.                             
      @205    CPT38                         $CHAR5.                             
      @210    CPT39                         $CHAR5.                             
      @215    CPT40                         $CHAR5.                             
      @220    CPT41                         $CHAR5.                             
      @225    CPT42                         $CHAR5.                             
      @230    CPT43                         $CHAR5.                             
      @235    CPT44                         $CHAR5.                             
      @240    CPT45                         $CHAR5.                             
      @245    CPT46                         $CHAR5.                             
      @250    CPT47                         $CHAR5.                             
      @255    CPT48                         $CHAR5.                             
      @260    CPT49                         $CHAR5.                             
      @265    CPT50                         $CHAR5.                             
      @270    CPT51                         $CHAR5.                             
      @275    CPT52                         $CHAR5.                             
      @280    CPT53                         $CHAR5.                             
      @285    CPTCCS1                       N3PF.                               
      @288    CPTCCS2                       N3PF.                               
      @291    CPTCCS3                       N3PF.                               
      @294    CPTCCS4                       N3PF.                               
      @297    CPTCCS5                       N3PF.                               
      @300    CPTCCS6                       N3PF.                               
      @303    CPTCCS7                       N3PF.                               
      @306    CPTCCS8                       N3PF.                               
      @309    CPTCCS9                       N3PF.                               
      @312    CPTCCS10                      N3PF.                               
      @315    CPTCCS11                      N3PF.                               
      @318    CPTCCS12                      N3PF.                               
      @321    CPTCCS13                      N3PF.                               
      @324    CPTCCS14                      N3PF.                               
      @327    CPTCCS15                      N3PF.                               
      @330    CPTCCS16                      N3PF.                               
      @333    CPTCCS17                      N3PF.                               
      @336    CPTCCS18                      N3PF.                               
      @339    CPTCCS19                      N3PF.                               
      @342    CPTCCS20                      N3PF.                               
      @345    CPTCCS21                      N3PF.                               
      @348    CPTCCS22                      N3PF.                               
      @351    CPTCCS23                      N3PF.                               
      @354    CPTCCS24                      N3PF.                               
      @357    CPTCCS25                      N3PF.                               
      @360    CPTCCS26                      N3PF.                               
      @363    CPTCCS27                      N3PF.                               
      @366    CPTCCS28                      N3PF.                               
      @369    CPTCCS29                      N3PF.                               
      @372    CPTCCS30                      N3PF.                               
      @375    CPTCCS31                      N3PF.                               
      @378    CPTCCS32                      N3PF.                               
      @381    CPTCCS33                      N3PF.                               
      @384    CPTCCS34                      N3PF.                               
      @387    CPTCCS35                      N3PF.                               
      @390    CPTCCS36                      N3PF.                               
      @393    CPTCCS37                      N3PF.                               
      @396    CPTCCS38                      N3PF.                               
      @399    CPTCCS39                      N3PF.                               
      @402    CPTCCS40                      N3PF.                               
      @405    CPTCCS41                      N3PF.                               
      @408    CPTCCS42                      N3PF.                               
      @411    CPTCCS43                      N3PF.                               
      @414    CPTCCS44                      N3PF.                               
      @417    CPTCCS45                      N3PF.                               
      @420    CPTCCS46                      N3PF.                               
      @423    CPTCCS47                      N3PF.                               
      @426    CPTCCS48                      N3PF.                               
      @429    CPTCCS49                      N3PF.                               
      @432    CPTCCS50                      N3PF.                               
      @435    CPTCCS51                      N3PF.                               
      @438    CPTCCS52                      N3PF.                               
      @441    CPTCCS53                      N3PF.                               
      @444    DaysToEvent                   N6PF.                               
      @450    DIED                          N2PF.                               
      @452    DISP_X                        $CHAR2.                             
      @454    DISPUB04                      N2PF.                               
      @456    DISPUNIFORM                   N2PF.                               
      @458    DMONTH                        N2PF.                               
      @460    DQTR                          N2PF.                               
      @462    DRG                           N3PF.                               
      @465    DRG_NoPOA                     N3PF.                               
      @468    DRG32                         N3PF.                               
      @471    DRGVER                        N2PF.                               
      @473    DSHOSPID                      $CHAR17.                            
      @490    DXPOA1                        $CHAR1.                             
      @491    DXPOA2                        $CHAR1.                             
      @492    DXPOA3                        $CHAR1.                             
      @493    DXPOA4                        $CHAR1.                             
      @494    DXPOA5                        $CHAR1.                             
      @495    DXPOA6                        $CHAR1.                             
      @496    DXPOA7                        $CHAR1.                             
      @497    DXPOA8                        $CHAR1.                             
      @498    DXPOA9                        $CHAR1.                             
      @499    DXPOA10                       $CHAR1.                             
      @500    DXPOA11                       $CHAR1.                             
      @501    DXPOA12                       $CHAR1.                             
      @502    DXPOA13                       $CHAR1.                             
      @503    DXPOA14                       $CHAR1.                             
      @504    DXPOA15                       $CHAR1.                             
      @505    DXPOA16                       $CHAR1.                             
      @506    DXPOA17                       $CHAR1.                             
      @507    DXPOA18                       $CHAR1.                             
      @508    DXPOA19                       $CHAR1.                             
      @509    DXPOA20                       $CHAR1.                             
      @510    DXPOA21                       $CHAR1.                             
      @511    DXPOA22                       $CHAR1.                             
      @512    DXPOA23                       $CHAR1.                             
      @513    DXPOA24                       $CHAR1.                             
      @514    DXPOA25                       $CHAR1.                             
      @515    DXPOA26                       $CHAR1.                             
      @516    DXPOA27                       $CHAR1.                             
      @517    DXPOA28                       $CHAR1.                             
      @518    DXPOA29                       $CHAR1.                             
      @519    DXPOA30                       $CHAR1.                             
      @520    DXPOA31                       $CHAR1.                             
      @521    DXPOA32                       $CHAR1.                             
      @522    DXPOA33                       $CHAR1.                             
      @523    DXPOA34                       $CHAR1.                             
      @524    DXPOA35                       $CHAR1.                             
      @525    DXPOA36                       $CHAR1.                             
      @526    DXPOA37                       $CHAR1.                             
      @527    DXPOA38                       $CHAR1.                             
      @528    DXPOA39                       $CHAR1.                             
      @529    DXPOA40                       $CHAR1.                             
      @530    DXPOA41                       $CHAR1.                             
      @531    DXPOA42                       $CHAR1.                             
      @532    DXPOA43                       $CHAR1.                             
      @533    DXPOA44                       $CHAR1.                             
      @534    DXPOA45                       $CHAR1.                             
      @535    DXPOA46                       $CHAR1.                             
      @536    DXPOA47                       $CHAR1.                             
      @537    DXPOA48                       $CHAR1.                             
      @538    DXPOA49                       $CHAR1.                             
      @539    DXPOA50                       $CHAR1.                             
      @540    DXPOA51                       $CHAR1.                             
      @541    DXPOA52                       $CHAR1.                             
      @542    DXPOA53                       $CHAR1.                             
      @543    DXPOA54                       $CHAR1.                             
      @544    DXPOA55                       $CHAR1.                             
      @545    DXPOA56                       $CHAR1.                             
      @546    DXPOA57                       $CHAR1.                             
      @547    DXPOA58                       $CHAR1.                             
      @548    DXPOA59                       $CHAR1.                             
      @549    DXPOA60                       $CHAR1.                             
      @550    DXPOA61                       $CHAR1.                             
      @551    DXPOA62                       $CHAR1.                             
      @552    DXPOA63                       $CHAR1.                             
      @553    DXPOA64                       $CHAR1.                             
      @554    DXPOA65                       $CHAR1.                             
      @555    DXPOA66                       $CHAR1.                             
      @556    DXPOA67                       $CHAR1.                             
      @557    DXVER                         N3PF.                               
      @560    E_POA1                        $CHAR1.                             
      @561    E_POA2                        $CHAR1.                             
      @562    E_POA3                        $CHAR1.                             
      @563    E_POA4                        $CHAR1.                             
      @564    E_POA5                        $CHAR1.                             
      @565    E_POA6                        $CHAR1.                             
      @566    E_POA7                        $CHAR1.                             
      @567    E_POA8                        $CHAR1.                             
      @568    E_POA9                        $CHAR1.                             
      @569    FEMALE                        N2PF.                               
      @571    HCUP_ED                       N2PF.                               
      @573    HCUP_OS                       N2PF.                               
      @575    HISPANIC                      N2PF.                               
      @577    HISPANIC_X                    $CHAR1.                             
      @578    Homeless                      N2PF.                               
      @580    HOSP_NPI                      $CHAR10.                            
      @590    HOSPST                        $CHAR2.                             
      @592    I10_DX_Admitting              $CHAR7.                             
      @599    I10_DX1                       $CHAR7.                             
      @606    I10_DX2                       $CHAR7.                             
      @613    I10_DX3                       $CHAR7.                             
      @620    I10_DX4                       $CHAR7.                             
      @627    I10_DX5                       $CHAR7.                             
      @634    I10_DX6                       $CHAR7.                             
      @641    I10_DX7                       $CHAR7.                             
      @648    I10_DX8                       $CHAR7.                             
      @655    I10_DX9                       $CHAR7.                             
      @662    I10_DX10                      $CHAR7.                             
      @669    I10_DX11                      $CHAR7.                             
      @676    I10_DX12                      $CHAR7.                             
      @683    I10_DX13                      $CHAR7.                             
      @690    I10_DX14                      $CHAR7.                             
      @697    I10_DX15                      $CHAR7.                             
      @704    I10_DX16                      $CHAR7.                             
      @711    I10_DX17                      $CHAR7.                             
      @718    I10_DX18                      $CHAR7.                             
      @725    I10_DX19                      $CHAR7.                             
      @732    I10_DX20                      $CHAR7.                             
      @739    I10_DX21                      $CHAR7.                             
      @746    I10_DX22                      $CHAR7.                             
      @753    I10_DX23                      $CHAR7.                             
      @760    I10_DX24                      $CHAR7.                             
      @767    I10_DX25                      $CHAR7.                             
      @774    I10_DX26                      $CHAR7.                             
      @781    I10_DX27                      $CHAR7.                             
      @788    I10_DX28                      $CHAR7.                             
      @795    I10_DX29                      $CHAR7.                             
      @802    I10_DX30                      $CHAR7.                             
      @809    I10_DX31                      $CHAR7.                             
      @816    I10_DX32                      $CHAR7.                             
      @823    I10_DX33                      $CHAR7.                             
      @830    I10_DX34                      $CHAR7.                             
      @837    I10_DX35                      $CHAR7.                             
      @844    I10_DX36                      $CHAR7.                             
      @851    I10_DX37                      $CHAR7.                             
      @858    I10_DX38                      $CHAR7.                             
      @865    I10_DX39                      $CHAR7.                             
      @872    I10_DX40                      $CHAR7.                             
      @879    I10_DX41                      $CHAR7.                             
      @886    I10_DX42                      $CHAR7.                             
      @893    I10_DX43                      $CHAR7.                             
      @900    I10_DX44                      $CHAR7.                             
      @907    I10_DX45                      $CHAR7.                             
      @914    I10_DX46                      $CHAR7.                             
      @921    I10_DX47                      $CHAR7.                             
      @928    I10_DX48                      $CHAR7.                             
      @935    I10_DX49                      $CHAR7.                             
      @942    I10_DX50                      $CHAR7.                             
      @949    I10_DX51                      $CHAR7.                             
      @956    I10_DX52                      $CHAR7.                             
      @963    I10_DX53                      $CHAR7.                             
      @970    I10_DX54                      $CHAR7.                             
      @977    I10_DX55                      $CHAR7.                             
      @984    I10_DX56                      $CHAR7.                             
      @991    I10_DX57                      $CHAR7.                             
      @998    I10_DX58                      $CHAR7.                             
      @1005   I10_DX59                      $CHAR7.                             
      @1012   I10_DX60                      $CHAR7.                             
      @1019   I10_DX61                      $CHAR7.                             
      @1026   I10_DX62                      $CHAR7.                             
      @1033   I10_DX63                      $CHAR7.                             
      @1040   I10_DX64                      $CHAR7.                             
      @1047   I10_DX65                      $CHAR7.                             
      @1054   I10_DX66                      $CHAR7.                             
      @1061   I10_DX67                      $CHAR7.                             
      @1068   I10_DXCCS1                    N4PF.                               
      @1072   I10_DXCCS2                    N4PF.                               
      @1076   I10_DXCCS3                    N4PF.                               
      @1080   I10_DXCCS4                    N4PF.                               
      @1084   I10_DXCCS5                    N4PF.                               
      @1088   I10_DXCCS6                    N4PF.                               
      @1092   I10_DXCCS7                    N4PF.                               
      @1096   I10_DXCCS8                    N4PF.                               
      @1100   I10_DXCCS9                    N4PF.                               
      @1104   I10_DXCCS10                   N4PF.                               
      @1108   I10_DXCCS11                   N4PF.                               
      @1112   I10_DXCCS12                   N4PF.                               
      @1116   I10_DXCCS13                   N4PF.                               
      @1120   I10_DXCCS14                   N4PF.                               
      @1124   I10_DXCCS15                   N4PF.                               
      @1128   I10_DXCCS16                   N4PF.                               
      @1132   I10_DXCCS17                   N4PF.                               
      @1136   I10_DXCCS18                   N4PF.                               
      @1140   I10_DXCCS19                   N4PF.                               
      @1144   I10_DXCCS20                   N4PF.                               
      @1148   I10_DXCCS21                   N4PF.                               
      @1152   I10_DXCCS22                   N4PF.                               
      @1156   I10_DXCCS23                   N4PF.                               
      @1160   I10_DXCCS24                   N4PF.                               
      @1164   I10_DXCCS25                   N4PF.                               
      @1168   I10_DXCCS26                   N4PF.                               
      @1172   I10_DXCCS27                   N4PF.                               
      @1176   I10_DXCCS28                   N4PF.                               
      @1180   I10_DXCCS29                   N4PF.                               
      @1184   I10_DXCCS30                   N4PF.                               
      @1188   I10_DXCCS31                   N4PF.                               
      @1192   I10_DXCCS32                   N4PF.                               
      @1196   I10_DXCCS33                   N4PF.                               
      @1200   I10_DXCCS34                   N4PF.                               
      @1204   I10_DXCCS35                   N4PF.                               
      @1208   I10_DXCCS36                   N4PF.                               
      @1212   I10_DXCCS37                   N4PF.                               
      @1216   I10_DXCCS38                   N4PF.                               
      @1220   I10_DXCCS39                   N4PF.                               
      @1224   I10_DXCCS40                   N4PF.                               
      @1228   I10_DXCCS41                   N4PF.                               
      @1232   I10_DXCCS42                   N4PF.                               
      @1236   I10_DXCCS43                   N4PF.                               
      @1240   I10_DXCCS44                   N4PF.                               
      @1244   I10_DXCCS45                   N4PF.                               
      @1248   I10_DXCCS46                   N4PF.                               
      @1252   I10_DXCCS47                   N4PF.                               
      @1256   I10_DXCCS48                   N4PF.                               
      @1260   I10_DXCCS49                   N4PF.                               
      @1264   I10_DXCCS50                   N4PF.                               
      @1268   I10_DXCCS51                   N4PF.                               
      @1272   I10_DXCCS52                   N4PF.                               
      @1276   I10_DXCCS53                   N4PF.                               
      @1280   I10_DXCCS54                   N4PF.                               
      @1284   I10_DXCCS55                   N4PF.                               
      @1288   I10_DXCCS56                   N4PF.                               
      @1292   I10_DXCCS57                   N4PF.                               
      @1296   I10_DXCCS58                   N4PF.                               
      @1300   I10_DXCCS59                   N4PF.                               
      @1304   I10_DXCCS60                   N4PF.                               
      @1308   I10_DXCCS61                   N4PF.                               
      @1312   I10_DXCCS62                   N4PF.                               
      @1316   I10_DXCCS63                   N4PF.                               
      @1320   I10_DXCCS64                   N4PF.                               
      @1324   I10_DXCCS65                   N4PF.                               
      @1328   I10_DXCCS66                   N4PF.                               
      @1332   I10_DXCCS67                   N4PF.                               
      @1336   I10_ECAUSE1                   $CHAR7.                             
      @1343   I10_ECAUSE2                   $CHAR7.                             
      @1350   I10_ECAUSE3                   $CHAR7.                             
      @1357   I10_ECAUSE4                   $CHAR7.                             
      @1364   I10_ECAUSE5                   $CHAR7.                             
      @1371   I10_ECAUSE6                   $CHAR7.                             
      @1378   I10_ECAUSE7                   $CHAR7.                             
      @1385   I10_ECAUSE8                   $CHAR7.                             
      @1392   I10_ECAUSE9                   $CHAR7.                             
      @1399   I10_ECauseCCS1                N4PF.                               
      @1403   I10_ECauseCCS2                N4PF.                               
      @1407   I10_ECauseCCS3                N4PF.                               
      @1411   I10_ECauseCCS4                N4PF.                               
      @1415   I10_ECauseCCS5                N4PF.                               
      @1419   I10_ECauseCCS6                N4PF.                               
      @1423   I10_ECauseCCS7                N4PF.                               
      @1427   I10_ECauseCCS8                N4PF.                               
      @1431   I10_ECauseCCS9                N4PF.                               
      @1435   I10_HOSPBRTH                  N3PF.                               
      @1438   I10_NCHRONIC                  N3PF.                               
      @1441   I10_NDX                       N3PF.                               
      @1444   I10_NECAUSE                   N2PF.                               
      @1446   I10_NEOMAT                    N2PF.                               
      @1448   I10_NPR                       N3PF.                               
      @1451   I10_ORPROC                    N2PF.                               
      @1453   I10_PR1                       $CHAR7.                             
      @1460   I10_PR2                       $CHAR7.                             
      @1467   I10_PR3                       $CHAR7.                             
      @1474   I10_PR4                       $CHAR7.                             
      @1481   I10_PR5                       $CHAR7.                             
      @1488   I10_PR6                       $CHAR7.                             
      @1495   I10_PR7                       $CHAR7.                             
      @1502   I10_PR8                       $CHAR7.                             
      @1509   I10_PR9                       $CHAR7.                             
      @1516   I10_PR10                      $CHAR7.                             
      @1523   I10_PR11                      $CHAR7.                             
      @1530   I10_PR12                      $CHAR7.                             
      @1537   I10_PR13                      $CHAR7.                             
      @1544   I10_PR14                      $CHAR7.                             
      @1551   I10_PR15                      $CHAR7.                             
      @1558   I10_PR16                      $CHAR7.                             
      @1565   I10_PR17                      $CHAR7.                             
      @1572   I10_PR18                      $CHAR7.                             
      @1579   I10_PR19                      $CHAR7.                             
      @1586   I10_PR20                      $CHAR7.                             
      @1593   I10_PR21                      $CHAR7.                             
      @1600   I10_PR22                      $CHAR7.                             
      @1607   I10_PR23                      $CHAR7.                             
      @1614   I10_PR24                      $CHAR7.                             
      @1621   I10_PR25                      $CHAR7.                             
      @1628   I10_PR26                      $CHAR7.                             
      @1635   I10_PR27                      $CHAR7.                             
      @1642   I10_PR28                      $CHAR7.                             
      @1649   I10_PR29                      $CHAR7.                             
      @1656   I10_PR30                      $CHAR7.                             
      @1663   I10_PR31                      $CHAR7.                             
      @1670   I10_PR32                      $CHAR7.                             
      @1677   I10_PR33                      $CHAR7.                             
      @1684   I10_PR34                      $CHAR7.                             
      @1691   I10_PR35                      $CHAR7.                             
      @1698   I10_PR36                      $CHAR7.                             
      @1705   I10_PR37                      $CHAR7.                             
      @1712   I10_PR38                      $CHAR7.                             
      @1719   I10_PR39                      $CHAR7.                             
      @1726   I10_PR40                      $CHAR7.                             
      @1733   I10_PR41                      $CHAR7.                             
      @1740   I10_PR42                      $CHAR7.                             
      @1747   I10_PR43                      $CHAR7.                             
      @1754   I10_PR44                      $CHAR7.                             
      @1761   I10_PR45                      $CHAR7.                             
      @1768   I10_PR46                      $CHAR7.                             
      @1775   I10_PR47                      $CHAR7.                             
      @1782   I10_PR48                      $CHAR7.                             
      @1789   I10_PR49                      $CHAR7.                             
      @1796   I10_PR50                      $CHAR7.                             
      @1803   I10_PRCCS1                    N3PF.                               
      @1806   I10_PRCCS2                    N3PF.                               
      @1809   I10_PRCCS3                    N3PF.                               
      @1812   I10_PRCCS4                    N3PF.                               
      @1815   I10_PRCCS5                    N3PF.                               
      @1818   I10_PRCCS6                    N3PF.                               
      @1821   I10_PRCCS7                    N3PF.                               
      @1824   I10_PRCCS8                    N3PF.                               
      @1827   I10_PRCCS9                    N3PF.                               
      @1830   I10_PRCCS10                   N3PF.                               
      @1833   I10_PRCCS11                   N3PF.                               
      @1836   I10_PRCCS12                   N3PF.                               
      @1839   I10_PRCCS13                   N3PF.                               
      @1842   I10_PRCCS14                   N3PF.                               
      @1845   I10_PRCCS15                   N3PF.                               
      @1848   I10_PRCCS16                   N3PF.                               
      @1851   I10_PRCCS17                   N3PF.                               
      @1854   I10_PRCCS18                   N3PF.                               
      @1857   I10_PRCCS19                   N3PF.                               
      @1860   I10_PRCCS20                   N3PF.                               
      @1863   I10_PRCCS21                   N3PF.                               
      @1866   I10_PRCCS22                   N3PF.                               
      @1869   I10_PRCCS23                   N3PF.                               
      @1872   I10_PRCCS24                   N3PF.                               
      @1875   I10_PRCCS25                   N3PF.                               
      @1878   I10_PRCCS26                   N3PF.                               
      @1881   I10_PRCCS27                   N3PF.                               
      @1884   I10_PRCCS28                   N3PF.                               
      @1887   I10_PRCCS29                   N3PF.                               
      @1890   I10_PRCCS30                   N3PF.                               
      @1893   I10_PRCCS31                   N3PF.                               
      @1896   I10_PRCCS32                   N3PF.                               
      @1899   I10_PRCCS33                   N3PF.                               
      @1902   I10_PRCCS34                   N3PF.                               
      @1905   I10_PRCCS35                   N3PF.                               
      @1908   I10_PRCCS36                   N3PF.                               
      @1911   I10_PRCCS37                   N3PF.                               
      @1914   I10_PRCCS38                   N3PF.                               
      @1917   I10_PRCCS39                   N3PF.                               
      @1920   I10_PRCCS40                   N3PF.                               
      @1923   I10_PRCCS41                   N3PF.                               
      @1926   I10_PRCCS42                   N3PF.                               
      @1929   I10_PRCCS43                   N3PF.                               
      @1932   I10_PRCCS44                   N3PF.                               
      @1935   I10_PRCCS45                   N3PF.                               
      @1938   I10_PRCCS46                   N3PF.                               
      @1941   I10_PRCCS47                   N3PF.                               
      @1944   I10_PRCCS48                   N3PF.                               
      @1947   I10_PRCCS49                   N3PF.                               
      @1950   I10_PRCCS50                   N3PF.                               
      @1953   I10_PROCTYPE                  N3PF.                               
      @1956   I10_SERVICELINE               N2PF.                               
      @1958   KEY                           15.                                 
      @1973   LOS                           N5PF.                               
      @1978   LOS_X                         N6PF.                               
      @1984   MDC                           N2PF.                               
      @1986   MDC_NoPOA                     N2PF.                               
      @1988   MDC32                         N2PF.                               
      @1990   MDSPEC1                       $CHAR3.                             
      @1993   MDSPEC2                       $CHAR3.                             
      @1996   MEDINCSTQ                     N2PF.                               
      @1998   MRN_R                         N9PF.                               
      @2007   NCPT                          N4PF.                               
      @2011   OS_TIME                       N11P2F.                             
      @2022   PAY1                          N2PF.                               
      @2024   PAY1_X                        $CHAR5.                             
      @2029   PAY2                          N2PF.                               
      @2031   PAY2_X                        $CHAR5.                             
      @2036   PL_CBSA                       N3PF.                               
      @2039   PL_NCHS                       N2PF.                               
      @2041   PL_RUCC                       N2PF.                               
      @2043   PL_UIC                        N2PF.                               
      @2045   PL_UR_CAT4                    N2PF.                               
      @2047   POA_Disch_Edit1               N2PF.                               
      @2049   POA_Disch_Edit2               N2PF.                               
      @2051   POA_Hosp_Edit1                N2PF.                               
      @2053   POA_Hosp_Edit2                N2PF.                               
      @2055   POA_Hosp_Edit3                N2PF.                               
      @2057   POA_Hosp_Edit3_Value          N8P2F.                              
      @2065   PointOfOrigin_X               $CHAR1.                             
      @2066   PointOfOriginUB04             $CHAR1.                             
      @2067   PRDAY1                        N5PF.                               
      @2072   PRVER                         N3PF.                               
      @2075   PSTATE                        $CHAR2.                             
      @2077   PSTCO2                        N5PF.                               
      @2082   RACE                          N2PF.                               
      @2084   RACE_X                        $CHAR2.                             
      @2086   TOTCHG                        N10PF.                              
      @2096   TOTCHG_X                      N15P2F.                             
      @2111   TRAN_IN                       N2PF.                               
      @2113   TRAN_OUT                      N2PF.                               
      @2115   VisitLink                     N9PF.                               
      @2124   YEAR                          N4PF.                               
      @2128   ZIP                           $CHAR5.                             
      @2133   ZIP3                          $CHAR3.                             
      @2136   ZIPINC_QRTL                   N3PF.                               
      @2139   AYEAR                         N4PF.                               
      @2143   BMONTH                        N2PF.                               
      @2145   BYEAR                         N4PF.                               
      @2149   PRMONTH1                      N2PF.                               
      @2151   PRYEAR1                       N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
