#CODEBOOK.MD


This codebook describes the variables for two data sets (dat, dat2) from the script
programming assignment, run_analysis.R.  For a description of the steps taken to 
construct each data set, please see the README.md file included in this repo. 


dat:

1.  activity_description.  the type of activity being performed by the subject, 
	which is one of 6 measurements.  the original dataset for this is the "activity_labels"
	included in the working directory after running the run_analysis.R script.

2.  subject.  this is the subject who is performing the activity.  only a number is available, 1:30.
	originally taken from the subject_train and subject_test data sets.

3.  columns 3:88. taken from the "features" data set, and are the mean and standard deviation
	for each type of observation.  This is a subset of the original "features" data set.  All
	observations for each subject and activity_description is included, for all variables.  for variables prefixed with 
	't' the observation is time measured in seconds, for those prefixed with 'f' the observation is frequency
	measured in Hz.
	

dat2:

1.  activity_description.  the type of activity being performed by the subject, 
	which is one of 6 measurements.  the original dataset for this is the "activity_labels"
	included in the working directory after running the run_analysis.R script.

2.  subject.  this is the subject who is performing the activity.  only a number is available, 1:30.
	originally taken from the subject_train and subject_test data sets.

3.  columns 3:88.  these are identical variables to the same columns from dat EXCEPT they
	are the average(mean) of those columns.  the results are grouped by subject and
	activity_description.  therefore you have an average of each subject by the type of 
	activity they are performing.  for variables prefixed with 
	't' the observation is time measured in seconds, for those prefixed with 'f' the observation is frequency
	measured in Hz.


FEATURES_INFO.TXT provides a more detailed description of the measurements in both 
dat and dat2 columns 3:88.