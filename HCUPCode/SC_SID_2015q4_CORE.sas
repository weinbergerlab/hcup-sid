/*******************************************************************            
* Creation Date: 07/02/2018                                                     
*   SC_SID_2015q4_CORE.SAS:                                                     
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
DATA SC_SIDC_2015q4_CORE;                                                       
INFILE 'SC_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 672;                         
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  DaysICU                    LENGTH=3                                           
  LABEL="Days in medical/surgical intensive care unit (as received from source)"
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
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
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
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
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
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
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  AGEGROUP                   LENGTH=3                                           
  LABEL="Age Group"                                                             
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AMONTH                        N2PF.                               
      @3      ATYPE                         N2PF.                               
      @5      AWEEKEND                      N2PF.                               
      @7      DaysICU                       N3PF.                               
      @10     DIED                          N2PF.                               
      @12     DISP_X                        $CHAR2.                             
      @14     DISPUB04                      N2PF.                               
      @16     DISPUNIFORM                   N2PF.                               
      @18     DMONTH                        N2PF.                               
      @20     DQTR                          N2PF.                               
      @22     DRG                           N3PF.                               
      @25     DRG_NoPOA                     N3PF.                               
      @28     DRG32                         N3PF.                               
      @31     DRGVER                        N2PF.                               
      @33     DXPOA1                        $CHAR1.                             
      @34     DXPOA2                        $CHAR1.                             
      @35     DXPOA3                        $CHAR1.                             
      @36     DXPOA4                        $CHAR1.                             
      @37     DXPOA5                        $CHAR1.                             
      @38     DXPOA6                        $CHAR1.                             
      @39     DXPOA7                        $CHAR1.                             
      @40     DXPOA8                        $CHAR1.                             
      @41     DXPOA9                        $CHAR1.                             
      @42     DXPOA10                       $CHAR1.                             
      @43     DXPOA11                       $CHAR1.                             
      @44     DXPOA12                       $CHAR1.                             
      @45     DXPOA13                       $CHAR1.                             
      @46     DXPOA14                       $CHAR1.                             
      @47     DXPOA15                       $CHAR1.                             
      @48     DXVER                         N3PF.                               
      @51     E_POA1                        $CHAR1.                             
      @52     E_POA2                        $CHAR1.                             
      @53     E_POA3                        $CHAR1.                             
      @54     E_POA4                        $CHAR1.                             
      @55     E_POA5                        $CHAR1.                             
      @56     E_POA6                        $CHAR1.                             
      @57     E_POA7                        $CHAR1.                             
      @58     E_POA8                        $CHAR1.                             
      @59     FEMALE                        N2PF.                               
      @61     HCUP_ED                       N2PF.                               
      @63     HCUP_OS                       N2PF.                               
      @65     HOSPST                        $CHAR2.                             
      @67     I10_DX1                       $CHAR7.                             
      @74     I10_DX2                       $CHAR7.                             
      @81     I10_DX3                       $CHAR7.                             
      @88     I10_DX4                       $CHAR7.                             
      @95     I10_DX5                       $CHAR7.                             
      @102    I10_DX6                       $CHAR7.                             
      @109    I10_DX7                       $CHAR7.                             
      @116    I10_DX8                       $CHAR7.                             
      @123    I10_DX9                       $CHAR7.                             
      @130    I10_DX10                      $CHAR7.                             
      @137    I10_DX11                      $CHAR7.                             
      @144    I10_DX12                      $CHAR7.                             
      @151    I10_DX13                      $CHAR7.                             
      @158    I10_DX14                      $CHAR7.                             
      @165    I10_DX15                      $CHAR7.                             
      @172    I10_DXCCS1                    N4PF.                               
      @176    I10_DXCCS2                    N4PF.                               
      @180    I10_DXCCS3                    N4PF.                               
      @184    I10_DXCCS4                    N4PF.                               
      @188    I10_DXCCS5                    N4PF.                               
      @192    I10_DXCCS6                    N4PF.                               
      @196    I10_DXCCS7                    N4PF.                               
      @200    I10_DXCCS8                    N4PF.                               
      @204    I10_DXCCS9                    N4PF.                               
      @208    I10_DXCCS10                   N4PF.                               
      @212    I10_DXCCS11                   N4PF.                               
      @216    I10_DXCCS12                   N4PF.                               
      @220    I10_DXCCS13                   N4PF.                               
      @224    I10_DXCCS14                   N4PF.                               
      @228    I10_DXCCS15                   N4PF.                               
      @232    I10_ECAUSE1                   $CHAR7.                             
      @239    I10_ECAUSE2                   $CHAR7.                             
      @246    I10_ECAUSE3                   $CHAR7.                             
      @253    I10_ECAUSE4                   $CHAR7.                             
      @260    I10_ECAUSE5                   $CHAR7.                             
      @267    I10_ECAUSE6                   $CHAR7.                             
      @274    I10_ECAUSE7                   $CHAR7.                             
      @281    I10_ECAUSE8                   $CHAR7.                             
      @288    I10_ECauseCCS1                N4PF.                               
      @292    I10_ECauseCCS2                N4PF.                               
      @296    I10_ECauseCCS3                N4PF.                               
      @300    I10_ECauseCCS4                N4PF.                               
      @304    I10_ECauseCCS5                N4PF.                               
      @308    I10_ECauseCCS6                N4PF.                               
      @312    I10_ECauseCCS7                N4PF.                               
      @316    I10_ECauseCCS8                N4PF.                               
      @320    I10_HOSPBRTH                  N3PF.                               
      @323    I10_NCHRONIC                  N3PF.                               
      @326    I10_NDX                       N3PF.                               
      @329    I10_NECAUSE                   N2PF.                               
      @331    I10_NEOMAT                    N2PF.                               
      @333    I10_NPR                       N3PF.                               
      @336    I10_ORPROC                    N2PF.                               
      @338    I10_PR1                       $CHAR7.                             
      @345    I10_PR2                       $CHAR7.                             
      @352    I10_PR3                       $CHAR7.                             
      @359    I10_PR4                       $CHAR7.                             
      @366    I10_PR5                       $CHAR7.                             
      @373    I10_PR6                       $CHAR7.                             
      @380    I10_PR7                       $CHAR7.                             
      @387    I10_PR8                       $CHAR7.                             
      @394    I10_PR9                       $CHAR7.                             
      @401    I10_PR10                      $CHAR7.                             
      @408    I10_PR11                      $CHAR7.                             
      @415    I10_PR12                      $CHAR7.                             
      @422    I10_PR13                      $CHAR7.                             
      @429    I10_PRCCS1                    N3PF.                               
      @432    I10_PRCCS2                    N3PF.                               
      @435    I10_PRCCS3                    N3PF.                               
      @438    I10_PRCCS4                    N3PF.                               
      @441    I10_PRCCS5                    N3PF.                               
      @444    I10_PRCCS6                    N3PF.                               
      @447    I10_PRCCS7                    N3PF.                               
      @450    I10_PRCCS8                    N3PF.                               
      @453    I10_PRCCS9                    N3PF.                               
      @456    I10_PRCCS10                   N3PF.                               
      @459    I10_PRCCS11                   N3PF.                               
      @462    I10_PRCCS12                   N3PF.                               
      @465    I10_PRCCS13                   N3PF.                               
      @468    I10_PROCTYPE                  N3PF.                               
      @471    I10_SERVICELINE               N2PF.                               
      @473    KEY                           15.                                 
      @488    LOS                           N5PF.                               
      @493    LOS_X                         N6PF.                               
      @499    MDC                           N2PF.                               
      @501    MDC_NoPOA                     N2PF.                               
      @503    MDC32                         N2PF.                               
      @505    MDSPEC1                       $CHAR3.                             
      @508    MDSPEC2                       $CHAR3.                             
      @511    MEDINCSTQ                     N2PF.                               
      @513    OS_TIME                       N11P2F.                             
      @524    PAY1                          N2PF.                               
      @526    PAY1_X                        $CHAR2.                             
      @528    PL_NCHS                       N2PF.                               
      @530    PL_UR_CAT4                    N2PF.                               
      @532    POA_Disch_Edit1               N2PF.                               
      @534    POA_Disch_Edit2               N2PF.                               
      @536    POA_Hosp_Edit1                N2PF.                               
      @538    POA_Hosp_Edit2                N2PF.                               
      @540    POA_Hosp_Edit3                N2PF.                               
      @542    POA_Hosp_Edit3_Value          N8P2F.                              
      @550    PointOfOrigin_X               $CHAR1.                             
      @551    PointOfOriginUB04             $CHAR1.                             
      @552    PRDAY1                        N5PF.                               
      @557    PRDAY2                        N5PF.                               
      @562    PRDAY3                        N5PF.                               
      @567    PRDAY4                        N5PF.                               
      @572    PRDAY5                        N5PF.                               
      @577    PRDAY6                        N5PF.                               
      @582    PRDAY7                        N5PF.                               
      @587    PRDAY8                        N5PF.                               
      @592    PRDAY9                        N5PF.                               
      @597    PRDAY10                       N5PF.                               
      @602    PRDAY11                       N5PF.                               
      @607    PRDAY12                       N5PF.                               
      @612    PRDAY13                       N5PF.                               
      @617    PRVER                         N3PF.                               
      @620    PSTATE                        $CHAR2.                             
      @622    PSTCO                         N5PF.                               
      @627    RACE                          N2PF.                               
      @629    RACE_X                        $CHAR1.                             
      @630    TOTCHG                        N10PF.                              
      @640    TOTCHG_X                      N15P2F.                             
      @655    TRAN_IN                       N2PF.                               
      @657    TRAN_OUT                      N2PF.                               
      @659    YEAR                          N4PF.                               
      @663    ZIPINC_QRTL                   N3PF.                               
      @666    AGEGROUP                      N3PF.                               
      @669    AYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
