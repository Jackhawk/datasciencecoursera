##======================================##
## Coursera - Getting and Cleaning Data
## "Tidy Data" course project
##======================================##
## Requirements:
## "Human Activity Recognition Using Smartphones Data Set"
## UCI Machine Learning Repository
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## Download data and extract content as a subfolder to your R working directory
## "./UCI HAR Dataset/"
##======================================##
## This function will read select data from the set
## Apply a format and summarise process
## write a "tidy data" csv file to your R working directory, "tidydata.txt"
##======================================##
## to run this code:
## save "run_analysis.R" to your R working directory
## in R: 
## > source("run_analysis.R")
## > run_analysis()
##======================================##
## Jack Cheney.  24 October 2015


run_analysis <- function() {
  
library(dplyr)
  
#---- Step 0. Read the data ----#

## train data set
    x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
## test data set
    x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## labels
    features <- read.table("./UCI HAR Dataset/features.txt") # colnames
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") # six activities
    
#---- Objective 1. Merge the data sets ----#
# and
#---- Objective 4. Add variable names ----#

    x_data <- rbind(x_train, x_test) # the measurements
    y_data <- rbind(y_train, y_test) # activity id
    subject_data <- rbind(subject_train, subject_test) # subject id
    colnames(x_data) <- features$V2 # add variable names
    merge_data <- cbind(Activity = y_data[,1], Subject = subject_data[,1], x_data) # mash it

#---- Objective 2. Extract measurements for mean and std ----#    
    
    sub_data <- data.frame(c(merge_data[,1:2]),
        merge_data[,grepl("std",colnames(merge_data))
        |(grepl("mean",colnames(merge_data)) 
        & !grepl("meanFreq",colnames(merge_data)))])

#---- Objective 3. Use descriptive activity names ----#

    sub_data$Activity <- activity_labels[match(sub_data$Activity, activity_labels$V1),2]

#---- Objective 5. Group by Activity, Subject and average of variables ----#

    clean_data <- sub_data %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))

    write.table(clean_data, "tidydata.txt", sep="\t", row.names=FALSE) 

}