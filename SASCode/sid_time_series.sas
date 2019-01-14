/* So you want to extract time series out of state inpatient database (SID)? */

/* Step 1: You need these SAS programs. Obviously, you have that already. */

/* Step 2: You need HCUP datasets.

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
   
/* Step 3: You need to tell SAS where your files are located. Edit the following code, replacing 
/folders/myshortcuts/HCUP-SID with the full path to the "top folder" from the diagram above. */

filename hcup '/folders/myshortcuts/HCUP-SID';

data _null_;
  rc = dlgcdir(pathname("hcup"));
run;

/* Step 4: If you want to change how your predictor and outcome variables are calculated from the raw data, 
you will need to edit `recode.sas`. You also need to edit `recode.sas` if you are adding
variables to your analysis, or removing them. Open it and follow instructions in there. */

%include "SASCode/recode.sas";

/* Step 5: If you want to change how time series are calculated, you will need to edit `aggregate.sas`.
You'll need to do this if you add variables to your analysis (or remove them), or if you want to change
the summary statistics that go into the time series. Follow instructions in `aggregate.sas`. */

%include "SASCode/aggregate.sas";

/* Step 6: Finally, process the data. 

This takes place in three steps: import (which reads data from HCUP .asc data files into SAS data files),
recoding (which calculates variables of interest for your analysis from the raw data in HCUP datasets), and
aggregation (where your variables of interest are aggregated over time). */

/* If you made changes to recode.sas or aggregate.sas, you may want to test your changes on a subset of the data at first.
To do so, change test_mode from 0 to 1, which will cause only the first year of data in each state to be loaded. */

%let test_mode = 0;

/* Importing: add your states and years of interest following the example below.

Each year in each state only needs to be imported once. After you import a given year,
you can take it out of import_sid, as importing each year takes quite a while. */

%import_sid(ca, 2003, 2011);
%import_sid(nj, 2005, 2014);
%import_sid(ny, 2005, 2014);
%import_sid(wa, 1997, 2014);

/* Recoding: add your states and years of interest following the example below.

Each year in each state only needs to be recoded once when it's first imported
and then again every time you change `recode.sas`. */

%recode(ca, 2003, 2011);
%recode(nj, 2005, 2014);
%recode(ny, 2005, 2014);
%recode(wa, 1997, 2014);

/* Time series generation: add your states and years of interest following the example below.

All years you want included in the output must be listed here each time you run the program,
so you should probably leave this alone except when you add (or remove) years or states. */

%generate_time_series(ca, 2003, 2011);
%generate_time_series(nj, 2005, 2014);
%generate_time_series(ny, 2005, 2014);
%generate_time_series(wa, 1997, 2014);

/* You don't need to change anything below this point */

/* Merge all states into one output */
%output_time_series();

