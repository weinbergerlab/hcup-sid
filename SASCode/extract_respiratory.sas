filename hcup '/folders/myshortcuts/HCUP-SID';

data _null_;
	rc = dlgcdir("/folders/myshortcuts/HCUP-SID");
run;

libname sid_all "SASData/all";
libname sid_ca "SASData/CA";
libname sid_nj "SASData/NJ";
libname sid_ny "SASData/NY";
libname sid_wa "SASData/WA";

%include "SASCode/macros.sas";
%include "SASCode/recode.sas";
%include "SASCode/states.sas";

/* %import_ca(); */
%import_nj();
/* %import_ny(); */
/* %import_wa(); */

/* Merge all states into one output */
%merge_states();

