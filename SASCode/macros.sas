/* Switch to the directory containing HCUP data for the state */
%macro pre_import(state, yearstart, yearend);
data _null_;
	rc = dlgcdir("HCUPData/Unzipped/%upcase(&state.)");
run;
%mend;

/* Switch back to the top directory and write out SAS data file for each year */
/* Merge in county data from AHA link dataset into core dataset */
%macro post_import(state, yearstart, yearend);
data _null_;
	rc = dlgcdir("../../..");
run;

%do year=&yearstart %to &yearend;
proc sort data=%upcase(&state.)_SIDC_&year._CORE;
   by dshospid;
run;
proc sort data=%upcase(&state.)_SIDC_&year._AHAL;
   by dshospid;
run;
data sid_&state..sid_&state._&year._core;
	length dx1-dx25 $7;
	length hospstco 5;
	merge %upcase(&state.)_SIDC_&year._CORE %upcase(&state.)_SIDC_&year._AHAL;
	by dshospid;
run;
%end;
%mend;

/* Load a dataset, but only if yearstart <= year <= yearend */
%macro maybe_load(state, yearstart, year, yearend, name);
%if &yearstart. <= &year. and &yearend. >= &year. %then %do;
	%include hcup("HCUPCode/%upcase(&state)_SID_&year._%upcase(&name).sas");
	%include hcup("HCUPCode/%upcase(&state)_SID_&year._AHAL.sas");
%end;
%mend;

/* In a single state/year dataset, extract diagnosis data fields and demographics, drop everything we don't care about */
%macro extract_dx_year(state, year);

data sid_&state..dx_&state._&year.; set sid_&state..sid_&state._&year._core;
	if missing(ayear) then ayear = year;
	keep hospst hospstco hfipsstco zip
		age ageday agemonth 
		amonth ayear 
		died ndx dx1-dx25;
run;

%mend;

/* In a single state, extract_dx_year over a range of years */
%macro extract_dx(state, yearstart, yearend);
%do year=&yearstart %to &yearend;
%extract_dx_year(&state, &year)
%end;
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

/* In a single state, aggregate recoded diagnosis data over time in monthly increments */
%macro aggregate(state, stateid);
proc means data=sid_&state..resp_&state. noprint nway sum missing;
	var 
		resp resp_prim
		flu flu_prim rsv rsv_prim resp_other resp_otherprim
		pneumo_other pneumo_otherprim pneumopneumo pneumopneumo_prim pneumosept pneumosept_prim
		bronchio bronchio_prim;

	output out=sid_all.st_&stateid._resp_by_month
		sum=
		resp resp_prim
		flu flu_prim rsv rsv_prim resp_other resp_otherprim
		pneumo_other pneumo_otherprim pneumopneumo pneumopneumo_prim pneumosept pneumosept_prim
		bronchio bronchio_prim;

	class hospst hospstco hfipsstco zip ayear amonth amonthdate agecat1 agecat2;
run;
%mend;

/* Merge data across all states into a single dataset */
%macro merge_states();

%let stateidstart=1;
%let stateidend=4;

data sid_all.all_resp_by_month; 
	set 
	%do stateid=&stateidstart %to &stateidend;
		sid_all.st_&stateid._resp_by_month
	%end;
	;
	
	drop _type_;
	rename _freq_=count;
run;

proc export data=sid_all.all_resp_by_month
   outfile='SASData/all/all_resp_by_month.csv'
   dbms=csv
   replace;
run;

%mend;

OPTIONS MPRINT;
OPTIONS SPOOL;
