/*******************************************************************            
* Creation Date: 04/27/2018                                                     
*   MS_SID_2015q4_DX_PR_GRPS.SAS:                                               
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
DATA MS_SIDC_2015q4_DX_PR_GRPS;                                                 
INFILE 'MS_SID_2015q4_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 1165;                  
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  I10_BODYSYSTEM1            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 1"                                               
                                                                                
  I10_BODYSYSTEM2            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 2"                                               
                                                                                
  I10_BODYSYSTEM3            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 3"                                               
                                                                                
  I10_BODYSYSTEM4            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 4"                                               
                                                                                
  I10_BODYSYSTEM5            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 5"                                               
                                                                                
  I10_BODYSYSTEM6            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 6"                                               
                                                                                
  I10_BODYSYSTEM7            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 7"                                               
                                                                                
  I10_BODYSYSTEM8            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 8"                                               
                                                                                
  I10_BODYSYSTEM9            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 9"                                               
                                                                                
  I10_BODYSYSTEM10           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 10"                                              
                                                                                
  I10_BODYSYSTEM11           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 11"                                              
                                                                                
  I10_BODYSYSTEM12           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 12"                                              
                                                                                
  I10_BODYSYSTEM13           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 13"                                              
                                                                                
  I10_BODYSYSTEM14           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 14"                                              
                                                                                
  I10_BODYSYSTEM15           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 15"                                              
                                                                                
  I10_BODYSYSTEM16           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 16"                                              
                                                                                
  I10_BODYSYSTEM17           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 17"                                              
                                                                                
  I10_BODYSYSTEM18           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 18"                                              
                                                                                
  I10_BODYSYSTEM19           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 19"                                              
                                                                                
  I10_BODYSYSTEM20           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 20"                                              
                                                                                
  I10_BODYSYSTEM21           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 21"                                              
                                                                                
  I10_BODYSYSTEM22           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 22"                                              
                                                                                
  I10_BODYSYSTEM23           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 23"                                              
                                                                                
  I10_BODYSYSTEM24           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 24"                                              
                                                                                
  I10_BODYSYSTEM25           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 25"                                              
                                                                                
  I10_BODYSYSTEM26           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 26"                                              
                                                                                
  I10_BODYSYSTEM27           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 27"                                              
                                                                                
  I10_BODYSYSTEM28           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 28"                                              
                                                                                
  I10_BODYSYSTEM29           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 29"                                              
                                                                                
  I10_BODYSYSTEM30           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 30"                                              
                                                                                
  I10_BODYSYSTEM31           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 31"                                              
                                                                                
  I10_BODYSYSTEM32           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 32"                                              
                                                                                
  I10_BODYSYSTEM33           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 33"                                              
                                                                                
  I10_BODYSYSTEM34           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 34"                                              
                                                                                
  I10_BODYSYSTEM35           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 35"                                              
                                                                                
  I10_BODYSYSTEM36           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 36"                                              
                                                                                
  I10_BODYSYSTEM37           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 37"                                              
                                                                                
  I10_BODYSYSTEM38           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 38"                                              
                                                                                
  I10_BODYSYSTEM39           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 39"                                              
                                                                                
  I10_BODYSYSTEM40           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 40"                                              
                                                                                
  I10_BODYSYSTEM41           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 41"                                              
                                                                                
  I10_BODYSYSTEM42           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 42"                                              
                                                                                
  I10_BODYSYSTEM43           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 43"                                              
                                                                                
  I10_BODYSYSTEM44           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 44"                                              
                                                                                
  I10_BODYSYSTEM45           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 45"                                              
                                                                                
  I10_BODYSYSTEM46           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 46"                                              
                                                                                
  I10_BODYSYSTEM47           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 47"                                              
                                                                                
  I10_BODYSYSTEM48           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 48"                                              
                                                                                
  I10_CHRON1                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 1"                               
                                                                                
  I10_CHRON2                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 2"                               
                                                                                
  I10_CHRON3                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 3"                               
                                                                                
  I10_CHRON4                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 4"                               
                                                                                
  I10_CHRON5                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 5"                               
                                                                                
  I10_CHRON6                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 6"                               
                                                                                
  I10_CHRON7                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 7"                               
                                                                                
  I10_CHRON8                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 8"                               
                                                                                
  I10_CHRON9                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 9"                               
                                                                                
  I10_CHRON10                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 10"                              
                                                                                
  I10_CHRON11                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 11"                              
                                                                                
  I10_CHRON12                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 12"                              
                                                                                
  I10_CHRON13                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 13"                              
                                                                                
  I10_CHRON14                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 14"                              
                                                                                
  I10_CHRON15                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 15"                              
                                                                                
  I10_CHRON16                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 16"                              
                                                                                
  I10_CHRON17                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 17"                              
                                                                                
  I10_CHRON18                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 18"                              
                                                                                
  I10_CHRON19                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 19"                              
                                                                                
  I10_CHRON20                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 20"                              
                                                                                
  I10_CHRON21                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 21"                              
                                                                                
  I10_CHRON22                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 22"                              
                                                                                
  I10_CHRON23                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 23"                              
                                                                                
  I10_CHRON24                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 24"                              
                                                                                
  I10_CHRON25                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 25"                              
                                                                                
  I10_CHRON26                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 26"                              
                                                                                
  I10_CHRON27                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 27"                              
                                                                                
  I10_CHRON28                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 28"                              
                                                                                
  I10_CHRON29                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 29"                              
                                                                                
  I10_CHRON30                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 30"                              
                                                                                
  I10_CHRON31                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 31"                              
                                                                                
  I10_CHRON32                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 32"                              
                                                                                
  I10_CHRON33                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 33"                              
                                                                                
  I10_CHRON34                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 34"                              
                                                                                
  I10_CHRON35                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 35"                              
                                                                                
  I10_CHRON36                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 36"                              
                                                                                
  I10_CHRON37                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 37"                              
                                                                                
  I10_CHRON38                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 38"                              
                                                                                
  I10_CHRON39                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 39"                              
                                                                                
  I10_CHRON40                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 40"                              
                                                                                
  I10_CHRON41                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 41"                              
                                                                                
  I10_CHRON42                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 42"                              
                                                                                
  I10_CHRON43                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 43"                              
                                                                                
  I10_CHRON44                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 44"                              
                                                                                
  I10_CHRON45                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 45"                              
                                                                                
  I10_CHRON46                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 46"                              
                                                                                
  I10_CHRON47                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 47"                              
                                                                                
  I10_CHRON48                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 48"                              
                                                                                
  I10_DXMCCS1                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 1"                               
                                                                                
  I10_DXMCCS2                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 2"                               
                                                                                
  I10_DXMCCS3                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 3"                               
                                                                                
  I10_DXMCCS4                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 4"                               
                                                                                
  I10_DXMCCS5                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 5"                               
                                                                                
  I10_DXMCCS6                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 6"                               
                                                                                
  I10_DXMCCS7                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 7"                               
                                                                                
  I10_DXMCCS8                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 8"                               
                                                                                
  I10_DXMCCS9                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 9"                               
                                                                                
  I10_DXMCCS10               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 10"                              
                                                                                
  I10_DXMCCS11               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 11"                              
                                                                                
  I10_DXMCCS12               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 12"                              
                                                                                
  I10_DXMCCS13               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 13"                              
                                                                                
  I10_DXMCCS14               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 14"                              
                                                                                
  I10_DXMCCS15               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 15"                              
                                                                                
  I10_DXMCCS16               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 16"                              
                                                                                
  I10_DXMCCS17               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 17"                              
                                                                                
  I10_DXMCCS18               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 18"                              
                                                                                
  I10_DXMCCS19               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 19"                              
                                                                                
  I10_DXMCCS20               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 20"                              
                                                                                
  I10_DXMCCS21               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 21"                              
                                                                                
  I10_DXMCCS22               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 22"                              
                                                                                
  I10_DXMCCS23               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 23"                              
                                                                                
  I10_DXMCCS24               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 24"                              
                                                                                
  I10_DXMCCS25               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 25"                              
                                                                                
  I10_DXMCCS26               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 26"                              
                                                                                
  I10_DXMCCS27               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 27"                              
                                                                                
  I10_DXMCCS28               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 28"                              
                                                                                
  I10_DXMCCS29               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 29"                              
                                                                                
  I10_DXMCCS30               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 30"                              
                                                                                
  I10_DXMCCS31               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 31"                              
                                                                                
  I10_DXMCCS32               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 32"                              
                                                                                
  I10_DXMCCS33               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 33"                              
                                                                                
  I10_DXMCCS34               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 34"                              
                                                                                
  I10_DXMCCS35               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 35"                              
                                                                                
  I10_DXMCCS36               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 36"                              
                                                                                
  I10_DXMCCS37               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 37"                              
                                                                                
  I10_DXMCCS38               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 38"                              
                                                                                
  I10_DXMCCS39               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 39"                              
                                                                                
  I10_DXMCCS40               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 40"                              
                                                                                
  I10_DXMCCS41               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 41"                              
                                                                                
  I10_DXMCCS42               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 42"                              
                                                                                
  I10_DXMCCS43               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 43"                              
                                                                                
  I10_DXMCCS44               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 44"                              
                                                                                
  I10_DXMCCS45               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 45"                              
                                                                                
  I10_DXMCCS46               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 46"                              
                                                                                
  I10_DXMCCS47               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 47"                              
                                                                                
  I10_DXMCCS48               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 48"                              
                                                                                
  I10_ECauseMCCS1            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 1"                                 
                                                                                
  I10_ECauseMCCS2            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 2"                                 
                                                                                
  I10_ECauseMCCS3            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 3"                                 
                                                                                
  I10_ECauseMCCS4            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 4"                                 
                                                                                
  I10_ECauseMCCS5            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 5"                                 
                                                                                
  I10_ECauseMCCS6            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 6"                                 
                                                                                
  I10_INJURY                 LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"ICD-10-CM Injury diagnosis reported on record (1:I10_DX1 is an injury; 2:I10_DX
2+ is an injury; 0:No injury)"                                                  
                                                                                
  I10_MULTINJURY             LENGTH=3                                           
  LABEL="ICD-10-CM More than one injury diagnosis reported on record"           
                                                                                
  I10_PCLASS1                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 1"                                          
                                                                                
  I10_PCLASS2                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 2"                                          
                                                                                
  I10_PCLASS3                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 3"                                          
                                                                                
  I10_PCLASS4                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 4"                                          
                                                                                
  I10_PCLASS5                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 5"                                          
                                                                                
  I10_PCLASS6                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 6"                                          
                                                                                
  I10_PCLASS7                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 7"                                          
                                                                                
  I10_PCLASS8                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 8"                                          
                                                                                
  I10_PCLASS9                LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 9"                                          
                                                                                
  I10_PCLASS10               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 10"                                         
                                                                                
  I10_PCLASS11               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 11"                                         
                                                                                
  I10_PCLASS12               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 12"                                         
                                                                                
  I10_PCLASS13               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 13"                                         
                                                                                
  I10_PCLASS14               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 14"                                         
                                                                                
  I10_PCLASS15               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 15"                                         
                                                                                
  I10_PCLASS16               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 16"                                         
                                                                                
  I10_PCLASS17               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 17"                                         
                                                                                
  I10_PCLASS18               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 18"                                         
                                                                                
  I10_PCLASS19               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 19"                                         
                                                                                
  I10_PCLASS20               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 20"                                         
                                                                                
  I10_PCLASS21               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 21"                                         
                                                                                
  I10_PCLASS22               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 22"                                         
                                                                                
  I10_PCLASS23               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 23"                                         
                                                                                
  I10_PCLASS24               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 24"                                         
                                                                                
  I10_PCLASS25               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 25"                                         
                                                                                
  I10_PCLASS26               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 26"                                         
                                                                                
  I10_PCLASS27               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 27"                                         
                                                                                
  I10_PCLASS28               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 28"                                         
                                                                                
  I10_PCLASS29               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 29"                                         
                                                                                
  I10_PCLASS30               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 30"                                         
                                                                                
  I10_PRMCCS1                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 1"                              
                                                                                
  I10_PRMCCS2                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 2"                              
                                                                                
  I10_PRMCCS3                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 3"                              
                                                                                
  I10_PRMCCS4                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 4"                              
                                                                                
  I10_PRMCCS5                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 5"                              
                                                                                
  I10_PRMCCS6                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 6"                              
                                                                                
  I10_PRMCCS7                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 7"                              
                                                                                
  I10_PRMCCS8                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 8"                              
                                                                                
  I10_PRMCCS9                LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 9"                              
                                                                                
  I10_PRMCCS10               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 10"                             
                                                                                
  I10_PRMCCS11               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 11"                             
                                                                                
  I10_PRMCCS12               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 12"                             
                                                                                
  I10_PRMCCS13               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 13"                             
                                                                                
  I10_PRMCCS14               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 14"                             
                                                                                
  I10_PRMCCS15               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 15"                             
                                                                                
  I10_PRMCCS16               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 16"                             
                                                                                
  I10_PRMCCS17               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 17"                             
                                                                                
  I10_PRMCCS18               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 18"                             
                                                                                
  I10_PRMCCS19               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 19"                             
                                                                                
  I10_PRMCCS20               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 20"                             
                                                                                
  I10_PRMCCS21               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 21"                             
                                                                                
  I10_PRMCCS22               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 22"                             
                                                                                
  I10_PRMCCS23               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 23"                             
                                                                                
  I10_PRMCCS24               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 24"                             
                                                                                
  I10_PRMCCS25               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 25"                             
                                                                                
  I10_PRMCCS26               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 26"                             
                                                                                
  I10_PRMCCS27               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 27"                             
                                                                                
  I10_PRMCCS28               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 28"                             
                                                                                
  I10_PRMCCS29               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 29"                             
                                                                                
  I10_PRMCCS30               LENGTH=$8                                          
  LABEL="ICD-10-PCS Multi-Level CCS:  Procedure 30"                             
                                                                                
  I10_U_BLOOD                LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Blood"                                    
                                                                                
  I10_U_CATH                 LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Cardiac Catheterization Lab"              
                                                                                
  I10_U_CTSCAN               LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Computed Tomography Scan"                 
                                                                                
  I10_U_EKG                  LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Electrocardiogram"                        
                                                                                
  I10_U_MHSA                 LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Mental Health and Substance Abuse"        
                                                                                
  I10_U_MRT                  LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Magnetic Resonance Technology"            
                                                                                
  I10_U_PACEMAKER            LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Pacemaker"                                
                                                                                
  I10_U_PHYTHERAPY           LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Physical Therapy"                         
                                                                                
  I10_U_RADTHERAPY           LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"ICD-10-PCS Utilization Flag: Radiology - Therapeutic and/or Chemotherapy Admini
stration"                                                                       
                                                                                
  I10_U_STRESS               LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Cardiac Stress Test"                      
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  U_CCU                      LENGTH=3                                           
  LABEL="Utilization Flag: Coronary Care Unit (CCU)"                            
                                                                                
  U_CHESTXRAY                LENGTH=3                                           
  LABEL="Utilization Flag: Chest X-Ray"                                         
                                                                                
  U_DIALYSIS                 LENGTH=3                                           
  LABEL="Utilization Flag: Renal Dialysis"                                      
                                                                                
  U_ECHO                     LENGTH=3                                           
  LABEL="Utilization Flag: Echocardiology"                                      
                                                                                
  U_ED                       LENGTH=3                                           
  LABEL="Utilization Flag: Emergency Room"                                      
                                                                                
  U_EEG                      LENGTH=3                                           
  LABEL="Utilization Flag: Electroencephalogram"                                
                                                                                
  U_EPO                      LENGTH=3                                           
  LABEL="Utilization Flag: EPO"                                                 
                                                                                
  U_ICU                      LENGTH=3                                           
  LABEL="Utilization Flag: Intensive Care Unit (ICU)"                           
                                                                                
  U_LITHOTRIPSY              LENGTH=3                                           
  LABEL="Utilization Flag: Lithotripsy"                                         
                                                                                
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
                                                                                
  U_RESPTHERAPY              LENGTH=3                                           
  LABEL="Utilization Flag: Respiratory Services"                                
                                                                                
  U_SPEECHTHERAPY            LENGTH=3                                           
  LABEL="Utilization Flag: Speech - Language Pathology"                         
                                                                                
  U_ULTRASOUND               LENGTH=3                                           
  LABEL="Utilization Flag: Ultrasound"                                          
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      I10_BODYSYSTEM1               N2PF.                               
      @3      I10_BODYSYSTEM2               N2PF.                               
      @5      I10_BODYSYSTEM3               N2PF.                               
      @7      I10_BODYSYSTEM4               N2PF.                               
      @9      I10_BODYSYSTEM5               N2PF.                               
      @11     I10_BODYSYSTEM6               N2PF.                               
      @13     I10_BODYSYSTEM7               N2PF.                               
      @15     I10_BODYSYSTEM8               N2PF.                               
      @17     I10_BODYSYSTEM9               N2PF.                               
      @19     I10_BODYSYSTEM10              N2PF.                               
      @21     I10_BODYSYSTEM11              N2PF.                               
      @23     I10_BODYSYSTEM12              N2PF.                               
      @25     I10_BODYSYSTEM13              N2PF.                               
      @27     I10_BODYSYSTEM14              N2PF.                               
      @29     I10_BODYSYSTEM15              N2PF.                               
      @31     I10_BODYSYSTEM16              N2PF.                               
      @33     I10_BODYSYSTEM17              N2PF.                               
      @35     I10_BODYSYSTEM18              N2PF.                               
      @37     I10_BODYSYSTEM19              N2PF.                               
      @39     I10_BODYSYSTEM20              N2PF.                               
      @41     I10_BODYSYSTEM21              N2PF.                               
      @43     I10_BODYSYSTEM22              N2PF.                               
      @45     I10_BODYSYSTEM23              N2PF.                               
      @47     I10_BODYSYSTEM24              N2PF.                               
      @49     I10_BODYSYSTEM25              N2PF.                               
      @51     I10_BODYSYSTEM26              N2PF.                               
      @53     I10_BODYSYSTEM27              N2PF.                               
      @55     I10_BODYSYSTEM28              N2PF.                               
      @57     I10_BODYSYSTEM29              N2PF.                               
      @59     I10_BODYSYSTEM30              N2PF.                               
      @61     I10_BODYSYSTEM31              N2PF.                               
      @63     I10_BODYSYSTEM32              N2PF.                               
      @65     I10_BODYSYSTEM33              N2PF.                               
      @67     I10_BODYSYSTEM34              N2PF.                               
      @69     I10_BODYSYSTEM35              N2PF.                               
      @71     I10_BODYSYSTEM36              N2PF.                               
      @73     I10_BODYSYSTEM37              N2PF.                               
      @75     I10_BODYSYSTEM38              N2PF.                               
      @77     I10_BODYSYSTEM39              N2PF.                               
      @79     I10_BODYSYSTEM40              N2PF.                               
      @81     I10_BODYSYSTEM41              N2PF.                               
      @83     I10_BODYSYSTEM42              N2PF.                               
      @85     I10_BODYSYSTEM43              N2PF.                               
      @87     I10_BODYSYSTEM44              N2PF.                               
      @89     I10_BODYSYSTEM45              N2PF.                               
      @91     I10_BODYSYSTEM46              N2PF.                               
      @93     I10_BODYSYSTEM47              N2PF.                               
      @95     I10_BODYSYSTEM48              N2PF.                               
      @97     I10_CHRON1                    N2PF.                               
      @99     I10_CHRON2                    N2PF.                               
      @101    I10_CHRON3                    N2PF.                               
      @103    I10_CHRON4                    N2PF.                               
      @105    I10_CHRON5                    N2PF.                               
      @107    I10_CHRON6                    N2PF.                               
      @109    I10_CHRON7                    N2PF.                               
      @111    I10_CHRON8                    N2PF.                               
      @113    I10_CHRON9                    N2PF.                               
      @115    I10_CHRON10                   N2PF.                               
      @117    I10_CHRON11                   N2PF.                               
      @119    I10_CHRON12                   N2PF.                               
      @121    I10_CHRON13                   N2PF.                               
      @123    I10_CHRON14                   N2PF.                               
      @125    I10_CHRON15                   N2PF.                               
      @127    I10_CHRON16                   N2PF.                               
      @129    I10_CHRON17                   N2PF.                               
      @131    I10_CHRON18                   N2PF.                               
      @133    I10_CHRON19                   N2PF.                               
      @135    I10_CHRON20                   N2PF.                               
      @137    I10_CHRON21                   N2PF.                               
      @139    I10_CHRON22                   N2PF.                               
      @141    I10_CHRON23                   N2PF.                               
      @143    I10_CHRON24                   N2PF.                               
      @145    I10_CHRON25                   N2PF.                               
      @147    I10_CHRON26                   N2PF.                               
      @149    I10_CHRON27                   N2PF.                               
      @151    I10_CHRON28                   N2PF.                               
      @153    I10_CHRON29                   N2PF.                               
      @155    I10_CHRON30                   N2PF.                               
      @157    I10_CHRON31                   N2PF.                               
      @159    I10_CHRON32                   N2PF.                               
      @161    I10_CHRON33                   N2PF.                               
      @163    I10_CHRON34                   N2PF.                               
      @165    I10_CHRON35                   N2PF.                               
      @167    I10_CHRON36                   N2PF.                               
      @169    I10_CHRON37                   N2PF.                               
      @171    I10_CHRON38                   N2PF.                               
      @173    I10_CHRON39                   N2PF.                               
      @175    I10_CHRON40                   N2PF.                               
      @177    I10_CHRON41                   N2PF.                               
      @179    I10_CHRON42                   N2PF.                               
      @181    I10_CHRON43                   N2PF.                               
      @183    I10_CHRON44                   N2PF.                               
      @185    I10_CHRON45                   N2PF.                               
      @187    I10_CHRON46                   N2PF.                               
      @189    I10_CHRON47                   N2PF.                               
      @191    I10_CHRON48                   N2PF.                               
      @193    I10_DXMCCS1                   $CHAR11.                            
      @204    I10_DXMCCS2                   $CHAR11.                            
      @215    I10_DXMCCS3                   $CHAR11.                            
      @226    I10_DXMCCS4                   $CHAR11.                            
      @237    I10_DXMCCS5                   $CHAR11.                            
      @248    I10_DXMCCS6                   $CHAR11.                            
      @259    I10_DXMCCS7                   $CHAR11.                            
      @270    I10_DXMCCS8                   $CHAR11.                            
      @281    I10_DXMCCS9                   $CHAR11.                            
      @292    I10_DXMCCS10                  $CHAR11.                            
      @303    I10_DXMCCS11                  $CHAR11.                            
      @314    I10_DXMCCS12                  $CHAR11.                            
      @325    I10_DXMCCS13                  $CHAR11.                            
      @336    I10_DXMCCS14                  $CHAR11.                            
      @347    I10_DXMCCS15                  $CHAR11.                            
      @358    I10_DXMCCS16                  $CHAR11.                            
      @369    I10_DXMCCS17                  $CHAR11.                            
      @380    I10_DXMCCS18                  $CHAR11.                            
      @391    I10_DXMCCS19                  $CHAR11.                            
      @402    I10_DXMCCS20                  $CHAR11.                            
      @413    I10_DXMCCS21                  $CHAR11.                            
      @424    I10_DXMCCS22                  $CHAR11.                            
      @435    I10_DXMCCS23                  $CHAR11.                            
      @446    I10_DXMCCS24                  $CHAR11.                            
      @457    I10_DXMCCS25                  $CHAR11.                            
      @468    I10_DXMCCS26                  $CHAR11.                            
      @479    I10_DXMCCS27                  $CHAR11.                            
      @490    I10_DXMCCS28                  $CHAR11.                            
      @501    I10_DXMCCS29                  $CHAR11.                            
      @512    I10_DXMCCS30                  $CHAR11.                            
      @523    I10_DXMCCS31                  $CHAR11.                            
      @534    I10_DXMCCS32                  $CHAR11.                            
      @545    I10_DXMCCS33                  $CHAR11.                            
      @556    I10_DXMCCS34                  $CHAR11.                            
      @567    I10_DXMCCS35                  $CHAR11.                            
      @578    I10_DXMCCS36                  $CHAR11.                            
      @589    I10_DXMCCS37                  $CHAR11.                            
      @600    I10_DXMCCS38                  $CHAR11.                            
      @611    I10_DXMCCS39                  $CHAR11.                            
      @622    I10_DXMCCS40                  $CHAR11.                            
      @633    I10_DXMCCS41                  $CHAR11.                            
      @644    I10_DXMCCS42                  $CHAR11.                            
      @655    I10_DXMCCS43                  $CHAR11.                            
      @666    I10_DXMCCS44                  $CHAR11.                            
      @677    I10_DXMCCS45                  $CHAR11.                            
      @688    I10_DXMCCS46                  $CHAR11.                            
      @699    I10_DXMCCS47                  $CHAR11.                            
      @710    I10_DXMCCS48                  $CHAR11.                            
      @721    I10_ECauseMCCS1               $CHAR11.                            
      @732    I10_ECauseMCCS2               $CHAR11.                            
      @743    I10_ECauseMCCS3               $CHAR11.                            
      @754    I10_ECauseMCCS4               $CHAR11.                            
      @765    I10_ECauseMCCS5               $CHAR11.                            
      @776    I10_ECauseMCCS6               $CHAR11.                            
      @787    I10_INJURY                    N2PF.                               
      @789    I10_MULTINJURY                N2PF.                               
      @791    I10_PCLASS1                   N2PF.                               
      @793    I10_PCLASS2                   N2PF.                               
      @795    I10_PCLASS3                   N2PF.                               
      @797    I10_PCLASS4                   N2PF.                               
      @799    I10_PCLASS5                   N2PF.                               
      @801    I10_PCLASS6                   N2PF.                               
      @803    I10_PCLASS7                   N2PF.                               
      @805    I10_PCLASS8                   N2PF.                               
      @807    I10_PCLASS9                   N2PF.                               
      @809    I10_PCLASS10                  N2PF.                               
      @811    I10_PCLASS11                  N2PF.                               
      @813    I10_PCLASS12                  N2PF.                               
      @815    I10_PCLASS13                  N2PF.                               
      @817    I10_PCLASS14                  N2PF.                               
      @819    I10_PCLASS15                  N2PF.                               
      @821    I10_PCLASS16                  N2PF.                               
      @823    I10_PCLASS17                  N2PF.                               
      @825    I10_PCLASS18                  N2PF.                               
      @827    I10_PCLASS19                  N2PF.                               
      @829    I10_PCLASS20                  N2PF.                               
      @831    I10_PCLASS21                  N2PF.                               
      @833    I10_PCLASS22                  N2PF.                               
      @835    I10_PCLASS23                  N2PF.                               
      @837    I10_PCLASS24                  N2PF.                               
      @839    I10_PCLASS25                  N2PF.                               
      @841    I10_PCLASS26                  N2PF.                               
      @843    I10_PCLASS27                  N2PF.                               
      @845    I10_PCLASS28                  N2PF.                               
      @847    I10_PCLASS29                  N2PF.                               
      @849    I10_PCLASS30                  N2PF.                               
      @851    I10_PRMCCS1                   $CHAR8.                             
      @859    I10_PRMCCS2                   $CHAR8.                             
      @867    I10_PRMCCS3                   $CHAR8.                             
      @875    I10_PRMCCS4                   $CHAR8.                             
      @883    I10_PRMCCS5                   $CHAR8.                             
      @891    I10_PRMCCS6                   $CHAR8.                             
      @899    I10_PRMCCS7                   $CHAR8.                             
      @907    I10_PRMCCS8                   $CHAR8.                             
      @915    I10_PRMCCS9                   $CHAR8.                             
      @923    I10_PRMCCS10                  $CHAR8.                             
      @931    I10_PRMCCS11                  $CHAR8.                             
      @939    I10_PRMCCS12                  $CHAR8.                             
      @947    I10_PRMCCS13                  $CHAR8.                             
      @955    I10_PRMCCS14                  $CHAR8.                             
      @963    I10_PRMCCS15                  $CHAR8.                             
      @971    I10_PRMCCS16                  $CHAR8.                             
      @979    I10_PRMCCS17                  $CHAR8.                             
      @987    I10_PRMCCS18                  $CHAR8.                             
      @995    I10_PRMCCS19                  $CHAR8.                             
      @1003   I10_PRMCCS20                  $CHAR8.                             
      @1011   I10_PRMCCS21                  $CHAR8.                             
      @1019   I10_PRMCCS22                  $CHAR8.                             
      @1027   I10_PRMCCS23                  $CHAR8.                             
      @1035   I10_PRMCCS24                  $CHAR8.                             
      @1043   I10_PRMCCS25                  $CHAR8.                             
      @1051   I10_PRMCCS26                  $CHAR8.                             
      @1059   I10_PRMCCS27                  $CHAR8.                             
      @1067   I10_PRMCCS28                  $CHAR8.                             
      @1075   I10_PRMCCS29                  $CHAR8.                             
      @1083   I10_PRMCCS30                  $CHAR8.                             
      @1091   I10_U_BLOOD                   N2PF.                               
      @1093   I10_U_CATH                    N2PF.                               
      @1095   I10_U_CTSCAN                  N2PF.                               
      @1097   I10_U_EKG                     N2PF.                               
      @1099   I10_U_MHSA                    N2PF.                               
      @1101   I10_U_MRT                     N2PF.                               
      @1103   I10_U_PACEMAKER               N2PF.                               
      @1105   I10_U_PHYTHERAPY              N2PF.                               
      @1107   I10_U_RADTHERAPY              N2PF.                               
      @1109   I10_U_STRESS                  N2PF.                               
      @1111   KEY                           15.                                 
      @1126   U_CCU                         N2PF.                               
      @1128   U_CHESTXRAY                   N2PF.                               
      @1130   U_DIALYSIS                    N2PF.                               
      @1132   U_ECHO                        N2PF.                               
      @1134   U_ED                          N2PF.                               
      @1136   U_EEG                         N2PF.                               
      @1138   U_EPO                         N2PF.                               
      @1140   U_ICU                         N2PF.                               
      @1142   U_LITHOTRIPSY                 N2PF.                               
      @1144   U_NEWBN2L                     N2PF.                               
      @1146   U_NEWBN3L                     N2PF.                               
      @1148   U_NEWBN4L                     N2PF.                               
      @1150   U_NUCMED                      N2PF.                               
      @1152   U_OBSERVATION                 N2PF.                               
      @1154   U_OCCTHERAPY                  N2PF.                               
      @1156   U_ORGANACQ                    N2PF.                               
      @1158   U_OTHIMPLANTS                 N2PF.                               
      @1160   U_RESPTHERAPY                 N2PF.                               
      @1162   U_SPEECHTHERAPY               N2PF.                               
      @1164   U_ULTRASOUND                  N2PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
