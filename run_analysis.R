
# prettyActivity: take an integer activity value, return a string with the readable version based on activity_labels.txt
prettyActivity <- function(x)
{
  if(x == 1) return("WALKING")
  else if(x == 2) return("WALKING_UPSTAIRS")
  else if(x == 3) return("WALKING_DOWNSTAIRS")
  else if(x == 4) return("SITTING")
  else if(x == 5) return("STANDING")
  else if(x == 6) return("LAYING")
  else return("UNKNOWN")
}

# getBigFrame - merge the input files and select out the fields necessary for summarization (see "CODEBOOK - TRIMMED.md" for 
# details)
# input = directory for the test/train folders, default is getwd()
# output = No return value but a global object called global.frame is created containing the merged, filtered data
getBigFrame <- function(baseDir)
{
  testFolder <- paste(baseDir, "test", sep="/")
  trainFolder <- paste(baseDir, "train", sep="/")
  
  Subjects <- scan(paste(testFolder, "subject_test.txt", sep = "/"), what="integer")  
  Activities <- scan(paste(testFolder, "Y_test.txt", sep = "/"))
  
  Subjects <- c(Subjects, scan(paste(trainFolder, "subject_train.txt", sep = "/"), what="integer"))
  Activities <- c(Activities, scan(paste(trainFolder, "Y_train.txt", sep = "/")))
  
  Subjects <- as.integer(Subjects)
  Activities <- sapply(Activities, prettyActivity) # convert the ints to strings
  
  big.frame <- data.frame(
    subject = integer(), 
    activity = character(),
    tBodyAcc.mean.X = numeric(), 
    tBodyAcc.mean.Y = numeric(),
    tBodyAcc.mean.Z = numeric(),
    tBodyAcc.std.X  = numeric(),
    tBodyAcc.std.Y  = numeric(),
    tBodyAcc.std.Z  = numeric(),
    
	  tGravityAcc.mean.X  = numeric(),
    tGravityAcc.mean.Y  = numeric(),
    tGravityAcc.mean.Z  = numeric(),
    tGravityAcc.std.X  = numeric(),
    tGravityAcc.std.Y  = numeric(),
    tGravityAcc.std.Z  = numeric(),
    
    tBodyAccJerk.mean.X  = numeric(),
    tBodyAccJerk.mean.Y  = numeric(),
    tBodyAccJerk.mean.Z  = numeric(),
    tBodyAccJerk.std.X  = numeric(),
    tBodyAccJerk.std.Y  = numeric(),
    tBodyAccJerk.std.Z  = numeric(),
    
    tBodyGyro.mean.X  = numeric(),
    tBodyGyro.mean.Y  = numeric(),
    tBodyGyro.mean.Z  = numeric(),
    tBodyGyro.std.X  = numeric(),
    tBodyGyro.std.Y  = numeric(),
    tBodyGyro.std.Z  = numeric(),
    
    tBodyGyroJerk.mean.X  = numeric(),
    tBodyGyroJerk.mean.Y  = numeric(),
    tBodyGyroJerk.mean.Z  = numeric(),
    tBodyGyroJerk.std.X  = numeric(),
    tBodyGyroJerk.std.Y  = numeric(),
    tBodyGyroJerk.std.Z  = numeric(),
    
    tBodyAccMag.mean  = numeric(),
    tBodyAccMag.std   = numeric(),
    
    tGravityAccMag.mean  = numeric(),
    tGravityAccMag.std   = numeric(),
    
    tBodyAccJerkMag.mean  = numeric(),
    tBodyAccJerkMag.std   = numeric(),
    
    tBodyGyroMag.mean  = numeric(),
    tBodyGyroMag.std   = numeric(),
    
    tBodyGyroJerkMag.mean  = numeric(),
    tBodyGyroJerkMag.std   = numeric(),
    
    fBodyAcc.mean.X  = numeric(),
    fBodyAcc.mean.Y  = numeric(),
    fBodyAcc.mean.Z  = numeric(),
    fBodyAcc.std.X  = numeric(),
    fBodyAcc.std.Y  = numeric(),
    fBodyAcc.std.Z  = numeric(),
    
    fBodyAccJerk.mean.X  = numeric(),
    fBodyAccJerk.mean.Y  = numeric(),
    fBodyAccJerk.mean.Z  = numeric(),
    fBodyAccJerk.std.X  = numeric(),
    fBodyAccJerk.std.Y  = numeric(),
    fBodyAccJerk.std.Z  = numeric(),
    
    fBodyGyro.mean.X  = numeric(),
    fBodyGyro.mean.Y  = numeric(),
    fBodyGyro.mean.Z  = numeric(),
    fBodyGyro.std.X  = numeric(),
    fBodyGyro.std.Y  = numeric(),
    fBodyGyro.std.Z  = numeric(),

    fBodyAccMag.mean  = numeric(),
    fBodyAccMag.std  = numeric(),
    
    fBodyBodyAccJerkMag.mean  = numeric(),
    fBodyBodyAccJerkMag.std  = numeric(),
    
    fBodyBodyGyroMag.mean  = numeric(),
    fBodyBodyGyroMag.std  = numeric(),
    
    fBodyBodyGyroJerkMag.mean  = numeric(),
    fBodyBodyGyroJerkMag.std  = numeric(),
    stringsAsFactors =FALSE) ## end of dataframe	
	
	# memory hungry as heck with 500+ values per line and 10k+ record, but it makes the DF creation much easier and we should GC after we return
  full.list <- lapply(strsplit(readLines(paste(testFolder, "X_test.txt", sep = "/"))," "), as.numeric)
  full.list <- append(full.list, lapply(strsplit(readLines(paste(trainFolder, "X_train.txt", sep = "/"))," "), as.numeric))
  
  thisRow <- 1
  while(thisRow < length(full.list))
  {
    #debug printout, but it's useful to see that processing is taking place.
    print(thisRow)
    
    aRow <- full.list[[thisRow]]
    aRow <- aRow[c(3:length(aRow))] # trim the first 2 elements
    
    # every row has a subject and an activity
  	thisList <- list(Subjects[thisRow], as.character(Activities[thisRow]))
  	
    # see data dictionary for definition of each element extracted from the input
    thisList <- append(thisList, aRow[c(1,2,3,4,5,6,41,42,43,44,45,46, 81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,
                            227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,
                            530,542,543)])  	                        
  	
  	#appending a list to a DF is surprisingly annoying if you want to keep column names 
    rowDF <- data.frame(thisList, stringsAsFactors =FALSE)
    rowDF <- setNames(rowDF, names(big.frame))
    big.frame <- rbind(big.frame, rowDF)
    
    #next row
  	thisRow <- thisRow + 1
  }
  
  # no point in passing this big object around, so push it into a global value
  global.frame <<- big.frame
  
  return()
}

# SummarizeInfo
# get the data from global.frame for the given participant and activity. For each data column (3:...) compute a mean disregarding NAs
# return a list of this subject, activity, and all computed values to be added to the output data.frame
summarizeInfo <- function(thisSubject, thisActivity)
{
  thisSummary <- list(thisSubject, thisActivity)
  
  slice <- global.frame[global.frame$subject == thisSubject & global.frame$activity == thisActivity,];  
  
  for(thisCol in 3:length(names(slice)))
  {
    anAvg <- mean(na.omit(slice[,thisCol]))
    thisSummary <- append(thisSummary, anAvg)
  }
  
  return(thisSummary)
  
}

# create an empty data frame for the summary data
makeSummaryDF <- function()
{
  summaryDF <- data.frame(
    subject = integer(), 
    activity = character(),
    mean.tBodyAcc.mean.X = numeric(),
    mean.tBodyAcc.mean.Y = numeric(),
    mean.tBodyAcc.mean.Z = numeric(),
    mean.tBodyAcc.std.X  = numeric(),
    mean.tBodyAcc.std.Y  = numeric(),
    mean.tBodyAcc.std.Z  = numeric(),
    
    mean.tGravityAcc.mean.X  = numeric(),
    mean.tGravityAcc.mean.Y  = numeric(),
    mean.tGravityAcc.mean.Z  = numeric(),
    mean.tGravityAcc.std.X  = numeric(),
    mean.tGravityAcc.std.Y  = numeric(),
    mean.tGravityAcc.std.Z  = numeric(),
    
    mean.tBodyAccJerk.mean.X  = numeric(),
    mean.tBodyAccJerk.mean.Y  = numeric(),
    mean.tBodyAccJerk.mean.Z  = numeric(),
    mean.tBodyAccJerk.std.X  = numeric(),
    mean.tBodyAccJerk.std.Y  = numeric(),
    mean.tBodyAccJerk.std.Z  = numeric(),
    
    mean.tBodyGyro.mean.X  = numeric(),
    mean.tBodyGyro.mean.Y  = numeric(),
    mean.tBodyGyro.mean.Z  = numeric(),
    mean.tBodyGyro.std.X  = numeric(),
    mean.tBodyGyro.std.Y  = numeric(),
    mean.tBodyGyro.std.Z  = numeric(),
    
    mean.tBodyGyroJerk.mean.X  = numeric(),
    mean.tBodyGyroJerk.mean.Y  = numeric(),
    mean.tBodyGyroJerk.mean.Z  = numeric(),
    mean.tBodyGyroJerk.std.X  = numeric(),
    mean.tBodyGyroJerk.std.Y  = numeric(),
    mean.tBodyGyroJerk.std.Z  = numeric(),
    
    mean.tBodyAccMag.mean  = numeric(),
    mean.tBodyAccMag.std   = numeric(),
    
    mean.tGravityAccMag.mean  = numeric(),
    mean.tGravityAccMag.std   = numeric(),
    
    mean.tBodyAccJerkMag.mean  = numeric(),
    mean.tBodyAccJerkMag.std   = numeric(),
    
    mean.tBodyGyroMag.mean  = numeric(),
    mean.tBodyGyroMag.std   = numeric(),
    
    mean.tBodyGyroJerkMag.mean  = numeric(),
    mean.tBodyGyroJerkMag.std   = numeric(),
    
    mean.fBodyAcc.mean.X  = numeric(),
    mean.fBodyAcc.mean.Y  = numeric(),
    mean.fBodyAcc.mean.Z  = numeric(),
    mean.fBodyAcc.std.X  = numeric(),
    mean.fBodyAcc.std.Y  = numeric(),
    mean.fBodyAcc.std.Z  = numeric(),
    
    mean.fBodyAccJerk.mean.X  = numeric(),
    mean.fBodyAccJerk.mean.Y  = numeric(),
    mean.fBodyAccJerk.mean.Z  = numeric(),
    mean.fBodyAccJerk.std.X  = numeric(),
    mean.fBodyAccJerk.std.Y  = numeric(),
    mean.fBodyAccJerk.std.Z  = numeric(),
    
    mean.fBodyGyro.mean.X  = numeric(),
    mean.fBodyGyro.mean.Y  = numeric(),
    mean.fBodyGyro.mean.Z  = numeric(),
    mean.fBodyGyro.std.X  = numeric(), 
    mean.fBodyGyro.std.Y  = numeric(),
    mean.fBodyGyro.std.Z  = numeric(),
    
    mean.fBodyAccMag.mean  = numeric(),
    mean.fBodyAccMag.std  = numeric(),
    
    mean.fBodyBodyAccJerkMag.mean  = numeric(),
    mean.fBodyBodyAccJerkMag.std  = numeric(),
    
    mean.fBodyBodyGyroMag.mean  = numeric(),
    mean.fBodyBodyGyroMag.std  = numeric(),
    
    mean.fBodyBodyGyroJerkMag.mean  = numeric(),
    mean.fBodyBodyGyroJerkMag.std = numeric(),
    stringsAsFactors = FALSE    # important for setting the "Activity" to a string value where everything is a number
    )
  
  return(summaryDF)
}

# run_analysis: Perform consolidation and summarization of Sample input
# Pre-req: set working directory to the folder containing the "test" and "train" subfolders
#     e.g. "/myroot/getdata-projectfiles-UCI HAR Dataset"
# Input: the base directory containing the "test" and "train" folders for the input data
#         output file will be in this directory named RUN_ANALYSIS_SUMMARY from table.write()
# Desired functionality:
##You should create one R script called run_analysis.R that does the following. 
##- Merges the training and the test sets to create one data set.
##- Extracts only the measurements on the mean and standard deviation for each measurement. 
##- Uses descriptive activity names to name the activities in the data set
##- Appropriately labels the data set with descriptive variable names. 
##- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Good luck!
run_analysis <- function(baseDir = getwd())
{  
  # create a filename for my temp file
  tableFile <- paste(baseDir, "TRIMMED.txt", sep="/")
  
  # for debugging, if the file has already been created, load and use it. Otherwise, compute it from the input data
  if(!file.exists(tableFile))
  {
    # sets up global.frame based on input data
    getBigFrame(baseDir)
    
    # save the consolidated file for later use
    write.table(global.frame, file = tableFile, row.names=FALSE)    
  }
  else
  {
    # load the consolidated file to save time during development
    global.frame <<- read.table(header=TRUE, file=tableFile)
  }	
  
  # now that I have a populated combined DF, time to summarize by subject and activity
  participants <- unique(global.frame$subject)
  activities <- unique(global.frame$activity)
  
  # create my empty data.frame with all headers
  dfSummary <- makeSummaryDF()
  
  for(thisPart in participants)
  {
    for(thisActivity in activities)
    {      
      listRow <- summarizeInfo(thisPart, thisActivity)
      dfRow <- data.frame(listRow, stringsAsFactors=FALSE)
      dfRow <- setNames(dfRow, names(dfSummary))
      
      dfSummary <- rbind(dfSummary, dfRow)      
    }
  }
  
  # compose my output file name
  summaryFile <- paste(baseDir, "MEAN SUMMARY.txt", sep="/")
  
  # sort the output by subject and activity - not required but easier to look at
  dfSummary <- dfSummary[with(dfSummary, order(subject, activity)),]
  
  # write the filtered summary file
  write.table(dfSummary, file=summaryFile, row.names=FALSE)
  
  # a bit of UI to make things friendly
  return("Complete")    
}
