# Getting and Cleaning Data
## Read-me for Course Project
### Fritz Lowrey (jaflowrey@gmail.com) 11 March, 2015

####Description
This script will run and compose a filtered list of all mean and std values gathered from the source data sets. It then summarizes the input by subject and activity by generating the mean of each captured parameter.

####Functional Logic
The core logic in this tool merges the test and training data in the files:

	test\X_test.txt
	test\Y_test.txt
	test\subjects_test.txt
	train\X_train.txt
	train\Y_train.txt
	train\subjects_train.txt
	
The inputs are merged into a data frame containing the mean and standard deviation values for the collected data, as defined in:

    *XXX*
	
Once the consolidated, filtered data is completed the data frame is saved to disk from which it can be loaded in the future to avoid re-computation of all results - as inputs will not change. This file is called "TRIMMED.txt", a codebook for the contents of this file is in this GitHub repository.

Once the system has the consolidated, filtered data (either from the runtime logic or by loading from disk) it is summarized by participant and activity. The code creates lists of unique subjects and unique activities from the main data frame, then for each subject+activity combination takes the subset of the data and computes a mean of the data for each variable excluding NA values. The results of each summary are added to an output data frame for saving to disk. The codebook for this file is: XXXXX

####References
asdsfda
asdfdsa
