/*******************************************************************            
* Creation Date: 04/24/2017                                                     
*   VT_SID_2015q4_DX_PR_GRPS.SAS:                                               
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
DATA VT_SIDC_2015q4_DX_PR_GRPS;                                                 
INFILE 'VT_SID_2015q4_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 689;                   
                                                                                
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
                                                                                
  I10_ECauseMCCS7            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 7"                                 
                                                                                
  I10_ECauseMCCS8            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 8"                                 
                                                                                
  I10_ECauseMCCS9            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 9"                                 
                                                                                
  I10_ECauseMCCS10           LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 10"                                
                                                                                
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
      @41     I10_CHRON1                    N2PF.                               
      @43     I10_CHRON2                    N2PF.                               
      @45     I10_CHRON3                    N2PF.                               
      @47     I10_CHRON4                    N2PF.                               
      @49     I10_CHRON5                    N2PF.                               
      @51     I10_CHRON6                    N2PF.                               
      @53     I10_CHRON7                    N2PF.                               
      @55     I10_CHRON8                    N2PF.                               
      @57     I10_CHRON9                    N2PF.                               
      @59     I10_CHRON10                   N2PF.                               
      @61     I10_CHRON11                   N2PF.                               
      @63     I10_CHRON12                   N2PF.                               
      @65     I10_CHRON13                   N2PF.                               
      @67     I10_CHRON14                   N2PF.                               
      @69     I10_CHRON15                   N2PF.                               
      @71     I10_CHRON16                   N2PF.                               
      @73     I10_CHRON17                   N2PF.                               
      @75     I10_CHRON18                   N2PF.                               
      @77     I10_CHRON19                   N2PF.                               
      @79     I10_CHRON20                   N2PF.                               
      @81     I10_DXMCCS1                   $CHAR11.                            
      @92     I10_DXMCCS2                   $CHAR11.                            
      @103    I10_DXMCCS3                   $CHAR11.                            
      @114    I10_DXMCCS4                   $CHAR11.                            
      @125    I10_DXMCCS5                   $CHAR11.                            
      @136    I10_DXMCCS6                   $CHAR11.                            
      @147    I10_DXMCCS7                   $CHAR11.                            
      @158    I10_DXMCCS8                   $CHAR11.                            
      @169    I10_DXMCCS9                   $CHAR11.                            
      @180    I10_DXMCCS10                  $CHAR11.                            
      @191    I10_DXMCCS11                  $CHAR11.                            
      @202    I10_DXMCCS12                  $CHAR11.                            
      @213    I10_DXMCCS13                  $CHAR11.                            
      @224    I10_DXMCCS14                  $CHAR11.                            
      @235    I10_DXMCCS15                  $CHAR11.                            
      @246    I10_DXMCCS16                  $CHAR11.                            
      @257    I10_DXMCCS17                  $CHAR11.                            
      @268    I10_DXMCCS18                  $CHAR11.                            
      @279    I10_DXMCCS19                  $CHAR11.                            
      @290    I10_DXMCCS20                  $CHAR11.                            
      @301    I10_ECauseMCCS1               $CHAR11.                            
      @312    I10_ECauseMCCS2               $CHAR11.                            
      @323    I10_ECauseMCCS3               $CHAR11.                            
      @334    I10_ECauseMCCS4               $CHAR11.                            
      @345    I10_ECauseMCCS5               $CHAR11.                            
      @356    I10_ECauseMCCS6               $CHAR11.                            
      @367    I10_ECauseMCCS7               $CHAR11.                            
      @378    I10_ECauseMCCS8               $CHAR11.                            
      @389    I10_ECauseMCCS9               $CHAR11.                            
      @400    I10_ECauseMCCS10              $CHAR11.                            
      @411    I10_INJURY                    N2PF.                               
      @413    I10_MULTINJURY                N2PF.                               
      @415    I10_PCLASS1                   N2PF.                               
      @417    I10_PCLASS2                   N2PF.                               
      @419    I10_PCLASS3                   N2PF.                               
      @421    I10_PCLASS4                   N2PF.                               
      @423    I10_PCLASS5                   N2PF.                               
      @425    I10_PCLASS6                   N2PF.                               
      @427    I10_PCLASS7                   N2PF.                               
      @429    I10_PCLASS8                   N2PF.                               
      @431    I10_PCLASS9                   N2PF.                               
      @433    I10_PCLASS10                  N2PF.                               
      @435    I10_PCLASS11                  N2PF.                               
      @437    I10_PCLASS12                  N2PF.                               
      @439    I10_PCLASS13                  N2PF.                               
      @441    I10_PCLASS14                  N2PF.                               
      @443    I10_PCLASS15                  N2PF.                               
      @445    I10_PCLASS16                  N2PF.                               
      @447    I10_PCLASS17                  N2PF.                               
      @449    I10_PCLASS18                  N2PF.                               
      @451    I10_PCLASS19                  N2PF.                               
      @453    I10_PCLASS20                  N2PF.                               
      @455    I10_PRMCCS1                   $CHAR8.                             
      @463    I10_PRMCCS2                   $CHAR8.                             
      @471    I10_PRMCCS3                   $CHAR8.                             
      @479    I10_PRMCCS4                   $CHAR8.                             
      @487    I10_PRMCCS5                   $CHAR8.                             
      @495    I10_PRMCCS6                   $CHAR8.                             
      @503    I10_PRMCCS7                   $CHAR8.                             
      @511    I10_PRMCCS8                   $CHAR8.                             
      @519    I10_PRMCCS9                   $CHAR8.                             
      @527    I10_PRMCCS10                  $CHAR8.                             
      @535    I10_PRMCCS11                  $CHAR8.                             
      @543    I10_PRMCCS12                  $CHAR8.                             
      @551    I10_PRMCCS13                  $CHAR8.                             
      @559    I10_PRMCCS14                  $CHAR8.                             
      @567    I10_PRMCCS15                  $CHAR8.                             
      @575    I10_PRMCCS16                  $CHAR8.                             
      @583    I10_PRMCCS17                  $CHAR8.                             
      @591    I10_PRMCCS18                  $CHAR8.                             
      @599    I10_PRMCCS19                  $CHAR8.                             
      @607    I10_PRMCCS20                  $CHAR8.                             
      @615    I10_U_BLOOD                   N2PF.                               
      @617    I10_U_CATH                    N2PF.                               
      @619    I10_U_CTSCAN                  N2PF.                               
      @621    I10_U_EKG                     N2PF.                               
      @623    I10_U_MHSA                    N2PF.                               
      @625    I10_U_MRT                     N2PF.                               
      @627    I10_U_PACEMAKER               N2PF.                               
      @629    I10_U_PHYTHERAPY              N2PF.                               
      @631    I10_U_RADTHERAPY              N2PF.                               
      @633    I10_U_STRESS                  N2PF.                               
      @635    KEY                           15.                                 
      @650    U_CCU                         N2PF.                               
      @652    U_CHESTXRAY                   N2PF.                               
      @654    U_DIALYSIS                    N2PF.                               
      @656    U_ECHO                        N2PF.                               
      @658    U_ED                          N2PF.                               
      @660    U_EEG                         N2PF.                               
      @662    U_EPO                         N2PF.                               
      @664    U_ICU                         N2PF.                               
      @666    U_LITHOTRIPSY                 N2PF.                               
      @668    U_NEWBN2L                     N2PF.                               
      @670    U_NEWBN3L                     N2PF.                               
      @672    U_NEWBN4L                     N2PF.                               
      @674    U_NUCMED                      N2PF.                               
      @676    U_OBSERVATION                 N2PF.                               
      @678    U_OCCTHERAPY                  N2PF.                               
      @680    U_ORGANACQ                    N2PF.                               
      @682    U_OTHIMPLANTS                 N2PF.                               
      @684    U_RESPTHERAPY                 N2PF.                               
      @686    U_SPEECHTHERAPY               N2PF.                               
      @688    U_ULTRASOUND                  N2PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
