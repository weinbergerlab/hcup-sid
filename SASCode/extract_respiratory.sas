data _null_;
	rc = dlgcdir("/folders/myshortcuts/HCUP-SID");
run;

libname sid_all "SASData/all";
libname sid_ca "SASData/CA";
libname sid_nj "SASData/NJ";
libname sid_ny "SASData/NY";
libname sid_wa "SASData/WA";

%include macros.sas

/* Import all CA data from HCUP */
%pre_import(ca, 2003, 2011);

%include HCUPCode/CA_SID_2003_CORE.sas
# %include HCUPCode/CA_SID_2004_CORE.sas
# %include HCUPCode/CA_SID_2005_CORE.sas
# %include HCUPCode/CA_SID_2006_CORE.sas
# %include HCUPCode/CA_SID_2007_CORE.sas
# %include HCUPCode/CA_SID_2008_CORE.sas
# %include HCUPCode/CA_SID_2009_CORE_V1.sas
# %include HCUPCode/CA_SID_2010_CORE.sas
# %include HCUPCode/CA_SID_2011_CORE.sas

/* Extract diagnostic codes, merge all years, recode to our needs, and aggregate over time */
%extract_dx(ca, 2003, 2011);
%merge_years(ca, 2003, 2011);
%recode(ca);
%aggregate(ca, 1);

/* Merge all states into one output */
%merge_states(1, 1);

%extract_dx_year(ca, 2003);
%extract_dx_year(ca, 2004);
%extract_dx_year(ca, 2005);
%extract_dx_year(ca, 2006);
%extract_dx_year(ca, 2007);
%extract_dx_year(ca, 2008);
%extract_dx_year(ca, 2009);
%extract_dx_year(ca, 2010);
%extract_dx_year(ca, 2011);



