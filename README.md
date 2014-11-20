#README.MD

The following describes the code in the run_analysis.R file.

1.  The script downloads the files containing the Samsung activity readings.

2.  The files are unzipped into the working directory, so regardless of what files
	have already been downloaded, this will refresh the data set.

3.  The activity labels are loaded to a table, these are the are the descriptors to
	the activity numbers.  will be merged in later steps.

4.  Features are loaded to a table.  These are the column headers, will be appended in 
	following steps.
	
5.  The next step is to create the master "train" data set.  
	a) loads "x_train" (the primary data set for training data) and uses "features" for
		the column names.
	b) column binds the "subject_train" data set, uses "subject" as the header.  This is the
		actual subject who performed the activities.
	c) column binds the "y_train" data set, the header is "activity", which represents the 
		number of the activity.
	d) activity_labels is merged on "activity" which is the number.  this is the descriptive
		activity label (i.e. "walking", "standing", etc.) of what the subject is performing.
	e) all columns except column 1 is selected, the "train" dataset is complete and stored 
		as a temp dataset
	
	
6.  The same steps from #5 above are performed on the nearly identical "test" data set.  "Test"
	has the same columns and variables, with a smaller number of observations in the dataset.

7.  "test" and "train" are merged.  We select the last columns ("activity_description", "subject")
	first, then select all columns which match the "mean" and "std" respectively.  The 
	data is stored in "dat", which is a table of all mean and standard deviations for the
	"train" and "test" data.  dat achieves the requirement for steps #1-4 of the assignment.

8.  remove the temp datasets we created in previous steps.  

9.  create the dat2 data set, which achieves step #5 from the assignment.  this aggregates the
	mean for all columns 3:88, grouped by activity_description and subject. 

10. update the headers for the 1&2 to maintain descriptive variables.

11. an optional step (commented out in this file) to write a file to the working directory
	with the tidy data set from step 11.
	
	