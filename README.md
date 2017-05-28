# README

## Getting and Cleaning Data Course Project
This README file contains the instructions to run the run_analysis.R script on the UCI Human Activity Recognition (HAR) Dataset to create a tidy data set for the ease of understanding.

## Contents of the Repository
1. run_analysis.R script file
2. README.md file
3. CODEBOOK.md file

## Output
The run_analysis.R script outputs a text file containing an independent tidy data set with the average of each variable for each activity and each subject in the UCI HAR Dataset.

## Running the Script
1. Download the run_analysis.R script found in this repository
2. Set the folder containing the run_analysis.R script as the working directory with the command setwd()
3. Read the script file into R using the function source('run_analysis.R')
4. Run the script by using the command run_analysis()

## Processes in the Script
1. Downloads the raw UCI HAR Dataset
2. Unzips the folder in the working directory
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names. 
7. From the data set in 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This file will be found as "Tidy_Data.txt" in that working directory

