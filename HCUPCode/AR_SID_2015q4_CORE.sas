/*******************************************************************            
* Creation Date: 02/11/2018                                                     
*   AR_SID_2015q4_CORE.SAS:                                                     
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
DATA AR_SIDC_2015q4_CORE;                                                       
INFILE 'AR_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 2125;                        
                                                                                
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
                                                                                
  APGAR1                     LENGTH=3                                           
  LABEL="One-minute APGAR score"                                                
                                                                                
  APGAR5                     LENGTH=3                                           
  LABEL="Five-minute APGAR score"                                               
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="Type of bill, UB-04 coding"                                            
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
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
                                                                                
  CPT54                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 54"                                           
                                                                                
  CPT55                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 55"                                           
                                                                                
  CPT56                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 56"                                           
                                                                                
  CPT57                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 57"                                           
                                                                                
  CPT58                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 58"                                           
                                                                                
  CPT59                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 59"                                           
                                                                                
  CPT60                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 60"                                           
                                                                                
  CPT61                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 61"                                           
                                                                                
  CPT62                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 62"                                           
                                                                                
  CPT63                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 63"                                           
                                                                                
  CPT64                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 64"                                           
                                                                                
  CPT65                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 65"                                           
                                                                                
  CPT66                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 66"                                           
                                                                                
  CPT67                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 67"                                           
                                                                                
  CPT68                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 68"                                           
                                                                                
  CPT69                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 69"                                           
                                                                                
  CPT70                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 70"                                           
                                                                                
  CPT71                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 71"                                           
                                                                                
  CPT72                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 72"                                           
                                                                                
  CPT73                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 73"                                           
                                                                                
  CPT74                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 74"                                           
                                                                                
  CPT75                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 75"                                           
                                                                                
  CPT76                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 76"                                           
                                                                                
  CPT77                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 77"                                           
                                                                                
  CPT78                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 78"                                           
                                                                                
  CPT79                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 79"                                           
                                                                                
  CPT80                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 80"                                           
                                                                                
  CPT81                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 81"                                           
                                                                                
  CPT82                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 82"                                           
                                                                                
  CPT83                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 83"                                           
                                                                                
  CPT84                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 84"                                           
                                                                                
  CPT85                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 85"                                           
                                                                                
  CPT86                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 86"                                           
                                                                                
  CPT87                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 87"                                           
                                                                                
  CPT88                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 88"                                           
                                                                                
  CPT89                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 89"                                           
                                                                                
  CPT90                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 90"                                           
                                                                                
  CPT91                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 91"                                           
                                                                                
  CPT92                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 92"                                           
                                                                                
  CPT93                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 93"                                           
                                                                                
  CPT94                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 94"                                           
                                                                                
  CPT95                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 95"                                           
                                                                                
  CPT96                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 96"                                           
                                                                                
  CPT97                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 97"                                           
                                                                                
  CPT98                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 98"                                           
                                                                                
  CPT99                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 99"                                           
                                                                                
  CPT100                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 100"                                          
                                                                                
  CPT101                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 101"                                          
                                                                                
  CPT102                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 102"                                          
                                                                                
  CPT103                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 103"                                          
                                                                                
  CPT104                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 104"                                          
                                                                                
  CPT105                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 105"                                          
                                                                                
  CPT106                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 106"                                          
                                                                                
  CPT107                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 107"                                          
                                                                                
  CPT108                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 108"                                          
                                                                                
  CPT109                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 109"                                          
                                                                                
  CPT110                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 110"                                          
                                                                                
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
                                                                                
  CPTCCS54                   LENGTH=4                                           
  LABEL="CCS: CPT 54"                                                           
                                                                                
  CPTCCS55                   LENGTH=4                                           
  LABEL="CCS: CPT 55"                                                           
                                                                                
  CPTCCS56                   LENGTH=4                                           
  LABEL="CCS: CPT 56"                                                           
                                                                                
  CPTCCS57                   LENGTH=4                                           
  LABEL="CCS: CPT 57"                                                           
                                                                                
  CPTCCS58                   LENGTH=4                                           
  LABEL="CCS: CPT 58"                                                           
                                                                                
  CPTCCS59                   LENGTH=4                                           
  LABEL="CCS: CPT 59"                                                           
                                                                                
  CPTCCS60                   LENGTH=4                                           
  LABEL="CCS: CPT 60"                                                           
                                                                                
  CPTCCS61                   LENGTH=4                                           
  LABEL="CCS: CPT 61"                                                           
                                                                                
  CPTCCS62                   LENGTH=4                                           
  LABEL="CCS: CPT 62"                                                           
                                                                                
  CPTCCS63                   LENGTH=4                                           
  LABEL="CCS: CPT 63"                                                           
                                                                                
  CPTCCS64                   LENGTH=4                                           
  LABEL="CCS: CPT 64"                                                           
                                                                                
  CPTCCS65                   LENGTH=4                                           
  LABEL="CCS: CPT 65"                                                           
                                                                                
  CPTCCS66                   LENGTH=4                                           
  LABEL="CCS: CPT 66"                                                           
                                                                                
  CPTCCS67                   LENGTH=4                                           
  LABEL="CCS: CPT 67"                                                           
                                                                                
  CPTCCS68                   LENGTH=4                                           
  LABEL="CCS: CPT 68"                                                           
                                                                                
  CPTCCS69                   LENGTH=4                                           
  LABEL="CCS: CPT 69"                                                           
                                                                                
  CPTCCS70                   LENGTH=4                                           
  LABEL="CCS: CPT 70"                                                           
                                                                                
  CPTCCS71                   LENGTH=4                                           
  LABEL="CCS: CPT 71"                                                           
                                                                                
  CPTCCS72                   LENGTH=4                                           
  LABEL="CCS: CPT 72"                                                           
                                                                                
  CPTCCS73                   LENGTH=4                                           
  LABEL="CCS: CPT 73"                                                           
                                                                                
  CPTCCS74                   LENGTH=4                                           
  LABEL="CCS: CPT 74"                                                           
                                                                                
  CPTCCS75                   LENGTH=4                                           
  LABEL="CCS: CPT 75"                                                           
                                                                                
  CPTCCS76                   LENGTH=4                                           
  LABEL="CCS: CPT 76"                                                           
                                                                                
  CPTCCS77                   LENGTH=4                                           
  LABEL="CCS: CPT 77"                                                           
                                                                                
  CPTCCS78                   LENGTH=4                                           
  LABEL="CCS: CPT 78"                                                           
                                                                                
  CPTCCS79                   LENGTH=4                                           
  LABEL="CCS: CPT 79"                                                           
                                                                                
  CPTCCS80                   LENGTH=4                                           
  LABEL="CCS: CPT 80"                                                           
                                                                                
  CPTCCS81                   LENGTH=4                                           
  LABEL="CCS: CPT 81"                                                           
                                                                                
  CPTCCS82                   LENGTH=4                                           
  LABEL="CCS: CPT 82"                                                           
                                                                                
  CPTCCS83                   LENGTH=4                                           
  LABEL="CCS: CPT 83"                                                           
                                                                                
  CPTCCS84                   LENGTH=4                                           
  LABEL="CCS: CPT 84"                                                           
                                                                                
  CPTCCS85                   LENGTH=4                                           
  LABEL="CCS: CPT 85"                                                           
                                                                                
  CPTCCS86                   LENGTH=4                                           
  LABEL="CCS: CPT 86"                                                           
                                                                                
  CPTCCS87                   LENGTH=4                                           
  LABEL="CCS: CPT 87"                                                           
                                                                                
  CPTCCS88                   LENGTH=4                                           
  LABEL="CCS: CPT 88"                                                           
                                                                                
  CPTCCS89                   LENGTH=4                                           
  LABEL="CCS: CPT 89"                                                           
                                                                                
  CPTCCS90                   LENGTH=4                                           
  LABEL="CCS: CPT 90"                                                           
                                                                                
  CPTCCS91                   LENGTH=4                                           
  LABEL="CCS: CPT 91"                                                           
                                                                                
  CPTCCS92                   LENGTH=4                                           
  LABEL="CCS: CPT 92"                                                           
                                                                                
  CPTCCS93                   LENGTH=4                                           
  LABEL="CCS: CPT 93"                                                           
                                                                                
  CPTCCS94                   LENGTH=4                                           
  LABEL="CCS: CPT 94"                                                           
                                                                                
  CPTCCS95                   LENGTH=4                                           
  LABEL="CCS: CPT 95"                                                           
                                                                                
  CPTCCS96                   LENGTH=4                                           
  LABEL="CCS: CPT 96"                                                           
                                                                                
  CPTCCS97                   LENGTH=4                                           
  LABEL="CCS: CPT 97"                                                           
                                                                                
  CPTCCS98                   LENGTH=4                                           
  LABEL="CCS: CPT 98"                                                           
                                                                                
  CPTCCS99                   LENGTH=4                                           
  LABEL="CCS: CPT 99"                                                           
                                                                                
  CPTCCS100                  LENGTH=4                                           
  LABEL="CCS: CPT 100"                                                          
                                                                                
  CPTCCS101                  LENGTH=4                                           
  LABEL="CCS: CPT 101"                                                          
                                                                                
  CPTCCS102                  LENGTH=4                                           
  LABEL="CCS: CPT 102"                                                          
                                                                                
  CPTCCS103                  LENGTH=4                                           
  LABEL="CCS: CPT 103"                                                          
                                                                                
  CPTCCS104                  LENGTH=4                                           
  LABEL="CCS: CPT 104"                                                          
                                                                                
  CPTCCS105                  LENGTH=4                                           
  LABEL="CCS: CPT 105"                                                          
                                                                                
  CPTCCS106                  LENGTH=4                                           
  LABEL="CCS: CPT 106"                                                          
                                                                                
  CPTCCS107                  LENGTH=4                                           
  LABEL="CCS: CPT 107"                                                          
                                                                                
  CPTCCS108                  LENGTH=4                                           
  LABEL="CCS: CPT 108"                                                          
                                                                                
  CPTCCS109                  LENGTH=4                                           
  LABEL="CCS: CPT 109"                                                          
                                                                                
  CPTCCS110                  LENGTH=4                                           
  LABEL="CCS: CPT 110"                                                          
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
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
                                                                                
  E_POA10                    LENGTH=$1                                          
  LABEL="E Cause 10, present on admission indicator"                            
                                                                                
  E_POA11                    LENGTH=$1                                          
  LABEL="E Cause 11, present on admission indicator"                            
                                                                                
  E_POA12                    LENGTH=$1                                          
  LABEL="E Cause 12, present on admission indicator"                            
                                                                                
  E_POA13                    LENGTH=$1                                          
  LABEL="E Cause 13, present on admission indicator"                            
                                                                                
  E_POA14                    LENGTH=$1                                          
  LABEL="E Cause 14, present on admission indicator"                            
                                                                                
  E_POA15                    LENGTH=$1                                          
  LABEL="E Cause 15, present on admission indicator"                            
                                                                                
  E_POA16                    LENGTH=$1                                          
  LABEL="E Cause 16, present on admission indicator"                            
                                                                                
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
                                                                                
  I10_ECAUSE10               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 10"                                                  
                                                                                
  I10_ECAUSE11               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 11"                                                  
                                                                                
  I10_ECAUSE12               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 12"                                                  
                                                                                
  I10_ECAUSE13               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 13"                                                  
                                                                                
  I10_ECAUSE14               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 14"                                                  
                                                                                
  I10_ECAUSE15               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 15"                                                  
                                                                                
  I10_ECAUSE16               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 16"                                                  
                                                                                
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
                                                                                
  I10_ECauseCCS10            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 10"                                             
                                                                                
  I10_ECauseCCS11            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 11"                                             
                                                                                
  I10_ECauseCCS12            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 12"                                             
                                                                                
  I10_ECauseCCS13            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 13"                                             
                                                                                
  I10_ECauseCCS14            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 14"                                             
                                                                                
  I10_ECauseCCS15            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 15"                                             
                                                                                
  I10_ECauseCCS16            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 16"                                             
                                                                                
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
                                                                                
  MARITALSTATUS_X            LENGTH=$1                                          
  LABEL="Patient's marital status (as received from source)"                    
                                                                                
  MARITALSTATUSUB04          LENGTH=$1                                          
  LABEL="Patient's marital status, UB-04 standard coding"                       
                                                                                
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
                                                                                
  MDNUMTYPE1                 LENGTH=$1                                          
  LABEL="Physician 1 number type"                                               
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$1                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$1                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$1                                          
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
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AHOUR                         N4PF.                               
      @14     AMONTH                        N2PF.                               
      @16     APGAR1                        N2PF.                               
      @18     APGAR5                        N2PF.                               
      @20     ATYPE                         N2PF.                               
      @22     AWEEKEND                      N2PF.                               
      @24     BILLTYPE                      $CHAR4.                             
      @28     BWT                           N4PF.                               
      @32     CPT1                          $CHAR5.                             
      @37     CPT2                          $CHAR5.                             
      @42     CPT3                          $CHAR5.                             
      @47     CPT4                          $CHAR5.                             
      @52     CPT5                          $CHAR5.                             
      @57     CPT6                          $CHAR5.                             
      @62     CPT7                          $CHAR5.                             
      @67     CPT8                          $CHAR5.                             
      @72     CPT9                          $CHAR5.                             
      @77     CPT10                         $CHAR5.                             
      @82     CPT11                         $CHAR5.                             
      @87     CPT12                         $CHAR5.                             
      @92     CPT13                         $CHAR5.                             
      @97     CPT14                         $CHAR5.                             
      @102    CPT15                         $CHAR5.                             
      @107    CPT16                         $CHAR5.                             
      @112    CPT17                         $CHAR5.                             
      @117    CPT18                         $CHAR5.                             
      @122    CPT19                         $CHAR5.                             
      @127    CPT20                         $CHAR5.                             
      @132    CPT21                         $CHAR5.                             
      @137    CPT22                         $CHAR5.                             
      @142    CPT23                         $CHAR5.                             
      @147    CPT24                         $CHAR5.                             
      @152    CPT25                         $CHAR5.                             
      @157    CPT26                         $CHAR5.                             
      @162    CPT27                         $CHAR5.                             
      @167    CPT28                         $CHAR5.                             
      @172    CPT29                         $CHAR5.                             
      @177    CPT30                         $CHAR5.                             
      @182    CPT31                         $CHAR5.                             
      @187    CPT32                         $CHAR5.                             
      @192    CPT33                         $CHAR5.                             
      @197    CPT34                         $CHAR5.                             
      @202    CPT35                         $CHAR5.                             
      @207    CPT36                         $CHAR5.                             
      @212    CPT37                         $CHAR5.                             
      @217    CPT38                         $CHAR5.                             
      @222    CPT39                         $CHAR5.                             
      @227    CPT40                         $CHAR5.                             
      @232    CPT41                         $CHAR5.                             
      @237    CPT42                         $CHAR5.                             
      @242    CPT43                         $CHAR5.                             
      @247    CPT44                         $CHAR5.                             
      @252    CPT45                         $CHAR5.                             
      @257    CPT46                         $CHAR5.                             
      @262    CPT47                         $CHAR5.                             
      @267    CPT48                         $CHAR5.                             
      @272    CPT49                         $CHAR5.                             
      @277    CPT50                         $CHAR5.                             
      @282    CPT51                         $CHAR5.                             
      @287    CPT52                         $CHAR5.                             
      @292    CPT53                         $CHAR5.                             
      @297    CPT54                         $CHAR5.                             
      @302    CPT55                         $CHAR5.                             
      @307    CPT56                         $CHAR5.                             
      @312    CPT57                         $CHAR5.                             
      @317    CPT58                         $CHAR5.                             
      @322    CPT59                         $CHAR5.                             
      @327    CPT60                         $CHAR5.                             
      @332    CPT61                         $CHAR5.                             
      @337    CPT62                         $CHAR5.                             
      @342    CPT63                         $CHAR5.                             
      @347    CPT64                         $CHAR5.                             
      @352    CPT65                         $CHAR5.                             
      @357    CPT66                         $CHAR5.                             
      @362    CPT67                         $CHAR5.                             
      @367    CPT68                         $CHAR5.                             
      @372    CPT69                         $CHAR5.                             
      @377    CPT70                         $CHAR5.                             
      @382    CPT71                         $CHAR5.                             
      @387    CPT72                         $CHAR5.                             
      @392    CPT73                         $CHAR5.                             
      @397    CPT74                         $CHAR5.                             
      @402    CPT75                         $CHAR5.                             
      @407    CPT76                         $CHAR5.                             
      @412    CPT77                         $CHAR5.                             
      @417    CPT78                         $CHAR5.                             
      @422    CPT79                         $CHAR5.                             
      @427    CPT80                         $CHAR5.                             
      @432    CPT81                         $CHAR5.                             
      @437    CPT82                         $CHAR5.                             
      @442    CPT83                         $CHAR5.                             
      @447    CPT84                         $CHAR5.                             
      @452    CPT85                         $CHAR5.                             
      @457    CPT86                         $CHAR5.                             
      @462    CPT87                         $CHAR5.                             
      @467    CPT88                         $CHAR5.                             
      @472    CPT89                         $CHAR5.                             
      @477    CPT90                         $CHAR5.                             
      @482    CPT91                         $CHAR5.                             
      @487    CPT92                         $CHAR5.                             
      @492    CPT93                         $CHAR5.                             
      @497    CPT94                         $CHAR5.                             
      @502    CPT95                         $CHAR5.                             
      @507    CPT96                         $CHAR5.                             
      @512    CPT97                         $CHAR5.                             
      @517    CPT98                         $CHAR5.                             
      @522    CPT99                         $CHAR5.                             
      @527    CPT100                        $CHAR5.                             
      @532    CPT101                        $CHAR5.                             
      @537    CPT102                        $CHAR5.                             
      @542    CPT103                        $CHAR5.                             
      @547    CPT104                        $CHAR5.                             
      @552    CPT105                        $CHAR5.                             
      @557    CPT106                        $CHAR5.                             
      @562    CPT107                        $CHAR5.                             
      @567    CPT108                        $CHAR5.                             
      @572    CPT109                        $CHAR5.                             
      @577    CPT110                        $CHAR5.                             
      @582    CPTCCS1                       N3PF.                               
      @585    CPTCCS2                       N3PF.                               
      @588    CPTCCS3                       N3PF.                               
      @591    CPTCCS4                       N3PF.                               
      @594    CPTCCS5                       N3PF.                               
      @597    CPTCCS6                       N3PF.                               
      @600    CPTCCS7                       N3PF.                               
      @603    CPTCCS8                       N3PF.                               
      @606    CPTCCS9                       N3PF.                               
      @609    CPTCCS10                      N3PF.                               
      @612    CPTCCS11                      N3PF.                               
      @615    CPTCCS12                      N3PF.                               
      @618    CPTCCS13                      N3PF.                               
      @621    CPTCCS14                      N3PF.                               
      @624    CPTCCS15                      N3PF.                               
      @627    CPTCCS16                      N3PF.                               
      @630    CPTCCS17                      N3PF.                               
      @633    CPTCCS18                      N3PF.                               
      @636    CPTCCS19                      N3PF.                               
      @639    CPTCCS20                      N3PF.                               
      @642    CPTCCS21                      N3PF.                               
      @645    CPTCCS22                      N3PF.                               
      @648    CPTCCS23                      N3PF.                               
      @651    CPTCCS24                      N3PF.                               
      @654    CPTCCS25                      N3PF.                               
      @657    CPTCCS26                      N3PF.                               
      @660    CPTCCS27                      N3PF.                               
      @663    CPTCCS28                      N3PF.                               
      @666    CPTCCS29                      N3PF.                               
      @669    CPTCCS30                      N3PF.                               
      @672    CPTCCS31                      N3PF.                               
      @675    CPTCCS32                      N3PF.                               
      @678    CPTCCS33                      N3PF.                               
      @681    CPTCCS34                      N3PF.                               
      @684    CPTCCS35                      N3PF.                               
      @687    CPTCCS36                      N3PF.                               
      @690    CPTCCS37                      N3PF.                               
      @693    CPTCCS38                      N3PF.                               
      @696    CPTCCS39                      N3PF.                               
      @699    CPTCCS40                      N3PF.                               
      @702    CPTCCS41                      N3PF.                               
      @705    CPTCCS42                      N3PF.                               
      @708    CPTCCS43                      N3PF.                               
      @711    CPTCCS44                      N3PF.                               
      @714    CPTCCS45                      N3PF.                               
      @717    CPTCCS46                      N3PF.                               
      @720    CPTCCS47                      N3PF.                               
      @723    CPTCCS48                      N3PF.                               
      @726    CPTCCS49                      N3PF.                               
      @729    CPTCCS50                      N3PF.                               
      @732    CPTCCS51                      N3PF.                               
      @735    CPTCCS52                      N3PF.                               
      @738    CPTCCS53                      N3PF.                               
      @741    CPTCCS54                      N3PF.                               
      @744    CPTCCS55                      N3PF.                               
      @747    CPTCCS56                      N3PF.                               
      @750    CPTCCS57                      N3PF.                               
      @753    CPTCCS58                      N3PF.                               
      @756    CPTCCS59                      N3PF.                               
      @759    CPTCCS60                      N3PF.                               
      @762    CPTCCS61                      N3PF.                               
      @765    CPTCCS62                      N3PF.                               
      @768    CPTCCS63                      N3PF.                               
      @771    CPTCCS64                      N3PF.                               
      @774    CPTCCS65                      N3PF.                               
      @777    CPTCCS66                      N3PF.                               
      @780    CPTCCS67                      N3PF.                               
      @783    CPTCCS68                      N3PF.                               
      @786    CPTCCS69                      N3PF.                               
      @789    CPTCCS70                      N3PF.                               
      @792    CPTCCS71                      N3PF.                               
      @795    CPTCCS72                      N3PF.                               
      @798    CPTCCS73                      N3PF.                               
      @801    CPTCCS74                      N3PF.                               
      @804    CPTCCS75                      N3PF.                               
      @807    CPTCCS76                      N3PF.                               
      @810    CPTCCS77                      N3PF.                               
      @813    CPTCCS78                      N3PF.                               
      @816    CPTCCS79                      N3PF.                               
      @819    CPTCCS80                      N3PF.                               
      @822    CPTCCS81                      N3PF.                               
      @825    CPTCCS82                      N3PF.                               
      @828    CPTCCS83                      N3PF.                               
      @831    CPTCCS84                      N3PF.                               
      @834    CPTCCS85                      N3PF.                               
      @837    CPTCCS86                      N3PF.                               
      @840    CPTCCS87                      N3PF.                               
      @843    CPTCCS88                      N3PF.                               
      @846    CPTCCS89                      N3PF.                               
      @849    CPTCCS90                      N3PF.                               
      @852    CPTCCS91                      N3PF.                               
      @855    CPTCCS92                      N3PF.                               
      @858    CPTCCS93                      N3PF.                               
      @861    CPTCCS94                      N3PF.                               
      @864    CPTCCS95                      N3PF.                               
      @867    CPTCCS96                      N3PF.                               
      @870    CPTCCS97                      N3PF.                               
      @873    CPTCCS98                      N3PF.                               
      @876    CPTCCS99                      N3PF.                               
      @879    CPTCCS100                     N3PF.                               
      @882    CPTCCS101                     N3PF.                               
      @885    CPTCCS102                     N3PF.                               
      @888    CPTCCS103                     N3PF.                               
      @891    CPTCCS104                     N3PF.                               
      @894    CPTCCS105                     N3PF.                               
      @897    CPTCCS106                     N3PF.                               
      @900    CPTCCS107                     N3PF.                               
      @903    CPTCCS108                     N3PF.                               
      @906    CPTCCS109                     N3PF.                               
      @909    CPTCCS110                     N3PF.                               
      @912    DaysToEvent                   N6PF.                               
      @918    DHOUR                         N4PF.                               
      @922    DIED                          N2PF.                               
      @924    DISP_X                        $CHAR2.                             
      @926    DISPUB04                      N2PF.                               
      @928    DISPUNIFORM                   N2PF.                               
      @930    DMONTH                        N2PF.                               
      @932    DNR                           N2PF.                               
      @934    DQTR                          N2PF.                               
      @936    DRG                           N3PF.                               
      @939    DRG_NoPOA                     N3PF.                               
      @942    DRG32                         N3PF.                               
      @945    DRGVER                        N2PF.                               
      @947    DSHOSPID                      $CHAR17.                            
      @964    DXPOA1                        $CHAR1.                             
      @965    DXPOA2                        $CHAR1.                             
      @966    DXPOA3                        $CHAR1.                             
      @967    DXPOA4                        $CHAR1.                             
      @968    DXPOA5                        $CHAR1.                             
      @969    DXPOA6                        $CHAR1.                             
      @970    DXPOA7                        $CHAR1.                             
      @971    DXPOA8                        $CHAR1.                             
      @972    DXPOA9                        $CHAR1.                             
      @973    DXPOA10                       $CHAR1.                             
      @974    DXPOA11                       $CHAR1.                             
      @975    DXPOA12                       $CHAR1.                             
      @976    DXPOA13                       $CHAR1.                             
      @977    DXPOA14                       $CHAR1.                             
      @978    DXPOA15                       $CHAR1.                             
      @979    DXPOA16                       $CHAR1.                             
      @980    DXPOA17                       $CHAR1.                             
      @981    DXPOA18                       $CHAR1.                             
      @982    DXPOA19                       $CHAR1.                             
      @983    DXPOA20                       $CHAR1.                             
      @984    DXPOA21                       $CHAR1.                             
      @985    DXPOA22                       $CHAR1.                             
      @986    DXPOA23                       $CHAR1.                             
      @987    DXPOA24                       $CHAR1.                             
      @988    DXPOA25                       $CHAR1.                             
      @989    DXPOA26                       $CHAR1.                             
      @990    DXPOA27                       $CHAR1.                             
      @991    DXPOA28                       $CHAR1.                             
      @992    DXPOA29                       $CHAR1.                             
      @993    DXPOA30                       $CHAR1.                             
      @994    DXVER                         N3PF.                               
      @997    E_POA1                        $CHAR1.                             
      @998    E_POA2                        $CHAR1.                             
      @999    E_POA3                        $CHAR1.                             
      @1000   E_POA4                        $CHAR1.                             
      @1001   E_POA5                        $CHAR1.                             
      @1002   E_POA6                        $CHAR1.                             
      @1003   E_POA7                        $CHAR1.                             
      @1004   E_POA8                        $CHAR1.                             
      @1005   E_POA9                        $CHAR1.                             
      @1006   E_POA10                       $CHAR1.                             
      @1007   E_POA11                       $CHAR1.                             
      @1008   E_POA12                       $CHAR1.                             
      @1009   E_POA13                       $CHAR1.                             
      @1010   E_POA14                       $CHAR1.                             
      @1011   E_POA15                       $CHAR1.                             
      @1012   E_POA16                       $CHAR1.                             
      @1013   FEMALE                        N2PF.                               
      @1015   HCUP_ED                       N2PF.                               
      @1017   HCUP_OS                       N2PF.                               
      @1019   HISPANIC                      N2PF.                               
      @1021   HISPANIC_X                    $CHAR1.                             
      @1022   HOSPST                        $CHAR2.                             
      @1024   I10_DX_Admitting              $CHAR7.                             
      @1031   I10_DX1                       $CHAR7.                             
      @1038   I10_DX2                       $CHAR7.                             
      @1045   I10_DX3                       $CHAR7.                             
      @1052   I10_DX4                       $CHAR7.                             
      @1059   I10_DX5                       $CHAR7.                             
      @1066   I10_DX6                       $CHAR7.                             
      @1073   I10_DX7                       $CHAR7.                             
      @1080   I10_DX8                       $CHAR7.                             
      @1087   I10_DX9                       $CHAR7.                             
      @1094   I10_DX10                      $CHAR7.                             
      @1101   I10_DX11                      $CHAR7.                             
      @1108   I10_DX12                      $CHAR7.                             
      @1115   I10_DX13                      $CHAR7.                             
      @1122   I10_DX14                      $CHAR7.                             
      @1129   I10_DX15                      $CHAR7.                             
      @1136   I10_DX16                      $CHAR7.                             
      @1143   I10_DX17                      $CHAR7.                             
      @1150   I10_DX18                      $CHAR7.                             
      @1157   I10_DX19                      $CHAR7.                             
      @1164   I10_DX20                      $CHAR7.                             
      @1171   I10_DX21                      $CHAR7.                             
      @1178   I10_DX22                      $CHAR7.                             
      @1185   I10_DX23                      $CHAR7.                             
      @1192   I10_DX24                      $CHAR7.                             
      @1199   I10_DX25                      $CHAR7.                             
      @1206   I10_DX26                      $CHAR7.                             
      @1213   I10_DX27                      $CHAR7.                             
      @1220   I10_DX28                      $CHAR7.                             
      @1227   I10_DX29                      $CHAR7.                             
      @1234   I10_DX30                      $CHAR7.                             
      @1241   I10_DXCCS1                    N4PF.                               
      @1245   I10_DXCCS2                    N4PF.                               
      @1249   I10_DXCCS3                    N4PF.                               
      @1253   I10_DXCCS4                    N4PF.                               
      @1257   I10_DXCCS5                    N4PF.                               
      @1261   I10_DXCCS6                    N4PF.                               
      @1265   I10_DXCCS7                    N4PF.                               
      @1269   I10_DXCCS8                    N4PF.                               
      @1273   I10_DXCCS9                    N4PF.                               
      @1277   I10_DXCCS10                   N4PF.                               
      @1281   I10_DXCCS11                   N4PF.                               
      @1285   I10_DXCCS12                   N4PF.                               
      @1289   I10_DXCCS13                   N4PF.                               
      @1293   I10_DXCCS14                   N4PF.                               
      @1297   I10_DXCCS15                   N4PF.                               
      @1301   I10_DXCCS16                   N4PF.                               
      @1305   I10_DXCCS17                   N4PF.                               
      @1309   I10_DXCCS18                   N4PF.                               
      @1313   I10_DXCCS19                   N4PF.                               
      @1317   I10_DXCCS20                   N4PF.                               
      @1321   I10_DXCCS21                   N4PF.                               
      @1325   I10_DXCCS22                   N4PF.                               
      @1329   I10_DXCCS23                   N4PF.                               
      @1333   I10_DXCCS24                   N4PF.                               
      @1337   I10_DXCCS25                   N4PF.                               
      @1341   I10_DXCCS26                   N4PF.                               
      @1345   I10_DXCCS27                   N4PF.                               
      @1349   I10_DXCCS28                   N4PF.                               
      @1353   I10_DXCCS29                   N4PF.                               
      @1357   I10_DXCCS30                   N4PF.                               
      @1361   I10_ECAUSE1                   $CHAR7.                             
      @1368   I10_ECAUSE2                   $CHAR7.                             
      @1375   I10_ECAUSE3                   $CHAR7.                             
      @1382   I10_ECAUSE4                   $CHAR7.                             
      @1389   I10_ECAUSE5                   $CHAR7.                             
      @1396   I10_ECAUSE6                   $CHAR7.                             
      @1403   I10_ECAUSE7                   $CHAR7.                             
      @1410   I10_ECAUSE8                   $CHAR7.                             
      @1417   I10_ECAUSE9                   $CHAR7.                             
      @1424   I10_ECAUSE10                  $CHAR7.                             
      @1431   I10_ECAUSE11                  $CHAR7.                             
      @1438   I10_ECAUSE12                  $CHAR7.                             
      @1445   I10_ECAUSE13                  $CHAR7.                             
      @1452   I10_ECAUSE14                  $CHAR7.                             
      @1459   I10_ECAUSE15                  $CHAR7.                             
      @1466   I10_ECAUSE16                  $CHAR7.                             
      @1473   I10_ECauseCCS1                N4PF.                               
      @1477   I10_ECauseCCS2                N4PF.                               
      @1481   I10_ECauseCCS3                N4PF.                               
      @1485   I10_ECauseCCS4                N4PF.                               
      @1489   I10_ECauseCCS5                N4PF.                               
      @1493   I10_ECauseCCS6                N4PF.                               
      @1497   I10_ECauseCCS7                N4PF.                               
      @1501   I10_ECauseCCS8                N4PF.                               
      @1505   I10_ECauseCCS9                N4PF.                               
      @1509   I10_ECauseCCS10               N4PF.                               
      @1513   I10_ECauseCCS11               N4PF.                               
      @1517   I10_ECauseCCS12               N4PF.                               
      @1521   I10_ECauseCCS13               N4PF.                               
      @1525   I10_ECauseCCS14               N4PF.                               
      @1529   I10_ECauseCCS15               N4PF.                               
      @1533   I10_ECauseCCS16               N4PF.                               
      @1537   I10_HOSPBRTH                  N3PF.                               
      @1540   I10_NCHRONIC                  N3PF.                               
      @1543   I10_NDX                       N3PF.                               
      @1546   I10_NECAUSE                   N2PF.                               
      @1548   I10_NEOMAT                    N2PF.                               
      @1550   I10_NPR                       N3PF.                               
      @1553   I10_ORPROC                    N2PF.                               
      @1555   I10_PR1                       $CHAR7.                             
      @1562   I10_PR2                       $CHAR7.                             
      @1569   I10_PR3                       $CHAR7.                             
      @1576   I10_PR4                       $CHAR7.                             
      @1583   I10_PR5                       $CHAR7.                             
      @1590   I10_PR6                       $CHAR7.                             
      @1597   I10_PR7                       $CHAR7.                             
      @1604   I10_PR8                       $CHAR7.                             
      @1611   I10_PR9                       $CHAR7.                             
      @1618   I10_PR10                      $CHAR7.                             
      @1625   I10_PR11                      $CHAR7.                             
      @1632   I10_PR12                      $CHAR7.                             
      @1639   I10_PR13                      $CHAR7.                             
      @1646   I10_PR14                      $CHAR7.                             
      @1653   I10_PR15                      $CHAR7.                             
      @1660   I10_PR16                      $CHAR7.                             
      @1667   I10_PR17                      $CHAR7.                             
      @1674   I10_PR18                      $CHAR7.                             
      @1681   I10_PR19                      $CHAR7.                             
      @1688   I10_PR20                      $CHAR7.                             
      @1695   I10_PR21                      $CHAR7.                             
      @1702   I10_PRCCS1                    N3PF.                               
      @1705   I10_PRCCS2                    N3PF.                               
      @1708   I10_PRCCS3                    N3PF.                               
      @1711   I10_PRCCS4                    N3PF.                               
      @1714   I10_PRCCS5                    N3PF.                               
      @1717   I10_PRCCS6                    N3PF.                               
      @1720   I10_PRCCS7                    N3PF.                               
      @1723   I10_PRCCS8                    N3PF.                               
      @1726   I10_PRCCS9                    N3PF.                               
      @1729   I10_PRCCS10                   N3PF.                               
      @1732   I10_PRCCS11                   N3PF.                               
      @1735   I10_PRCCS12                   N3PF.                               
      @1738   I10_PRCCS13                   N3PF.                               
      @1741   I10_PRCCS14                   N3PF.                               
      @1744   I10_PRCCS15                   N3PF.                               
      @1747   I10_PRCCS16                   N3PF.                               
      @1750   I10_PRCCS17                   N3PF.                               
      @1753   I10_PRCCS18                   N3PF.                               
      @1756   I10_PRCCS19                   N3PF.                               
      @1759   I10_PRCCS20                   N3PF.                               
      @1762   I10_PRCCS21                   N3PF.                               
      @1765   I10_PROCTYPE                  N3PF.                               
      @1768   I10_SERVICELINE               N2PF.                               
      @1770   KEY                           15.                                 
      @1785   LOS                           N5PF.                               
      @1790   LOS_X                         N6PF.                               
      @1796   MARITALSTATUS_X               $CHAR1.                             
      @1797   MARITALSTATUSUB04             $CHAR1.                             
      @1798   MDC                           N2PF.                               
      @1800   MDC_NoPOA                     N2PF.                               
      @1802   MDC32                         N2PF.                               
      @1804   MDNUM1_R                      N9PF.                               
      @1813   MDNUM2_R                      N9PF.                               
      @1822   MDNUM3_R                      N9PF.                               
      @1831   MDNUM4_R                      N9PF.                               
      @1840   MDNUMTYPE1                    $CHAR1.                             
      @1841   MEDINCSTQ                     N2PF.                               
      @1843   MRN_R                         N9PF.                               
      @1852   NCPT                          N4PF.                               
      @1856   OS_TIME                       N11P2F.                             
      @1867   P7EDSRC_X                     $CHAR2.                             
      @1869   PAY1                          N2PF.                               
      @1871   PAY1_X                        $CHAR1.                             
      @1872   PAY2                          N2PF.                               
      @1874   PAY2_X                        $CHAR1.                             
      @1875   PAY3                          N2PF.                               
      @1877   PAY3_X                        $CHAR1.                             
      @1878   PL_CBSA                       N3PF.                               
      @1881   PL_NCHS                       N2PF.                               
      @1883   PL_RUCC                       N2PF.                               
      @1885   PL_UIC                        N2PF.                               
      @1887   PL_UR_CAT4                    N2PF.                               
      @1889   POA_Disch_Edit1               N2PF.                               
      @1891   POA_Disch_Edit2               N2PF.                               
      @1893   POA_Hosp_Edit1                N2PF.                               
      @1895   POA_Hosp_Edit2                N2PF.                               
      @1897   POA_Hosp_Edit3                N2PF.                               
      @1899   POA_Hosp_Edit3_Value          N8P2F.                              
      @1907   PointOfOrigin_X               $CHAR1.                             
      @1908   PointOfOriginUB04             $CHAR1.                             
      @1909   PRDAY1                        N5PF.                               
      @1914   PRDAY2                        N5PF.                               
      @1919   PRDAY3                        N5PF.                               
      @1924   PRDAY4                        N5PF.                               
      @1929   PRDAY5                        N5PF.                               
      @1934   PRDAY6                        N5PF.                               
      @1939   PRDAY7                        N5PF.                               
      @1944   PRDAY8                        N5PF.                               
      @1949   PRDAY9                        N5PF.                               
      @1954   PRDAY10                       N5PF.                               
      @1959   PRDAY11                       N5PF.                               
      @1964   PRDAY12                       N5PF.                               
      @1969   PRDAY13                       N5PF.                               
      @1974   PRDAY14                       N5PF.                               
      @1979   PRDAY15                       N5PF.                               
      @1984   PRDAY16                       N5PF.                               
      @1989   PRDAY17                       N5PF.                               
      @1994   PRDAY18                       N5PF.                               
      @1999   PRDAY19                       N5PF.                               
      @2004   PRDAY20                       N5PF.                               
      @2009   PRDAY21                       N5PF.                               
      @2014   PRVER                         N3PF.                               
      @2017   PSTATE                        $CHAR2.                             
      @2019   PSTCO2                        N5PF.                               
      @2024   RACE                          N2PF.                               
      @2026   RACE_X                        $CHAR1.                             
      @2027   TOTCHG                        N10PF.                              
      @2037   TOTCHG_X                      N15P2F.                             
      @2052   TRAN_IN                       N2PF.                               
      @2054   TRAN_OUT                      N2PF.                               
      @2056   VisitLink                     N9PF.                               
      @2065   YEAR                          N4PF.                               
      @2069   ZIP                           $CHAR5.                             
      @2074   ZIP3                          $CHAR3.                             
      @2077   ZIPINC_QRTL                   N3PF.                               
      @2080   AYEAR                         N4PF.                               
      @2084   BMONTH                        N2PF.                               
      @2086   BYEAR                         N4PF.                               
      @2090   PRMONTH1                      N2PF.                               
      @2092   PRMONTH2                      N2PF.                               
      @2094   PRMONTH3                      N2PF.                               
      @2096   PRMONTH4                      N2PF.                               
      @2098   PRMONTH5                      N2PF.                               
      @2100   PRMONTH6                      N2PF.                               
      @2102   PRYEAR1                       N4PF.                               
      @2106   PRYEAR2                       N4PF.                               
      @2110   PRYEAR3                       N4PF.                               
      @2114   PRYEAR4                       N4PF.                               
      @2118   PRYEAR5                       N4PF.                               
      @2122   PRYEAR6                       N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
