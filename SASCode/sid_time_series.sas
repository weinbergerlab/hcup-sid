/* So you want to extract time series out of state inpatient database (SID)? */

/* Step 1: you need these SAS programs. Obviously, you did that already. */

/* Step 2: you need HCUP datasets.

The datasets you need are SID core and SID AHA linkage (AHAL) datasets from HCUP for states and years of interest. 
SID core datasets are sold by HCUP; AHAL datasets for years prior to 2006 are included with purchase of 
the corresponding core datasets, whereas AHAL datasets for 2006 onward are free downloads from 
HCUP at https://www.hcup-us.ahrq.gov/db/state/ahalinkage/aha_linkage.jsp

The datasets from HCUP come as compressed and (for non-free ones) password-protected archives. You will need to 
extract core and AHAL .asc files for each state and year from those archives. After you are done with that, 
you need to arrange them into subfolders of HCUPData. In the end, your file structure must look like this:

 - top folder
   - SASCode
     - sid_time_series.sas (this file)
     - … (other SAS programs)
   - SASData
     - all (this folder is where your time series will end up)
     - XX (one folder for each state you are working with, XX being the two-letter code for that state)
   - HCUPCode (this contains HCUP load scripts obtained from HCUP, with some minor modifications)
   - HCUPData
     - XX (one folder for each state you are working with)
       - XX_SID_YYYY_CORE.asc (the core dataset for state XX, year YY)
       - XX_SID_YYYY_AHAL.asc (the AHAL dataset for state XX, year YY)
*/
   
/* Step 3: you need to tell SAS where your files are located. Edit the following code, replacing 
/folders/myshortcuts/HCUP-SID with the full path to the "top folder" in the diagram above. */

filename hcup '/folders/myshortcuts/HCUP-SID';

data _null_;
  rc = dlgcdir(pathname("hcup"));
run;

libname sid_all "SASData/all";
%include "SASCode/macros.sas";

/* Step 6: if you want to change how your predictor and outcome variables are calculated from the raw data, 
you will need to edit recode.sas. Open it and follow instructions in there. */

%include "SASCode/recode.sas";

/* Step 7: if you want to change how time series are calculated, you will need to edit aggregate.sas. 
Open it and follow instructions in there. */

%include "SASCode/aggregate.sas";

/* Step 8: finally, generate the time series. Add your states of interest, following the example below.

If you made changes to recode.sas or aggregate.sas, you may want to test your changes on a subset of the data at first.
To do so, change test_mode from 0 to 1, which will cause only the first year of data in each state to be loaded. 

If you have already run this program once to completion (during which time HCUP data was imported into SAS and 
saved in SAS data files), and now just need to re-run the recoding and aggregation, but don't need to re-import 
HCUP data into SAS, then you can change `skip_import` 0 to 1. This is useful if you are making changes to 
recode.sas or aggregate.sas and just need to redo everything starting with recoding, but don't need to redo the 
time-consuming import from HCUP original datasets. */

%let test_mode = 0;
%let skip_import = 0;

%generate_time_series(ca, 2003, 2011);
%generate_time_series(nj, 2005, 2014);
%generate_time_series(ny, 2005, 2014);
%generate_time_series(wa, 1997, 2014);

/* You don't need to change anything below this point */

/* Merge all states into one output */
%output_time_series();

