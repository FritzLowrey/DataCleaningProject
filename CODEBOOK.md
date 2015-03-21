---
title: "Codebook - Course Project - getdata-012"
author: "Fritz Lowrey"
date: "Friday, March 20, 2015"
---

**Description
This is the CODEBOOK for the output of the run_analysis() function defined for this class.

**Variable definitions:

| Variable   | Data Type 	| Definition 	|
|--------------------------------	|-----------	|------------	|
| subject 	| int 	| The subject ID from the X_test and X_train files 	|
| activity 	| character 	| The textual activity from activity_labels.txt based on the numeric value in Y_test and Y_train 	|
| mean.tBodyAcc.mean.X 	| numeric 	| Mean of the Mean of the Accelerometer on the Body in the X axis 	|
| mean.tBodyAcc.mean.Y 	| numeric 	| Mean of the Mean of the Accelerometer on the Body in the Y axis 	|
| mean.tBodyAcc.mean.Z 	| numeric 	| Mean of the Mean of the Accelerometer on the Body in the Z axis 	|
| mean.tBodyAcc.std.X 	| numeric 	| Mean of the Std. Deviation of the Accelerometer on the Body in the X axis 	|
| mean.tBodyAcc.std.Y 	| numeric 	| Mean of the Std. Deviation of the Accelerometer on the Body in the Y axis 	|
| mean.tBodyAcc.std.Z 	| numeric 	| Mean of the Std. Deviation of the Accelerometer on the Body in the Z axis 	|
| mean.tGravityAcc.mean.X 	| numeric 	| Mean of the Mean of the Accelerometer Gravity Reading in the X axis 	|
| mean.tGravityAcc.mean.Y 	| numeric 	| Mean of the Mean of the Accelerometer Gravity Reading in the Y axis   |
| mean.tGravityAcc.mean.Z 	| numeric 	| Mean of the Mean of the Accelerometer Gravity Reading in the Z axis   |
| mean.tGravityAcc.std.X 	| numeric 	| Mean of the Std. Deviation of the Accelerometer Gravity Reading in the X axis 	|
| mean.tGravityAcc.std.Y 	| numeric 	| Mean of the Std. Deviation of the Accelerometer Gravity Reading in the Y axis 	|
| mean.tGravityAcc.std.Z 	| numeric 	| Mean of the Std. Deviation of the Accelerometer Gravity Reading in the Z axis 	|
| mean.tBodyAccJerk.mean.X 	| numeric 	| Mean of the Mean of the Accelerometer on the Body processed to determine the "jerk" reading in the X axis 	|
| mean.tBodyAccJerk.mean.Y 	| numeric 	| Mean of the Mean of the Accelerometer on the Body processed to determine the "jerk" reading in the Y axis 	|
| mean.tBodyAccJerk.mean.Z 	| numeric 	| Mean of the Mean of the Accelerometer on the Body processed to determine the "jerk" reading in the Z axis 	|
| mean.tBodyAccJerk.std.X 	| numeric 	| Mean of the Std. Deviation of the Accelerometer on the Body processed to determine the "accelleration jerk" reading Reading in the X axis  	|
| mean.tBodyAccJerk.std.Y 	| numeric 	| Mean of the Std. Deviation of the Accelerometer on the Body processed to determine the "accelleration jerk" reading Reading in the Y axis   	|
| mean.tBodyAccJerk.std.Z 	| numeric 	| Mean of the Std. Deviation of the Accelerometer on the Body processed to determine the "accelleration jerk" reading Reading in the Z axis  	|
| mean.tBodyGyro.mean.X 	| numeric 	| Mean of the Mean of the Gyroscope on the Body in the X axis 	|
| mean.tBodyGyro.mean.Y 	| numeric 	| Mean of the Mean of the Gyroscope on the Body in the Y axis 	|
| mean.tBodyGyro.mean.Z 	| numeric 	| Mean of the Mean of the Gyroscope on the Body in the Z axis 	|
| mean.tBodyGyro.std.X 	| numeric 	| Mean of the Std. Deviation of the Gyroscope on the Body in the X axis 	|
| mean.tBodyGyro.std.Y 	| numeric 	| Mean of the Std. Deviation of the Gyroscope on the Body in the Y axis 	|
| mean.tBodyGyro.std.Z 	| numeric 	| Mean of the Std. Deviation of the Gyroscope on the Body in the Z axis 	|
| mean.tBodyGyroJerk.mean.X 	| numeric 	| Mean of the Mean of the Gyroscope on the Body processed to determine the "jerk" reading in the X axis 	|
| mean.tBodyGyroJerk.mean.Y 	| numeric 	| Mean of the Mean of the Gyroscope on the Body processed to determine the "jerk" reading in the Y axis 	|
| mean.tBodyGyroJerk.mean.Z 	| numeric 	| Mean of the Mean of the Gyroscope on the Body processed to determine the "jerk" reading in the Z axis 	|
| mean.tBodyGyroJerk.std.X 	| numeric 	| Mean of the Std. Deviation of the Gyroscope on the Body processed to determine the "jerk" reading in the X axis 	|
| mean.tBodyGyroJerk.std.Y 	| numeric 	| Mean of the Std. Deviation of the Gyroscope on the Body processed to determine the "jerk" reading in the Y axis 	|
| mean.tBodyGyroJerk.std.Z 	| numeric 	| Mean of the Std. Deviation of the Gyroscope on the Body processed to determine the "jerk" reading in the Z axis 	|
| mean.tBodyAccMag.mean 	| numeric 	| Mean of the Mean of the Accelerometer on the Body processed to determine the "magnitude" reading axis 	|
| mean.tBodyAccMag.std 	| numeric 	| Mean of the Std. Deviation of the Accelerometer on the Body processed to determine the "magnitude" 	|
| mean.tGravityAccMag.mean 	| numeric 	| Mean of the Mean of the Accelerometer Gravity reading processed to determine the "magnitude" 	|
| mean.tGravityAccMag.std 	| numeric 	| Mean of the Std. Deviation of the Accelerometer Gravity reading processed to determine the "magnitude" 	|
| mean.tBodyAccJerkMag.mean 	| numeric 	| Mean of the mean of the magnitude of the jerk reading of the Accelerometer on the body 	|
| mean.tBodyAccJerkMag.std 	| numeric 	| Mean of the std. deviation of the magnitude of the jerk reading of the Accelerometer on the body	|
| mean.tBodyGyroMag.mean 	| numeric 	| Mean of the mean of the magnitude of the reading of the gyroscope on the body 	|
| mean.tBodyGyroMag.std 	| numeric 	| Mean of the std. deviation of the magnitude of the reading of the gyroscope on the body  	|
| mean.tBodyGyroJerkMag.mean 	| numeric 	| Mean of the mean of the magnitude of the jerk reading of the gyroscope on the body  	|
| mean.tBodyGyroJerkMag.std 	| numeric 	| Mean of the std. deviation of the magnitude of the jerk reading of the gyroscope on the body  	|
| mean.fBodyAcc.mean.X 	| numeric 	| Mean of the mean of the FFT of the reading from the accelerometer on the body in the X axis 	|
| mean.fBodyAcc.mean.Y 	| numeric 	| Mean of the mean of the FFT of the reading from the accelerometer on the body in the Y axis 	|
| mean.fBodyAcc.mean.Z 	| numeric 	| Mean of the mean of the FFT of the reading from the accelerometer on the body in the Z axis 	|
| mean.fBodyAcc.std.X 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the accelerometer on the body in the X axis 	|
| mean.fBodyAcc.std.Y 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the accelerometer on the body in the Y axis 	|
| mean.fBodyAcc.std.Z 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the accelerometer on the body in the Z axis 	|
| mean.fBodyAccJerk.mean.X 	| numeric 	| Mean of the mean of the FFT of the reading from the accelerometer "jerk" on the body in the X axis 	|
| mean.fBodyAccJerk.mean.Y 	| numeric 	| Mean of the mean of the FFT of the reading from the accelerometer "jerk" on the body in the Y axis 	|
| mean.fBodyAccJerk.mean.Z 	| numeric 	| Mean of the mean of the FFT of the reading from the accelerometer "jerk" on the body in the Z axis 	|
| mean.fBodyAccJerk.std.X 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the accelerometer "jerk" on the body in the X axis 	|
| mean.fBodyAccJerk.std.Y 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the accelerometer "jerk" on the body in the Y axis 	|
| mean.fBodyAccJerk.std.Z 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the accelerometer "jerk" on the body in the Z axis 	|
| mean.fBodyGyro.mean.X 	| numeric 	| Mean of the mean of the FFT of the reading from the gyroscope on the body in the X axis 	|
| mean.fBodyGyro.mean.Y 	| numeric 	| Mean of the mean of the FFT of the reading from the gyroscope on the body in the Y axis 	|
| mean.fBodyGyro.mean.Z 	| numeric 	| Mean of the mean of the FFT of the reading from the gyroscope on the body in the Z axis 	|
| mean.fBodyGyro.std.X 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the gyroscope on the body in the X axis 	|
| mean.fBodyGyro.std.Y 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the gyroscope on the body in the Y axis 	|
| mean.fBodyGyro.std.Z 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the gyroscope on the body in the Z axis 	|
| mean.fBodyAccMag.mean 	| numeric 	| Mean of the mean of the FFT of the reading from the magnitude of the accellerometer on the body	|
| mean.fBodyAccMag.std 	| numeric 	| Mean of the std. deviation of the FFT of the reading from the magnitude of the accellerometer on the body 	|
| mean.fBodyBodyAccJerkMag.mean 	| numeric 	| Mean of the mean of the FFT of the body accellerometer jerk manitude 	|
| mean.fBodyBodyAccJerkMag.std 	| numeric 	| Mean of the std. deviation of the FFT of the body accellerometer jerk manitude 	|
| mean.fBodyBodyGyroMag.mean 	| numeric 	| Mean of the mean of the FFT of the gyroscope magnitude on the body 	|
| mean.fBodyBodyGyroMag.std 	| numeric 	| Mean of the std. deviation of the FFT of the gyroscope magnitude on the body 	|
| mean.fBodyBodyGyroJerkMag.mean 	| numeric 	| Mean of the mean of the FFT of the magnitude of the jerk recorded by the gyroscopy on the body 	|
| mean.fBodyBodyGyroJerkMag.std 	| numeric 	| Mean of the std. deviation of the FFT of the magnitude of the jerk recorded by the gyroscopy on the body 	|

