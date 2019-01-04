%include "SASCode/macros.sas";
%include "SASCode/recode.sas";
%include "SASCode/aggregate.sas";

/* Import all CA data from HCUP */
%macro generate_timeseries_ca();

	%let ca_yearstart=2003;
	%let ca_yearend=2011;

	%pre_import(ca);

	%do year=&ca_yearstart %to &ca_yearend;
		%if &year. = 2009 %then %do;
			%load_sid(ca, &year., core_v1);
		%else %do;
			%load_sid(ca, &year., core);
		%end
	%end;

	%post_import(ca);

	%extract_dx(ca, &ca_yearstart, &ca_yearend);
	%merge_years(ca, &ca_yearstart, &ca_yearend);
	%recode(ca);
	%aggregate(ca, 1);

%mend;

/* Import all NJ data from HCUP */
%macro generate_timeseries_nj();

	%let nj_yearstart=2005;
	%let nj_yearend=2014;

	%pre_import(nj);

	%do year=&nj_yearstart %to &nj_yearend;
		%load_sid(nj, &year., core);
	%end;

	%post_import(nj);

	%extract_dx(nj, &nj_yearstart, &nj_yearend);
	%merge_years(nj, &nj_yearstart, &nj_yearend);
	%recode(nj);
	%aggregate(nj, 2);

%mend;

/* Import all NY data from HCUP */
%macro generate_timeseries_ny();

	%let ny_yearstart=2005;
	%let ny_yearend=2014;

	%pre_import(ny);

	%do year=&nj_yearstart %to &nj_yearend;
		%load_sid(nj, &year., core);
	%end;

	%post_import(ny);

	%extract_dx(ny, &ny_yearstart, &ny_yearend);
	%merge_years(ny, &ny_yearstart, &ny_yearend);
	%recode(ny);
	%aggregate(ny, 3);

%mend;

/* Import all WA data from HCUP */
%macro generate_timeseries_wa();

	%let wa_yearstart=1997;
	%let wa_yearend=2014;

	%pre_import(wa);

	%do year=&wa_yearstart %to &wa_yearend;
		%load_sid(wa, &year., core);
	%end;

	%post_import(wa);


	%extract_dx(wa, &wa_yearstart, &wa_yearend);
	%merge_years(wa, &wa_yearstart, &wa_yearend);
	%recode(wa);
	%aggregate(wa, 4);

%mend;

