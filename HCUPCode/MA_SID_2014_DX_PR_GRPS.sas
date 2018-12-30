/*******************************************************************            
* Creation Date: 03/28/2017                                                     
*   MA_SID_2014_DX_PR_GRPS.SAS:                                                 
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY DX_PR_GRPS FILE INTO SAS                                  
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
DATA MA_SIDC_2014_DX_PR_GRPS;                                                   
INFILE 'MA_SID_2014_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 1986;                    
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  BODYSYSTEM1                LENGTH=3                                           
  LABEL="Body system 1"                                                         
                                                                                
  BODYSYSTEM2                LENGTH=3                                           
  LABEL="Body system 2"                                                         
                                                                                
  BODYSYSTEM3                LENGTH=3                                           
  LABEL="Body system 3"                                                         
                                                                                
  BODYSYSTEM4                LENGTH=3                                           
  LABEL="Body system 4"                                                         
                                                                                
  BODYSYSTEM5                LENGTH=3                                           
  LABEL="Body system 5"                                                         
                                                                                
  BODYSYSTEM6                LENGTH=3                                           
  LABEL="Body system 6"                                                         
                                                                                
  BODYSYSTEM7                LENGTH=3                                           
  LABEL="Body system 7"                                                         
                                                                                
  BODYSYSTEM8                LENGTH=3                                           
  LABEL="Body system 8"                                                         
                                                                                
  BODYSYSTEM9                LENGTH=3                                           
  LABEL="Body system 9"                                                         
                                                                                
  BODYSYSTEM10               LENGTH=3                                           
  LABEL="Body system 10"                                                        
                                                                                
  BODYSYSTEM11               LENGTH=3                                           
  LABEL="Body system 11"                                                        
                                                                                
  BODYSYSTEM12               LENGTH=3                                           
  LABEL="Body system 12"                                                        
                                                                                
  BODYSYSTEM13               LENGTH=3                                           
  LABEL="Body system 13"                                                        
                                                                                
  BODYSYSTEM14               LENGTH=3                                           
  LABEL="Body system 14"                                                        
                                                                                
  BODYSYSTEM15               LENGTH=3                                           
  LABEL="Body system 15"                                                        
                                                                                
  BODYSYSTEM16               LENGTH=3                                           
  LABEL="Body system 16"                                                        
                                                                                
  BODYSYSTEM17               LENGTH=3                                           
  LABEL="Body system 17"                                                        
                                                                                
  BODYSYSTEM18               LENGTH=3                                           
  LABEL="Body system 18"                                                        
                                                                                
  BODYSYSTEM19               LENGTH=3                                           
  LABEL="Body system 19"                                                        
                                                                                
  BODYSYSTEM20               LENGTH=3                                           
  LABEL="Body system 20"                                                        
                                                                                
  BODYSYSTEM21               LENGTH=3                                           
  LABEL="Body system 21"                                                        
                                                                                
  BODYSYSTEM22               LENGTH=3                                           
  LABEL="Body system 22"                                                        
                                                                                
  BODYSYSTEM23               LENGTH=3                                           
  LABEL="Body system 23"                                                        
                                                                                
  BODYSYSTEM24               LENGTH=3                                           
  LABEL="Body system 24"                                                        
                                                                                
  BODYSYSTEM25               LENGTH=3                                           
  LABEL="Body system 25"                                                        
                                                                                
  BODYSYSTEM26               LENGTH=3                                           
  LABEL="Body system 26"                                                        
                                                                                
  BODYSYSTEM27               LENGTH=3                                           
  LABEL="Body system 27"                                                        
                                                                                
  BODYSYSTEM28               LENGTH=3                                           
  LABEL="Body system 28"                                                        
                                                                                
  BODYSYSTEM29               LENGTH=3                                           
  LABEL="Body system 29"                                                        
                                                                                
  BODYSYSTEM30               LENGTH=3                                           
  LABEL="Body system 30"                                                        
                                                                                
  BODYSYSTEM31               LENGTH=3                                           
  LABEL="Body system 31"                                                        
                                                                                
  BODYSYSTEM32               LENGTH=3                                           
  LABEL="Body system 32"                                                        
                                                                                
  BODYSYSTEM33               LENGTH=3                                           
  LABEL="Body system 33"                                                        
                                                                                
  BODYSYSTEM34               LENGTH=3                                           
  LABEL="Body system 34"                                                        
                                                                                
  BODYSYSTEM35               LENGTH=3                                           
  LABEL="Body system 35"                                                        
                                                                                
  BODYSYSTEM36               LENGTH=3                                           
  LABEL="Body system 36"                                                        
                                                                                
  BODYSYSTEM37               LENGTH=3                                           
  LABEL="Body system 37"                                                        
                                                                                
  BODYSYSTEM38               LENGTH=3                                           
  LABEL="Body system 38"                                                        
                                                                                
  BODYSYSTEM39               LENGTH=3                                           
  LABEL="Body system 39"                                                        
                                                                                
  BODYSYSTEM40               LENGTH=3                                           
  LABEL="Body system 40"                                                        
                                                                                
  BODYSYSTEM41               LENGTH=3                                           
  LABEL="Body system 41"                                                        
                                                                                
  BODYSYSTEM42               LENGTH=3                                           
  LABEL="Body system 42"                                                        
                                                                                
  BODYSYSTEM43               LENGTH=3                                           
  LABEL="Body system 43"                                                        
                                                                                
  BODYSYSTEM44               LENGTH=3                                           
  LABEL="Body system 44"                                                        
                                                                                
  BODYSYSTEM45               LENGTH=3                                           
  LABEL="Body system 45"                                                        
                                                                                
  BODYSYSTEM46               LENGTH=3                                           
  LABEL="Body system 46"                                                        
                                                                                
  BODYSYSTEM47               LENGTH=3                                           
  LABEL="Body system 47"                                                        
                                                                                
  BODYSYSTEM48               LENGTH=3                                           
  LABEL="Body system 48"                                                        
                                                                                
  BODYSYSTEM49               LENGTH=3                                           
  LABEL="Body system 49"                                                        
                                                                                
  BODYSYSTEM50               LENGTH=3                                           
  LABEL="Body system 50"                                                        
                                                                                
  BODYSYSTEM51               LENGTH=3                                           
  LABEL="Body system 51"                                                        
                                                                                
  BODYSYSTEM52               LENGTH=3                                           
  LABEL="Body system 52"                                                        
                                                                                
  BODYSYSTEM53               LENGTH=3                                           
  LABEL="Body system 53"                                                        
                                                                                
  BODYSYSTEM54               LENGTH=3                                           
  LABEL="Body system 54"                                                        
                                                                                
  BODYSYSTEM55               LENGTH=3                                           
  LABEL="Body system 55"                                                        
                                                                                
  BODYSYSTEM56               LENGTH=3                                           
  LABEL="Body system 56"                                                        
                                                                                
  BODYSYSTEM57               LENGTH=3                                           
  LABEL="Body system 57"                                                        
                                                                                
  BODYSYSTEM58               LENGTH=3                                           
  LABEL="Body system 58"                                                        
                                                                                
  BODYSYSTEM59               LENGTH=3                                           
  LABEL="Body system 59"                                                        
                                                                                
  BODYSYSTEM60               LENGTH=3                                           
  LABEL="Body system 60"                                                        
                                                                                
  BODYSYSTEM61               LENGTH=3                                           
  LABEL="Body system 61"                                                        
                                                                                
  BODYSYSTEM62               LENGTH=3                                           
  LABEL="Body system 62"                                                        
                                                                                
  BODYSYSTEM63               LENGTH=3                                           
  LABEL="Body system 63"                                                        
                                                                                
  BODYSYSTEM64               LENGTH=3                                           
  LABEL="Body system 64"                                                        
                                                                                
  BODYSYSTEM65               LENGTH=3                                           
  LABEL="Body system 65"                                                        
                                                                                
  BODYSYSTEM66               LENGTH=3                                           
  LABEL="Body system 66"                                                        
                                                                                
  BODYSYSTEM67               LENGTH=3                                           
  LABEL="Body system 67"                                                        
                                                                                
  BODYSYSTEM68               LENGTH=3                                           
  LABEL="Body system 68"                                                        
                                                                                
  BODYSYSTEM69               LENGTH=3                                           
  LABEL="Body system 69"                                                        
                                                                                
  BODYSYSTEM70               LENGTH=3                                           
  LABEL="Body system 70"                                                        
                                                                                
  BODYSYSTEM71               LENGTH=3                                           
  LABEL="Body system 71"                                                        
                                                                                
  CHRON1                     LENGTH=3                                           
  LABEL="Chronic condition indicator 1"                                         
                                                                                
  CHRON2                     LENGTH=3                                           
  LABEL="Chronic condition indicator 2"                                         
                                                                                
  CHRON3                     LENGTH=3                                           
  LABEL="Chronic condition indicator 3"                                         
                                                                                
  CHRON4                     LENGTH=3                                           
  LABEL="Chronic condition indicator 4"                                         
                                                                                
  CHRON5                     LENGTH=3                                           
  LABEL="Chronic condition indicator 5"                                         
                                                                                
  CHRON6                     LENGTH=3                                           
  LABEL="Chronic condition indicator 6"                                         
                                                                                
  CHRON7                     LENGTH=3                                           
  LABEL="Chronic condition indicator 7"                                         
                                                                                
  CHRON8                     LENGTH=3                                           
  LABEL="Chronic condition indicator 8"                                         
                                                                                
  CHRON9                     LENGTH=3                                           
  LABEL="Chronic condition indicator 9"                                         
                                                                                
  CHRON10                    LENGTH=3                                           
  LABEL="Chronic condition indicator 10"                                        
                                                                                
  CHRON11                    LENGTH=3                                           
  LABEL="Chronic condition indicator 11"                                        
                                                                                
  CHRON12                    LENGTH=3                                           
  LABEL="Chronic condition indicator 12"                                        
                                                                                
  CHRON13                    LENGTH=3                                           
  LABEL="Chronic condition indicator 13"                                        
                                                                                
  CHRON14                    LENGTH=3                                           
  LABEL="Chronic condition indicator 14"                                        
                                                                                
  CHRON15                    LENGTH=3                                           
  LABEL="Chronic condition indicator 15"                                        
                                                                                
  CHRON16                    LENGTH=3                                           
  LABEL="Chronic condition indicator 16"                                        
                                                                                
  CHRON17                    LENGTH=3                                           
  LABEL="Chronic condition indicator 17"                                        
                                                                                
  CHRON18                    LENGTH=3                                           
  LABEL="Chronic condition indicator 18"                                        
                                                                                
  CHRON19                    LENGTH=3                                           
  LABEL="Chronic condition indicator 19"                                        
                                                                                
  CHRON20                    LENGTH=3                                           
  LABEL="Chronic condition indicator 20"                                        
                                                                                
  CHRON21                    LENGTH=3                                           
  LABEL="Chronic condition indicator 21"                                        
                                                                                
  CHRON22                    LENGTH=3                                           
  LABEL="Chronic condition indicator 22"                                        
                                                                                
  CHRON23                    LENGTH=3                                           
  LABEL="Chronic condition indicator 23"                                        
                                                                                
  CHRON24                    LENGTH=3                                           
  LABEL="Chronic condition indicator 24"                                        
                                                                                
  CHRON25                    LENGTH=3                                           
  LABEL="Chronic condition indicator 25"                                        
                                                                                
  CHRON26                    LENGTH=3                                           
  LABEL="Chronic condition indicator 26"                                        
                                                                                
  CHRON27                    LENGTH=3                                           
  LABEL="Chronic condition indicator 27"                                        
                                                                                
  CHRON28                    LENGTH=3                                           
  LABEL="Chronic condition indicator 28"                                        
                                                                                
  CHRON29                    LENGTH=3                                           
  LABEL="Chronic condition indicator 29"                                        
                                                                                
  CHRON30                    LENGTH=3                                           
  LABEL="Chronic condition indicator 30"                                        
                                                                                
  CHRON31                    LENGTH=3                                           
  LABEL="Chronic condition indicator 31"                                        
                                                                                
  CHRON32                    LENGTH=3                                           
  LABEL="Chronic condition indicator 32"                                        
                                                                                
  CHRON33                    LENGTH=3                                           
  LABEL="Chronic condition indicator 33"                                        
                                                                                
  CHRON34                    LENGTH=3                                           
  LABEL="Chronic condition indicator 34"                                        
                                                                                
  CHRON35                    LENGTH=3                                           
  LABEL="Chronic condition indicator 35"                                        
                                                                                
  CHRON36                    LENGTH=3                                           
  LABEL="Chronic condition indicator 36"                                        
                                                                                
  CHRON37                    LENGTH=3                                           
  LABEL="Chronic condition indicator 37"                                        
                                                                                
  CHRON38                    LENGTH=3                                           
  LABEL="Chronic condition indicator 38"                                        
                                                                                
  CHRON39                    LENGTH=3                                           
  LABEL="Chronic condition indicator 39"                                        
                                                                                
  CHRON40                    LENGTH=3                                           
  LABEL="Chronic condition indicator 40"                                        
                                                                                
  CHRON41                    LENGTH=3                                           
  LABEL="Chronic condition indicator 41"                                        
                                                                                
  CHRON42                    LENGTH=3                                           
  LABEL="Chronic condition indicator 42"                                        
                                                                                
  CHRON43                    LENGTH=3                                           
  LABEL="Chronic condition indicator 43"                                        
                                                                                
  CHRON44                    LENGTH=3                                           
  LABEL="Chronic condition indicator 44"                                        
                                                                                
  CHRON45                    LENGTH=3                                           
  LABEL="Chronic condition indicator 45"                                        
                                                                                
  CHRON46                    LENGTH=3                                           
  LABEL="Chronic condition indicator 46"                                        
                                                                                
  CHRON47                    LENGTH=3                                           
  LABEL="Chronic condition indicator 47"                                        
                                                                                
  CHRON48                    LENGTH=3                                           
  LABEL="Chronic condition indicator 48"                                        
                                                                                
  CHRON49                    LENGTH=3                                           
  LABEL="Chronic condition indicator 49"                                        
                                                                                
  CHRON50                    LENGTH=3                                           
  LABEL="Chronic condition indicator 50"                                        
                                                                                
  CHRON51                    LENGTH=3                                           
  LABEL="Chronic condition indicator 51"                                        
                                                                                
  CHRON52                    LENGTH=3                                           
  LABEL="Chronic condition indicator 52"                                        
                                                                                
  CHRON53                    LENGTH=3                                           
  LABEL="Chronic condition indicator 53"                                        
                                                                                
  CHRON54                    LENGTH=3                                           
  LABEL="Chronic condition indicator 54"                                        
                                                                                
  CHRON55                    LENGTH=3                                           
  LABEL="Chronic condition indicator 55"                                        
                                                                                
  CHRON56                    LENGTH=3                                           
  LABEL="Chronic condition indicator 56"                                        
                                                                                
  CHRON57                    LENGTH=3                                           
  LABEL="Chronic condition indicator 57"                                        
                                                                                
  CHRON58                    LENGTH=3                                           
  LABEL="Chronic condition indicator 58"                                        
                                                                                
  CHRON59                    LENGTH=3                                           
  LABEL="Chronic condition indicator 59"                                        
                                                                                
  CHRON60                    LENGTH=3                                           
  LABEL="Chronic condition indicator 60"                                        
                                                                                
  CHRON61                    LENGTH=3                                           
  LABEL="Chronic condition indicator 61"                                        
                                                                                
  CHRON62                    LENGTH=3                                           
  LABEL="Chronic condition indicator 62"                                        
                                                                                
  CHRON63                    LENGTH=3                                           
  LABEL="Chronic condition indicator 63"                                        
                                                                                
  CHRON64                    LENGTH=3                                           
  LABEL="Chronic condition indicator 64"                                        
                                                                                
  CHRON65                    LENGTH=3                                           
  LABEL="Chronic condition indicator 65"                                        
                                                                                
  CHRON66                    LENGTH=3                                           
  LABEL="Chronic condition indicator 66"                                        
                                                                                
  CHRON67                    LENGTH=3                                           
  LABEL="Chronic condition indicator 67"                                        
                                                                                
  CHRON68                    LENGTH=3                                           
  LABEL="Chronic condition indicator 68"                                        
                                                                                
  CHRON69                    LENGTH=3                                           
  LABEL="Chronic condition indicator 69"                                        
                                                                                
  CHRON70                    LENGTH=3                                           
  LABEL="Chronic condition indicator 70"                                        
                                                                                
  CHRON71                    LENGTH=3                                           
  LABEL="Chronic condition indicator 71"                                        
                                                                                
  DXMCCS1                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 1"                                         
                                                                                
  DXMCCS2                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 2"                                         
                                                                                
  DXMCCS3                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 3"                                         
                                                                                
  DXMCCS4                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 4"                                         
                                                                                
  DXMCCS5                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 5"                                         
                                                                                
  DXMCCS6                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 6"                                         
                                                                                
  DXMCCS7                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 7"                                         
                                                                                
  DXMCCS8                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 8"                                         
                                                                                
  DXMCCS9                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 9"                                         
                                                                                
  DXMCCS10                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 10"                                        
                                                                                
  DXMCCS11                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 11"                                        
                                                                                
  DXMCCS12                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 12"                                        
                                                                                
  DXMCCS13                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 13"                                        
                                                                                
  DXMCCS14                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 14"                                        
                                                                                
  DXMCCS15                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 15"                                        
                                                                                
  DXMCCS16                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 16"                                        
                                                                                
  DXMCCS17                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 17"                                        
                                                                                
  DXMCCS18                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 18"                                        
                                                                                
  DXMCCS19                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 19"                                        
                                                                                
  DXMCCS20                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 20"                                        
                                                                                
  DXMCCS21                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 21"                                        
                                                                                
  DXMCCS22                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 22"                                        
                                                                                
  DXMCCS23                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 23"                                        
                                                                                
  DXMCCS24                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 24"                                        
                                                                                
  DXMCCS25                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 25"                                        
                                                                                
  DXMCCS26                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 26"                                        
                                                                                
  DXMCCS27                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 27"                                        
                                                                                
  DXMCCS28                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 28"                                        
                                                                                
  DXMCCS29                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 29"                                        
                                                                                
  DXMCCS30                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 30"                                        
                                                                                
  DXMCCS31                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 31"                                        
                                                                                
  DXMCCS32                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 32"                                        
                                                                                
  DXMCCS33                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 33"                                        
                                                                                
  DXMCCS34                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 34"                                        
                                                                                
  DXMCCS35                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 35"                                        
                                                                                
  DXMCCS36                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 36"                                        
                                                                                
  DXMCCS37                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 37"                                        
                                                                                
  DXMCCS38                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 38"                                        
                                                                                
  DXMCCS39                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 39"                                        
                                                                                
  DXMCCS40                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 40"                                        
                                                                                
  DXMCCS41                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 41"                                        
                                                                                
  DXMCCS42                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 42"                                        
                                                                                
  DXMCCS43                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 43"                                        
                                                                                
  DXMCCS44                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 44"                                        
                                                                                
  DXMCCS45                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 45"                                        
                                                                                
  DXMCCS46                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 46"                                        
                                                                                
  DXMCCS47                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 47"                                        
                                                                                
  DXMCCS48                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 48"                                        
                                                                                
  DXMCCS49                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 49"                                        
                                                                                
  DXMCCS50                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 50"                                        
                                                                                
  DXMCCS51                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 51"                                        
                                                                                
  DXMCCS52                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 52"                                        
                                                                                
  DXMCCS53                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 53"                                        
                                                                                
  DXMCCS54                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 54"                                        
                                                                                
  DXMCCS55                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 55"                                        
                                                                                
  DXMCCS56                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 56"                                        
                                                                                
  DXMCCS57                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 57"                                        
                                                                                
  DXMCCS58                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 58"                                        
                                                                                
  DXMCCS59                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 59"                                        
                                                                                
  DXMCCS60                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 60"                                        
                                                                                
  DXMCCS61                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 61"                                        
                                                                                
  DXMCCS62                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 62"                                        
                                                                                
  DXMCCS63                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 63"                                        
                                                                                
  DXMCCS64                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 64"                                        
                                                                                
  DXMCCS65                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 65"                                        
                                                                                
  DXMCCS66                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 66"                                        
                                                                                
  DXMCCS67                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 67"                                        
                                                                                
  DXMCCS68                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 68"                                        
                                                                                
  DXMCCS69                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 69"                                        
                                                                                
  DXMCCS70                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 70"                                        
                                                                                
  DXMCCS71                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  Diagnosis 71"                                        
                                                                                
  E_MCCS1                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 1"                                            
                                                                                
  E_MCCS2                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 2"                                            
                                                                                
  E_MCCS3                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 3"                                            
                                                                                
  E_MCCS4                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 4"                                            
                                                                                
  E_MCCS5                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 5"                                            
                                                                                
  E_MCCS6                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 6"                                            
                                                                                
  E_MCCS7                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 7"                                            
                                                                                
  E_MCCS8                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 8"                                            
                                                                                
  E_MCCS9                    LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 9"                                            
                                                                                
  E_MCCS10                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 10"                                           
                                                                                
  E_MCCS11                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 11"                                           
                                                                                
  E_MCCS12                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 12"                                           
                                                                                
  E_MCCS13                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 13"                                           
                                                                                
  E_MCCS14                   LENGTH=$11                                         
  LABEL="Multi-Level CCS:  E Code 14"                                           
                                                                                
  INJURY                     LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Injury diagnosis reported on record (1:DX1 is an injury; 2:DX2+ is an injury; 0
:No injury)"                                                                    
                                                                                
  INJURY_CUT                 LENGTH=3                                           
  LABEL="Injury by cutting or piercing (by E codes)"                            
                                                                                
  INJURY_DROWN               LENGTH=3                                           
  LABEL="Injury by drowning or submersion (by E codes)"                         
                                                                                
  INJURY_FALL                LENGTH=3                                           
  LABEL="Injury by falling (by E codes)"                                        
                                                                                
  INJURY_FIRE                LENGTH=3                                           
  LABEL="Injury by fire, flame or hot object (by E codes)"                      
                                                                                
  INJURY_FIREARM             LENGTH=3                                           
  LABEL="Injury by firearm (by E codes)"                                        
                                                                                
  INJURY_MACHINERY           LENGTH=3                                           
  LABEL="Injury by machinery (by E codes)"                                      
                                                                                
  INJURY_MVT                 LENGTH=3                                           
  LABEL="Injury involving motor vehicle traffic (by E codes)"                   
                                                                                
  INJURY_NATURE              LENGTH=3                                           
  LABEL="Injury involving nature or environmental factors (by E codes)"         
                                                                                
  INJURY_POISON              LENGTH=3                                           
  LABEL="Injury by poison (by E codes)"                                         
                                                                                
  INJURY_STRUCK              LENGTH=3                                           
  LABEL="Injury from being struck by or against (by E codes)"                   
                                                                                
  INJURY_SUFFOCATION         LENGTH=3                                           
  LABEL="Injury by suffocation (by E codes)"                                    
                                                                                
  INTENT_ASSAULT             LENGTH=3                                           
  LABEL="Injury by assault indicated on the record (by E codes)"                
                                                                                
  INTENT_SELF_HARM           LENGTH=3                                           
  LABEL=                                                                        
  "Intentional self harm indicated on the record (by diagnosis and/or E codes)" 
                                                                                
  INTENT_UNINTENTIONAL       LENGTH=3                                           
  LABEL="Unintentional injury indicated on the record (by E codes)"             
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  MULTINJURY                 LENGTH=3                                           
  LABEL="More than one injury diagnosis reported on record"                     
                                                                                
  PCLASS1                    LENGTH=3                                           
  LABEL="Procedure class 1"                                                     
                                                                                
  PCLASS2                    LENGTH=3                                           
  LABEL="Procedure class 2"                                                     
                                                                                
  PCLASS3                    LENGTH=3                                           
  LABEL="Procedure class 3"                                                     
                                                                                
  PCLASS4                    LENGTH=3                                           
  LABEL="Procedure class 4"                                                     
                                                                                
  PCLASS5                    LENGTH=3                                           
  LABEL="Procedure class 5"                                                     
                                                                                
  PCLASS6                    LENGTH=3                                           
  LABEL="Procedure class 6"                                                     
                                                                                
  PCLASS7                    LENGTH=3                                           
  LABEL="Procedure class 7"                                                     
                                                                                
  PCLASS8                    LENGTH=3                                           
  LABEL="Procedure class 8"                                                     
                                                                                
  PCLASS9                    LENGTH=3                                           
  LABEL="Procedure class 9"                                                     
                                                                                
  PCLASS10                   LENGTH=3                                           
  LABEL="Procedure class 10"                                                    
                                                                                
  PCLASS11                   LENGTH=3                                           
  LABEL="Procedure class 11"                                                    
                                                                                
  PCLASS12                   LENGTH=3                                           
  LABEL="Procedure class 12"                                                    
                                                                                
  PCLASS13                   LENGTH=3                                           
  LABEL="Procedure class 13"                                                    
                                                                                
  PCLASS14                   LENGTH=3                                           
  LABEL="Procedure class 14"                                                    
                                                                                
  PCLASS15                   LENGTH=3                                           
  LABEL="Procedure class 15"                                                    
                                                                                
  PCLASS16                   LENGTH=3                                           
  LABEL="Procedure class 16"                                                    
                                                                                
  PCLASS17                   LENGTH=3                                           
  LABEL="Procedure class 17"                                                    
                                                                                
  PCLASS18                   LENGTH=3                                           
  LABEL="Procedure class 18"                                                    
                                                                                
  PCLASS19                   LENGTH=3                                           
  LABEL="Procedure class 19"                                                    
                                                                                
  PCLASS20                   LENGTH=3                                           
  LABEL="Procedure class 20"                                                    
                                                                                
  PCLASS21                   LENGTH=3                                           
  LABEL="Procedure class 21"                                                    
                                                                                
  PCLASS22                   LENGTH=3                                           
  LABEL="Procedure class 22"                                                    
                                                                                
  PCLASS23                   LENGTH=3                                           
  LABEL="Procedure class 23"                                                    
                                                                                
  PCLASS24                   LENGTH=3                                           
  LABEL="Procedure class 24"                                                    
                                                                                
  PCLASS25                   LENGTH=3                                           
  LABEL="Procedure class 25"                                                    
                                                                                
  PCLASS26                   LENGTH=3                                           
  LABEL="Procedure class 26"                                                    
                                                                                
  PCLASS27                   LENGTH=3                                           
  LABEL="Procedure class 27"                                                    
                                                                                
  PCLASS28                   LENGTH=3                                           
  LABEL="Procedure class 28"                                                    
                                                                                
  PCLASS29                   LENGTH=3                                           
  LABEL="Procedure class 29"                                                    
                                                                                
  PCLASS30                   LENGTH=3                                           
  LABEL="Procedure class 30"                                                    
                                                                                
  PCLASS31                   LENGTH=3                                           
  LABEL="Procedure class 31"                                                    
                                                                                
  PCLASS32                   LENGTH=3                                           
  LABEL="Procedure class 32"                                                    
                                                                                
  PCLASS33                   LENGTH=3                                           
  LABEL="Procedure class 33"                                                    
                                                                                
  PCLASS34                   LENGTH=3                                           
  LABEL="Procedure class 34"                                                    
                                                                                
  PCLASS35                   LENGTH=3                                           
  LABEL="Procedure class 35"                                                    
                                                                                
  PCLASS36                   LENGTH=3                                           
  LABEL="Procedure class 36"                                                    
                                                                                
  PCLASS37                   LENGTH=3                                           
  LABEL="Procedure class 37"                                                    
                                                                                
  PCLASS38                   LENGTH=3                                           
  LABEL="Procedure class 38"                                                    
                                                                                
  PCLASS39                   LENGTH=3                                           
  LABEL="Procedure class 39"                                                    
                                                                                
  PCLASS40                   LENGTH=3                                           
  LABEL="Procedure class 40"                                                    
                                                                                
  PCLASS41                   LENGTH=3                                           
  LABEL="Procedure class 41"                                                    
                                                                                
  PCLASS42                   LENGTH=3                                           
  LABEL="Procedure class 42"                                                    
                                                                                
  PCLASS43                   LENGTH=3                                           
  LABEL="Procedure class 43"                                                    
                                                                                
  PCLASS44                   LENGTH=3                                           
  LABEL="Procedure class 44"                                                    
                                                                                
  PCLASS45                   LENGTH=3                                           
  LABEL="Procedure class 45"                                                    
                                                                                
  PCLASS46                   LENGTH=3                                           
  LABEL="Procedure class 46"                                                    
                                                                                
  PCLASS47                   LENGTH=3                                           
  LABEL="Procedure class 47"                                                    
                                                                                
  PCLASS48                   LENGTH=3                                           
  LABEL="Procedure class 48"                                                    
                                                                                
  PCLASS49                   LENGTH=3                                           
  LABEL="Procedure class 49"                                                    
                                                                                
  PCLASS50                   LENGTH=3                                           
  LABEL="Procedure class 50"                                                    
                                                                                
  PCLASS51                   LENGTH=3                                           
  LABEL="Procedure class 51"                                                    
                                                                                
  PCLASS52                   LENGTH=3                                           
  LABEL="Procedure class 52"                                                    
                                                                                
  PCLASS53                   LENGTH=3                                           
  LABEL="Procedure class 53"                                                    
                                                                                
  PCLASS54                   LENGTH=3                                           
  LABEL="Procedure class 54"                                                    
                                                                                
  PCLASS55                   LENGTH=3                                           
  LABEL="Procedure class 55"                                                    
                                                                                
  PCLASS56                   LENGTH=3                                           
  LABEL="Procedure class 56"                                                    
                                                                                
  PCLASS57                   LENGTH=3                                           
  LABEL="Procedure class 57"                                                    
                                                                                
  PCLASS58                   LENGTH=3                                           
  LABEL="Procedure class 58"                                                    
                                                                                
  PCLASS59                   LENGTH=3                                           
  LABEL="Procedure class 59"                                                    
                                                                                
  PCLASS60                   LENGTH=3                                           
  LABEL="Procedure class 60"                                                    
                                                                                
  PCLASS61                   LENGTH=3                                           
  LABEL="Procedure class 61"                                                    
                                                                                
  PCLASS62                   LENGTH=3                                           
  LABEL="Procedure class 62"                                                    
                                                                                
  PCLASS63                   LENGTH=3                                           
  LABEL="Procedure class 63"                                                    
                                                                                
  PCLASS64                   LENGTH=3                                           
  LABEL="Procedure class 64"                                                    
                                                                                
  PCLASS65                   LENGTH=3                                           
  LABEL="Procedure class 65"                                                    
                                                                                
  PCLASS66                   LENGTH=3                                           
  LABEL="Procedure class 66"                                                    
                                                                                
  PRMCCS1                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 1"                                         
                                                                                
  PRMCCS2                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 2"                                         
                                                                                
  PRMCCS3                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 3"                                         
                                                                                
  PRMCCS4                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 4"                                         
                                                                                
  PRMCCS5                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 5"                                         
                                                                                
  PRMCCS6                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 6"                                         
                                                                                
  PRMCCS7                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 7"                                         
                                                                                
  PRMCCS8                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 8"                                         
                                                                                
  PRMCCS9                    LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 9"                                         
                                                                                
  PRMCCS10                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 10"                                        
                                                                                
  PRMCCS11                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 11"                                        
                                                                                
  PRMCCS12                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 12"                                        
                                                                                
  PRMCCS13                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 13"                                        
                                                                                
  PRMCCS14                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 14"                                        
                                                                                
  PRMCCS15                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 15"                                        
                                                                                
  PRMCCS16                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 16"                                        
                                                                                
  PRMCCS17                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 17"                                        
                                                                                
  PRMCCS18                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 18"                                        
                                                                                
  PRMCCS19                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 19"                                        
                                                                                
  PRMCCS20                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 20"                                        
                                                                                
  PRMCCS21                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 21"                                        
                                                                                
  PRMCCS22                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 22"                                        
                                                                                
  PRMCCS23                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 23"                                        
                                                                                
  PRMCCS24                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 24"                                        
                                                                                
  PRMCCS25                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 25"                                        
                                                                                
  PRMCCS26                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 26"                                        
                                                                                
  PRMCCS27                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 27"                                        
                                                                                
  PRMCCS28                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 28"                                        
                                                                                
  PRMCCS29                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 29"                                        
                                                                                
  PRMCCS30                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 30"                                        
                                                                                
  PRMCCS31                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 31"                                        
                                                                                
  PRMCCS32                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 32"                                        
                                                                                
  PRMCCS33                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 33"                                        
                                                                                
  PRMCCS34                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 34"                                        
                                                                                
  PRMCCS35                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 35"                                        
                                                                                
  PRMCCS36                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 36"                                        
                                                                                
  PRMCCS37                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 37"                                        
                                                                                
  PRMCCS38                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 38"                                        
                                                                                
  PRMCCS39                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 39"                                        
                                                                                
  PRMCCS40                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 40"                                        
                                                                                
  PRMCCS41                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 41"                                        
                                                                                
  PRMCCS42                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 42"                                        
                                                                                
  PRMCCS43                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 43"                                        
                                                                                
  PRMCCS44                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 44"                                        
                                                                                
  PRMCCS45                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 45"                                        
                                                                                
  PRMCCS46                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 46"                                        
                                                                                
  PRMCCS47                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 47"                                        
                                                                                
  PRMCCS48                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 48"                                        
                                                                                
  PRMCCS49                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 49"                                        
                                                                                
  PRMCCS50                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 50"                                        
                                                                                
  PRMCCS51                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 51"                                        
                                                                                
  PRMCCS52                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 52"                                        
                                                                                
  PRMCCS53                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 53"                                        
                                                                                
  PRMCCS54                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 54"                                        
                                                                                
  PRMCCS55                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 55"                                        
                                                                                
  PRMCCS56                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 56"                                        
                                                                                
  PRMCCS57                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 57"                                        
                                                                                
  PRMCCS58                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 58"                                        
                                                                                
  PRMCCS59                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 59"                                        
                                                                                
  PRMCCS60                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 60"                                        
                                                                                
  PRMCCS61                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 61"                                        
                                                                                
  PRMCCS62                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 62"                                        
                                                                                
  PRMCCS63                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 63"                                        
                                                                                
  PRMCCS64                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 64"                                        
                                                                                
  PRMCCS65                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 65"                                        
                                                                                
  PRMCCS66                   LENGTH=$8                                          
  LABEL="Multi-Level CCS:  Procedure 66"                                        
                                                                                
  U_BLOOD                    LENGTH=3                                           
  LABEL="Utilization Flag: Blood"                                               
                                                                                
  U_CATH                     LENGTH=3                                           
  LABEL="Utilization Flag: Cardiac Catheterization Lab"                         
                                                                                
  U_CCU                      LENGTH=3                                           
  LABEL="Utilization Flag: Coronary Care Unit (CCU)"                            
                                                                                
  U_CHESTXRAY                LENGTH=3                                           
  LABEL="Utilization Flag: Chest X-Ray"                                         
                                                                                
  U_CTSCAN                   LENGTH=3                                           
  LABEL="Utilization Flag: Computed Tomography Scan"                            
                                                                                
  U_DIALYSIS                 LENGTH=3                                           
  LABEL="Utilization Flag: Renal Dialysis"                                      
                                                                                
  U_ECHO                     LENGTH=3                                           
  LABEL="Utilization Flag: Echocardiology"                                      
                                                                                
  U_ED                       LENGTH=3                                           
  LABEL="Utilization Flag: Emergency Room"                                      
                                                                                
  U_EEG                      LENGTH=3                                           
  LABEL="Utilization Flag: Electroencephalogram"                                
                                                                                
  U_EKG                      LENGTH=3                                           
  LABEL="Utilization Flag: Electrocardiogram"                                   
                                                                                
  U_EPO                      LENGTH=3                                           
  LABEL="Utilization Flag: EPO"                                                 
                                                                                
  U_ICU                      LENGTH=3                                           
  LABEL="Utilization Flag: Intensive Care Unit (ICU)"                           
                                                                                
  U_LITHOTRIPSY              LENGTH=3                                           
  LABEL="Utilization Flag: Lithotripsy"                                         
                                                                                
  U_MHSA                     LENGTH=3                                           
  LABEL="Utilization Flag: Mental Health and Substance Abuse"                   
                                                                                
  U_MRT                      LENGTH=3                                           
  LABEL="Utilization Flag: Magnetic Resonance Technology"                       
                                                                                
  U_NEWBN2L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level II"                                    
                                                                                
  U_NEWBN3L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level III"                                   
                                                                                
  U_NEWBN4L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level IV"                                    
                                                                                
  U_NUCMED                   LENGTH=3                                           
  LABEL="Utilization Flag: Nuclear Medicine"                                    
                                                                                
  U_OBSERVATION              LENGTH=3                                           
  LABEL="Utilization Flag: Observation Room"                                    
                                                                                
  U_OCCTHERAPY               LENGTH=3                                           
  LABEL="Utilization Flag: Occupational Therapy"                                
                                                                                
  U_ORGANACQ                 LENGTH=3                                           
  LABEL="Utilization Flag: Organ Acquisition"                                   
                                                                                
  U_OTHIMPLANTS              LENGTH=3                                           
  LABEL="Utilization Flag: Other Implants"                                      
                                                                                
  U_PACEMAKER                LENGTH=3                                           
  LABEL="Utilization Flag: Pacemaker"                                           
                                                                                
  U_PHYTHERAPY               LENGTH=3                                           
  LABEL="Utilization Flag: Physical Therapy"                                    
                                                                                
  U_RADTHERAPY               LENGTH=3                                           
  LABEL=                                                                        
  "Utilization Flag: Radiology - Therapeutic and/or Chemotherapy Administration"
                                                                                
  U_RESPTHERAPY              LENGTH=3                                           
  LABEL="Utilization Flag: Respiratory Services"                                
                                                                                
  U_SPEECHTHERAPY            LENGTH=3                                           
  LABEL="Utilization Flag: Speech - Language Pathology"                         
                                                                                
  U_STRESS                   LENGTH=3                                           
  LABEL="Utilization Flag: Cardiac Stress Test"                                 
                                                                                
  U_ULTRASOUND               LENGTH=3                                           
  LABEL="Utilization Flag: Ultrasound"                                          
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      BODYSYSTEM1                   N2PF.                               
      @3      BODYSYSTEM2                   N2PF.                               
      @5      BODYSYSTEM3                   N2PF.                               
      @7      BODYSYSTEM4                   N2PF.                               
      @9      BODYSYSTEM5                   N2PF.                               
      @11     BODYSYSTEM6                   N2PF.                               
      @13     BODYSYSTEM7                   N2PF.                               
      @15     BODYSYSTEM8                   N2PF.                               
      @17     BODYSYSTEM9                   N2PF.                               
      @19     BODYSYSTEM10                  N2PF.                               
      @21     BODYSYSTEM11                  N2PF.                               
      @23     BODYSYSTEM12                  N2PF.                               
      @25     BODYSYSTEM13                  N2PF.                               
      @27     BODYSYSTEM14                  N2PF.                               
      @29     BODYSYSTEM15                  N2PF.                               
      @31     BODYSYSTEM16                  N2PF.                               
      @33     BODYSYSTEM17                  N2PF.                               
      @35     BODYSYSTEM18                  N2PF.                               
      @37     BODYSYSTEM19                  N2PF.                               
      @39     BODYSYSTEM20                  N2PF.                               
      @41     BODYSYSTEM21                  N2PF.                               
      @43     BODYSYSTEM22                  N2PF.                               
      @45     BODYSYSTEM23                  N2PF.                               
      @47     BODYSYSTEM24                  N2PF.                               
      @49     BODYSYSTEM25                  N2PF.                               
      @51     BODYSYSTEM26                  N2PF.                               
      @53     BODYSYSTEM27                  N2PF.                               
      @55     BODYSYSTEM28                  N2PF.                               
      @57     BODYSYSTEM29                  N2PF.                               
      @59     BODYSYSTEM30                  N2PF.                               
      @61     BODYSYSTEM31                  N2PF.                               
      @63     BODYSYSTEM32                  N2PF.                               
      @65     BODYSYSTEM33                  N2PF.                               
      @67     BODYSYSTEM34                  N2PF.                               
      @69     BODYSYSTEM35                  N2PF.                               
      @71     BODYSYSTEM36                  N2PF.                               
      @73     BODYSYSTEM37                  N2PF.                               
      @75     BODYSYSTEM38                  N2PF.                               
      @77     BODYSYSTEM39                  N2PF.                               
      @79     BODYSYSTEM40                  N2PF.                               
      @81     BODYSYSTEM41                  N2PF.                               
      @83     BODYSYSTEM42                  N2PF.                               
      @85     BODYSYSTEM43                  N2PF.                               
      @87     BODYSYSTEM44                  N2PF.                               
      @89     BODYSYSTEM45                  N2PF.                               
      @91     BODYSYSTEM46                  N2PF.                               
      @93     BODYSYSTEM47                  N2PF.                               
      @95     BODYSYSTEM48                  N2PF.                               
      @97     BODYSYSTEM49                  N2PF.                               
      @99     BODYSYSTEM50                  N2PF.                               
      @101    BODYSYSTEM51                  N2PF.                               
      @103    BODYSYSTEM52                  N2PF.                               
      @105    BODYSYSTEM53                  N2PF.                               
      @107    BODYSYSTEM54                  N2PF.                               
      @109    BODYSYSTEM55                  N2PF.                               
      @111    BODYSYSTEM56                  N2PF.                               
      @113    BODYSYSTEM57                  N2PF.                               
      @115    BODYSYSTEM58                  N2PF.                               
      @117    BODYSYSTEM59                  N2PF.                               
      @119    BODYSYSTEM60                  N2PF.                               
      @121    BODYSYSTEM61                  N2PF.                               
      @123    BODYSYSTEM62                  N2PF.                               
      @125    BODYSYSTEM63                  N2PF.                               
      @127    BODYSYSTEM64                  N2PF.                               
      @129    BODYSYSTEM65                  N2PF.                               
      @131    BODYSYSTEM66                  N2PF.                               
      @133    BODYSYSTEM67                  N2PF.                               
      @135    BODYSYSTEM68                  N2PF.                               
      @137    BODYSYSTEM69                  N2PF.                               
      @139    BODYSYSTEM70                  N2PF.                               
      @141    BODYSYSTEM71                  N2PF.                               
      @143    CHRON1                        N2PF.                               
      @145    CHRON2                        N2PF.                               
      @147    CHRON3                        N2PF.                               
      @149    CHRON4                        N2PF.                               
      @151    CHRON5                        N2PF.                               
      @153    CHRON6                        N2PF.                               
      @155    CHRON7                        N2PF.                               
      @157    CHRON8                        N2PF.                               
      @159    CHRON9                        N2PF.                               
      @161    CHRON10                       N2PF.                               
      @163    CHRON11                       N2PF.                               
      @165    CHRON12                       N2PF.                               
      @167    CHRON13                       N2PF.                               
      @169    CHRON14                       N2PF.                               
      @171    CHRON15                       N2PF.                               
      @173    CHRON16                       N2PF.                               
      @175    CHRON17                       N2PF.                               
      @177    CHRON18                       N2PF.                               
      @179    CHRON19                       N2PF.                               
      @181    CHRON20                       N2PF.                               
      @183    CHRON21                       N2PF.                               
      @185    CHRON22                       N2PF.                               
      @187    CHRON23                       N2PF.                               
      @189    CHRON24                       N2PF.                               
      @191    CHRON25                       N2PF.                               
      @193    CHRON26                       N2PF.                               
      @195    CHRON27                       N2PF.                               
      @197    CHRON28                       N2PF.                               
      @199    CHRON29                       N2PF.                               
      @201    CHRON30                       N2PF.                               
      @203    CHRON31                       N2PF.                               
      @205    CHRON32                       N2PF.                               
      @207    CHRON33                       N2PF.                               
      @209    CHRON34                       N2PF.                               
      @211    CHRON35                       N2PF.                               
      @213    CHRON36                       N2PF.                               
      @215    CHRON37                       N2PF.                               
      @217    CHRON38                       N2PF.                               
      @219    CHRON39                       N2PF.                               
      @221    CHRON40                       N2PF.                               
      @223    CHRON41                       N2PF.                               
      @225    CHRON42                       N2PF.                               
      @227    CHRON43                       N2PF.                               
      @229    CHRON44                       N2PF.                               
      @231    CHRON45                       N2PF.                               
      @233    CHRON46                       N2PF.                               
      @235    CHRON47                       N2PF.                               
      @237    CHRON48                       N2PF.                               
      @239    CHRON49                       N2PF.                               
      @241    CHRON50                       N2PF.                               
      @243    CHRON51                       N2PF.                               
      @245    CHRON52                       N2PF.                               
      @247    CHRON53                       N2PF.                               
      @249    CHRON54                       N2PF.                               
      @251    CHRON55                       N2PF.                               
      @253    CHRON56                       N2PF.                               
      @255    CHRON57                       N2PF.                               
      @257    CHRON58                       N2PF.                               
      @259    CHRON59                       N2PF.                               
      @261    CHRON60                       N2PF.                               
      @263    CHRON61                       N2PF.                               
      @265    CHRON62                       N2PF.                               
      @267    CHRON63                       N2PF.                               
      @269    CHRON64                       N2PF.                               
      @271    CHRON65                       N2PF.                               
      @273    CHRON66                       N2PF.                               
      @275    CHRON67                       N2PF.                               
      @277    CHRON68                       N2PF.                               
      @279    CHRON69                       N2PF.                               
      @281    CHRON70                       N2PF.                               
      @283    CHRON71                       N2PF.                               
      @285    DXMCCS1                       $CHAR11.                            
      @296    DXMCCS2                       $CHAR11.                            
      @307    DXMCCS3                       $CHAR11.                            
      @318    DXMCCS4                       $CHAR11.                            
      @329    DXMCCS5                       $CHAR11.                            
      @340    DXMCCS6                       $CHAR11.                            
      @351    DXMCCS7                       $CHAR11.                            
      @362    DXMCCS8                       $CHAR11.                            
      @373    DXMCCS9                       $CHAR11.                            
      @384    DXMCCS10                      $CHAR11.                            
      @395    DXMCCS11                      $CHAR11.                            
      @406    DXMCCS12                      $CHAR11.                            
      @417    DXMCCS13                      $CHAR11.                            
      @428    DXMCCS14                      $CHAR11.                            
      @439    DXMCCS15                      $CHAR11.                            
      @450    DXMCCS16                      $CHAR11.                            
      @461    DXMCCS17                      $CHAR11.                            
      @472    DXMCCS18                      $CHAR11.                            
      @483    DXMCCS19                      $CHAR11.                            
      @494    DXMCCS20                      $CHAR11.                            
      @505    DXMCCS21                      $CHAR11.                            
      @516    DXMCCS22                      $CHAR11.                            
      @527    DXMCCS23                      $CHAR11.                            
      @538    DXMCCS24                      $CHAR11.                            
      @549    DXMCCS25                      $CHAR11.                            
      @560    DXMCCS26                      $CHAR11.                            
      @571    DXMCCS27                      $CHAR11.                            
      @582    DXMCCS28                      $CHAR11.                            
      @593    DXMCCS29                      $CHAR11.                            
      @604    DXMCCS30                      $CHAR11.                            
      @615    DXMCCS31                      $CHAR11.                            
      @626    DXMCCS32                      $CHAR11.                            
      @637    DXMCCS33                      $CHAR11.                            
      @648    DXMCCS34                      $CHAR11.                            
      @659    DXMCCS35                      $CHAR11.                            
      @670    DXMCCS36                      $CHAR11.                            
      @681    DXMCCS37                      $CHAR11.                            
      @692    DXMCCS38                      $CHAR11.                            
      @703    DXMCCS39                      $CHAR11.                            
      @714    DXMCCS40                      $CHAR11.                            
      @725    DXMCCS41                      $CHAR11.                            
      @736    DXMCCS42                      $CHAR11.                            
      @747    DXMCCS43                      $CHAR11.                            
      @758    DXMCCS44                      $CHAR11.                            
      @769    DXMCCS45                      $CHAR11.                            
      @780    DXMCCS46                      $CHAR11.                            
      @791    DXMCCS47                      $CHAR11.                            
      @802    DXMCCS48                      $CHAR11.                            
      @813    DXMCCS49                      $CHAR11.                            
      @824    DXMCCS50                      $CHAR11.                            
      @835    DXMCCS51                      $CHAR11.                            
      @846    DXMCCS52                      $CHAR11.                            
      @857    DXMCCS53                      $CHAR11.                            
      @868    DXMCCS54                      $CHAR11.                            
      @879    DXMCCS55                      $CHAR11.                            
      @890    DXMCCS56                      $CHAR11.                            
      @901    DXMCCS57                      $CHAR11.                            
      @912    DXMCCS58                      $CHAR11.                            
      @923    DXMCCS59                      $CHAR11.                            
      @934    DXMCCS60                      $CHAR11.                            
      @945    DXMCCS61                      $CHAR11.                            
      @956    DXMCCS62                      $CHAR11.                            
      @967    DXMCCS63                      $CHAR11.                            
      @978    DXMCCS64                      $CHAR11.                            
      @989    DXMCCS65                      $CHAR11.                            
      @1000   DXMCCS66                      $CHAR11.                            
      @1011   DXMCCS67                      $CHAR11.                            
      @1022   DXMCCS68                      $CHAR11.                            
      @1033   DXMCCS69                      $CHAR11.                            
      @1044   DXMCCS70                      $CHAR11.                            
      @1055   DXMCCS71                      $CHAR11.                            
      @1066   E_MCCS1                       $CHAR11.                            
      @1077   E_MCCS2                       $CHAR11.                            
      @1088   E_MCCS3                       $CHAR11.                            
      @1099   E_MCCS4                       $CHAR11.                            
      @1110   E_MCCS5                       $CHAR11.                            
      @1121   E_MCCS6                       $CHAR11.                            
      @1132   E_MCCS7                       $CHAR11.                            
      @1143   E_MCCS8                       $CHAR11.                            
      @1154   E_MCCS9                       $CHAR11.                            
      @1165   E_MCCS10                      $CHAR11.                            
      @1176   E_MCCS11                      $CHAR11.                            
      @1187   E_MCCS12                      $CHAR11.                            
      @1198   E_MCCS13                      $CHAR11.                            
      @1209   E_MCCS14                      $CHAR11.                            
      @1220   INJURY                        N2PF.                               
      @1222   INJURY_CUT                    N2PF.                               
      @1224   INJURY_DROWN                  N2PF.                               
      @1226   INJURY_FALL                   N2PF.                               
      @1228   INJURY_FIRE                   N2PF.                               
      @1230   INJURY_FIREARM                N2PF.                               
      @1232   INJURY_MACHINERY              N2PF.                               
      @1234   INJURY_MVT                    N2PF.                               
      @1236   INJURY_NATURE                 N2PF.                               
      @1238   INJURY_POISON                 N2PF.                               
      @1240   INJURY_STRUCK                 N2PF.                               
      @1242   INJURY_SUFFOCATION            N2PF.                               
      @1244   INTENT_ASSAULT                N2PF.                               
      @1246   INTENT_SELF_HARM              N2PF.                               
      @1248   INTENT_UNINTENTIONAL          N2PF.                               
      @1250   KEY                           15.                                 
      @1265   MULTINJURY                    N2PF.                               
      @1267   PCLASS1                       N2PF.                               
      @1269   PCLASS2                       N2PF.                               
      @1271   PCLASS3                       N2PF.                               
      @1273   PCLASS4                       N2PF.                               
      @1275   PCLASS5                       N2PF.                               
      @1277   PCLASS6                       N2PF.                               
      @1279   PCLASS7                       N2PF.                               
      @1281   PCLASS8                       N2PF.                               
      @1283   PCLASS9                       N2PF.                               
      @1285   PCLASS10                      N2PF.                               
      @1287   PCLASS11                      N2PF.                               
      @1289   PCLASS12                      N2PF.                               
      @1291   PCLASS13                      N2PF.                               
      @1293   PCLASS14                      N2PF.                               
      @1295   PCLASS15                      N2PF.                               
      @1297   PCLASS16                      N2PF.                               
      @1299   PCLASS17                      N2PF.                               
      @1301   PCLASS18                      N2PF.                               
      @1303   PCLASS19                      N2PF.                               
      @1305   PCLASS20                      N2PF.                               
      @1307   PCLASS21                      N2PF.                               
      @1309   PCLASS22                      N2PF.                               
      @1311   PCLASS23                      N2PF.                               
      @1313   PCLASS24                      N2PF.                               
      @1315   PCLASS25                      N2PF.                               
      @1317   PCLASS26                      N2PF.                               
      @1319   PCLASS27                      N2PF.                               
      @1321   PCLASS28                      N2PF.                               
      @1323   PCLASS29                      N2PF.                               
      @1325   PCLASS30                      N2PF.                               
      @1327   PCLASS31                      N2PF.                               
      @1329   PCLASS32                      N2PF.                               
      @1331   PCLASS33                      N2PF.                               
      @1333   PCLASS34                      N2PF.                               
      @1335   PCLASS35                      N2PF.                               
      @1337   PCLASS36                      N2PF.                               
      @1339   PCLASS37                      N2PF.                               
      @1341   PCLASS38                      N2PF.                               
      @1343   PCLASS39                      N2PF.                               
      @1345   PCLASS40                      N2PF.                               
      @1347   PCLASS41                      N2PF.                               
      @1349   PCLASS42                      N2PF.                               
      @1351   PCLASS43                      N2PF.                               
      @1353   PCLASS44                      N2PF.                               
      @1355   PCLASS45                      N2PF.                               
      @1357   PCLASS46                      N2PF.                               
      @1359   PCLASS47                      N2PF.                               
      @1361   PCLASS48                      N2PF.                               
      @1363   PCLASS49                      N2PF.                               
      @1365   PCLASS50                      N2PF.                               
      @1367   PCLASS51                      N2PF.                               
      @1369   PCLASS52                      N2PF.                               
      @1371   PCLASS53                      N2PF.                               
      @1373   PCLASS54                      N2PF.                               
      @1375   PCLASS55                      N2PF.                               
      @1377   PCLASS56                      N2PF.                               
      @1379   PCLASS57                      N2PF.                               
      @1381   PCLASS58                      N2PF.                               
      @1383   PCLASS59                      N2PF.                               
      @1385   PCLASS60                      N2PF.                               
      @1387   PCLASS61                      N2PF.                               
      @1389   PCLASS62                      N2PF.                               
      @1391   PCLASS63                      N2PF.                               
      @1393   PCLASS64                      N2PF.                               
      @1395   PCLASS65                      N2PF.                               
      @1397   PCLASS66                      N2PF.                               
      @1399   PRMCCS1                       $CHAR8.                             
      @1407   PRMCCS2                       $CHAR8.                             
      @1415   PRMCCS3                       $CHAR8.                             
      @1423   PRMCCS4                       $CHAR8.                             
      @1431   PRMCCS5                       $CHAR8.                             
      @1439   PRMCCS6                       $CHAR8.                             
      @1447   PRMCCS7                       $CHAR8.                             
      @1455   PRMCCS8                       $CHAR8.                             
      @1463   PRMCCS9                       $CHAR8.                             
      @1471   PRMCCS10                      $CHAR8.                             
      @1479   PRMCCS11                      $CHAR8.                             
      @1487   PRMCCS12                      $CHAR8.                             
      @1495   PRMCCS13                      $CHAR8.                             
      @1503   PRMCCS14                      $CHAR8.                             
      @1511   PRMCCS15                      $CHAR8.                             
      @1519   PRMCCS16                      $CHAR8.                             
      @1527   PRMCCS17                      $CHAR8.                             
      @1535   PRMCCS18                      $CHAR8.                             
      @1543   PRMCCS19                      $CHAR8.                             
      @1551   PRMCCS20                      $CHAR8.                             
      @1559   PRMCCS21                      $CHAR8.                             
      @1567   PRMCCS22                      $CHAR8.                             
      @1575   PRMCCS23                      $CHAR8.                             
      @1583   PRMCCS24                      $CHAR8.                             
      @1591   PRMCCS25                      $CHAR8.                             
      @1599   PRMCCS26                      $CHAR8.                             
      @1607   PRMCCS27                      $CHAR8.                             
      @1615   PRMCCS28                      $CHAR8.                             
      @1623   PRMCCS29                      $CHAR8.                             
      @1631   PRMCCS30                      $CHAR8.                             
      @1639   PRMCCS31                      $CHAR8.                             
      @1647   PRMCCS32                      $CHAR8.                             
      @1655   PRMCCS33                      $CHAR8.                             
      @1663   PRMCCS34                      $CHAR8.                             
      @1671   PRMCCS35                      $CHAR8.                             
      @1679   PRMCCS36                      $CHAR8.                             
      @1687   PRMCCS37                      $CHAR8.                             
      @1695   PRMCCS38                      $CHAR8.                             
      @1703   PRMCCS39                      $CHAR8.                             
      @1711   PRMCCS40                      $CHAR8.                             
      @1719   PRMCCS41                      $CHAR8.                             
      @1727   PRMCCS42                      $CHAR8.                             
      @1735   PRMCCS43                      $CHAR8.                             
      @1743   PRMCCS44                      $CHAR8.                             
      @1751   PRMCCS45                      $CHAR8.                             
      @1759   PRMCCS46                      $CHAR8.                             
      @1767   PRMCCS47                      $CHAR8.                             
      @1775   PRMCCS48                      $CHAR8.                             
      @1783   PRMCCS49                      $CHAR8.                             
      @1791   PRMCCS50                      $CHAR8.                             
      @1799   PRMCCS51                      $CHAR8.                             
      @1807   PRMCCS52                      $CHAR8.                             
      @1815   PRMCCS53                      $CHAR8.                             
      @1823   PRMCCS54                      $CHAR8.                             
      @1831   PRMCCS55                      $CHAR8.                             
      @1839   PRMCCS56                      $CHAR8.                             
      @1847   PRMCCS57                      $CHAR8.                             
      @1855   PRMCCS58                      $CHAR8.                             
      @1863   PRMCCS59                      $CHAR8.                             
      @1871   PRMCCS60                      $CHAR8.                             
      @1879   PRMCCS61                      $CHAR8.                             
      @1887   PRMCCS62                      $CHAR8.                             
      @1895   PRMCCS63                      $CHAR8.                             
      @1903   PRMCCS64                      $CHAR8.                             
      @1911   PRMCCS65                      $CHAR8.                             
      @1919   PRMCCS66                      $CHAR8.                             
      @1927   U_BLOOD                       N2PF.                               
      @1929   U_CATH                        N2PF.                               
      @1931   U_CCU                         N2PF.                               
      @1933   U_CHESTXRAY                   N2PF.                               
      @1935   U_CTSCAN                      N2PF.                               
      @1937   U_DIALYSIS                    N2PF.                               
      @1939   U_ECHO                        N2PF.                               
      @1941   U_ED                          N2PF.                               
      @1943   U_EEG                         N2PF.                               
      @1945   U_EKG                         N2PF.                               
      @1947   U_EPO                         N2PF.                               
      @1949   U_ICU                         N2PF.                               
      @1951   U_LITHOTRIPSY                 N2PF.                               
      @1953   U_MHSA                        N2PF.                               
      @1955   U_MRT                         N2PF.                               
      @1957   U_NEWBN2L                     N2PF.                               
      @1959   U_NEWBN3L                     N2PF.                               
      @1961   U_NEWBN4L                     N2PF.                               
      @1963   U_NUCMED                      N2PF.                               
      @1965   U_OBSERVATION                 N2PF.                               
      @1967   U_OCCTHERAPY                  N2PF.                               
      @1969   U_ORGANACQ                    N2PF.                               
      @1971   U_OTHIMPLANTS                 N2PF.                               
      @1973   U_PACEMAKER                   N2PF.                               
      @1975   U_PHYTHERAPY                  N2PF.                               
      @1977   U_RADTHERAPY                  N2PF.                               
      @1979   U_RESPTHERAPY                 N2PF.                               
      @1981   U_SPEECHTHERAPY               N2PF.                               
      @1983   U_STRESS                      N2PF.                               
      @1985   U_ULTRASOUND                  N2PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
