# run_analysis: Perform consolidation and summarization of Sample input
# Pre-req: set working directory to the folder containing the "test" and "train" subfolders
#     e.g. ./myroot/getdata-projectfiles-UCI HAR Dataset
# output will be in this directory named RUN_ANALYSIS_SUMMARY from table.write()
run_analysis <- function()
{
  ##You should create one R script called run_analysis.R that does the following. 
  ##- Merges the training and the test sets to create one data set.
  ##- Extracts only the measurements on the mean and standard deviation for each measurement. 
  ##- Uses descriptive activity names to name the activities in the data set
  ##- Appropriately labels the data set with descriptive variable names. 
  ##- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  ##Good luck!
  
  testFolder <- paste(getwd(), "test", sep="/")
  testSubjects <- scan(paste(testFolder, "subject_test.txt", sep = "/"), what="integer")  
  testY <- scan(paste(testFolder, "Y_test.txt", sep = "/"), what="numeric")
  textX <- list()
  
  lenTS <- length(testSubjects)
  
  # make a data.frame holder for the data, including place holder fields for the other input
  testDF <- data.frame(subject = as.integer(testSubjects), y.test = as.integer(testY), 
                       body.mean.x = as.numeric(c(1:lenTS)), body.mean.y= as.numeric(c(1:lenTS)), body.mean.z= as.numeric(c(1:lenTS)), 
                       body.std.x= as.numeric(c(1:lenTS)), body.std.y= as.numeric(c(1:lenTS)), body.std.z= as.numeric(c(1:lenTS)))
  
  # got this nice line from the http://stackoverflow.com/a/4123297/4512294
  # NOTE: This is very memory intensive, a line-by-line approach may be more efficient on RAM constrained computers
  #results.list <- lapply(strsplit(readLines(paste(testFolder, "X_test.txt", sep = "/"))," "), as.numeric)
  
  # this file solution is less memory hogging
  rowCount <- 1
  con  <- file(paste(testFolder, "X_test.txt", sep = "/"), open = "r")  
  while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) 
  {
    # do stuff
    tmpVec = strsplit(oneLine," ")

    # Test elements 1-3 are the mean, offset by 2 because of lead spaces
    testDF[rowCount, ]$mean.x <- as.numeric(tmpVec[[1]][3])
    testDF[rowCount, ]$mean.y <- as.numeric(tmpVec[[1]][4])
    testDF[rowCount, ]$mean.z <- as.numeric(tmpVec[[1]][5] )
    
    # Test elements 4-6 are the std, offset by 2 because of lead spaces
    testDF[rowCount, ]$std.x <- as.numeric(tmpVec[[1]][6])
    testDF[rowCount, ]$std.y <- as.numeric(tmpVec[[1]][7])
    testDF[rowCount, ]$std.z <- as.numeric(tmpVec[[1]][8]) 
    
    41 tGravityAcc-mean()-X
    42 tGravityAcc-mean()-Y
    43 tGravityAcc-mean()-Z
    44 tGravityAcc-std()-X
    45 tGravityAcc-std()-Y
    46 tGravityAcc-std()-Z
    
    81 tBodyAccJerk-mean()-X
    82 tBodyAccJerk-mean()-Y
    83 tBodyAccJerk-mean()-Z
    84 tBodyAccJerk-std()-X
    85 tBodyAccJerk-std()-Y
    86 tBodyAccJerk-std()-Z
    
    121 tBodyGyro-mean()-X
    122 tBodyGyro-mean()-Y
    123 tBodyGyro-mean()-Z
    124 tBodyGyro-std()-X
    125 tBodyGyro-std()-Y
    126 tBodyGyro-std()-Z
    
    161 tBodyGyroJerk-mean()-X
    162 tBodyGyroJerk-mean()-Y
    163 tBodyGyroJerk-mean()-Z
    164 tBodyGyroJerk-std()-X
    165 tBodyGyroJerk-std()-Y
    166 tBodyGyroJerk-std()-Z
    
    201 tBodyAccMag-mean()
    202 tBodyAccMag-std()
    
    214 tGravityAccMag-mean()
    215 tGravityAccMag-std()
    
    227 tBodyAccJerkMag-mean()
    228 tBodyAccJerkMag-std()
    
    240 tBodyGyroMag-mean()
    241 tBodyGyroMag-std()
    
    253 tBodyGyroJerkMag-mean()
    254 tBodyGyroJerkMag-std()
    
    266 fBodyAcc-mean()-X
    267 fBodyAcc-mean()-Y
    268 fBodyAcc-mean()-Z
    269 fBodyAcc-std()-X
    270 fBodyAcc-std()-Y
    271 fBodyAcc-std()-Z
    
    345 fBodyAccJerk-mean()-X
    346 fBodyAccJerk-mean()-Y
    347 fBodyAccJerk-mean()-Z
    348 fBodyAccJerk-std()-X
    349 fBodyAccJerk-std()-Y
    350 fBodyAccJerk-std()-Z
    
    424 fBodyGyro-mean()-X
    425 fBodyGyro-mean()-Y
    426 fBodyGyro-mean()-Z
    427 fBodyGyro-std()-X
    428 fBodyGyro-std()-Y
    429 fBodyGyro-std()-Z
    
    503 fBodyAccMag-mean()
    504 fBodyAccMag-std()
    
    516 fBodyBodyAccJerkMag-mean()
    517 fBodyBodyAccJerkMag-std()
    
    529 fBodyBodyGyroMag-mean()
    530 fBodyBodyGyroMag-std()
    
    542 fBodyBodyGyroJerkMag-mean()
    543 fBodyBodyGyroJerkMag-std()
    
    rowCount <- rowCount + 1

  }   
  close(con)
  
  write.table(testDF, file = paste(getwd(), "TEST_OUT.csv", sep="/"), row.names=FALSE)
  
  return()
  

  #trainFolder <- paste(getwd(), "train", sep="/")
  #trainSubjects <- file.read(paste(trainFolder, "subject_train.txt", sep = "/"))  
  #trainX <- file.read(paste(trainFolder, "X_train.txt", sep = "/"))  
  #trainY <- file.read(paste(trainFolder, "Y_train.txt", sep = "/"))  
  
  # Merge subjects list
  #foreach subject
  
}
