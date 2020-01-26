/* This is where variables of interest, having been recoded, are aggregated into a time series.  */

/* If you want to make changes here, you need to change the `proc means` in the `aggregate_time` macro below. 
If you're adding new outcome variables, add them to the `let outcome_vars` statement. If you are adding new predictor 
variables, added them to the `class` statement.

If you are adding new variables to your analysis, you also need to go to recode.sas and 
follow the instructions there. */

/* In a single state, aggregate recoded diagnosis data */
%macro aggregate_time(state);
  proc means data=sid_&state..recoded_&state._core noprint nway sum missing;
  	%let outcome_vars = resp resp_prim flu flu_prim rsv rsv_prim resp_other resp_otherprim 
      pneumo_other pneumo_otherprim pneumopneumo pneumopneumo_prim pneumosept pneumosept_prim
      bronchio bronchio_prim;
  
    var &outcome_vars.;

    output out=aggregate_&state._core sum=&outcome_vars.;
    class hospst hospstco hfipsstco zip ayear amonth amonthdate agecat1 agecat2;
  run;
  
  proc append base = sid_all.time_series data = aggregate_&state._core;
  run;
%mend;

/* This is where cost variables of interest, having been recoded, are matched to clinical data about the admission.  */

/* In a single state / year, aggregate recoded cost data */
%macro aggregate_cost(state, year);

	proc sort data=sid_&state..recoded_&state._&year._core;
		 by key;
	run;

	proc sort data=sid_&state..recoded_&state._&year._chgs;
		 by key;
	run;

	data sid_&state..aggregate_&state._&year._chgs;
		merge sid_&state..recoded_&state._&year._core sid_&state..recoded_&state._&year._chgs;
		by key;
	run;
  
%mend;

