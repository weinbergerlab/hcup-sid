/* Import all CA data from HCUP */
%macro import_ca();

%let ca_yearstart=2003;
%let ca_yearend=2011;

%pre_import(ca, &ca_yearstart, &ca_yearend);

%maybe_load(ca, &ca_yearstart., 2003, &ca_yearend., core);
%maybe_load(ca, &ca_yearstart., 2004, &ca_yearend., core);
%maybe_load(ca, &ca_yearstart., 2005, &ca_yearend., core);
%maybe_load(ca, &ca_yearstart., 2006, &ca_yearend., core);
%maybe_load(ca, &ca_yearstart., 2007, &ca_yearend., core);
%maybe_load(ca, &ca_yearstart., 2008, &ca_yearend., core);
%maybe_load(ca, &ca_yearstart., 2009, &ca_yearend., core_v1);
%maybe_load(ca, &ca_yearstart., 2010, &ca_yearend., core);
%maybe_load(ca, &ca_yearstart., 2011, &ca_yearend., core);

%post_import(ca, &ca_yearstart, &ca_yearend);

%extract_dx(ca, &ca_yearstart, &ca_yearend);
%merge_years(ca, &ca_yearstart, &ca_yearend);
%recode(ca);
%aggregate(ca, 1);

%mend;

/* Import all NJ data from HCUP */
%macro import_nj();

%let nj_yearstart=2005;
%let nj_yearend=2014;

%pre_import(nj, &nj_yearstart, &nj_yearend);

%maybe_load(nj, &nj_yearstart., 2005, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2006, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2007, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2008, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2009, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2010, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2011, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2012, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2013, &nj_yearend., core);
%maybe_load(nj, &nj_yearstart., 2014, &nj_yearend., core);

%post_import(nj, &nj_yearstart, &nj_yearend);

%extract_dx(nj, &nj_yearstart, &nj_yearend);
%merge_years(nj, &nj_yearstart, &nj_yearend);
%recode(nj);
%aggregate(nj, 2);

%mend;

/* Import all NY data from HCUP */
%macro import_ny();

%let ny_yearstart=2005;
%let ny_yearend=2014;

%pre_import(ny, &ny_yearstart, &ny_yearend);

%maybe_load(ny, &ny_yearstart., 2005, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2006, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2007, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2008, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2009, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2010, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2011, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2012, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2013, &ny_yearend., core);
%maybe_load(ny, &ny_yearstart., 2014, &ny_yearend., core);

%post_import(ny, &ny_yearstart, &ny_yearend);

%extract_dx(ny, &ny_yearstart, &ny_yearend);
%merge_years(ny, &ny_yearstart, &ny_yearend);
%recode(ny);
%aggregate(ny, 3);

%mend;

/* Import all WA data from HCUP */
%macro import_wa();

%let wa_yearstart=1997;
%let wa_yearend=2014;

%pre_import(wa, &wa_yearstart, &wa_yearend);

%maybe_load(wa, &wa_yearstart., 1997, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 1998, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 1999, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2000, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2001, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2002, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2003, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2004, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2005, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2006, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2007, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2008, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2009, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2010, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2011, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2012, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2013, &wa_yearend., core);
%maybe_load(wa, &wa_yearstart., 2014, &wa_yearend., core);

%post_import(wa, &wa_yearstart, &wa_yearend);


%extract_dx(wa, &wa_yearstart, &wa_yearend);
%merge_years(wa, &wa_yearstart, &wa_yearend);
%recode(wa);
%aggregate(wa, 4);

%mend;

