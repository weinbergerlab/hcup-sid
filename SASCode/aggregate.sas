/* This is where variables of interest, having been recoded, are aggregated into a time series.  */

/* If you want to make changes here, you need to change the `proc means` in the `aggregate` macro below. If you're adding new outcome variables, add them to `var` and `output` statements. If you are adding new predictor variables, added them to the `class` statement.

If you are adding new variables to your analysis, you also need to go to recode.sas and follow the instructions there. */

/* In a single state, aggregate recoded diagnosis data */
%macro aggregate(state, stateid);
	proc means data=sid_&state..outcomes_&state. noprint nway sum missing;
		var resp resp_prim flu flu_prim rsv rsv_prim resp_other resp_otherprim 
			pneumo_other pneumo_otherprim pneumopneumo pneumopneumo_prim pneumosept pneumosept_prim
			bronchio bronchio_prim;

		output out=sid_all.st_&stateid._aggregate 
			sum=resp resp_prim flu flu_prim rsv rsv_prim resp_other resp_otherprim 
			pneumo_other pneumo_otherprim pneumopneumo pneumopneumo_prim pneumosept pneumosept_prim 
			bronchio bronchio_prim;

		class hospst hospstco hfipsstco zip ayear amonth amonthdate agecat1 agecat2;
	run;
%mend;

