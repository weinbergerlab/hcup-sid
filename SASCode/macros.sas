/* If test_mode is on, only first year is processed in each state. It's off by default. 
Don't change it here, change it in sid_time_series.sas */
%let test_mode = 0;

/* If skip_import is on, we skip the HCUP asc file -> SAS dataset loading, and assume it's already been done. 
It's off by default. Don't change it here, change it in sid_time_series.sas */
%let skip_import = 0;

/* Switch to the directory containing HCUP data for the state */
%macro pre_import(state, yearstart, yearend);
  libname sid_&state. "SASData/%upcase(&state.)";

  data _null_;
    rc = dlgcdir("HCUPData/%upcase(&state.)");
  run;
%mend;

/* Switch back to the top directory and write out SAS data file for each year */
%macro post_import(state, yearstart, yearend);
  data _null_;
    rc = dlgcdir("../..");
  run;
  
  %if &test_mode. %then %let yearend = &yearstart.;

  %if not &skip_import. %then %do;
    %do year=&yearstart %to &yearend;
	  /* Merge in county data from AHA link dataset into core dataset */
      proc sort data=%upcase(&state.)_SIDC_&year._CORE;
         by dshospid;
      run;

      proc sort data=%upcase(&state.)_SIDC_&year._AHAL;
         by dshospid;
      run;

      data sid_&state..sid_&state._&year._core;
        /* The following have inconsistent lengths between different datasets; 
        this here is the max length, to avoid truncation */
        length dx1-dx25 $7;
        length cpt1-cpt50 $5;
        /* The following are not present in all datasets; 
        inserting them here prevents errors later during aggregation */
        length hospstco 5;
        length hfipsstco 4;
        length zip $5;
        merge %upcase(&state.)_SIDC_&year._CORE %upcase(&state.)_SIDC_&year._AHAL;
        by dshospid;
      run;

      /* For CHGS, there is no merging or other shenanigans to do, so we just rename the dataset and put it in the right place */
      proc datasets; 
      	delete sid_&state._&year._chgs;
      	change %upcase(&state.)_SIDC_&year._CHGS=sid_&state._&year._chgs;
      run;

      proc datasets;
      	copy move in=work out=sid_&state.;
      	select sid_&state._&year._chgs;
      run;
      
    %end;
  %end; 
%mend;

/* Load core and AHA linkage datasets for state/year */
%macro load_sid(state, year);
  /* This sets up the name of the load script for a given state and year. 
  Most have name ending in CORE.sas but a few don't */
  %if %lowcase(&state.) = ca and &year. = 2009 %then %let name = core_v1;
  %else %if %lowcase(&state.) = hi and 1996 <= &year. = 2012 %then %let name = core_v1;
  %else %let name = core;

  /* Load core and AHAL */
  %if not &skip_import. %then %do;
    %include hcup("HCUPCode/%upcase(&state)_SID_&year._%upcase(&name).sas");
    %include hcup("HCUPCode/%upcase(&state)_SID_&year._AHAL.sas");
    %include hcup("HCUPCode/%upcase(&state)_SID_&year._CHGS.sas");
  %end;
%mend;

/* In a single state, recode predictor / outcome variables over a range of years */
%macro recode(state, yearstart, yearend);
  %if &test_mode. %then %let yearend = &yearstart.;
  %do year=&yearstart %to &yearend;
    %recode_year(&state, &year)
  %end;
%mend;

/* In a single state, merge data across a range of years */
%macro merge_years(state, yearstart, yearend, dataset);
  %if &test_mode. %then %let yearend = &yearstart.;
  data sid_&state..recoded_&state._&dataset.; 
    set 
    %do year=&yearstart %to &yearend;
      sid_&state..recoded_&state._&year._&dataset.
    %end;
    ;
  run;

%mend;

/* Output timeseries merged across all states */
%macro output_time_series();
  proc export data=sid_all.time_series
     outfile='SASData/all/time_series.csv'
     dbms=csv
     replace;
  run;
%mend;

/* Top-level macros for processing SID time series */
%macro import_sid(state, yearstart, yearend);

  %pre_import(&state., &yearstart., &yearend.);

  %if &test_mode. %then %let yearend = &yearstart.;
  %do year=&yearstart %to &yearend;
    %load_sid(&state., &year.);
  %end;

  %post_import(&state., &yearstart., &yearend.);
%mend;

%macro generate_time_series(state, yearstart, yearend);
  %merge_years(&state., &yearstart, &yearend, core);
  %aggregate_time(&state.);
%mend;

%macro generate_cost_summary(state, yearstart, yearend);
  %if &test_mode. %then %let yearend = &yearstart.;
  %do year=&yearstart %to &yearend;
    %aggregate_cost(&state., &year.);
  %end;
%mend;

/* Helpful for macro debugging */
* options mprint mlogic symbolgen;
options spool;

/* Set up lib for all-state dataset */
libname sid_all "SASData/all";

/* Delete the all-state time series (because we'll be appending data to it) */
proc delete data = sid_all.time_series;
run;
