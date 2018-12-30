/*******************************************************************            
* Creation Date: 11/28/2018                                                     
*   MN_SID_2017_CORE.SAS:                                                       
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
DATA MN_SIDC_2017_CORE;                                                         
INFILE 'MN_SID_2017_CORE.ASC' FIRSTOBS=3 LRECL = 2878;                          
                                                                                
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
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Admission Hour"                                                        
                                                                                
  AMDC                       LENGTH=3                                           
  LABEL="All Patient Refined MDC"                                               
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="Type of bill, UB-04 coding"                                            
                                                                                
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
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
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
                                                                                
  DXPOA72                    LENGTH=$1                                          
  LABEL="Diagnosis 72, present on admission indicator"                          
                                                                                
  DXPOA73                    LENGTH=$1                                          
  LABEL="Diagnosis 73, present on admission indicator"                          
                                                                                
  DXPOA74                    LENGTH=$1                                          
  LABEL="Diagnosis 74, present on admission indicator"                          
                                                                                
  DXPOA75                    LENGTH=$1                                          
  LABEL="Diagnosis 75, present on admission indicator"                          
                                                                                
  DXPOA76                    LENGTH=$1                                          
  LABEL="Diagnosis 76, present on admission indicator"                          
                                                                                
  DXPOA77                    LENGTH=$1                                          
  LABEL="Diagnosis 77, present on admission indicator"                          
                                                                                
  DXPOA78                    LENGTH=$1                                          
  LABEL="Diagnosis 78, present on admission indicator"                          
                                                                                
  DXPOA79                    LENGTH=$1                                          
  LABEL="Diagnosis 79, present on admission indicator"                          
                                                                                
  DXPOA80                    LENGTH=$1                                          
  LABEL="Diagnosis 80, present on admission indicator"                          
                                                                                
  DXPOA81                    LENGTH=$1                                          
  LABEL="Diagnosis 81, present on admission indicator"                          
                                                                                
  DXPOA82                    LENGTH=$1                                          
  LABEL="Diagnosis 82, present on admission indicator"                          
                                                                                
  DXPOA83                    LENGTH=$1                                          
  LABEL="Diagnosis 83, present on admission indicator"                          
                                                                                
  DXPOA84                    LENGTH=$1                                          
  LABEL="Diagnosis 84, present on admission indicator"                          
                                                                                
  DXPOA85                    LENGTH=$1                                          
  LABEL="Diagnosis 85, present on admission indicator"                          
                                                                                
  DXPOA86                    LENGTH=$1                                          
  LABEL="Diagnosis 86, present on admission indicator"                          
                                                                                
  DXPOA87                    LENGTH=$1                                          
  LABEL="Diagnosis 87, present on admission indicator"                          
                                                                                
  DXPOA88                    LENGTH=$1                                          
  LABEL="Diagnosis 88, present on admission indicator"                          
                                                                                
  DXPOA89                    LENGTH=$1                                          
  LABEL="Diagnosis 89, present on admission indicator"                          
                                                                                
  DXPOA90                    LENGTH=$1                                          
  LABEL="Diagnosis 90, present on admission indicator"                          
                                                                                
  DXPOA91                    LENGTH=$1                                          
  LABEL="Diagnosis 91, present on admission indicator"                          
                                                                                
  DXPOA92                    LENGTH=$1                                          
  LABEL="Diagnosis 92, present on admission indicator"                          
                                                                                
  DXPOA93                    LENGTH=$1                                          
  LABEL="Diagnosis 93, present on admission indicator"                          
                                                                                
  DXPOA94                    LENGTH=$1                                          
  LABEL="Diagnosis 94, present on admission indicator"                          
                                                                                
  DXPOA95                    LENGTH=$1                                          
  LABEL="Diagnosis 95, present on admission indicator"                          
                                                                                
  DXPOA96                    LENGTH=$1                                          
  LABEL="Diagnosis 96, present on admission indicator"                          
                                                                                
  DXPOA97                    LENGTH=$1                                          
  LABEL="Diagnosis 97, present on admission indicator"                          
                                                                                
  DXPOA98                    LENGTH=$1                                          
  LABEL="Diagnosis 98, present on admission indicator"                          
                                                                                
  DXPOA99                    LENGTH=$1                                          
  LABEL="Diagnosis 99, present on admission indicator"                          
                                                                                
  DXPOA100                   LENGTH=$1                                          
  LABEL="Diagnosis 100, present on admission indicator"                         
                                                                                
  DXPOA101                   LENGTH=$1                                          
  LABEL="Diagnosis 101, present on admission indicator"                         
                                                                                
  DXPOA102                   LENGTH=$1                                          
  LABEL="Diagnosis 102, present on admission indicator"                         
                                                                                
  DXPOA103                   LENGTH=$1                                          
  LABEL="Diagnosis 103, present on admission indicator"                         
                                                                                
  DXPOA104                   LENGTH=$1                                          
  LABEL="Diagnosis 104, present on admission indicator"                         
                                                                                
  DXPOA105                   LENGTH=$1                                          
  LABEL="Diagnosis 105, present on admission indicator"                         
                                                                                
  DXPOA106                   LENGTH=$1                                          
  LABEL="Diagnosis 106, present on admission indicator"                         
                                                                                
  DXPOA107                   LENGTH=$1                                          
  LABEL="Diagnosis 107, present on admission indicator"                         
                                                                                
  DXPOA108                   LENGTH=$1                                          
  LABEL="Diagnosis 108, present on admission indicator"                         
                                                                                
  DXPOA109                   LENGTH=$1                                          
  LABEL="Diagnosis 109, present on admission indicator"                         
                                                                                
  DXPOA110                   LENGTH=$1                                          
  LABEL="Diagnosis 110, present on admission indicator"                         
                                                                                
  DXPOA111                   LENGTH=$1                                          
  LABEL="Diagnosis 111, present on admission indicator"                         
                                                                                
  DXPOA112                   LENGTH=$1                                          
  LABEL="Diagnosis 112, present on admission indicator"                         
                                                                                
  DXPOA113                   LENGTH=$1                                          
  LABEL="Diagnosis 113, present on admission indicator"                         
                                                                                
  DXPOA114                   LENGTH=$1                                          
  LABEL="Diagnosis 114, present on admission indicator"                         
                                                                                
  DXPOA115                   LENGTH=$1                                          
  LABEL="Diagnosis 115, present on admission indicator"                         
                                                                                
  DXPOA116                   LENGTH=$1                                          
  LABEL="Diagnosis 116, present on admission indicator"                         
                                                                                
  DXPOA117                   LENGTH=$1                                          
  LABEL="Diagnosis 117, present on admission indicator"                         
                                                                                
  DXPOA118                   LENGTH=$1                                          
  LABEL="Diagnosis 118, present on admission indicator"                         
                                                                                
  DXPOA119                   LENGTH=$1                                          
  LABEL="Diagnosis 119, present on admission indicator"                         
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$20                                         
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
                                                                                
  I10_DX72                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 72"                                                
                                                                                
  I10_DX73                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 73"                                                
                                                                                
  I10_DX74                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 74"                                                
                                                                                
  I10_DX75                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 75"                                                
                                                                                
  I10_DX76                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 76"                                                
                                                                                
  I10_DX77                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 77"                                                
                                                                                
  I10_DX78                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 78"                                                
                                                                                
  I10_DX79                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 79"                                                
                                                                                
  I10_DX80                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 80"                                                
                                                                                
  I10_DX81                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 81"                                                
                                                                                
  I10_DX82                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 82"                                                
                                                                                
  I10_DX83                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 83"                                                
                                                                                
  I10_DX84                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 84"                                                
                                                                                
  I10_DX85                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 85"                                                
                                                                                
  I10_DX86                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 86"                                                
                                                                                
  I10_DX87                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 87"                                                
                                                                                
  I10_DX88                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 88"                                                
                                                                                
  I10_DX89                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 89"                                                
                                                                                
  I10_DX90                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 90"                                                
                                                                                
  I10_DX91                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 91"                                                
                                                                                
  I10_DX92                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 92"                                                
                                                                                
  I10_DX93                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 93"                                                
                                                                                
  I10_DX94                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 94"                                                
                                                                                
  I10_DX95                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 95"                                                
                                                                                
  I10_DX96                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 96"                                                
                                                                                
  I10_DX97                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 97"                                                
                                                                                
  I10_DX98                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 98"                                                
                                                                                
  I10_DX99                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 99"                                                
                                                                                
  I10_DX100                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 100"                                               
                                                                                
  I10_DX101                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 101"                                               
                                                                                
  I10_DX102                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 102"                                               
                                                                                
  I10_DX103                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 103"                                               
                                                                                
  I10_DX104                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 104"                                               
                                                                                
  I10_DX105                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 105"                                               
                                                                                
  I10_DX106                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 106"                                               
                                                                                
  I10_DX107                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 107"                                               
                                                                                
  I10_DX108                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 108"                                               
                                                                                
  I10_DX109                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 109"                                               
                                                                                
  I10_DX110                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 110"                                               
                                                                                
  I10_DX111                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 111"                                               
                                                                                
  I10_DX112                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 112"                                               
                                                                                
  I10_DX113                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 113"                                               
                                                                                
  I10_DX114                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 114"                                               
                                                                                
  I10_DX115                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 115"                                               
                                                                                
  I10_DX116                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 116"                                               
                                                                                
  I10_DX117                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 117"                                               
                                                                                
  I10_DX118                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 118"                                               
                                                                                
  I10_DX119                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 119"                                               
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NPR                    LENGTH=3                                           
  LABEL="ICD-10-PCS Number of procedures on this record"                        
                                                                                
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
                                                                                
  I10_PR67                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 67"                                               
                                                                                
  I10_PR68                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 68"                                               
                                                                                
  I10_PR69                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 69"                                               
                                                                                
  I10_PR70                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 70"                                               
                                                                                
  I10_PR71                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 71"                                               
                                                                                
  I10_PR72                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 72"                                               
                                                                                
  I10_PR73                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 73"                                               
                                                                                
  I10_PR74                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 74"                                               
                                                                                
  I10_PR75                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 75"                                               
                                                                                
  I10_PR76                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 76"                                               
                                                                                
  I10_PR77                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 77"                                               
                                                                                
  I10_PR78                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 78"                                               
                                                                                
  I10_PR79                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 79"                                               
                                                                                
  I10_PR80                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 80"                                               
                                                                                
  I10_PR81                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 81"                                               
                                                                                
  I10_PR82                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 82"                                               
                                                                                
  I10_PR83                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 83"                                               
                                                                                
  I10_PR84                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 84"                                               
                                                                                
  I10_PR85                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 85"                                               
                                                                                
  I10_PR86                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 86"                                               
                                                                                
  I10_PR87                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 87"                                               
                                                                                
  I10_PR88                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 88"                                               
                                                                                
  I10_PR89                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 89"                                               
                                                                                
  I10_PR90                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 90"                                               
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$7                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$7                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$7                                          
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
                                                                                
  PRDAY67                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR67"                             
                                                                                
  PRDAY68                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR68"                             
                                                                                
  PRDAY69                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR69"                             
                                                                                
  PRDAY70                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR70"                             
                                                                                
  PRDAY71                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR71"                             
                                                                                
  PRDAY72                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR72"                             
                                                                                
  PRDAY73                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR73"                             
                                                                                
  PRDAY74                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR74"                             
                                                                                
  PRDAY75                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR75"                             
                                                                                
  PRDAY76                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR76"                             
                                                                                
  PRDAY77                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR77"                             
                                                                                
  PRDAY78                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR78"                             
                                                                                
  PRDAY79                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR79"                             
                                                                                
  PRDAY80                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR80"                             
                                                                                
  PRDAY81                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR81"                             
                                                                                
  PRDAY82                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR82"                             
                                                                                
  PRDAY83                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR83"                             
                                                                                
  PRDAY84                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR84"                             
                                                                                
  PRDAY85                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR85"                             
                                                                                
  PRDAY86                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR86"                             
                                                                                
  PRDAY87                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR87"                             
                                                                                
  PRDAY88                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR88"                             
                                                                                
  PRDAY89                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR89"                             
                                                                                
  PRDAY90                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR90"                             
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_EDIT                  LENGTH=3                                           
  LABEL="Race Edit Checks"                                                      
                                                                                
  RACE_X                     LENGTH=$20                                         
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
                                                                                
  PRMONTH67                  LENGTH=3                                           
  LABEL="Month of procedure 67"                                                 
                                                                                
  PRMONTH68                  LENGTH=3                                           
  LABEL="Month of procedure 68"                                                 
                                                                                
  PRMONTH69                  LENGTH=3                                           
  LABEL="Month of procedure 69"                                                 
                                                                                
  PRMONTH70                  LENGTH=3                                           
  LABEL="Month of procedure 70"                                                 
                                                                                
  PRMONTH71                  LENGTH=3                                           
  LABEL="Month of procedure 71"                                                 
                                                                                
  PRMONTH72                  LENGTH=3                                           
  LABEL="Month of procedure 72"                                                 
                                                                                
  PRMONTH73                  LENGTH=3                                           
  LABEL="Month of procedure 73"                                                 
                                                                                
  PRMONTH74                  LENGTH=3                                           
  LABEL="Month of procedure 74"                                                 
                                                                                
  PRMONTH75                  LENGTH=3                                           
  LABEL="Month of procedure 75"                                                 
                                                                                
  PRMONTH76                  LENGTH=3                                           
  LABEL="Month of procedure 76"                                                 
                                                                                
  PRMONTH77                  LENGTH=3                                           
  LABEL="Month of procedure 77"                                                 
                                                                                
  PRMONTH78                  LENGTH=3                                           
  LABEL="Month of procedure 78"                                                 
                                                                                
  PRMONTH79                  LENGTH=3                                           
  LABEL="Month of procedure 79"                                                 
                                                                                
  PRMONTH80                  LENGTH=3                                           
  LABEL="Month of procedure 80"                                                 
                                                                                
  PRMONTH81                  LENGTH=3                                           
  LABEL="Month of procedure 81"                                                 
                                                                                
  PRMONTH82                  LENGTH=3                                           
  LABEL="Month of procedure 82"                                                 
                                                                                
  PRMONTH83                  LENGTH=3                                           
  LABEL="Month of procedure 83"                                                 
                                                                                
  PRMONTH84                  LENGTH=3                                           
  LABEL="Month of procedure 84"                                                 
                                                                                
  PRMONTH85                  LENGTH=3                                           
  LABEL="Month of procedure 85"                                                 
                                                                                
  PRMONTH86                  LENGTH=3                                           
  LABEL="Month of procedure 86"                                                 
                                                                                
  PRMONTH87                  LENGTH=3                                           
  LABEL="Month of procedure 87"                                                 
                                                                                
  PRMONTH88                  LENGTH=3                                           
  LABEL="Month of procedure 88"                                                 
                                                                                
  PRMONTH89                  LENGTH=3                                           
  LABEL="Month of procedure 89"                                                 
                                                                                
  PRMONTH90                  LENGTH=3                                           
  LABEL="Month of procedure 90"                                                 
                                                                                
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
                                                                                
  PRYEAR67                   LENGTH=3                                           
  LABEL="Year of procedure 67"                                                  
                                                                                
  PRYEAR68                   LENGTH=3                                           
  LABEL="Year of procedure 68"                                                  
                                                                                
  PRYEAR69                   LENGTH=3                                           
  LABEL="Year of procedure 69"                                                  
                                                                                
  PRYEAR70                   LENGTH=3                                           
  LABEL="Year of procedure 70"                                                  
                                                                                
  PRYEAR71                   LENGTH=3                                           
  LABEL="Year of procedure 71"                                                  
                                                                                
  PRYEAR72                   LENGTH=3                                           
  LABEL="Year of procedure 72"                                                  
                                                                                
  PRYEAR73                   LENGTH=3                                           
  LABEL="Year of procedure 73"                                                  
                                                                                
  PRYEAR74                   LENGTH=3                                           
  LABEL="Year of procedure 74"                                                  
                                                                                
  PRYEAR75                   LENGTH=3                                           
  LABEL="Year of procedure 75"                                                  
                                                                                
  PRYEAR76                   LENGTH=3                                           
  LABEL="Year of procedure 76"                                                  
                                                                                
  PRYEAR77                   LENGTH=3                                           
  LABEL="Year of procedure 77"                                                  
                                                                                
  PRYEAR78                   LENGTH=3                                           
  LABEL="Year of procedure 78"                                                  
                                                                                
  PRYEAR79                   LENGTH=3                                           
  LABEL="Year of procedure 79"                                                  
                                                                                
  PRYEAR80                   LENGTH=3                                           
  LABEL="Year of procedure 80"                                                  
                                                                                
  PRYEAR81                   LENGTH=3                                           
  LABEL="Year of procedure 81"                                                  
                                                                                
  PRYEAR82                   LENGTH=3                                           
  LABEL="Year of procedure 82"                                                  
                                                                                
  PRYEAR83                   LENGTH=3                                           
  LABEL="Year of procedure 83"                                                  
                                                                                
  PRYEAR84                   LENGTH=3                                           
  LABEL="Year of procedure 84"                                                  
                                                                                
  PRYEAR85                   LENGTH=3                                           
  LABEL="Year of procedure 85"                                                  
                                                                                
  PRYEAR86                   LENGTH=3                                           
  LABEL="Year of procedure 86"                                                  
                                                                                
  PRYEAR87                   LENGTH=3                                           
  LABEL="Year of procedure 87"                                                  
                                                                                
  PRYEAR88                   LENGTH=3                                           
  LABEL="Year of procedure 88"                                                  
                                                                                
  PRYEAR89                   LENGTH=3                                           
  LABEL="Year of procedure 89"                                                  
                                                                                
  PRYEAR90                   LENGTH=3                                           
  LABEL="Year of procedure 90"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      ADRG                          N3PF.                               
      @4      ADRGRISKMORTALITY             N2PF.                               
      @6      ADRGSEV                       N2PF.                               
      @8      AGE                           N3PF.                               
      @11     AGEDAY                        N3PF.                               
      @14     AGEMONTH                      N3PF.                               
      @17     AHOUR                         N4PF.                               
      @21     AMDC                          N2PF.                               
      @23     AMONTH                        N2PF.                               
      @25     ATYPE                         N2PF.                               
      @27     AWEEKEND                      N2PF.                               
      @29     BILLTYPE                      $CHAR4.                             
      @33     DHOUR                         N4PF.                               
      @37     DIED                          N2PF.                               
      @39     DISP_X                        $CHAR2.                             
      @41     DISPUB04                      N2PF.                               
      @43     DISPUNIFORM                   N2PF.                               
      @45     DMONTH                        N2PF.                               
      @47     DQTR                          N2PF.                               
      @49     DRG                           N3PF.                               
      @52     DRG_NoPOA                     N3PF.                               
      @55     DRGVER                        N2PF.                               
      @57     DXPOA1                        $CHAR1.                             
      @58     DXPOA2                        $CHAR1.                             
      @59     DXPOA3                        $CHAR1.                             
      @60     DXPOA4                        $CHAR1.                             
      @61     DXPOA5                        $CHAR1.                             
      @62     DXPOA6                        $CHAR1.                             
      @63     DXPOA7                        $CHAR1.                             
      @64     DXPOA8                        $CHAR1.                             
      @65     DXPOA9                        $CHAR1.                             
      @66     DXPOA10                       $CHAR1.                             
      @67     DXPOA11                       $CHAR1.                             
      @68     DXPOA12                       $CHAR1.                             
      @69     DXPOA13                       $CHAR1.                             
      @70     DXPOA14                       $CHAR1.                             
      @71     DXPOA15                       $CHAR1.                             
      @72     DXPOA16                       $CHAR1.                             
      @73     DXPOA17                       $CHAR1.                             
      @74     DXPOA18                       $CHAR1.                             
      @75     DXPOA19                       $CHAR1.                             
      @76     DXPOA20                       $CHAR1.                             
      @77     DXPOA21                       $CHAR1.                             
      @78     DXPOA22                       $CHAR1.                             
      @79     DXPOA23                       $CHAR1.                             
      @80     DXPOA24                       $CHAR1.                             
      @81     DXPOA25                       $CHAR1.                             
      @82     DXPOA26                       $CHAR1.                             
      @83     DXPOA27                       $CHAR1.                             
      @84     DXPOA28                       $CHAR1.                             
      @85     DXPOA29                       $CHAR1.                             
      @86     DXPOA30                       $CHAR1.                             
      @87     DXPOA31                       $CHAR1.                             
      @88     DXPOA32                       $CHAR1.                             
      @89     DXPOA33                       $CHAR1.                             
      @90     DXPOA34                       $CHAR1.                             
      @91     DXPOA35                       $CHAR1.                             
      @92     DXPOA36                       $CHAR1.                             
      @93     DXPOA37                       $CHAR1.                             
      @94     DXPOA38                       $CHAR1.                             
      @95     DXPOA39                       $CHAR1.                             
      @96     DXPOA40                       $CHAR1.                             
      @97     DXPOA41                       $CHAR1.                             
      @98     DXPOA42                       $CHAR1.                             
      @99     DXPOA43                       $CHAR1.                             
      @100    DXPOA44                       $CHAR1.                             
      @101    DXPOA45                       $CHAR1.                             
      @102    DXPOA46                       $CHAR1.                             
      @103    DXPOA47                       $CHAR1.                             
      @104    DXPOA48                       $CHAR1.                             
      @105    DXPOA49                       $CHAR1.                             
      @106    DXPOA50                       $CHAR1.                             
      @107    DXPOA51                       $CHAR1.                             
      @108    DXPOA52                       $CHAR1.                             
      @109    DXPOA53                       $CHAR1.                             
      @110    DXPOA54                       $CHAR1.                             
      @111    DXPOA55                       $CHAR1.                             
      @112    DXPOA56                       $CHAR1.                             
      @113    DXPOA57                       $CHAR1.                             
      @114    DXPOA58                       $CHAR1.                             
      @115    DXPOA59                       $CHAR1.                             
      @116    DXPOA60                       $CHAR1.                             
      @117    DXPOA61                       $CHAR1.                             
      @118    DXPOA62                       $CHAR1.                             
      @119    DXPOA63                       $CHAR1.                             
      @120    DXPOA64                       $CHAR1.                             
      @121    DXPOA65                       $CHAR1.                             
      @122    DXPOA66                       $CHAR1.                             
      @123    DXPOA67                       $CHAR1.                             
      @124    DXPOA68                       $CHAR1.                             
      @125    DXPOA69                       $CHAR1.                             
      @126    DXPOA70                       $CHAR1.                             
      @127    DXPOA71                       $CHAR1.                             
      @128    DXPOA72                       $CHAR1.                             
      @129    DXPOA73                       $CHAR1.                             
      @130    DXPOA74                       $CHAR1.                             
      @131    DXPOA75                       $CHAR1.                             
      @132    DXPOA76                       $CHAR1.                             
      @133    DXPOA77                       $CHAR1.                             
      @134    DXPOA78                       $CHAR1.                             
      @135    DXPOA79                       $CHAR1.                             
      @136    DXPOA80                       $CHAR1.                             
      @137    DXPOA81                       $CHAR1.                             
      @138    DXPOA82                       $CHAR1.                             
      @139    DXPOA83                       $CHAR1.                             
      @140    DXPOA84                       $CHAR1.                             
      @141    DXPOA85                       $CHAR1.                             
      @142    DXPOA86                       $CHAR1.                             
      @143    DXPOA87                       $CHAR1.                             
      @144    DXPOA88                       $CHAR1.                             
      @145    DXPOA89                       $CHAR1.                             
      @146    DXPOA90                       $CHAR1.                             
      @147    DXPOA91                       $CHAR1.                             
      @148    DXPOA92                       $CHAR1.                             
      @149    DXPOA93                       $CHAR1.                             
      @150    DXPOA94                       $CHAR1.                             
      @151    DXPOA95                       $CHAR1.                             
      @152    DXPOA96                       $CHAR1.                             
      @153    DXPOA97                       $CHAR1.                             
      @154    DXPOA98                       $CHAR1.                             
      @155    DXPOA99                       $CHAR1.                             
      @156    DXPOA100                      $CHAR1.                             
      @157    DXPOA101                      $CHAR1.                             
      @158    DXPOA102                      $CHAR1.                             
      @159    DXPOA103                      $CHAR1.                             
      @160    DXPOA104                      $CHAR1.                             
      @161    DXPOA105                      $CHAR1.                             
      @162    DXPOA106                      $CHAR1.                             
      @163    DXPOA107                      $CHAR1.                             
      @164    DXPOA108                      $CHAR1.                             
      @165    DXPOA109                      $CHAR1.                             
      @166    DXPOA110                      $CHAR1.                             
      @167    DXPOA111                      $CHAR1.                             
      @168    DXPOA112                      $CHAR1.                             
      @169    DXPOA113                      $CHAR1.                             
      @170    DXPOA114                      $CHAR1.                             
      @171    DXPOA115                      $CHAR1.                             
      @172    DXPOA116                      $CHAR1.                             
      @173    DXPOA117                      $CHAR1.                             
      @174    DXPOA118                      $CHAR1.                             
      @175    DXPOA119                      $CHAR1.                             
      @176    DXVER                         N3PF.                               
      @179    FEMALE                        N2PF.                               
      @181    HCUP_ED                       N2PF.                               
      @183    HCUP_OS                       N2PF.                               
      @185    HISPANIC                      N2PF.                               
      @187    HISPANIC_X                    $CHAR20.                            
      @207    HOSPST                        $CHAR2.                             
      @209    I10_DX_Admitting              $CHAR7.                             
      @216    I10_DX1                       $CHAR7.                             
      @223    I10_DX2                       $CHAR7.                             
      @230    I10_DX3                       $CHAR7.                             
      @237    I10_DX4                       $CHAR7.                             
      @244    I10_DX5                       $CHAR7.                             
      @251    I10_DX6                       $CHAR7.                             
      @258    I10_DX7                       $CHAR7.                             
      @265    I10_DX8                       $CHAR7.                             
      @272    I10_DX9                       $CHAR7.                             
      @279    I10_DX10                      $CHAR7.                             
      @286    I10_DX11                      $CHAR7.                             
      @293    I10_DX12                      $CHAR7.                             
      @300    I10_DX13                      $CHAR7.                             
      @307    I10_DX14                      $CHAR7.                             
      @314    I10_DX15                      $CHAR7.                             
      @321    I10_DX16                      $CHAR7.                             
      @328    I10_DX17                      $CHAR7.                             
      @335    I10_DX18                      $CHAR7.                             
      @342    I10_DX19                      $CHAR7.                             
      @349    I10_DX20                      $CHAR7.                             
      @356    I10_DX21                      $CHAR7.                             
      @363    I10_DX22                      $CHAR7.                             
      @370    I10_DX23                      $CHAR7.                             
      @377    I10_DX24                      $CHAR7.                             
      @384    I10_DX25                      $CHAR7.                             
      @391    I10_DX26                      $CHAR7.                             
      @398    I10_DX27                      $CHAR7.                             
      @405    I10_DX28                      $CHAR7.                             
      @412    I10_DX29                      $CHAR7.                             
      @419    I10_DX30                      $CHAR7.                             
      @426    I10_DX31                      $CHAR7.                             
      @433    I10_DX32                      $CHAR7.                             
      @440    I10_DX33                      $CHAR7.                             
      @447    I10_DX34                      $CHAR7.                             
      @454    I10_DX35                      $CHAR7.                             
      @461    I10_DX36                      $CHAR7.                             
      @468    I10_DX37                      $CHAR7.                             
      @475    I10_DX38                      $CHAR7.                             
      @482    I10_DX39                      $CHAR7.                             
      @489    I10_DX40                      $CHAR7.                             
      @496    I10_DX41                      $CHAR7.                             
      @503    I10_DX42                      $CHAR7.                             
      @510    I10_DX43                      $CHAR7.                             
      @517    I10_DX44                      $CHAR7.                             
      @524    I10_DX45                      $CHAR7.                             
      @531    I10_DX46                      $CHAR7.                             
      @538    I10_DX47                      $CHAR7.                             
      @545    I10_DX48                      $CHAR7.                             
      @552    I10_DX49                      $CHAR7.                             
      @559    I10_DX50                      $CHAR7.                             
      @566    I10_DX51                      $CHAR7.                             
      @573    I10_DX52                      $CHAR7.                             
      @580    I10_DX53                      $CHAR7.                             
      @587    I10_DX54                      $CHAR7.                             
      @594    I10_DX55                      $CHAR7.                             
      @601    I10_DX56                      $CHAR7.                             
      @608    I10_DX57                      $CHAR7.                             
      @615    I10_DX58                      $CHAR7.                             
      @622    I10_DX59                      $CHAR7.                             
      @629    I10_DX60                      $CHAR7.                             
      @636    I10_DX61                      $CHAR7.                             
      @643    I10_DX62                      $CHAR7.                             
      @650    I10_DX63                      $CHAR7.                             
      @657    I10_DX64                      $CHAR7.                             
      @664    I10_DX65                      $CHAR7.                             
      @671    I10_DX66                      $CHAR7.                             
      @678    I10_DX67                      $CHAR7.                             
      @685    I10_DX68                      $CHAR7.                             
      @692    I10_DX69                      $CHAR7.                             
      @699    I10_DX70                      $CHAR7.                             
      @706    I10_DX71                      $CHAR7.                             
      @713    I10_DX72                      $CHAR7.                             
      @720    I10_DX73                      $CHAR7.                             
      @727    I10_DX74                      $CHAR7.                             
      @734    I10_DX75                      $CHAR7.                             
      @741    I10_DX76                      $CHAR7.                             
      @748    I10_DX77                      $CHAR7.                             
      @755    I10_DX78                      $CHAR7.                             
      @762    I10_DX79                      $CHAR7.                             
      @769    I10_DX80                      $CHAR7.                             
      @776    I10_DX81                      $CHAR7.                             
      @783    I10_DX82                      $CHAR7.                             
      @790    I10_DX83                      $CHAR7.                             
      @797    I10_DX84                      $CHAR7.                             
      @804    I10_DX85                      $CHAR7.                             
      @811    I10_DX86                      $CHAR7.                             
      @818    I10_DX87                      $CHAR7.                             
      @825    I10_DX88                      $CHAR7.                             
      @832    I10_DX89                      $CHAR7.                             
      @839    I10_DX90                      $CHAR7.                             
      @846    I10_DX91                      $CHAR7.                             
      @853    I10_DX92                      $CHAR7.                             
      @860    I10_DX93                      $CHAR7.                             
      @867    I10_DX94                      $CHAR7.                             
      @874    I10_DX95                      $CHAR7.                             
      @881    I10_DX96                      $CHAR7.                             
      @888    I10_DX97                      $CHAR7.                             
      @895    I10_DX98                      $CHAR7.                             
      @902    I10_DX99                      $CHAR7.                             
      @909    I10_DX100                     $CHAR7.                             
      @916    I10_DX101                     $CHAR7.                             
      @923    I10_DX102                     $CHAR7.                             
      @930    I10_DX103                     $CHAR7.                             
      @937    I10_DX104                     $CHAR7.                             
      @944    I10_DX105                     $CHAR7.                             
      @951    I10_DX106                     $CHAR7.                             
      @958    I10_DX107                     $CHAR7.                             
      @965    I10_DX108                     $CHAR7.                             
      @972    I10_DX109                     $CHAR7.                             
      @979    I10_DX110                     $CHAR7.                             
      @986    I10_DX111                     $CHAR7.                             
      @993    I10_DX112                     $CHAR7.                             
      @1000   I10_DX113                     $CHAR7.                             
      @1007   I10_DX114                     $CHAR7.                             
      @1014   I10_DX115                     $CHAR7.                             
      @1021   I10_DX116                     $CHAR7.                             
      @1028   I10_DX117                     $CHAR7.                             
      @1035   I10_DX118                     $CHAR7.                             
      @1042   I10_DX119                     $CHAR7.                             
      @1049   I10_NDX                       N3PF.                               
      @1052   I10_NPR                       N3PF.                               
      @1055   I10_PR1                       $CHAR7.                             
      @1062   I10_PR2                       $CHAR7.                             
      @1069   I10_PR3                       $CHAR7.                             
      @1076   I10_PR4                       $CHAR7.                             
      @1083   I10_PR5                       $CHAR7.                             
      @1090   I10_PR6                       $CHAR7.                             
      @1097   I10_PR7                       $CHAR7.                             
      @1104   I10_PR8                       $CHAR7.                             
      @1111   I10_PR9                       $CHAR7.                             
      @1118   I10_PR10                      $CHAR7.                             
      @1125   I10_PR11                      $CHAR7.                             
      @1132   I10_PR12                      $CHAR7.                             
      @1139   I10_PR13                      $CHAR7.                             
      @1146   I10_PR14                      $CHAR7.                             
      @1153   I10_PR15                      $CHAR7.                             
      @1160   I10_PR16                      $CHAR7.                             
      @1167   I10_PR17                      $CHAR7.                             
      @1174   I10_PR18                      $CHAR7.                             
      @1181   I10_PR19                      $CHAR7.                             
      @1188   I10_PR20                      $CHAR7.                             
      @1195   I10_PR21                      $CHAR7.                             
      @1202   I10_PR22                      $CHAR7.                             
      @1209   I10_PR23                      $CHAR7.                             
      @1216   I10_PR24                      $CHAR7.                             
      @1223   I10_PR25                      $CHAR7.                             
      @1230   I10_PR26                      $CHAR7.                             
      @1237   I10_PR27                      $CHAR7.                             
      @1244   I10_PR28                      $CHAR7.                             
      @1251   I10_PR29                      $CHAR7.                             
      @1258   I10_PR30                      $CHAR7.                             
      @1265   I10_PR31                      $CHAR7.                             
      @1272   I10_PR32                      $CHAR7.                             
      @1279   I10_PR33                      $CHAR7.                             
      @1286   I10_PR34                      $CHAR7.                             
      @1293   I10_PR35                      $CHAR7.                             
      @1300   I10_PR36                      $CHAR7.                             
      @1307   I10_PR37                      $CHAR7.                             
      @1314   I10_PR38                      $CHAR7.                             
      @1321   I10_PR39                      $CHAR7.                             
      @1328   I10_PR40                      $CHAR7.                             
      @1335   I10_PR41                      $CHAR7.                             
      @1342   I10_PR42                      $CHAR7.                             
      @1349   I10_PR43                      $CHAR7.                             
      @1356   I10_PR44                      $CHAR7.                             
      @1363   I10_PR45                      $CHAR7.                             
      @1370   I10_PR46                      $CHAR7.                             
      @1377   I10_PR47                      $CHAR7.                             
      @1384   I10_PR48                      $CHAR7.                             
      @1391   I10_PR49                      $CHAR7.                             
      @1398   I10_PR50                      $CHAR7.                             
      @1405   I10_PR51                      $CHAR7.                             
      @1412   I10_PR52                      $CHAR7.                             
      @1419   I10_PR53                      $CHAR7.                             
      @1426   I10_PR54                      $CHAR7.                             
      @1433   I10_PR55                      $CHAR7.                             
      @1440   I10_PR56                      $CHAR7.                             
      @1447   I10_PR57                      $CHAR7.                             
      @1454   I10_PR58                      $CHAR7.                             
      @1461   I10_PR59                      $CHAR7.                             
      @1468   I10_PR60                      $CHAR7.                             
      @1475   I10_PR61                      $CHAR7.                             
      @1482   I10_PR62                      $CHAR7.                             
      @1489   I10_PR63                      $CHAR7.                             
      @1496   I10_PR64                      $CHAR7.                             
      @1503   I10_PR65                      $CHAR7.                             
      @1510   I10_PR66                      $CHAR7.                             
      @1517   I10_PR67                      $CHAR7.                             
      @1524   I10_PR68                      $CHAR7.                             
      @1531   I10_PR69                      $CHAR7.                             
      @1538   I10_PR70                      $CHAR7.                             
      @1545   I10_PR71                      $CHAR7.                             
      @1552   I10_PR72                      $CHAR7.                             
      @1559   I10_PR73                      $CHAR7.                             
      @1566   I10_PR74                      $CHAR7.                             
      @1573   I10_PR75                      $CHAR7.                             
      @1580   I10_PR76                      $CHAR7.                             
      @1587   I10_PR77                      $CHAR7.                             
      @1594   I10_PR78                      $CHAR7.                             
      @1601   I10_PR79                      $CHAR7.                             
      @1608   I10_PR80                      $CHAR7.                             
      @1615   I10_PR81                      $CHAR7.                             
      @1622   I10_PR82                      $CHAR7.                             
      @1629   I10_PR83                      $CHAR7.                             
      @1636   I10_PR84                      $CHAR7.                             
      @1643   I10_PR85                      $CHAR7.                             
      @1650   I10_PR86                      $CHAR7.                             
      @1657   I10_PR87                      $CHAR7.                             
      @1664   I10_PR88                      $CHAR7.                             
      @1671   I10_PR89                      $CHAR7.                             
      @1678   I10_PR90                      $CHAR7.                             
      @1685   I10_PROCTYPE                  N3PF.                               
      @1688   KEY                           15.                                 
      @1703   LOS                           N5PF.                               
      @1708   LOS_X                         N6PF.                               
      @1714   MDC                           N2PF.                               
      @1716   MDC_NoPOA                     N2PF.                               
      @1718   MEDINCSTQ                     N2PF.                               
      @1720   MRN_R                         N9PF.                               
      @1729   OS_TIME                       N11P2F.                             
      @1740   PAY1                          N2PF.                               
      @1742   PAY1_X                        $CHAR7.                             
      @1749   PAY2                          N2PF.                               
      @1751   PAY2_X                        $CHAR7.                             
      @1758   PAY3                          N2PF.                               
      @1760   PAY3_X                        $CHAR7.                             
      @1767   PL_CBSA                       N3PF.                               
      @1770   PL_NCHS                       N2PF.                               
      @1772   PL_RUCC                       N2PF.                               
      @1774   PL_UIC                        N2PF.                               
      @1776   PL_UR_CAT4                    N2PF.                               
      @1778   POA_Disch_Edit1               N2PF.                               
      @1780   POA_Disch_Edit2               N2PF.                               
      @1782   POA_Hosp_Edit1                N2PF.                               
      @1784   POA_Hosp_Edit2                N2PF.                               
      @1786   POA_Hosp_Edit3                N2PF.                               
      @1788   POA_Hosp_Edit3_Value          N8P2F.                              
      @1796   PointOfOrigin_X               $CHAR1.                             
      @1797   PointOfOriginUB04             $CHAR1.                             
      @1798   PRDAY1                        N5PF.                               
      @1803   PRDAY2                        N5PF.                               
      @1808   PRDAY3                        N5PF.                               
      @1813   PRDAY4                        N5PF.                               
      @1818   PRDAY5                        N5PF.                               
      @1823   PRDAY6                        N5PF.                               
      @1828   PRDAY7                        N5PF.                               
      @1833   PRDAY8                        N5PF.                               
      @1838   PRDAY9                        N5PF.                               
      @1843   PRDAY10                       N5PF.                               
      @1848   PRDAY11                       N5PF.                               
      @1853   PRDAY12                       N5PF.                               
      @1858   PRDAY13                       N5PF.                               
      @1863   PRDAY14                       N5PF.                               
      @1868   PRDAY15                       N5PF.                               
      @1873   PRDAY16                       N5PF.                               
      @1878   PRDAY17                       N5PF.                               
      @1883   PRDAY18                       N5PF.                               
      @1888   PRDAY19                       N5PF.                               
      @1893   PRDAY20                       N5PF.                               
      @1898   PRDAY21                       N5PF.                               
      @1903   PRDAY22                       N5PF.                               
      @1908   PRDAY23                       N5PF.                               
      @1913   PRDAY24                       N5PF.                               
      @1918   PRDAY25                       N5PF.                               
      @1923   PRDAY26                       N5PF.                               
      @1928   PRDAY27                       N5PF.                               
      @1933   PRDAY28                       N5PF.                               
      @1938   PRDAY29                       N5PF.                               
      @1943   PRDAY30                       N5PF.                               
      @1948   PRDAY31                       N5PF.                               
      @1953   PRDAY32                       N5PF.                               
      @1958   PRDAY33                       N5PF.                               
      @1963   PRDAY34                       N5PF.                               
      @1968   PRDAY35                       N5PF.                               
      @1973   PRDAY36                       N5PF.                               
      @1978   PRDAY37                       N5PF.                               
      @1983   PRDAY38                       N5PF.                               
      @1988   PRDAY39                       N5PF.                               
      @1993   PRDAY40                       N5PF.                               
      @1998   PRDAY41                       N5PF.                               
      @2003   PRDAY42                       N5PF.                               
      @2008   PRDAY43                       N5PF.                               
      @2013   PRDAY44                       N5PF.                               
      @2018   PRDAY45                       N5PF.                               
      @2023   PRDAY46                       N5PF.                               
      @2028   PRDAY47                       N5PF.                               
      @2033   PRDAY48                       N5PF.                               
      @2038   PRDAY49                       N5PF.                               
      @2043   PRDAY50                       N5PF.                               
      @2048   PRDAY51                       N5PF.                               
      @2053   PRDAY52                       N5PF.                               
      @2058   PRDAY53                       N5PF.                               
      @2063   PRDAY54                       N5PF.                               
      @2068   PRDAY55                       N5PF.                               
      @2073   PRDAY56                       N5PF.                               
      @2078   PRDAY57                       N5PF.                               
      @2083   PRDAY58                       N5PF.                               
      @2088   PRDAY59                       N5PF.                               
      @2093   PRDAY60                       N5PF.                               
      @2098   PRDAY61                       N5PF.                               
      @2103   PRDAY62                       N5PF.                               
      @2108   PRDAY63                       N5PF.                               
      @2113   PRDAY64                       N5PF.                               
      @2118   PRDAY65                       N5PF.                               
      @2123   PRDAY66                       N5PF.                               
      @2128   PRDAY67                       N5PF.                               
      @2133   PRDAY68                       N5PF.                               
      @2138   PRDAY69                       N5PF.                               
      @2143   PRDAY70                       N5PF.                               
      @2148   PRDAY71                       N5PF.                               
      @2153   PRDAY72                       N5PF.                               
      @2158   PRDAY73                       N5PF.                               
      @2163   PRDAY74                       N5PF.                               
      @2168   PRDAY75                       N5PF.                               
      @2173   PRDAY76                       N5PF.                               
      @2178   PRDAY77                       N5PF.                               
      @2183   PRDAY78                       N5PF.                               
      @2188   PRDAY79                       N5PF.                               
      @2193   PRDAY80                       N5PF.                               
      @2198   PRDAY81                       N5PF.                               
      @2203   PRDAY82                       N5PF.                               
      @2208   PRDAY83                       N5PF.                               
      @2213   PRDAY84                       N5PF.                               
      @2218   PRDAY85                       N5PF.                               
      @2223   PRDAY86                       N5PF.                               
      @2228   PRDAY87                       N5PF.                               
      @2233   PRDAY88                       N5PF.                               
      @2238   PRDAY89                       N5PF.                               
      @2243   PRDAY90                       N5PF.                               
      @2248   PrimLang                      $CHAR3.                             
      @2251   PRVER                         N3PF.                               
      @2254   PSTATE                        $CHAR2.                             
      @2256   PSTCO2                        N5PF.                               
      @2261   RACE                          N2PF.                               
      @2263   RACE_EDIT                     N2PF.                               
      @2265   RACE_X                        $CHAR20.                            
      @2285   TOTCHG                        N10PF.                              
      @2295   TOTCHG_X                      N15P2F.                             
      @2310   TRAN_IN                       N2PF.                               
      @2312   TRAN_OUT                      N2PF.                               
      @2314   YEAR                          N4PF.                               
      @2318   ZIP                           $CHAR5.                             
      @2323   ZIP3                          $CHAR3.                             
      @2326   ZIPINC_QRTL                   N3PF.                               
      @2329   AYEAR                         N4PF.                               
      @2333   BMONTH                        N2PF.                               
      @2335   BYEAR                         N4PF.                               
      @2339   PRMONTH1                      N2PF.                               
      @2341   PRMONTH2                      N2PF.                               
      @2343   PRMONTH3                      N2PF.                               
      @2345   PRMONTH4                      N2PF.                               
      @2347   PRMONTH5                      N2PF.                               
      @2349   PRMONTH6                      N2PF.                               
      @2351   PRMONTH7                      N2PF.                               
      @2353   PRMONTH8                      N2PF.                               
      @2355   PRMONTH9                      N2PF.                               
      @2357   PRMONTH10                     N2PF.                               
      @2359   PRMONTH11                     N2PF.                               
      @2361   PRMONTH12                     N2PF.                               
      @2363   PRMONTH13                     N2PF.                               
      @2365   PRMONTH14                     N2PF.                               
      @2367   PRMONTH15                     N2PF.                               
      @2369   PRMONTH16                     N2PF.                               
      @2371   PRMONTH17                     N2PF.                               
      @2373   PRMONTH18                     N2PF.                               
      @2375   PRMONTH19                     N2PF.                               
      @2377   PRMONTH20                     N2PF.                               
      @2379   PRMONTH21                     N2PF.                               
      @2381   PRMONTH22                     N2PF.                               
      @2383   PRMONTH23                     N2PF.                               
      @2385   PRMONTH24                     N2PF.                               
      @2387   PRMONTH25                     N2PF.                               
      @2389   PRMONTH26                     N2PF.                               
      @2391   PRMONTH27                     N2PF.                               
      @2393   PRMONTH28                     N2PF.                               
      @2395   PRMONTH29                     N2PF.                               
      @2397   PRMONTH30                     N2PF.                               
      @2399   PRMONTH31                     N2PF.                               
      @2401   PRMONTH32                     N2PF.                               
      @2403   PRMONTH33                     N2PF.                               
      @2405   PRMONTH34                     N2PF.                               
      @2407   PRMONTH35                     N2PF.                               
      @2409   PRMONTH36                     N2PF.                               
      @2411   PRMONTH37                     N2PF.                               
      @2413   PRMONTH38                     N2PF.                               
      @2415   PRMONTH39                     N2PF.                               
      @2417   PRMONTH40                     N2PF.                               
      @2419   PRMONTH41                     N2PF.                               
      @2421   PRMONTH42                     N2PF.                               
      @2423   PRMONTH43                     N2PF.                               
      @2425   PRMONTH44                     N2PF.                               
      @2427   PRMONTH45                     N2PF.                               
      @2429   PRMONTH46                     N2PF.                               
      @2431   PRMONTH47                     N2PF.                               
      @2433   PRMONTH48                     N2PF.                               
      @2435   PRMONTH49                     N2PF.                               
      @2437   PRMONTH50                     N2PF.                               
      @2439   PRMONTH51                     N2PF.                               
      @2441   PRMONTH52                     N2PF.                               
      @2443   PRMONTH53                     N2PF.                               
      @2445   PRMONTH54                     N2PF.                               
      @2447   PRMONTH55                     N2PF.                               
      @2449   PRMONTH56                     N2PF.                               
      @2451   PRMONTH57                     N2PF.                               
      @2453   PRMONTH58                     N2PF.                               
      @2455   PRMONTH59                     N2PF.                               
      @2457   PRMONTH60                     N2PF.                               
      @2459   PRMONTH61                     N2PF.                               
      @2461   PRMONTH62                     N2PF.                               
      @2463   PRMONTH63                     N2PF.                               
      @2465   PRMONTH64                     N2PF.                               
      @2467   PRMONTH65                     N2PF.                               
      @2469   PRMONTH66                     N2PF.                               
      @2471   PRMONTH67                     N2PF.                               
      @2473   PRMONTH68                     N2PF.                               
      @2475   PRMONTH69                     N2PF.                               
      @2477   PRMONTH70                     N2PF.                               
      @2479   PRMONTH71                     N2PF.                               
      @2481   PRMONTH72                     N2PF.                               
      @2483   PRMONTH73                     N2PF.                               
      @2485   PRMONTH74                     N2PF.                               
      @2487   PRMONTH75                     N2PF.                               
      @2489   PRMONTH76                     N2PF.                               
      @2491   PRMONTH77                     N2PF.                               
      @2493   PRMONTH78                     N2PF.                               
      @2495   PRMONTH79                     N2PF.                               
      @2497   PRMONTH80                     N2PF.                               
      @2499   PRMONTH81                     N2PF.                               
      @2501   PRMONTH82                     N2PF.                               
      @2503   PRMONTH83                     N2PF.                               
      @2505   PRMONTH84                     N2PF.                               
      @2507   PRMONTH85                     N2PF.                               
      @2509   PRMONTH86                     N2PF.                               
      @2511   PRMONTH87                     N2PF.                               
      @2513   PRMONTH88                     N2PF.                               
      @2515   PRMONTH89                     N2PF.                               
      @2517   PRMONTH90                     N2PF.                               
      @2519   PRYEAR1                       N4PF.                               
      @2523   PRYEAR2                       N4PF.                               
      @2527   PRYEAR3                       N4PF.                               
      @2531   PRYEAR4                       N4PF.                               
      @2535   PRYEAR5                       N4PF.                               
      @2539   PRYEAR6                       N4PF.                               
      @2543   PRYEAR7                       N4PF.                               
      @2547   PRYEAR8                       N4PF.                               
      @2551   PRYEAR9                       N4PF.                               
      @2555   PRYEAR10                      N4PF.                               
      @2559   PRYEAR11                      N4PF.                               
      @2563   PRYEAR12                      N4PF.                               
      @2567   PRYEAR13                      N4PF.                               
      @2571   PRYEAR14                      N4PF.                               
      @2575   PRYEAR15                      N4PF.                               
      @2579   PRYEAR16                      N4PF.                               
      @2583   PRYEAR17                      N4PF.                               
      @2587   PRYEAR18                      N4PF.                               
      @2591   PRYEAR19                      N4PF.                               
      @2595   PRYEAR20                      N4PF.                               
      @2599   PRYEAR21                      N4PF.                               
      @2603   PRYEAR22                      N4PF.                               
      @2607   PRYEAR23                      N4PF.                               
      @2611   PRYEAR24                      N4PF.                               
      @2615   PRYEAR25                      N4PF.                               
      @2619   PRYEAR26                      N4PF.                               
      @2623   PRYEAR27                      N4PF.                               
      @2627   PRYEAR28                      N4PF.                               
      @2631   PRYEAR29                      N4PF.                               
      @2635   PRYEAR30                      N4PF.                               
      @2639   PRYEAR31                      N4PF.                               
      @2643   PRYEAR32                      N4PF.                               
      @2647   PRYEAR33                      N4PF.                               
      @2651   PRYEAR34                      N4PF.                               
      @2655   PRYEAR35                      N4PF.                               
      @2659   PRYEAR36                      N4PF.                               
      @2663   PRYEAR37                      N4PF.                               
      @2667   PRYEAR38                      N4PF.                               
      @2671   PRYEAR39                      N4PF.                               
      @2675   PRYEAR40                      N4PF.                               
      @2679   PRYEAR41                      N4PF.                               
      @2683   PRYEAR42                      N4PF.                               
      @2687   PRYEAR43                      N4PF.                               
      @2691   PRYEAR44                      N4PF.                               
      @2695   PRYEAR45                      N4PF.                               
      @2699   PRYEAR46                      N4PF.                               
      @2703   PRYEAR47                      N4PF.                               
      @2707   PRYEAR48                      N4PF.                               
      @2711   PRYEAR49                      N4PF.                               
      @2715   PRYEAR50                      N4PF.                               
      @2719   PRYEAR51                      N4PF.                               
      @2723   PRYEAR52                      N4PF.                               
      @2727   PRYEAR53                      N4PF.                               
      @2731   PRYEAR54                      N4PF.                               
      @2735   PRYEAR55                      N4PF.                               
      @2739   PRYEAR56                      N4PF.                               
      @2743   PRYEAR57                      N4PF.                               
      @2747   PRYEAR58                      N4PF.                               
      @2751   PRYEAR59                      N4PF.                               
      @2755   PRYEAR60                      N4PF.                               
      @2759   PRYEAR61                      N4PF.                               
      @2763   PRYEAR62                      N4PF.                               
      @2767   PRYEAR63                      N4PF.                               
      @2771   PRYEAR64                      N4PF.                               
      @2775   PRYEAR65                      N4PF.                               
      @2779   PRYEAR66                      N4PF.                               
      @2783   PRYEAR67                      N4PF.                               
      @2787   PRYEAR68                      N4PF.                               
      @2791   PRYEAR69                      N4PF.                               
      @2795   PRYEAR70                      N4PF.                               
      @2799   PRYEAR71                      N4PF.                               
      @2803   PRYEAR72                      N4PF.                               
      @2807   PRYEAR73                      N4PF.                               
      @2811   PRYEAR74                      N4PF.                               
      @2815   PRYEAR75                      N4PF.                               
      @2819   PRYEAR76                      N4PF.                               
      @2823   PRYEAR77                      N4PF.                               
      @2827   PRYEAR78                      N4PF.                               
      @2831   PRYEAR79                      N4PF.                               
      @2835   PRYEAR80                      N4PF.                               
      @2839   PRYEAR81                      N4PF.                               
      @2843   PRYEAR82                      N4PF.                               
      @2847   PRYEAR83                      N4PF.                               
      @2851   PRYEAR84                      N4PF.                               
      @2855   PRYEAR85                      N4PF.                               
      @2859   PRYEAR86                      N4PF.                               
      @2863   PRYEAR87                      N4PF.                               
      @2867   PRYEAR88                      N4PF.                               
      @2871   PRYEAR89                      N4PF.                               
      @2875   PRYEAR90                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
