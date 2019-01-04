/* Switch to the directory containing HCUP data for the state */
%macro pre_import(state);
	data _null_;
		rc = dlgcdir("HCUPData/Unzipped/%upcase(&state.)");
	run;
%mend;

/* Switch back to the top directory and write out SAS data file for each year */
/* Merge in county data from AHA link dataset into core dataset */
%macro post_import(state);
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
			length cpt1-cpt50 $5;
			length hospstco 5;
			merge %upcase(&state.)_SIDC_&year._CORE %upcase(&state.)_SIDC_&year._AHAL;
			by dshospid;
		run;
	%end;
%mend;

/* Load core and AHA linkage datasets for state/year */
%macro load_sid(state, year, name);
	%if &yearstart. <= &year. and &yearend. >= &year. %then %do;
		%include hcup("HCUPCode/%upcase(&state)_SID_&year._%upcase(&name).sas");
		%include hcup("HCUPCode/%upcase(&state)_SID_&year._AHAL.sas");
	%end;
%mend;

/* In a single state/year dataset, extract diagnosis data fields and demographics, drop everything we don't care about */
%macro extract_dx_year(state, year);

data sid_&state..dx_&state._&year.; set sid_&state..sid_&state._&year._core;
	if missing(ayear) then ayear = year;
	keep &recode_input_only. &recode_passthrough.;
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

/* Merge data across all states into a single dataset */
%macro merge_timeseries();

	%let stateidstart=1;
	%let stateidend=4;

	data sid_all.all_aggregate; 
		set 
		%do stateid=&stateidstart %to &stateidend;
			sid_all.st_&stateid._aggregate
		%end;
		;
	
		drop _type_;
		rename _freq_=count;
	run;

	proc export data=sid_all.all_aggregate
	   outfile='SASData/all/all_aggregate.csv'
	   dbms=csv
	   replace;
	run;

%mend;

OPTIONS MPRINT;
OPTIONS SPOOL;
