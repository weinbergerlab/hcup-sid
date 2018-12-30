/*******************************************************************            
* Creation Date: 01/09/2018                                                     
*   MA_SID_2015q4_CORE.SAS:                                                     
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
DATA MA_SIDC_2015q4_CORE;                                                       
INFILE 'MA_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 2668;                        
                                                                                
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
                                                                                
  I10_DX68                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 68"                                                
                                                                                
  I10_DX69                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 69"                                                
                                                                                
  I10_DX70                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 70"                                                
                                                                                
  I10_DX71                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 71"                                                
                                                                                
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
                                                                                
  I10_DXCCS68                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 68"                                           
                                                                                
  I10_DXCCS69                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 69"                                           
                                                                                
  I10_DXCCS70                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 70"                                           
                                                                                
  I10_DXCCS71                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 71"                                           
                                                                                
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
                                                                                
  I10_PR51                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 51"                                               
                                                                                
  I10_PR52                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 52"                                               
                                                                                
  I10_PR53                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 53"                                               
                                                                                
  I10_PR54                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 54"                                               
                                                                                
  I10_PR55                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 55"                                               
                                                                                
  I10_PR56                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 56"                                               
                                                                                
  I10_PR57                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 57"                                               
                                                                                
  I10_PR58                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 58"                                               
                                                                                
  I10_PR59                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 59"                                               
                                                                                
  I10_PR60                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 60"                                               
                                                                                
  I10_PR61                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 61"                                               
                                                                                
  I10_PR62                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 62"                                               
                                                                                
  I10_PR63                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 63"                                               
                                                                                
  I10_PR64                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 64"                                               
                                                                                
  I10_PR65                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 65"                                               
                                                                                
  I10_PR66                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 66"                                               
                                                                                
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
                                                                                
  I10_PRCCS51                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 51"                                          
                                                                                
  I10_PRCCS52                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 52"                                          
                                                                                
  I10_PRCCS53                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 53"                                          
                                                                                
  I10_PRCCS54                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 54"                                          
                                                                                
  I10_PRCCS55                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 55"                                          
                                                                                
  I10_PRCCS56                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 56"                                          
                                                                                
  I10_PRCCS57                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 57"                                          
                                                                                
  I10_PRCCS58                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 58"                                          
                                                                                
  I10_PRCCS59                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 59"                                          
                                                                                
  I10_PRCCS60                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 60"                                          
                                                                                
  I10_PRCCS61                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 61"                                          
                                                                                
  I10_PRCCS62                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 62"                                          
                                                                                
  I10_PRCCS63                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 63"                                          
                                                                                
  I10_PRCCS64                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 64"                                          
                                                                                
  I10_PRCCS65                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 65"                                          
                                                                                
  I10_PRCCS66                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 66"                                          
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
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
                                                                                
  PRDAY22                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR22"                             
                                                                                
  PRDAY23                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR23"                             
                                                                                
  PRDAY24                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR24"                             
                                                                                
  PRDAY25                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR25"                             
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR26"                             
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR27"                             
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR28"                             
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR29"                             
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR30"                             
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR31"                             
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR32"                             
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR33"                             
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR34"                             
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR35"                             
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR36"                             
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR37"                             
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR38"                             
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR39"                             
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR40"                             
                                                                                
  PRDAY41                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR41"                             
                                                                                
  PRDAY42                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR42"                             
                                                                                
  PRDAY43                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR43"                             
                                                                                
  PRDAY44                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR44"                             
                                                                                
  PRDAY45                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR45"                             
                                                                                
  PRDAY46                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR46"                             
                                                                                
  PRDAY47                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR47"                             
                                                                                
  PRDAY48                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR48"                             
                                                                                
  PRDAY49                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR49"                             
                                                                                
  PRDAY50                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR50"                             
                                                                                
  PRDAY51                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR51"                             
                                                                                
  PRDAY52                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR52"                             
                                                                                
  PRDAY53                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR53"                             
                                                                                
  PRDAY54                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR54"                             
                                                                                
  PRDAY55                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR55"                             
                                                                                
  PRDAY56                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR56"                             
                                                                                
  PRDAY57                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR57"                             
                                                                                
  PRDAY58                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR58"                             
                                                                                
  PRDAY59                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR59"                             
                                                                                
  PRDAY60                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR60"                             
                                                                                
  PRDAY61                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR61"                             
                                                                                
  PRDAY62                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR62"                             
                                                                                
  PRDAY63                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR63"                             
                                                                                
  PRDAY64                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR64"                             
                                                                                
  PRDAY65                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR65"                             
                                                                                
  PRDAY66                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR66"                             
                                                                                
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
      @82     DXPOA1                        $CHAR1.                             
      @83     DXPOA2                        $CHAR1.                             
      @84     DXPOA3                        $CHAR1.                             
      @85     DXPOA4                        $CHAR1.                             
      @86     DXPOA5                        $CHAR1.                             
      @87     DXPOA6                        $CHAR1.                             
      @88     DXPOA7                        $CHAR1.                             
      @89     DXPOA8                        $CHAR1.                             
      @90     DXPOA9                        $CHAR1.                             
      @91     DXPOA10                       $CHAR1.                             
      @92     DXPOA11                       $CHAR1.                             
      @93     DXPOA12                       $CHAR1.                             
      @94     DXPOA13                       $CHAR1.                             
      @95     DXPOA14                       $CHAR1.                             
      @96     DXPOA15                       $CHAR1.                             
      @97     DXPOA16                       $CHAR1.                             
      @98     DXPOA17                       $CHAR1.                             
      @99     DXPOA18                       $CHAR1.                             
      @100    DXPOA19                       $CHAR1.                             
      @101    DXPOA20                       $CHAR1.                             
      @102    DXPOA21                       $CHAR1.                             
      @103    DXPOA22                       $CHAR1.                             
      @104    DXPOA23                       $CHAR1.                             
      @105    DXPOA24                       $CHAR1.                             
      @106    DXPOA25                       $CHAR1.                             
      @107    DXPOA26                       $CHAR1.                             
      @108    DXPOA27                       $CHAR1.                             
      @109    DXPOA28                       $CHAR1.                             
      @110    DXPOA29                       $CHAR1.                             
      @111    DXPOA30                       $CHAR1.                             
      @112    DXPOA31                       $CHAR1.                             
      @113    DXPOA32                       $CHAR1.                             
      @114    DXPOA33                       $CHAR1.                             
      @115    DXPOA34                       $CHAR1.                             
      @116    DXPOA35                       $CHAR1.                             
      @117    DXPOA36                       $CHAR1.                             
      @118    DXPOA37                       $CHAR1.                             
      @119    DXPOA38                       $CHAR1.                             
      @120    DXPOA39                       $CHAR1.                             
      @121    DXPOA40                       $CHAR1.                             
      @122    DXPOA41                       $CHAR1.                             
      @123    DXPOA42                       $CHAR1.                             
      @124    DXPOA43                       $CHAR1.                             
      @125    DXPOA44                       $CHAR1.                             
      @126    DXPOA45                       $CHAR1.                             
      @127    DXPOA46                       $CHAR1.                             
      @128    DXPOA47                       $CHAR1.                             
      @129    DXPOA48                       $CHAR1.                             
      @130    DXPOA49                       $CHAR1.                             
      @131    DXPOA50                       $CHAR1.                             
      @132    DXPOA51                       $CHAR1.                             
      @133    DXPOA52                       $CHAR1.                             
      @134    DXPOA53                       $CHAR1.                             
      @135    DXPOA54                       $CHAR1.                             
      @136    DXPOA55                       $CHAR1.                             
      @137    DXPOA56                       $CHAR1.                             
      @138    DXPOA57                       $CHAR1.                             
      @139    DXPOA58                       $CHAR1.                             
      @140    DXPOA59                       $CHAR1.                             
      @141    DXPOA60                       $CHAR1.                             
      @142    DXPOA61                       $CHAR1.                             
      @143    DXPOA62                       $CHAR1.                             
      @144    DXPOA63                       $CHAR1.                             
      @145    DXPOA64                       $CHAR1.                             
      @146    DXPOA65                       $CHAR1.                             
      @147    DXPOA66                       $CHAR1.                             
      @148    DXPOA67                       $CHAR1.                             
      @149    DXPOA68                       $CHAR1.                             
      @150    DXPOA69                       $CHAR1.                             
      @151    DXPOA70                       $CHAR1.                             
      @152    DXPOA71                       $CHAR1.                             
      @153    DXVER                         N3PF.                               
      @156    E_POA1                        $CHAR1.                             
      @157    E_POA2                        $CHAR1.                             
      @158    E_POA3                        $CHAR1.                             
      @159    E_POA4                        $CHAR1.                             
      @160    E_POA5                        $CHAR1.                             
      @161    E_POA6                        $CHAR1.                             
      @162    E_POA7                        $CHAR1.                             
      @163    E_POA8                        $CHAR1.                             
      @164    E_POA9                        $CHAR1.                             
      @165    E_POA10                       $CHAR1.                             
      @166    E_POA11                       $CHAR1.                             
      @167    FEMALE                        N2PF.                               
      @169    HCUP_ED                       N2PF.                               
      @171    HCUP_OS                       N2PF.                               
      @173    HISPANIC                      N2PF.                               
      @175    HISPANIC_X                    $CHAR15.                            
      @190    Homeless                      N2PF.                               
      @192    HOSPST                        $CHAR2.                             
      @194    I10_DX_Admitting              $CHAR7.                             
      @201    I10_DX1                       $CHAR7.                             
      @208    I10_DX2                       $CHAR7.                             
      @215    I10_DX3                       $CHAR7.                             
      @222    I10_DX4                       $CHAR7.                             
      @229    I10_DX5                       $CHAR7.                             
      @236    I10_DX6                       $CHAR7.                             
      @243    I10_DX7                       $CHAR7.                             
      @250    I10_DX8                       $CHAR7.                             
      @257    I10_DX9                       $CHAR7.                             
      @264    I10_DX10                      $CHAR7.                             
      @271    I10_DX11                      $CHAR7.                             
      @278    I10_DX12                      $CHAR7.                             
      @285    I10_DX13                      $CHAR7.                             
      @292    I10_DX14                      $CHAR7.                             
      @299    I10_DX15                      $CHAR7.                             
      @306    I10_DX16                      $CHAR7.                             
      @313    I10_DX17                      $CHAR7.                             
      @320    I10_DX18                      $CHAR7.                             
      @327    I10_DX19                      $CHAR7.                             
      @334    I10_DX20                      $CHAR7.                             
      @341    I10_DX21                      $CHAR7.                             
      @348    I10_DX22                      $CHAR7.                             
      @355    I10_DX23                      $CHAR7.                             
      @362    I10_DX24                      $CHAR7.                             
      @369    I10_DX25                      $CHAR7.                             
      @376    I10_DX26                      $CHAR7.                             
      @383    I10_DX27                      $CHAR7.                             
      @390    I10_DX28                      $CHAR7.                             
      @397    I10_DX29                      $CHAR7.                             
      @404    I10_DX30                      $CHAR7.                             
      @411    I10_DX31                      $CHAR7.                             
      @418    I10_DX32                      $CHAR7.                             
      @425    I10_DX33                      $CHAR7.                             
      @432    I10_DX34                      $CHAR7.                             
      @439    I10_DX35                      $CHAR7.                             
      @446    I10_DX36                      $CHAR7.                             
      @453    I10_DX37                      $CHAR7.                             
      @460    I10_DX38                      $CHAR7.                             
      @467    I10_DX39                      $CHAR7.                             
      @474    I10_DX40                      $CHAR7.                             
      @481    I10_DX41                      $CHAR7.                             
      @488    I10_DX42                      $CHAR7.                             
      @495    I10_DX43                      $CHAR7.                             
      @502    I10_DX44                      $CHAR7.                             
      @509    I10_DX45                      $CHAR7.                             
      @516    I10_DX46                      $CHAR7.                             
      @523    I10_DX47                      $CHAR7.                             
      @530    I10_DX48                      $CHAR7.                             
      @537    I10_DX49                      $CHAR7.                             
      @544    I10_DX50                      $CHAR7.                             
      @551    I10_DX51                      $CHAR7.                             
      @558    I10_DX52                      $CHAR7.                             
      @565    I10_DX53                      $CHAR7.                             
      @572    I10_DX54                      $CHAR7.                             
      @579    I10_DX55                      $CHAR7.                             
      @586    I10_DX56                      $CHAR7.                             
      @593    I10_DX57                      $CHAR7.                             
      @600    I10_DX58                      $CHAR7.                             
      @607    I10_DX59                      $CHAR7.                             
      @614    I10_DX60                      $CHAR7.                             
      @621    I10_DX61                      $CHAR7.                             
      @628    I10_DX62                      $CHAR7.                             
      @635    I10_DX63                      $CHAR7.                             
      @642    I10_DX64                      $CHAR7.                             
      @649    I10_DX65                      $CHAR7.                             
      @656    I10_DX66                      $CHAR7.                             
      @663    I10_DX67                      $CHAR7.                             
      @670    I10_DX68                      $CHAR7.                             
      @677    I10_DX69                      $CHAR7.                             
      @684    I10_DX70                      $CHAR7.                             
      @691    I10_DX71                      $CHAR7.                             
      @698    I10_DXCCS1                    N4PF.                               
      @702    I10_DXCCS2                    N4PF.                               
      @706    I10_DXCCS3                    N4PF.                               
      @710    I10_DXCCS4                    N4PF.                               
      @714    I10_DXCCS5                    N4PF.                               
      @718    I10_DXCCS6                    N4PF.                               
      @722    I10_DXCCS7                    N4PF.                               
      @726    I10_DXCCS8                    N4PF.                               
      @730    I10_DXCCS9                    N4PF.                               
      @734    I10_DXCCS10                   N4PF.                               
      @738    I10_DXCCS11                   N4PF.                               
      @742    I10_DXCCS12                   N4PF.                               
      @746    I10_DXCCS13                   N4PF.                               
      @750    I10_DXCCS14                   N4PF.                               
      @754    I10_DXCCS15                   N4PF.                               
      @758    I10_DXCCS16                   N4PF.                               
      @762    I10_DXCCS17                   N4PF.                               
      @766    I10_DXCCS18                   N4PF.                               
      @770    I10_DXCCS19                   N4PF.                               
      @774    I10_DXCCS20                   N4PF.                               
      @778    I10_DXCCS21                   N4PF.                               
      @782    I10_DXCCS22                   N4PF.                               
      @786    I10_DXCCS23                   N4PF.                               
      @790    I10_DXCCS24                   N4PF.                               
      @794    I10_DXCCS25                   N4PF.                               
      @798    I10_DXCCS26                   N4PF.                               
      @802    I10_DXCCS27                   N4PF.                               
      @806    I10_DXCCS28                   N4PF.                               
      @810    I10_DXCCS29                   N4PF.                               
      @814    I10_DXCCS30                   N4PF.                               
      @818    I10_DXCCS31                   N4PF.                               
      @822    I10_DXCCS32                   N4PF.                               
      @826    I10_DXCCS33                   N4PF.                               
      @830    I10_DXCCS34                   N4PF.                               
      @834    I10_DXCCS35                   N4PF.                               
      @838    I10_DXCCS36                   N4PF.                               
      @842    I10_DXCCS37                   N4PF.                               
      @846    I10_DXCCS38                   N4PF.                               
      @850    I10_DXCCS39                   N4PF.                               
      @854    I10_DXCCS40                   N4PF.                               
      @858    I10_DXCCS41                   N4PF.                               
      @862    I10_DXCCS42                   N4PF.                               
      @866    I10_DXCCS43                   N4PF.                               
      @870    I10_DXCCS44                   N4PF.                               
      @874    I10_DXCCS45                   N4PF.                               
      @878    I10_DXCCS46                   N4PF.                               
      @882    I10_DXCCS47                   N4PF.                               
      @886    I10_DXCCS48                   N4PF.                               
      @890    I10_DXCCS49                   N4PF.                               
      @894    I10_DXCCS50                   N4PF.                               
      @898    I10_DXCCS51                   N4PF.                               
      @902    I10_DXCCS52                   N4PF.                               
      @906    I10_DXCCS53                   N4PF.                               
      @910    I10_DXCCS54                   N4PF.                               
      @914    I10_DXCCS55                   N4PF.                               
      @918    I10_DXCCS56                   N4PF.                               
      @922    I10_DXCCS57                   N4PF.                               
      @926    I10_DXCCS58                   N4PF.                               
      @930    I10_DXCCS59                   N4PF.                               
      @934    I10_DXCCS60                   N4PF.                               
      @938    I10_DXCCS61                   N4PF.                               
      @942    I10_DXCCS62                   N4PF.                               
      @946    I10_DXCCS63                   N4PF.                               
      @950    I10_DXCCS64                   N4PF.                               
      @954    I10_DXCCS65                   N4PF.                               
      @958    I10_DXCCS66                   N4PF.                               
      @962    I10_DXCCS67                   N4PF.                               
      @966    I10_DXCCS68                   N4PF.                               
      @970    I10_DXCCS69                   N4PF.                               
      @974    I10_DXCCS70                   N4PF.                               
      @978    I10_DXCCS71                   N4PF.                               
      @982    I10_ECAUSE1                   $CHAR7.                             
      @989    I10_ECAUSE2                   $CHAR7.                             
      @996    I10_ECAUSE3                   $CHAR7.                             
      @1003   I10_ECAUSE4                   $CHAR7.                             
      @1010   I10_ECAUSE5                   $CHAR7.                             
      @1017   I10_ECAUSE6                   $CHAR7.                             
      @1024   I10_ECAUSE7                   $CHAR7.                             
      @1031   I10_ECAUSE8                   $CHAR7.                             
      @1038   I10_ECAUSE9                   $CHAR7.                             
      @1045   I10_ECAUSE10                  $CHAR7.                             
      @1052   I10_ECAUSE11                  $CHAR7.                             
      @1059   I10_ECauseCCS1                N4PF.                               
      @1063   I10_ECauseCCS2                N4PF.                               
      @1067   I10_ECauseCCS3                N4PF.                               
      @1071   I10_ECauseCCS4                N4PF.                               
      @1075   I10_ECauseCCS5                N4PF.                               
      @1079   I10_ECauseCCS6                N4PF.                               
      @1083   I10_ECauseCCS7                N4PF.                               
      @1087   I10_ECauseCCS8                N4PF.                               
      @1091   I10_ECauseCCS9                N4PF.                               
      @1095   I10_ECauseCCS10               N4PF.                               
      @1099   I10_ECauseCCS11               N4PF.                               
      @1103   I10_HOSPBRTH                  N3PF.                               
      @1106   I10_NCHRONIC                  N3PF.                               
      @1109   I10_NDX                       N3PF.                               
      @1112   I10_NECAUSE                   N2PF.                               
      @1114   I10_NEOMAT                    N2PF.                               
      @1116   I10_NPR                       N3PF.                               
      @1119   I10_ORPROC                    N2PF.                               
      @1121   I10_PR1                       $CHAR7.                             
      @1128   I10_PR2                       $CHAR7.                             
      @1135   I10_PR3                       $CHAR7.                             
      @1142   I10_PR4                       $CHAR7.                             
      @1149   I10_PR5                       $CHAR7.                             
      @1156   I10_PR6                       $CHAR7.                             
      @1163   I10_PR7                       $CHAR7.                             
      @1170   I10_PR8                       $CHAR7.                             
      @1177   I10_PR9                       $CHAR7.                             
      @1184   I10_PR10                      $CHAR7.                             
      @1191   I10_PR11                      $CHAR7.                             
      @1198   I10_PR12                      $CHAR7.                             
      @1205   I10_PR13                      $CHAR7.                             
      @1212   I10_PR14                      $CHAR7.                             
      @1219   I10_PR15                      $CHAR7.                             
      @1226   I10_PR16                      $CHAR7.                             
      @1233   I10_PR17                      $CHAR7.                             
      @1240   I10_PR18                      $CHAR7.                             
      @1247   I10_PR19                      $CHAR7.                             
      @1254   I10_PR20                      $CHAR7.                             
      @1261   I10_PR21                      $CHAR7.                             
      @1268   I10_PR22                      $CHAR7.                             
      @1275   I10_PR23                      $CHAR7.                             
      @1282   I10_PR24                      $CHAR7.                             
      @1289   I10_PR25                      $CHAR7.                             
      @1296   I10_PR26                      $CHAR7.                             
      @1303   I10_PR27                      $CHAR7.                             
      @1310   I10_PR28                      $CHAR7.                             
      @1317   I10_PR29                      $CHAR7.                             
      @1324   I10_PR30                      $CHAR7.                             
      @1331   I10_PR31                      $CHAR7.                             
      @1338   I10_PR32                      $CHAR7.                             
      @1345   I10_PR33                      $CHAR7.                             
      @1352   I10_PR34                      $CHAR7.                             
      @1359   I10_PR35                      $CHAR7.                             
      @1366   I10_PR36                      $CHAR7.                             
      @1373   I10_PR37                      $CHAR7.                             
      @1380   I10_PR38                      $CHAR7.                             
      @1387   I10_PR39                      $CHAR7.                             
      @1394   I10_PR40                      $CHAR7.                             
      @1401   I10_PR41                      $CHAR7.                             
      @1408   I10_PR42                      $CHAR7.                             
      @1415   I10_PR43                      $CHAR7.                             
      @1422   I10_PR44                      $CHAR7.                             
      @1429   I10_PR45                      $CHAR7.                             
      @1436   I10_PR46                      $CHAR7.                             
      @1443   I10_PR47                      $CHAR7.                             
      @1450   I10_PR48                      $CHAR7.                             
      @1457   I10_PR49                      $CHAR7.                             
      @1464   I10_PR50                      $CHAR7.                             
      @1471   I10_PR51                      $CHAR7.                             
      @1478   I10_PR52                      $CHAR7.                             
      @1485   I10_PR53                      $CHAR7.                             
      @1492   I10_PR54                      $CHAR7.                             
      @1499   I10_PR55                      $CHAR7.                             
      @1506   I10_PR56                      $CHAR7.                             
      @1513   I10_PR57                      $CHAR7.                             
      @1520   I10_PR58                      $CHAR7.                             
      @1527   I10_PR59                      $CHAR7.                             
      @1534   I10_PR60                      $CHAR7.                             
      @1541   I10_PR61                      $CHAR7.                             
      @1548   I10_PR62                      $CHAR7.                             
      @1555   I10_PR63                      $CHAR7.                             
      @1562   I10_PR64                      $CHAR7.                             
      @1569   I10_PR65                      $CHAR7.                             
      @1576   I10_PR66                      $CHAR7.                             
      @1583   I10_PRCCS1                    N3PF.                               
      @1586   I10_PRCCS2                    N3PF.                               
      @1589   I10_PRCCS3                    N3PF.                               
      @1592   I10_PRCCS4                    N3PF.                               
      @1595   I10_PRCCS5                    N3PF.                               
      @1598   I10_PRCCS6                    N3PF.                               
      @1601   I10_PRCCS7                    N3PF.                               
      @1604   I10_PRCCS8                    N3PF.                               
      @1607   I10_PRCCS9                    N3PF.                               
      @1610   I10_PRCCS10                   N3PF.                               
      @1613   I10_PRCCS11                   N3PF.                               
      @1616   I10_PRCCS12                   N3PF.                               
      @1619   I10_PRCCS13                   N3PF.                               
      @1622   I10_PRCCS14                   N3PF.                               
      @1625   I10_PRCCS15                   N3PF.                               
      @1628   I10_PRCCS16                   N3PF.                               
      @1631   I10_PRCCS17                   N3PF.                               
      @1634   I10_PRCCS18                   N3PF.                               
      @1637   I10_PRCCS19                   N3PF.                               
      @1640   I10_PRCCS20                   N3PF.                               
      @1643   I10_PRCCS21                   N3PF.                               
      @1646   I10_PRCCS22                   N3PF.                               
      @1649   I10_PRCCS23                   N3PF.                               
      @1652   I10_PRCCS24                   N3PF.                               
      @1655   I10_PRCCS25                   N3PF.                               
      @1658   I10_PRCCS26                   N3PF.                               
      @1661   I10_PRCCS27                   N3PF.                               
      @1664   I10_PRCCS28                   N3PF.                               
      @1667   I10_PRCCS29                   N3PF.                               
      @1670   I10_PRCCS30                   N3PF.                               
      @1673   I10_PRCCS31                   N3PF.                               
      @1676   I10_PRCCS32                   N3PF.                               
      @1679   I10_PRCCS33                   N3PF.                               
      @1682   I10_PRCCS34                   N3PF.                               
      @1685   I10_PRCCS35                   N3PF.                               
      @1688   I10_PRCCS36                   N3PF.                               
      @1691   I10_PRCCS37                   N3PF.                               
      @1694   I10_PRCCS38                   N3PF.                               
      @1697   I10_PRCCS39                   N3PF.                               
      @1700   I10_PRCCS40                   N3PF.                               
      @1703   I10_PRCCS41                   N3PF.                               
      @1706   I10_PRCCS42                   N3PF.                               
      @1709   I10_PRCCS43                   N3PF.                               
      @1712   I10_PRCCS44                   N3PF.                               
      @1715   I10_PRCCS45                   N3PF.                               
      @1718   I10_PRCCS46                   N3PF.                               
      @1721   I10_PRCCS47                   N3PF.                               
      @1724   I10_PRCCS48                   N3PF.                               
      @1727   I10_PRCCS49                   N3PF.                               
      @1730   I10_PRCCS50                   N3PF.                               
      @1733   I10_PRCCS51                   N3PF.                               
      @1736   I10_PRCCS52                   N3PF.                               
      @1739   I10_PRCCS53                   N3PF.                               
      @1742   I10_PRCCS54                   N3PF.                               
      @1745   I10_PRCCS55                   N3PF.                               
      @1748   I10_PRCCS56                   N3PF.                               
      @1751   I10_PRCCS57                   N3PF.                               
      @1754   I10_PRCCS58                   N3PF.                               
      @1757   I10_PRCCS59                   N3PF.                               
      @1760   I10_PRCCS60                   N3PF.                               
      @1763   I10_PRCCS61                   N3PF.                               
      @1766   I10_PRCCS62                   N3PF.                               
      @1769   I10_PRCCS63                   N3PF.                               
      @1772   I10_PRCCS64                   N3PF.                               
      @1775   I10_PRCCS65                   N3PF.                               
      @1778   I10_PRCCS66                   N3PF.                               
      @1781   I10_PROCTYPE                  N3PF.                               
      @1784   I10_SERVICELINE               N2PF.                               
      @1786   KEY                           15.                                 
      @1801   LOS                           N5PF.                               
      @1806   LOS_X                         N6PF.                               
      @1812   MDC                           N2PF.                               
      @1814   MDC_NoPOA                     N2PF.                               
      @1816   MDC32                         N2PF.                               
      @1818   MEDINCSTQ                     N2PF.                               
      @1820   OS_TIME                       N11P2F.                             
      @1831   PAY1                          N2PF.                               
      @1833   PAY1_X                        $CHAR1.                             
      @1834   PAY2                          N2PF.                               
      @1836   PAY2_X                        $CHAR1.                             
      @1837   PAYER1_X                      $CHAR3.                             
      @1840   PAYER2_X                      $CHAR3.                             
      @1843   PL_CBSA                       N3PF.                               
      @1846   PL_UR_CAT4                    N2PF.                               
      @1848   POA_Disch_Edit1               N2PF.                               
      @1850   POA_Disch_Edit2               N2PF.                               
      @1852   POA_Hosp_Edit1                N2PF.                               
      @1854   POA_Hosp_Edit2                N2PF.                               
      @1856   POA_Hosp_Edit3                N2PF.                               
      @1858   POA_Hosp_Edit3_Value          N8P2F.                              
      @1866   PRDAY1                        N5PF.                               
      @1871   PRDAY2                        N5PF.                               
      @1876   PRDAY3                        N5PF.                               
      @1881   PRDAY4                        N5PF.                               
      @1886   PRDAY5                        N5PF.                               
      @1891   PRDAY6                        N5PF.                               
      @1896   PRDAY7                        N5PF.                               
      @1901   PRDAY8                        N5PF.                               
      @1906   PRDAY9                        N5PF.                               
      @1911   PRDAY10                       N5PF.                               
      @1916   PRDAY11                       N5PF.                               
      @1921   PRDAY12                       N5PF.                               
      @1926   PRDAY13                       N5PF.                               
      @1931   PRDAY14                       N5PF.                               
      @1936   PRDAY15                       N5PF.                               
      @1941   PRDAY16                       N5PF.                               
      @1946   PRDAY17                       N5PF.                               
      @1951   PRDAY18                       N5PF.                               
      @1956   PRDAY19                       N5PF.                               
      @1961   PRDAY20                       N5PF.                               
      @1966   PRDAY21                       N5PF.                               
      @1971   PRDAY22                       N5PF.                               
      @1976   PRDAY23                       N5PF.                               
      @1981   PRDAY24                       N5PF.                               
      @1986   PRDAY25                       N5PF.                               
      @1991   PRDAY26                       N5PF.                               
      @1996   PRDAY27                       N5PF.                               
      @2001   PRDAY28                       N5PF.                               
      @2006   PRDAY29                       N5PF.                               
      @2011   PRDAY30                       N5PF.                               
      @2016   PRDAY31                       N5PF.                               
      @2021   PRDAY32                       N5PF.                               
      @2026   PRDAY33                       N5PF.                               
      @2031   PRDAY34                       N5PF.                               
      @2036   PRDAY35                       N5PF.                               
      @2041   PRDAY36                       N5PF.                               
      @2046   PRDAY37                       N5PF.                               
      @2051   PRDAY38                       N5PF.                               
      @2056   PRDAY39                       N5PF.                               
      @2061   PRDAY40                       N5PF.                               
      @2066   PRDAY41                       N5PF.                               
      @2071   PRDAY42                       N5PF.                               
      @2076   PRDAY43                       N5PF.                               
      @2081   PRDAY44                       N5PF.                               
      @2086   PRDAY45                       N5PF.                               
      @2091   PRDAY46                       N5PF.                               
      @2096   PRDAY47                       N5PF.                               
      @2101   PRDAY48                       N5PF.                               
      @2106   PRDAY49                       N5PF.                               
      @2111   PRDAY50                       N5PF.                               
      @2116   PRDAY51                       N5PF.                               
      @2121   PRDAY52                       N5PF.                               
      @2126   PRDAY53                       N5PF.                               
      @2131   PRDAY54                       N5PF.                               
      @2136   PRDAY55                       N5PF.                               
      @2141   PRDAY56                       N5PF.                               
      @2146   PRDAY57                       N5PF.                               
      @2151   PRDAY58                       N5PF.                               
      @2156   PRDAY59                       N5PF.                               
      @2161   PRDAY60                       N5PF.                               
      @2166   PRDAY61                       N5PF.                               
      @2171   PRDAY62                       N5PF.                               
      @2176   PRDAY63                       N5PF.                               
      @2181   PRDAY64                       N5PF.                               
      @2186   PRDAY65                       N5PF.                               
      @2191   PRDAY66                       N5PF.                               
      @2196   PRVER                         N3PF.                               
      @2199   PSTATE                        $CHAR2.                             
      @2201   PSTCO2                        N5PF.                               
      @2206   RACE                          N2PF.                               
      @2208   RACE_X                        $CHAR13.                            
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
