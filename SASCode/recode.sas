/* This is where raw variables from the SID code and AHAL datasets are recoded into
predictor and outcome variables of interest */

/* If you want to make changes here, you need to do the implement your recoding in the `data` statement of 
the `recode_year` macro below. Make sure you update the `keep` line near the bottom as well, so that 
the results of your recoding (as well as any other variables from the original data set that you need in 
your analysis) are passed on correctly.

Common situations you will encounter here are:

1. Adding a new (predictor or outcome) variable to your analysis, when that variable already exists in 
the original dataset? Simply add it to the `keep` statement.
2. Adding a new (predictor or outcome) variables to your analysis, and you need to calculate it by 
recoding variables in the original data set? Add code inside `data` to do the recoding, and add 
the name of the resulting variables to the `keep` statement.
*/

/* In a single state, 
   * recode diagnosis fields into outcomes we care about
   * recode patient age into age categories
   * recode admission date
*/
%macro recode_year(state, year);

data sid_&state..recoded_&state._&year._core; set sid_&state..sid_&state._&year._core;

  /* Recode ICD-9 diagnoses:
     * resp(iratory) = 460-519 (Diseases Of The Respiratory System)
     * flu = 487 (Influenza), 488 (Influenza due to certain identified influenza viruses)
     * rsv = 079.6 (Respiratory syncytial virus),
         466.11 (Acute bronchiolitis due to respiratory syncytial virus), 
         480.1 (Pneumonia due to respiratory syncytial virus)
     * resp(iratory) other = respiratory but not flu or rsv
     * bronchio(litis) = 466.1 (Acute bronchiolitis)
     * pneumo(nia) other = 480-488 (Pneumonia And Influenza) but not flu or rsv
     * pneumo(coccal) pneumo(nia) = 481 (Pneumococcal pneumonia)
     * pneumo(coccal) sept(icemia) = 038.2 (Pneumococcal septicemia)
     * flu (or) pneumo(nia) = flu or pneumonia (or both, but not rsv)
     
     and CPT codes:
     * leg(ionella) test #1: 87449 (Legionella &al antigen, urine)
     * leg(ionella) test #2: 86713 (Legionella IgG/IgM by DFA)
     * leg(ionella) test #3: 87278 (Legionella antigen by DFA)
  */
  resp = 0;
  resp_prim = 0;

  flu = 0; 
  flu_prim = 0; 

  rsv = 0; 
  rsv_prim = 0; 

  resp_other = 0;
  resp_otherprim = 0;

  bronchio = 0; 
  bronchio_prim = 0; 

  pneumo_other = 0; 
  pneumo_otherprim = 0; 

  pneumopneumo = 0;
  pneumopneumo_prim = 0;

  pneumosept = 0;
  pneumosept_prim = 0;

  if '460  '<=DX1<='519  ' then resp_prim=1;
  if '4600 '<=DX1<='5199 ' then resp_prim=1;
  if '46000'<=DX1<='51999' then resp_prim=1;

  if '487  '<=DX1<='487  ' then flu_prim=1;
  if '4870 '<=DX1<='4879 ' then flu_prim=1;
  if '48700'<=DX1<='48799' then flu_prim=1;
  if '488  '<=DX1<='488  ' then flu_prim=1;
  if '4880 '<=DX1<='4889 ' then flu_prim=1;
  if '48800'<=DX1<='48899' then flu_prim=1;

  if '0796 '<=DX1<='0796 ' then rsv_prim=1;
  if '07960'<=DX1<='07969' then rsv_prim=1;
  if '46611'<=DX1<='46611' then rsv_prim=1;
  if '4801 '<=DX1<='4801 ' then rsv_prim=1;
  if '48010'<=DX1<='48019' then rsv_prim=1;

  if '460  '<=DX1<='519  ' and flu_prim=0 and rsv_prim=0 then resp_otherprim=1;
  if '4600 '<=DX1<='5199 ' and flu_prim=0 and rsv_prim=0 then resp_otherprim=1;
  if '46000'<=DX1<='51999' and flu_prim=0 and rsv_prim=0 then resp_otherprim=1;

  IF '4661 '<=DX1<='4661 ' THEN  bronchio_prim = 1; 
  IF '46610'<=DX1<='46619' THEN  bronchio_prim = 1; 

  if '480  '<=DX1<='488  ' and flu_prim=0 and rsv_prim=0 then pneumo_otherprim=1;
  if '4800 '<=DX1<='4889 ' and flu_prim=0 and rsv_prim=0 then pneumo_otherprim=1;
  if '48000'<=DX1<='48899' and flu_prim=0 and rsv_prim=0 then pneumo_otherprim=1;

  IF '481  '<=DX1<='481  ' THEN  pneumopneumo_prim = 1; 
  IF '4810 '<=DX1<='4819 ' THEN  pneumopneumo_prim = 1; 
  IF '48100'<=DX1<='48199' THEN  pneumopneumo_prim = 1; 

  IF '0382 '<=DX1<='0382 ' THEN  pneumosept_prim = 1; 

  ARRAY DX[30] DX1-DX30;
  DO I=1 TO 30;

    if '460  '<=DX[I]<='519  ' then resp = 1;
    if '4600 '<=DX[I]<='5199 ' then resp = 1;
    if '46000'<=DX[I]<='51999' then resp = 1;

    if '487  '<=DX[I]<='487  ' then flu = 1;
    if '4870 '<=DX[I]<='4879 ' then flu = 1;
    if '48700'<=DX[I]<='48799' then flu = 1;
    if '488  '<=DX[I]<='488  ' then flu = 1;
    if '4880 '<=DX[I]<='4889 ' then flu = 1;
    if '48800'<=DX[I]<='48899' then flu = 1;
   
    if '0796 '<=DX[I]<='0796 ' then rsv = 1;
    if '07960'<=DX[I]<='07969' then rsv = 1;
    if '46611'<=DX[I]<='46611' then rsv = 1;
    if '4801 '<=DX[I]<='4801 ' then rsv = 1;
    if '48010'<=DX[I]<='48019' then rsv = 1;

    if '460  '<=DX[I]<='519  ' and flu = 0 and rsv = 0 then resp_other = 1;
    if '4600 '<=DX[I]<='5199 ' and flu = 0 and rsv = 0 then resp_other = 1;
    if '46000'<=DX[I]<='51999' and flu = 0 and rsv = 0 then resp_other = 1;

    IF '4661 '<=DX[I]<='4661 ' THEN  bronchio = 1; 
    IF '46610'<=DX[I]<='46619' THEN  bronchio = 1; 
  
    if '480  '<=DX[I]<='488  ' and flu = 0 and rsv = 0 then pneumo_other = 1;
    if '4800 '<=DX[I]<='4889 ' and flu = 0 and rsv = 0 then pneumo_other = 1;
    if '48000'<=DX[I]<='48899' and flu = 0 and rsv = 0 then pneumo_other = 1;

    if '481  '<=DX[I]<='481  ' then  pneumopneumo = 1; 
    if '4810 '<=DX[I]<='4819 ' then  pneumopneumo = 1; 
    if '48100'<=DX[I]<='48199' then  pneumopneumo = 1; 

    IF '0382 '<=DX[I]<='0382 ' THEN pneumosept = 1; 
  END;
  
  flu_pneumo = max(flu, pneumo_other);
  flu_pneumoprim = max(flu_prim, pneumo_otherprim);

  leg_test = 0;
  ARRAY CPTS[30] CPT1-CPT30;
  DO I=1 TO 30;
    if CPTS[I] in('87449', '86713', '87278') then leg_test=1; 
  END;
  
  /* recode admission date; month 1 = Jan 1901 */
  if missing(ayear) then do;
    ayear = year;
    length ayear 3;
  end;

  amonth = (ayear - 1901) * 12 + amonth;
  amonthdate = intnx('month', '01DEC1900'd, amonth);
  format amonthdate date9.;
  
  /* recode age */
  ageyear = .;
  if age ne . then do;
    if ((age = 0) or (0 <= ageday <= 365) or (0 <= agemonth <= 11)) then ageyear = 0;
    else ageyear = age;
  end;

  agecat1 = .;
  if age ne . then do;
    if (ageyear = 0) then agecat1 = 0;
    else if ageyear = 1 then agecat1 = 1;
    else if ageyear = 2 then agecat1 = 2;
    else if ageyear = 3 then agecat1 = 3;
    else if ageyear = 4 then agecat1 = 4;
    else if ageyear < 10 then agecat1 = 5;
    else if ageyear < 15 then agecat1 = 6;
    else if ageyear < 20 then agecat1 = 7;
    else if ageyear < 25 then agecat1 = 8;
    else if ageyear < 30 then agecat1 = 9;
    else if ageyear < 35 then agecat1 = 10;
    else if ageyear < 40 then agecat1 = 11;
    else if ageyear < 45 then agecat1 = 12;
    else if ageyear < 50 then agecat1 = 13;
    else if ageyear < 55 then agecat1 = 14;
    else if ageyear < 60 then agecat1 = 15;
    else if ageyear < 65 then agecat1 = 16;
    else if ageyear < 70 then agecat1 = 17;
    else if ageyear < 75 then agecat1 = 18;
    else if ageyear < 80 then agecat1 = 19;
    else if ageyear < 85 then agecat1 = 20;
    else if ageyear < 90 then agecat1 = 21;
    else if ageyear < 95 then agecat1 = 22;
    else if ageyear >= 95 then agecat1 = 23;
  end;

  label agecat1 = "0=<1, 1=1, 2=2, 3=3, 4=4, 5=5-9, 6=10-14, 7=15-19, 8=20-24, 9=25-29, 10=30-34, 11=35-39, 12=40-44, 13=45-49, 14=50-54, 15=55-59, 16=60-64, 17=65-69, 18=70-74, 19=75-79, 20=80-84, 21=85-89, 22=90-94, 23=95+";

  agecat2 = .;
  if age ne . then do;
    if 0 <= ageday <= 182 then agecat2 = 1;
    else if 183 <= ageday <= 365 then agecat2 = 2;
    else if agecat1 > 0 then agecat2 = 3;
  end; 
  
  label agecat1 = "1=<183 days, 2=183-365 days, 3=1+ year";

  keep 
    hospst hospstco hfipsstco zip 
    age agemonth ageday agecat1 agecat2 
    ayear amonth amonthdate 
    died 
    resp resp_prim flu flu_prim rsv rsv_prim resp_other resp_otherprim 
    bronchio bronchio_prim 
    pneumo_other pneumo_otherprim pneumopneumo pneumopneumo_prim pneumosept pneumosept_prim 
    leg_test;
run;

/* Recode charges dataset */
data sid_&state..charges_&state._&year.; set %upcase(&state.)_SIDC_&year._CHGS;
/* Add code here to recode CHGS dataset. Also 'drop' charges not relevant to the analysis and 
'keep' only those columns that are relevant to subsequent analysis */
run;

%mend;
