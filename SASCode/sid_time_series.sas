/* So you want to extract time series out of state inpatient database (SID)? */

/* Step 1: You need these SAS programs. Obviously, you have that already. */

/* Step 2: You need HCUP datasets.

The datasets you need are SID core, SID AHA linkage (AHAL), and SID charges (CHGS) datasets from HCUP for
states and years of interest. SID core datasets are sold by HCUP; AHAL datasets for years prior to 2006 are
included with purchase of the corresponding core datasets, whereas AHAL datasets for 2006 onward are free
downloads from HCUP at https://www.hcup-us.ahrq.gov/db/state/ahalinkage/aha_linkage.jsp

The datasets from HCUP come as compressed and (for non-free ones) password-protected archives. You will need to 
extract core, AHAL, and CHGS .asc files for each state and year from those archives. After you are done with that, 
you need to arrange them into subfolders of HCUPData. In the end, your file structure must look like this:

 - top folder
   - SASCode
     - sid_time_series.sas (this file)
     - … (other SAS programs)
   - SASData (initially empty)
     - all (this folder is where your time series will end up)
     - XX (one folder for each state you are working with, XX being the two-letter code for that state)
   - HCUPCode (this contains HCUP load scripts obtained from HCUP, with some minor modifications)
   - HCUPData
     - XX (one folder for each state you are working with)
       - XX_SID_YYYY_CORE.asc (the core dataset for state XX, year YY)
       - XX_SID_YYYY_AHAL.asc (the AHAL dataset for state XX, year YY)
       - XX_SID_YYYY_CHGS.asc (the CHGS dataset for state XX, year YY)
*/
   
/* Step 3: You need to tell SAS where your files are located. Edit the following code, replacing 
/folders/myshortcuts/HCUP-SID with the full path to the "top folder" from the diagram above. */

filename hcup '/folders/myshortcuts/HCUP-SID';

data _null_;
  rc = dlgcdir(pathname("hcup"));
run;

%include "SASCode/macros.sas";

/* Step 3.5: If you are making changes to the code in `recode.sas` or `aggregate.sas`, as described below, you 
may want to test your changes on a subset of the data at first. To do so, change test_mode from 0 to 1, which will
cause only the first year of data in each state to be processed. */

%let test_mode = 0;

/* Step 4: You need to import HCUP data into SAS. You only need to import data for each year once; it is 
saved in a SAS data file for future use. If you add more years or states later, you'll need to import those 
once as well. 

By default, data about hospital charges is not loaded, because it adds a lot of time to processing. If you will need it in your analysis, change this from 0 to 1: */

%let include_charges = 0;

/* Edit the following block to determine which state/year data will be imported; for each state, year range is inclusive */

%import_sid(ca, 2009, 2011);
%import_sid(nj, 2009, 2011);
%import_sid(ny, 2009, 2011);
%import_sid(wa, 2009, 2011);

/* Step 5: Compute your predictor and outcome variables from raw data. 

To change how the predictor and outcome variables are calculated from the raw data, you need to edit `recode.sas`. 
You also need to edit `recode.sas` if you are adding variables to your analysis, or removing them.
Open `recode.sas` and follow instructions in there.

You also need to tell SAS which years you want to process. This first time you run this program, these should be
the same years as the ones you imported; subsequently, you don't need to re-process any years that have already
been processed, unless you make changes to `recode.sas`, in which case you should re-process all years.

Edit the year ranges below to determine which data will be processed; year range is inclusive. */

%include "SASCode/recode.sas";

%recode(ca, 2009, 2011);
%recode(nj, 2009, 2011);
%recode(ny, 2009, 2011);
%recode(wa, 2009, 2011);

/* Step 6A: If you are doing a time series analysis, generate the time series

Here, predictor and outcome variables are aggregated by time period. If you need to change which variables
are aggregated (for example, because you added or removed variables in `recode.sas`) or if you want to change
the summary statistics that go into the time series, you need to edit `aggregate.sas`. Open `aggregate.sas`
and follow instructions in there.

Edit the year ranges below to determine which years will be included in the time series. Only the years
listed here will appear in the final time series data produced by this program. */

%include "SASCode/aggregate.sas";

%generate_time_series(ca, 2009, 2011);
%generate_time_series(nj, 2009, 2011);
%generate_time_series(ny, 2009, 2011);
%generate_time_series(wa, 2009, 2011);

/* Finally, merge all states into one output */
%output_time_series();

/* Step 6B: If you are doing a cost analysis, merge cost data with admissions data

Edit the year ranges below to determine which years will be included in the merged data.  */

%if &include_charges. %then %do;

  %generate_cost_summary(ca, 2009, 2011);
  %generate_cost_summary(nj, 2009, 2011);
  %generate_cost_summary(ny, 2009, 2011);
  %generate_cost_summary(wa, 2009, 2011);

%end;

/* Due to its size, cost data is not merged across all states here */
