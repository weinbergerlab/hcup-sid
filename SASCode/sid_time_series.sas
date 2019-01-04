/* So you want to extract time series out of state inpatient database (SID)? */

/* Step 1: you need these SAS programs. Obviously, you did that already.*/

/* Step 2: you need HCUP datasets.

The datasets you need are SID core and SID AHA linkage (AHAL) datasets from HCUP for states and years of interest. SID core datasets are sold by HCUP; AHAL datasets for years prior to 2006 are included with the purchase of the corresponding core datasets, whereas AHAL datasets for 2006 onward are free downloads from HCUP at https://www.hcup-us.ahrq.gov/db/state/ahalinkage/aha_linkage.jsp

The datasets from HCUP come as compressed and (for non-free ones) password-protected archives. You will need to extract core and AHAL .asc files for each state and year from those archives. After you are done with that, your need to arrange them into subfolders of HCUPData/Unzipped. In the end, your file structure must look like this:

 - top folder
   - SASCode
     - sid_time_series.sas (this file)
     - … (other SAS programs)
   - SASData
     - all (this folder is where your time series will end up)
     - XX (one folder for each state you are working with, XX being the two-letter code for that state)
   - HCUPCode (this contains HCUP load scripts obtained from HCUP, with some minor modifications)
   - HCUPData
     - Unzipped
       - XX (one folder for each state you are working with)
         - XX_SID_YYYY_CORE.asc (the core dataset for state XX, year YY)
         - XX_SID_YYYY_AHAL.ask (the AHAL dataset for state XX, year YY)
*/
	 
/* Step 3: you need to tell SAS where your files are located. Edit the following code, replacing /folders/mushortcuts/HCUP-SID with the full path to the "top folder" in the diagram above. */

filename hcup '/folders/myshortcuts/HCUP-SID';

data _null_;
	rc = dlgcdir("/folders/myshortcuts/HCUP-SID");
run;

/* Step 4: set up a libname for each state you are working with, following the examples below. Each of these must correspond to a folder on your computer, which you should have set up in step 2 above. */

libname sid_all "SASData/all";
libname sid_ca "SASData/CA";
libname sid_nj "SASData/NJ";
libname sid_ny "SASData/NY";
libname sid_wa "SASData/WA";

/* Step 5: if you added any states in step 4, you will also need to edit states.sas. Open it and follow instructions in there. */

%include "SASCode/states.sas";

/* Step 6: if you want to change how outcome variables are calculated, you will need to edit recode.sas. Open it and follow instructions in there. */

/* Step 7: if you want to change how time series are calculated, you will need to edit aggregate.sas. Open it and follow instructions in there. */

/* Step 8: finally, generate the time series. Add your states of interest, following the example below */

/* %generate_timeseries_ca(); */
%generate_timeseries_nj();
/* %generate_timeseries_ny(); */
/* %generate_timeseries_wa(); */

/* You don't need to change anything below this point */

/* Merge all states into one output */
%merge_timeseries();

