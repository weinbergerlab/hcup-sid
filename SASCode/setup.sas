data _null_;
	rc = dlgcdir("/folders/myshortcuts/HCUP-SID");
run;

libname sid_all "SASData/all";
libname sid_ca "SASData/CA";
