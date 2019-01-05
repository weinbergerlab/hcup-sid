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
/* Merge in county data from AHA link dataset into core dataset */
%macro post_import(state, yearstart, yearend);
  data _null_;
    rc = dlgcdir("../../..");
  run;
  
  %if &test_mode. %then %let yearend = &yearstart.;

  %if not &skip_import. %then %do;
    %do year=&yearstart %to &yearend;
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
    %end;
  %end; 
%mend;

/* Load core and AHA linkage datasets for state/year */
%macro load_sid(state, year);
  /* This sets up the name of the load script for a given state and year. 
  Most have name ending in CORE.sas but a few don't */
  %if %lowcase(&state.) = "ca" and year = 2009 %then %let name = core_v1;
  %if %lowcase(&state.) = "hi" and 1996 <= year = 2012 %then %let name = core_v1;
  %else %let name = core;

  /* Load core and AHAL */
  %if not &skip_import. %then %do;
    %include hcup("HCUPCode/%upcase(&state)_SID_&year._%upcase(&name).sas");
    %include hcup("HCUPCode/%upcase(&state)_SID_&year._AHAL.sas");
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
%macro merge_years(state, yearstart, yearend);
  %if &test_mode. %then %let yearend = &yearstart.;
  data sid_&state..recoded_&state.; 
    set 
    %do year=&yearstart %to &yearend;
      sid_&state..recoded_&state._&year.
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

/* Combine all the things above into a single macros that does everything start-to-finish */
%macro generate_time_series(state, yearstart, yearend);

  %pre_import(&state., &yearstart., &yearend.);

  %if &test_mode. %then %let yearend = &yearstart.;
  %do year=&yearstart %to &yearend;
    %load_sid(&state., &year.);
  %end;

  %post_import(&state., &yearstart., &yearend.);

  %recode(&state., &yearstart, &yearend);
  %merge_years(&state., &yearstart, &yearend);
  %aggregate(&state.);

%mend;

/* Helpful for macro debugging */
OPTIONS MPRINT;
OPTIONS SPOOL;

/* Set up working directory */
data _null_;
  rc = dlgcdir(pathname("hcup"));
run;

/* Set up lib for all-state dataset */
libname sid_all "SASData/all";

/* Delete the all-state time series (because we'll appending data to it) */
proc delete data = sid_all.time_series;
run;
