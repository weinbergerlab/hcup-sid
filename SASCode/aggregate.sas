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

/* This is where cost variables of interest, having been recoded, are aggregated by admission.  */

/* If you want to make changes here, you need to change the `proc means` in the `aggregate_cost` macro below. 
If you're adding new outcome variables, add them to `var` and `output` statements. If you are adding new predictor 
variables, added them to the `class` statement.

If you are adding new variables to your analysis, you also need to go to recode.sas and 
follow the instructions there. */

/* In a single state, aggregate recoded cost data */
%macro aggregate_cost(state, yearstart, yearend);

	/* First aggregate data in each year and merge all years into one dataset*/
  %do year=&yearstart %to &yearend;
		proc means data=sid_&state..charges_&state._&year. noprint nway sum missing;
		var xx yy zz; /* What variables are being summed; also see output statement below */

		output out=aggregate_&state._&year. 
			sum=xx yy zz; /* What variables are being summed */

		class key; /* What variables are we grouping by -- key is unique identifier of an admission */
		run;

	  proc append base = aggregate_&state. data = aggregate_&state._&year.;
  	run;
  %end;
  
  /* Second re-merge the all-years dataset in case one admission has cost entries in multiple years */
	proc means data=aggregate_&state. noprint nway sum missing;
	var xx yy zz; /* What variables are being summed; same list of variables as above */

	output out=sid_&state..charges_&state. 
		sum=xx yy zz; /* What variables are being summed */

		class key; /* What variables are we grouping by -- key is unique identifier of an admission */
	run;
	
	/* Finally, merge cost data into core data */
	proc sort data=sid_&state..recoded_&state.;
		 by key;
	run;

	proc sort data=sid_&state..charges_&state.;
		 by key;
	run;

	data sid_&state..cost_aggregate_&state.;
		merge sid_&state..recoded_&state. sid_&state..charges_&state.;
		by key;
	run;
  
%mend;

