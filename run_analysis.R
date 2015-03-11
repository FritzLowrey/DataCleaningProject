
# prettyActivity: take an integer activity value, return a string with the readable version
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
    tBodyAcc.mean.X = numeric(), # lapply(full.list, "[", 3),
    tBodyAcc.mean.Y = numeric(), #= lapply(full.list, "[", 4),
    tBodyAcc.mean.Z = numeric(), #= lapply(full.list, "[", 5),
    tBodyAcc.std.X  = numeric(), #= lapply(full.list, "[", 6),
    tBodyAcc.std.Y  = numeric(), #= lapply(full.list, "[", 7),
    tBodyAcc.std.Z  = numeric(), #= lapply(full.list, "[", 8), #
    
	  tGravityAcc.mean.X  = numeric(), #= lapply(full.list, "[", 43), #41 tGravityAcc.mean.X
    tGravityAcc.mean.Y  = numeric(), #= lapply(full.list, "[", 44), #42 tGravityAcc.mean.Y
    tGravityAcc.mean.Z  = numeric(), #= lapply(full.list, "[", 45), #43 tGravityAcc.mean.Z
    tGravityAcc.std.X  = numeric(), #= lapply(full.list, "[", 46), #44 tGravityAcc.std.X
    tGravityAcc.std.Y  = numeric(), #= lapply(full.list, "[", 47), #45 tGravityAcc.std.Y
    tGravityAcc.std.Z  = numeric(), #= lapply(full.list, "[", 48), #46 tGravityAcc.std.Z
    
    tBodyAccJerk.mean.X  = numeric(), #= lapply(full.list, "[", 83), #81 tBodyAccJerk.mean.X
    tBodyAccJerk.mean.Y  = numeric(), #= lapply(full.list, "[", 84), #82 tBodyAccJerk.mean.Y
    tBodyAccJerk.mean.Z  = numeric(), #= lapply(full.list, "[", 85), #83 tBodyAccJerk.mean.Z
    tBodyAccJerk.std.X  = numeric(), #= lapply(full.list, "[", 86), #84 tBodyAccJerk.std.X
    tBodyAccJerk.std.Y  = numeric(), #= lapply(full.list, "[", 87), #85 tBodyAccJerk.std.Y
    tBodyAccJerk.std.Z  = numeric(), # = lapply(full.list, "[", 88), #86 tBodyAccJerk.std.Z
    
    tBodyGyro.mean.X  = numeric(), #= lapply(full.list, "[", 123), #121 tBodyGyro.mean.X
    tBodyGyro.mean.Y  = numeric(), #= lapply(full.list, "[", 124), #122 tBodyGyro.mean.Y
    tBodyGyro.mean.Z  = numeric(), #= lapply(full.list, "[", 125), #123 tBodyGyro.mean.Z
    tBodyGyro.std.X  = numeric(), #= lapply(full.list, "[", 126), #124 tBodyGyro.std.X
    tBodyGyro.std.Y  = numeric(), #= lapply(full.list, "[", 127), #125 tBodyGyro.std.Y
    tBodyGyro.std.Z  = numeric(), #= lapply(full.list, "[", 128), #126 tBodyGyro.std.Z
    
    tBodyGyroJerk.mean.X  = numeric(), #= lapply(full.list, "[", 163), #161 tBodyGyroJerk-mean()-X
    tBodyGyroJerk.mean.Y  = numeric(), #= lapply(full.list, "[", 164), #162 tBodyGyroJerk-mean()-Y
    tBodyGyroJerk.mean.Z  = numeric(), #= lapply(full.list, "[", 165), #163 tBodyGyroJerk-mean()-Z
    tBodyGyroJerk.std.X  = numeric(), #= lapply(full.list, "[", 166), #164 tBodyGyroJerk-std()-X
    tBodyGyroJerk.std.Y  = numeric(), #= lapply(full.list, "[", 167), #165 tBodyGyroJerk-std()-Y
    tBodyGyroJerk.std.Z  = numeric(), #= lapply(full.list, "[", 168), #166 tBodyGyroJerk-std()-Z
    
    tBodyAccMag.mean  = numeric(), #= lapply(full.list, "[", 203), #201 tBodyAccMag-mean()
    tBodyAccMag.std   = numeric(), #= lapply(full.list, "[", 204), #202 tBodyAccMag-std()
    
    tGravityAccMag.mean  = numeric(), #= lapply(full.list, "[", 216), #214 tGravityAccMag-mean()
    tGravityAccMag.std   = numeric(), #= lapply(full.list, "[", 217), #215 tGravityAccMag-std()
    
    tBodyAccJerkMag.mean  = numeric(), #= lapply(full.list, "[", 229), #227 tBodyAccJerkMag-mean()
    tBodyAccJerkMag.std   = numeric(), #= lapply(full.list, "[", 230), #228 tBodyAccJerkMag-std()
    
    tBodyGyroMag.mean  = numeric(), #= lapply(full.list, "[", 242), #240 tBodyGyroMag-mean()
    tBodyGyroMag.std   = numeric(), #= lapply(full.list, "[", 243), #241 tBodyGyroMag-std()
    
    tBodyGyroJerkMag.mean  = numeric(), #= lapply(full.list, "[", 255), #253 tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag.std   = numeric(), #= lapply(full.list, "[", 256), #254 tBodyGyroJerkMag-std()
    
    fBodyAcc.mean.X  = numeric(), #= lapply(full.list, "[", 268), #266 fBodyAcc-mean()-X
    fBodyAcc.mean.Y  = numeric(), #= lapply(full.list, "[", 269), #267 fBodyAcc-mean()-Y
    fBodyAcc.mean.Z  = numeric(), #= lapply(full.list, "[", 270), #268 fBodyAcc-mean()-Z
    fBodyAcc.std.X  = numeric(), #= lapply(full.list, "[", 271), #269 fBodyAcc-std()-X
    fBodyAcc.std.Y  = numeric(), #= lapply(full.list, "[", 272), #270 fBodyAcc-std()-Y
    fBodyAcc.std.Z  = numeric(), #= lapply(full.list, "[", 273), #271 fBodyAcc-std()-Z
    
    fBodyAccJerk.mean.X  = numeric(), #= lapply(full.list, "[", 347), #345 fBodyAccJerk-mean()-X
    fBodyAccJerk.mean.Y  = numeric(), #= lapply(full.list, "[", 348), #346 fBodyAccJerk-mean()-Y
    fBodyAccJerk.mean.Z  = numeric(), #= lapply(full.list, "[", 349), #347 fBodyAccJerk-mean()-Z
    fBodyAccJerk.std.X  = numeric(), #= lapply(full.list, "[", 350), #348 fBodyAccJerk-std()-X
    fBodyAccJerk.std.Y  = numeric(), #= lapply(full.list, "[", 352), #349 fBodyAccJerk-std()-Y
    fBodyAccJerk.std.Z  = numeric(), #= lapply(full.list, "[", 353), #350 fBodyAccJerk-std()-Z
    
    fBodyGyro.mean.X  = numeric(), #= lapply(full.list, "[", 426), #424 fBodyGyro-mean()-X
    fBodyGyro.mean.Y  = numeric(), #= lapply(full.list, "[", 427), #425 fBodyGyro-mean()-Y
    fBodyGyro.mean.Z  = numeric(), #= lapply(full.list, "[", 428), #426 fBodyGyro-mean()-Z
    fBodyGyro.std.X  = numeric(), #= lapply(full.list, "[", 429), #427 fBodyGyro-std()-X
    fBodyGyro.std.Y  = numeric(), #= lapply(full.list, "[", 430), #428 fBodyGyro-std()-Y
    fBodyGyro.std.Z  = numeric(), #= lapply(full.list, "[", 431), #429 fBodyGyro-std()-Z

    fBodyAccMag.mean  = numeric(), #= lapply(full.list, "[", 505), #503 fBodyAccMag-mean()
    fBodyAccMag.std  = numeric(), #= lapply(full.list, "[", 506), #504 fBodyAccMag-std()
    
    fBodyBodyAccJerkMag.mean  = numeric(), #= lapply(full.list, "[", 518), #516 fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag.std  = numeric(), #= lapply(full.list, "[", 519), #517 fBodyBodyAccJerkMag-std()
    
    fBodyBodyGyroMag.mean  = numeric(), #= lapply(full.list, "[", 531), #529 fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag.std  = numeric(), #= lapply(full.list, "[", 532), #530 fBodyBodyGyroMag-std()
    
    fBodyBodyGyroJerkMag.mean  = numeric(), #= lapply(full.list, "[", 544), #542 fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag.std  = numeric() #= lapply(full.list, "[", 545) #543 fBodyBodyGyroJerkMag-std()
	) ## end of dataframe
	
	
	# memory hungry as heck with 500+ values per line and 10k+ record, but it makes the DF creation much easier and we should GC after we return
  full.list <- lapply(strsplit(readLines(paste(testFolder, "X_test.txt", sep = "/"))," "), as.numeric)
  full.list <- append(full.list, lapply(strsplit(readLines(paste(trainFolder, "X_train.txt", sep = "/"))," "), as.numeric))
  
  thisRow <- 1
  while(thisRow < length(full.list))
  {
    print(thisRow)
    aRow <- full.list[[thisRow]]
    aRow <- aRow[c(3:length(aRow))] # trim the first 2 elements
    
    # every row has a subject and an activity
  	thisList <- list(Subjects[thisRow], as.character(Activities[thisRow]))
  	
    # see data dictionary for definition of each element extracted from the input
    thisList <- append(thisList, aRow[c(1,2,3,4,5,6,41,42,43,44,45,46, 81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,
                            227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,
                            530,542,543)])  	                        
  	
  	#big.frame[nrow(big.frame)+1, ] <- thisList    
    big.frame <- rbind(big.frame, setNames(thisList, names(big.frame)), default.stringsasfactors=FALSE)
  	
  	thisRow <- thisRow + 1
  }
  
  return(big.frame)    
}

# run_analysis: Perform consolidation and summarization of Sample input
# Pre-req: set working directory to the folder containing the "test" and "train" subfolders
#     e.g. ./myroot/getdata-projectfiles-UCI HAR Dataset
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

  tableFile <- paste(baseDir, "TRIMMED.txt", sep="/")
  
  if(!file.exists(tableFile))
  {
    big.frame <- getBigFrame(baseDir)
    
    write.table(big.frame, file = tableFile, row.names=FALSE)    
  }
  else
  {
    big.frame <- read.table(header=TRUE, file=tableFile)
  }	
  
  return("Complete")
  

  #trainFolder <- paste(getwd(), "train", sep="/")
  #trainSubjects <- file.read(paste(trainFolder, "subject_train.txt", sep = "/"))  
  #trainX <- file.read(paste(trainFolder, "X_train.txt", sep = "/"))  
  #trainY <- file.read(paste(trainFolder, "Y_train.txt", sep = "/"))  
  
  # Merge subjects list
  #foreach subject
  
}
