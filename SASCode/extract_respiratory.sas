/* In a single state/year dataset, extract diagnosis data fields and demographics, drop everything we don't care about */
%macro extract_dx(state, year, yearshort);

data sid_&state..dx_&state._&year.; set sid_&state..sid_&state._&year._core;
	keep hospst hospstco
		age ageday agemonth 
		amonth ayear 
		died ndx dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 
		dx11 dx12 dx13 dx14 dx15 dx16 dx17 dx18 dx19 dx20 
		dx21 dx22 dx23 dx24 dx25;
run;

%mend;

/* In a single state, merge data across a range of years */
%macro merge_years(state, yearstart, yearend);

data sid_&state..dx_&state.; 
	set 
	%do year=&yearstart %to &yearend;
		sid_&state..dx_&state._&year.
	%end;
	;
run;

%mend;

/* In a single state, 
   * recode diagnosis fields into respiratory diagnoses we care about
   * recode patient age into age categories
   * recode admission date
*/
%macro recode_state(state);

data sid_&state..resp_&state.; set sid_&state..dx_&state.;
	/* Recode respiratory diagnoses that we care about (ICD-9):
	   * resp = 460-519 (Diseases Of The Respiratory System)
	   * flu = 487 (Influenza), 488 (Influenza due to certain identified influenza viruses)
	   * rsv = 079.6 (Respiratory syncytial virus),
	       466.11 (Acute bronchiolitis due to respiratory syncytial virus), 
	       480.1 (Pneumonia due to respiratory syncytial virus)
	   * bronchio(litis) = ?
	   * pneumo(nia) = 480-486 (Pneumonia And Influenza, minus flu)
	   * pneumococcal pneumo(nia) = 481 (Pneumococcal pneumonia)
	   * pneumosept = ?
	   * respcirc = ?
	   * flu or pneumonia (flupneumo)
	*/
	resp = 0;
	resp_prim = 0;

	flu_spec = 0; 
	flu_specprim = 0; 

	rsv_spec = 0; 
	rsv_specprim = 0; 

	pneumo_unspec = 0; 
	pneumo_unspecprim = 0; 

	resp_unspec = 0; 
	resp_unspecprim = 0; 

	if '460  '<=DX1<='519  ' then resp_prim=1;
	if '4600 '<=DX1<='5199 ' then resp_prim=1;
	if '46000'<=DX1<='51999' then resp_prim=1;

	if '487  '<=DX1<='487  ' then flu_specprim=1;
	if '4870 '<=DX1<='4879 ' then flu_specprim=1;
	if '48700'<=DX1<='48799' then flu_specprim=1;
	if '488  '<=DX1<='488  ' then flu_specprim=1;
	if '4880 '<=DX1<='4889 ' then flu_specprim=1;
	if '48800'<=DX1<='48899' then flu_specprim=1;

	if '0796 '<=DX1<='0796 ' then rsv_specprim=1;
	if '07960'<=DX1<='07969' then rsv_specprim=1;
	if '46611'<=DX1<='46611' then rsv_specprim=1;
	if '4801 '<=DX1<='4801 ' then rsv_specprim=1;
	if '48010'<=DX1<='48019' then rsv_specprim=1;

	if '480  '<=DX1<='486  ' and flu_specprim=0 and rsv_specprim=0 then pneumo_unspecprim=1;
	if '4800 '<=DX1<='4869 ' and flu_specprim=0 and rsv_specprim=0 then pneumo_unspecprim=1;
	if '48000'<=DX1<='48699' and flu_specprim=0 and rsv_specprim=0 then pneumo_unspecprim=1;

	if '460  '<=DX1<='519  ' and flu_specprim=0 and rsv_specprim=0 then resp_unspecprim=1;
	if '4600 '<=DX1<='5199 ' and flu_specprim=0 and rsv_specprim=0 then resp_unspecprim=1;
	if '46000'<=DX1<='51999' and flu_specprim=0 and rsv_specprim=0 then resp_unspecprim=1;

	pneumococcalpneumo = 0;
	pneumococcalpneumo_prim = 0;
	IF '481  '<=DX1<='481  ' THEN  pneumococcalpneumo_prim = 1; 
	IF '4810 '<=DX1<='4819 ' THEN  pneumococcalpneumo_prim = 1; 
	IF '48100'<=DX1<='48199' THEN  pneumococcalpneumo_prim = 1; 

	ARRAY DX[30] DX1-DX30;
	DO I=1 TO 30;

		if '481  '<=DX[I]<='481  ' then  pneumococcalpneumo = 1; 
		if '4810 '<=DX[I]<='4819 ' then  pneumococcalpneumo = 1; 
		if '48100'<=DX[I]<='48199' then  pneumococcalpneumo = 1; 

		if '460  '<=DX[I]<='519  ' then resp = 1;
		if '4600 '<=DX[I]<='5199 ' then resp = 1;
		if '46000'<=DX[I]<='51999' then resp = 1;

		if '487  '<=DX[I]<='487  ' then flu_spec = 1;
		if '4870 '<=DX[I]<='4879 ' then flu_spec = 1;
		if '48700'<=DX[I]<='48799' then flu_spec = 1;
		if '488  '<=DX[I]<='488  ' then flu_spec = 1;
		if '4880 '<=DX[I]<='4889 ' then flu_spec = 1;
		if '48800'<=DX[I]<='48899' then flu_spec = 1;
	 
		if '0796 '<=DX[I]<='0796 ' then rsv_spec = 1;
		if '07960'<=DX[I]<='07969' then rsv_spec = 1;
		if '46611'<=DX[I]<='46611' then rsv_spec = 1;
		if '4801 '<=DX[I]<='4801 ' then rsv_spec = 1;
		if '48010'<=DX[I]<='48019' then rsv_spec = 1;

		if '480  '<=DX[I]<='486  ' and flu_spec = 0 and rsv_spec = 0 then pneumo_unspec = 1;
		if '4800 '<=DX[I]<='4869 ' and flu_spec = 0 and rsv_spec = 0 then pneumo_unspec = 1;
		if '48000'<=DX[I]<='48699' and flu_spec = 0 and rsv_spec = 0 then pneumo_unspec = 1;

		if '460  '<=DX[I]<='519  ' and flu_spec = 0 and rsv_spec = 0 then resp_unspec = 1;
		if '4600 '<=DX[I]<='5199 ' and flu_spec = 0 and rsv_spec = 0 then resp_unspec = 1;
		if '46000'<=DX[I]<='51999' and flu_spec = 0 and rsv_spec = 0 then resp_unspec = 1;

	END;
	
	hospstco = .;
	flu = .;
	flu_prim = .;
	rsv = .;
	rsv_prim = .;
	pneumo = .;
	pneumo_prim = .;
	pneumosept = .;
	pneumosept_prim = .;
	respcirc = .;
	respcirc_prim = .;
	bronchio = .;
	bronchio_prim = .;
	
	flupneumo = max(flu, pneumo);
	flupneumo_prim = max(flu_prim, pneumo_prim);
	
	/* recode admission date */
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
		else if ageyear <40 then agecat1 = 11;
		else if ageyear <45 then agecat1 = 12;
		else if ageyear <50 then agecat1 = 13;
		else if ageyear <55 then agecat1 = 14;
		else if ageyear <60 then agecat1 = 15;
		else if ageyear <65 then agecat1 = 16;
		else if ageyear <70 then agecat1 = 17;
		else if ageyear <75 then agecat1 = 18;
		else if ageyear <80 then agecat1 = 19;
		else if ageyear <85 then agecat1 = 20;
		else if ageyear <90 then agecat1 = 21;
		else if ageyear <95 then agecat1 = 22;
		else if ageyear >=95 then agecat1 = 23;
	end;

	agecat2 = .;
	if age ne . then do;
		if 0 <= ageday <= 182 then agecat2 = 1;
		else if 183 <= ageday <= 365 then agecat2 = 2;
		else if agecat1 > 0 then agecat2 = 3;
	end; 
	
	keep hospst hospstco
		age agemonth ageday agecat1 agecat2
		ayear amonth amonthdate
		died resp resp_prim resp_unspec resp_unspecprim
		flu_spec flu_specprim rsv_spec rsv_specprim
		pneumo_unspec pneumo_unspecprim pneumococcalpneumo pneumococcalpneumo_prim
		flu flu_prim rsv rsv_prim 
		pneumo pneumo_prim pneumosept pneumosept_prim
		respcirc respcirc_prim bronchio bronchio_prim
		flupneumo flupneumo_prim;
run;

%mend;

/* In a single state, aggregate recoded diagnosis data over time in monthly increments */
%macro aggregate_state(state, stateid);
proc means data=sid_&state..resp_&state. noprint nway sum;
	var 
		resp resp_prim resp_unspec resp_unspecprim
		flu_spec flu_specprim rsv_spec rsv_specprim
		pneumo_unspec pneumo_unspecprim pneumococcalpneumo pneumococcalpneumo_prim
		flu flu_prim rsv rsv_prim 
		pneumo pneumo_prim pneumosept pneumosept_prim
		respcirc respcirc_prim bronchio bronchio_prim
		flupneumo flupneumo_prim;

	output out=sid_all.st_&stateid._resp_by_month
		sum=
			resp resp_prim resp_unspec resp_unspecprim
			flu_spec flu_specprim rsv_spec rsv_specprim
			pneumo_unspec pneumo_unspecprim pneumococcalpneumo pneumococcalpneumo_prim
			flu flu_prim rsv rsv_prim 
			pneumo pneumo_prim pneumosept pneumosept_prim
			respcirc respcirc_prim bronchio bronchio_prim
			flupneumo flupneumo_prim;

	class hospst /* hospstco */ ayear amonth amonthdate agecat1 agecat2;
run;
%mend;

/* Merge data across all states into a single dataset */
%macro merge_states(stateidstart, stateidend);

data sid_all.all_resp_by_month; 
	set 
	%do stateid=&stateidstart %to &stateidend;
		sid_all.st_&stateid._resp_by_month
	%end;
	;
run;

proc export data=sid_all.all_resp_by_month
   outfile='SASData/all/all_resp_by_month.csv'
   dbms=csv
   replace;
run;

%mend;

OPTIONS MPRINT;

%extract_dx(ca, 2003, 03);
%extract_dx(ca, 2004, 04);
%extract_dx(ca, 2005, 05);
%extract_dx(ca, 2006, 06);
%extract_dx(ca, 2007, 07);
%extract_dx(ca, 2008, 08);
%extract_dx(ca, 2009, 09);
%extract_dx(ca, 2010, 10);
%extract_dx(ca, 2011, 11);

%merge_years(ca, 2003, 2011);

%recode_state(ca);
%aggregate_state(ca, 1);

%merge_states(1, 1);
