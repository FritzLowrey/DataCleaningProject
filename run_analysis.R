
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
  	thisList <- list(Subjects[thisRow], as.character(Activities[thisRow]))
  	
    thisList <- append(thisList, aRow[c(1,2,3,4,5,6,41,42,43,44,45,46, 81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,
                            227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,
                            530,542,543)])  	                        
  	
  	#big.frame[nrow(big.frame)+1, ] <- thisList    
    big.frame <- rbind(big.frame, setNames(thisList, names(big.frame)), default.stringsasfactors=FALSE)
  	
  	thisRow <- thisRow + 1
  }
  
  return(big.frame)  
  
  for(thisSet in c("test", "train"))
  {
    # build up a file name for test or train 
    thisFileName <- paste("X_", thisSet, ".txt", sep="")
    thisFileName <- paste(baseDir, thisSet, thisFileName, sep="/")
    print(thisFileName)
    
    con  <- file(thisFileName, open = "r")
    
    # read and import each line of the file
    while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
      tempvec <- strsplit(oneLine," ")[[1]]
      tempvec <- as.numeric(tempvec[c(3:length(tempvec))])
      
      print(thisRow)
      
      big.frame[thisRow,]$tBodyAcc.mean.X <- tempvec[1] #1 tBodyAcc-mean()-X
      big.frame[thisRow,]$tBodyAcc.mean.Y <- tempvec[2] #2 tBodyAcc-mean()-Y
      big.frame[thisRow,]$tBodyAcc.mean.Z <- tempvec[3] #3 tBodyAcc-mean()-Z
      big.frame[thisRow,]$tBodyAcc.std.X  <- tempvec[4] #4 tBodyAcc-std()-X
      big.frame[thisRow,]$tBodyAcc.std.Y  <- tempvec[5] #5 tBodyAcc-std()-Y
      big.frame[thisRow,]$tBodyAcc.std.Z  <- tempvec[6] #6 tBodyAcc-std()-Z
      
      big.frame[thisRow,]$tGravityAcc.mean.X  <- tempvec[41] #41 tGravityAcc.mean.X
      big.frame[thisRow,]$tGravityAcc.mean.Y  <- tempvec[42] #42 tGravityAcc.mean.Y
      big.frame[thisRow,]$tGravityAcc.mean.Z  <- tempvec[43] #43 tGravityAcc.mean.Z
      big.frame[thisRow,]$tGravityAcc.std.X  <- tempvec[44] #44 tGravityAcc.std.X
      big.frame[thisRow,]$tGravityAcc.std.Y  <- tempvec[45] #45 tGravityAcc.std.Y
      big.frame[thisRow,]$tGravityAcc.std.Z  <- tempvec[46] #46 tGravityAcc.std.Z
      
      big.frame[thisRow,]$tBodyAccJerk.mean.X  <- tempvec[81] #81 tBodyAccJerk.mean.X
      big.frame[thisRow,]$tBodyAccJerk.mean.Y  <- tempvec[82] #82 tBodyAccJerk.mean.Y
      big.frame[thisRow,]$tBodyAccJerk.mean.Z  <- tempvec[83] #83 tBodyAccJerk.mean.Z
      big.frame[thisRow,]$tBodyAccJerk.std.X  <- tempvec[84] #84 tBodyAccJerk.std.X
      big.frame[thisRow,]$tBodyAccJerk.std.Y  <- tempvec[85] #85 tBodyAccJerk.std.Y
      big.frame[thisRow,]$tBodyAccJerk.std.Z  <- tempvec[86] #86 tBodyAccJerk.std.Z
      
      big.frame[thisRow,]$tBodyGyro.mean.X  <- tempvec[121] #121 tBodyGyro.mean.X
      big.frame[thisRow,]$tBodyGyro.mean.Y  <- tempvec[122] #122 tBodyGyro.mean.Y
      big.frame[thisRow,]$tBodyGyro.mean.Z  <- tempvec[123] #123 tBodyGyro.mean.Z
      big.frame[thisRow,]$tBodyGyro.std.X  <- tempvec[124] #124 tBodyGyro.std.X
      big.frame[thisRow,]$tBodyGyro.std.Y  <- tempvec[125] #125 tBodyGyro.std.Y
      big.frame[thisRow,]$tBodyGyro.std.Z  <- tempvec[126] #126 tBodyGyro.std.Z
      
      big.frame[thisRow,]$tBodyGyroJerk.mean.X  <- tempvec[161] #161 tBodyGyroJerk-mean()-X
      big.frame[thisRow,]$tBodyGyroJerk.mean.Y  <- tempvec[162] #162 tBodyGyroJerk-mean()-Y
      big.frame[thisRow,]$tBodyGyroJerk.mean.Z  <- tempvec[163] #163 tBodyGyroJerk-mean()-Z
      big.frame[thisRow,]$tBodyGyroJerk.std.X  <- tempvec[164] #164 tBodyGyroJerk-std()-X
      big.frame[thisRow,]$tBodyGyroJerk.std.Y  <- tempvec[165] #165 tBodyGyroJerk-std()-Y
      big.frame[thisRow,]$tBodyGyroJerk.std.Z  <- tempvec[166] #166 tBodyGyroJerk-std()-Z
      
      big.frame[thisRow,]$tBodyAccMag.mean  <- tempvec[201] #201 tBodyAccMag-mean()
      big.frame[thisRow,]$tBodyAccMag.std   <- tempvec[202] #202 tBodyAccMag-std()
      
      big.frame[thisRow,]$tGravityAccMag.mean  <- tempvec[214] #214 tGravityAccMag-mean()
      big.frame[thisRow,]$tGravityAccMag.std   <- tempvec[215] #215 tGravityAccMag-std()
      
      big.frame[thisRow,]$tBodyAccJerkMag.mean  <- tempvec[227] #227 tBodyAccJerkMag-mean()
      big.frame[thisRow,]$tBodyAccJerkMag.std   <- tempvec[228] #228 tBodyAccJerkMag-std()
      
      big.frame[thisRow,]$tBodyGyroMag.mean  <- tempvec[240] #240 tBodyGyroMag-mean()
      big.frame[thisRow,]$tBodyGyroMag.std   <- tempvec[241] #241 tBodyGyroMag-std()
      
      big.frame[thisRow,]$tBodyGyroJerkMag.mean  <- tempvec[253] #253 tBodyGyroJerkMag-mean()
      big.frame[thisRow,]$tBodyGyroJerkMag.std   <- tempvec[254] #254 tBodyGyroJerkMag-std()
      
      big.frame[thisRow,]$fBodyAcc.mean.X  <- tempvec[266] #266 fBodyAcc-mean()-X
      big.frame[thisRow,]$fBodyAcc.mean.Y  <- tempvec[267] #267 fBodyAcc-mean()-Y
      big.frame[thisRow,]$fBodyAcc.mean.Z  <- tempvec[268] #268 fBodyAcc-mean()-Z
      big.frame[thisRow,]$fBodyAcc.std.X  <- tempvec[269] #269 fBodyAcc-std()-X
      big.frame[thisRow,]$fBodyAcc.std.Y  <- tempvec[270] #270 fBodyAcc-std()-Y
      big.frame[thisRow,]$fBodyAcc.std.Z  <- tempvec[271] #271 fBodyAcc-std()-Z
      
      big.frame[thisRow,]$fBodyAccJerk.mean.X  <- tempvec[345] #345 fBodyAccJerk-mean()-X
      big.frame[thisRow,]$fBodyAccJerk.mean.Y  <- tempvec[346] #346 fBodyAccJerk-mean()-Y
      big.frame[thisRow,]$fBodyAccJerk.mean.Z  <- tempvec[347] #347 fBodyAccJerk-mean()-Z
      big.frame[thisRow,]$fBodyAccJerk.std.X  <- tempvec[348] #348 fBodyAccJerk-std()-X
      big.frame[thisRow,]$fBodyAccJerk.std.Y  <- tempvec[349] #349 fBodyAccJerk-std()-Y
      big.frame[thisRow,]$fBodyAccJerk.std.Z  <- tempvec[350] #350 fBodyAccJerk-std()-Z
      
      big.frame[thisRow,]$fBodyGyro.mean.X  <- tempvec[424] #424 fBodyGyro-mean()-X
      big.frame[thisRow,]$fBodyGyro.mean.Y  <- tempvec[425] #425 fBodyGyro-mean()-Y
      big.frame[thisRow,]$fBodyGyro.mean.Z  <- tempvec[426] #426 fBodyGyro-mean()-Z
      big.frame[thisRow,]$fBodyGyro.std.X  <- tempvec[427] #427 fBodyGyro-std()-X
      big.frame[thisRow,]$fBodyGyro.std.Y  <- tempvec[428] #428 fBodyGyro-std()-Y
      big.frame[thisRow,]$fBodyGyro.std.Z  <- tempvec[429] #429 fBodyGyro-std()-Z
      
      big.frame[thisRow,]$fBodyAccMag.mean <- tempvec[503] #503 fBodyAccMag-mean()
      big.frame[thisRow,]$fBodyAccMag.std  <- tempvec[504] #504 fBodyAccMag-std()
      
      big.frame[thisRow,]$fBodyBodyAccJerkMag.mean <- tempvec[516] #516 fBodyBodyAccJerkMag-mean()
      big.frame[thisRow,]$fBodyBodyAccJerkMag.std  <- tempvec[517] #517 fBodyBodyAccJerkMag-std()
      
      big.frame[thisRow,]$fBodyBodyGyroMag.mean <- tempvec[529] #529 fBodyBodyGyroMag-mean()
      big.frame[thisRow,]$fBodyBodyGyroMag.std  <- tempvec[530] #530 fBodyBodyGyroMag-std()
      
      big.frame[thisRow,]$fBodyBodyGyroJerkMag.mean <- tempvec[542] #542 fBodyBodyGyroJerkMag-mean()
      big.frame[thisRow,]$fBodyBodyGyroJerkMag.std  <- tempvec[543] #543 fBodyBodyGyroJerkMag-std()
      
      
      thisRow <- thisRow + 1
    }
    close(con)
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
