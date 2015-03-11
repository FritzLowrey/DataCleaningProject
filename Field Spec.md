#Data Dictionary and Field Specification
##Getting and Cleaning Data
###Fritz Lowrey
###11 March, 2015

*Description*
This file is created to preserve work done on cleaning the data. A separate file will be created representing the summary contents by participant and activity.

*Fields in Cleaned File*
The output table from the cleaning is the union of data from the test and training data provided in the input data. The subject column represents the "subject_x.txt" file and the activity column is a human readable version of the integer value from the "Y_x.txt" file. The remainder of the fields are extracted from the "X_x.txt" data for each subject, parsed from the string and cast as numeric (real) values.

Fields extracted were selected based on the desired use of "mean" and "std" (standard deviation) elements of the input data. Other fields with these string exist, but are derived data rather than captured input or post-processed contents (i.e. the FFT-based values to reduce noise and dropouts).

The column names are intended to represent the values extracted in a format that is useful both to a human view and to a programmer. Spaces in data.frame headers are difficult to use in code. 

	*subject - int - The subject for this
	*activity - string (character) - string values defined in the activity_labels.txt for the numeric values in the Y_x.txt data file
	*tBodyAcc.mean.X - numeric - field index 1
	*tBodyAcc.mean.Y - numeric - field index 2
	*tBodyAcc.mean.Z - numeric - field index 3
	*tBodyAcc.std.X  - numeric - field index 4
	*tBodyAcc.std.Y  - numeric - field index 5
	*tBodyAcc.std.Z  - numeric - field index 6

	*tGravityAcc.mean.X  - numeric - field index 41
	*tGravityAcc.mean.Y  - numeric - field index 42
	*tGravityAcc.mean.Z  - numeric - field index 43
	*tGravityAcc.std.X  - numeric - field index 44
	*tGravityAcc.std.Y  - numeric - field index 45
	*tGravityAcc.std.Z  - numeric - field index 46

	*tBodyAccJerk.mean.X  - numeric - field index 81
	*tBodyAccJerk.mean.Y  - numeric - field index 82
	*tBodyAccJerk.mean.Z  - numeric - field index 83
	*tBodyAccJerk.std.X  - numeric - field index 84
	*tBodyAccJerk.std.Y  - numeric - field index 85
	*tBodyAccJerk.std.Z  - numeric - field index 86

	*tBodyGyro.mean.X  - numeric - field index 121
	*tBodyGyro.mean.Y  - numeric - field index 122
	*tBodyGyro.mean.Z  - numeric - field index 123
	*tBodyGyro.std.X  - numeric - field index 124
	*tBodyGyro.std.Y  - numeric - field index 125
	*tBodyGyro.std.Z  - numeric - field index 126

	*tBodyGyroJerk.mean.X  - numeric - field index 161
	*tBodyGyroJerk.mean.Y  - numeric - field index 162
	*tBodyGyroJerk.mean.Z  - numeric - field index 163
	*tBodyGyroJerk.std.X  - numeric - field index 164
	*tBodyGyroJerk.std.Y  - numeric - field index 165
	*tBodyGyroJerk.std.Z  - numeric - field index 166

	*tBodyAccMag.mean  - numeric - field index 201
	*tBodyAccMag.std   - numeric - field index 202

	*tGravityAccMag.mean  - numeric - field index 214
	*tGravityAccMag.std   - numeric - field index 215

	*tBodyAccJerkMag.mean  - numeric - field index 227
	*tBodyAccJerkMag.std   - numeric - field index 228

	*tBodyGyroMag.mean  - numeric - field index 240
	*tBodyGyroMag.std   - numeric - field index 241

	*tBodyGyroJerkMag.mean  - numeric - field index 253
	*tBodyGyroJerkMag.std   - numeric - field index 254

	*fBodyAcc.mean.X  - numeric - field index 266
	*fBodyAcc.mean.Y  - numeric - field index 267
	*fBodyAcc.mean.Z  - numeric - field index 268
	*fBodyAcc.std.X  - numeric - field index 269
	*fBodyAcc.std.Y  - numeric - field index 270
	*fBodyAcc.std.Z  - numeric - field index 271

	*fBodyAccJerk.mean.X  - numeric - field index 345
	*fBodyAccJerk.mean.Y  - numeric - field index 346
	*fBodyAccJerk.mean.Z  - numeric - field index 347
	*fBodyAccJerk.std.X  - numeric - field index 348
	*fBodyAccJerk.std.Y  - numeric - field index 349
	*fBodyAccJerk.std.Z  - numeric - field index 350

	*fBodyGyro.mean.X  - numeric - field index 424
	*fBodyGyro.mean.Y  - numeric - field index 425
	*fBodyGyro.mean.Z  - numeric - field index 426
	*fBodyGyro.std.X  - numeric - field index 427
	*fBodyGyro.std.Y  - numeric - field index 428
	*fBodyGyro.std.Z  - numeric - field index 429

	*fBodyAccMag.mean - numeric - field index 503
	*fBodyAccMag.std  - numeric - field index 504

	*fBodyBodyAccJerkMag.mean - numeric - field index 516
	*fBodyBodyAccJerkMag.std  - numeric - field index 517

	*fBodyBodyGyroMag.mean - numeric - field index 529
	*fBodyBodyGyroMag.std  - numeric - field index 530

	*fBodyBodyGyroJerkMag.mean - numeric - field index 542
	*fBodyBodyGyroJerkMag.std  - numeric - field index 543

