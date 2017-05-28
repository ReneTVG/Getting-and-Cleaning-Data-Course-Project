run_analysis <- function()
{
  # Downloads and unzips file from URL
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
  unzip(temp)
  unlink(temp)
  
  # Reads the txt files into tables
  features <- read.table("UCI HAR Dataset/features.txt")
  alabels <- read.table("UCI HAR Dataset/activity_labels.txt")
  
  xtrain <- read.table("UCI HAR Dataset/train/x_train.txt")
  ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
  subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
  xtest <- read.table("UCI HAR Dataset/test/x_test.txt")
  ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
  subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  #Merge training and test set
  allset <- rbind(xtest, xtrain)
  
  #Add variable names
  names(allset) = features[,2]
  
  #Extracts only the measurements on the mean and standard deviation for each measurement
  ext <-grep("mean|std", names(allset))
  extract <- allset[,ext]
  
  #Joins the activity sets
  y <- rbind(ytest, ytrain)
  
  #Add labels the activity sets
  download.packages("dplyr")
  library(dplyr)
  act <- full_join(y, alabels, by = "V1")
  extract <- cbind(act[,2], extract)
  
  #Add subject to the data set
  subject <- rbind(subtest, subtrain)
  extract <- cbind(subject, extract)
  
  #Renames headers to be more descriptive
  names(extract)[1:2] = c("subject", "activity")
  names(extract) <- gsub("^t", "time", names(extract))
  names(extract) <- gsub("^f", "freq", names(extract))
  names(extract) <- gsub("mean", "Mean", names(extract))
  names(extract) <- gsub("std", "Std", names(extract))
  names(extract) <- gsub("-|\\()", "", names(extract))
  
  
  
  #Aggregates the average of each variable for each activity and each subject
  agg <- aggregate(extract[,3:81], by = list(subject = extract$subject, activity = extract$activity), mean)
  
  write.table(agg, file = "Tidy_Data.txt", row.names = FALSE)
  
  
}