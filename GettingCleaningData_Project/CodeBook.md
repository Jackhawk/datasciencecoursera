## Code Book---
#Tidy Data Project    author: Jack Cheney    date: 24 October 2015
    course: Coursera - Getting and Cleaning Data  ---###Project Description
The purpose of this project was to demonstrate ability to collect, work with and clean a data set.  The project goal was to prepare a tidy data set that can be used for later analysis.
The raw data was produced from the accelerometers of the Samsung Galaxy S smartphone.
---##Study design and data processing---###Collection of the raw data

Raw data was downloaded from the UCI Machine Learning Repository

[Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
###Notes on the original (raw) data **List of the raw data files**```./UCI HAR Dataset  activity_labels.txt		# list of activities with activity_id  features_info.txt			# description of how variables were created  features.txt				# list of all variable names  README.txt				# describes the data and processes applied  ./UCI HAR Dataset/test/    ./UCI HAR Dataset/test/Inertial Signals # not used for this project    subject_test.txt		# list of subject_id for the test data    X_test.txt				# the test data     y_test.txt				# activity_id for the test data  ./UCI HAR Dataset/train/    ./UCI HAR Dataset/test/Inertial Signals # not used for this project    subject_train.txt		# list of subject_id for the test data    X_train.txt				# the test data    y_train.txt				# activity_id for the test data
```These two subfolders and their content were ignored for the purpose of this project
* ./UCI HAR Dataset/test/Inertial Signals
* ./UCI HAR Dataset/train/Inertial Signals

The UCI data was randomly split into two sets

* The **test** dataset contains 30% of the data
* The **train** dataset contains 70% of the dataThe original test and train data files contain 561 variables and a total of 10,299 observations over the combined test and train data files.
Each set of observations are made for 30 different subjects undertaking 6 different activities:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

See the file "features_info.txt" for a full description of the the variables.
---##Creating the tidy datafile###Cleaning script process
**High level description of the process taken**1. Download the data from the UCI Machine Learning Repository (as above)
2. Read data to the R workspace
   * train dataset
   * test dataset
   * features.txt
   * activity_labels.txt
3. Merge the datasets, add variable names and activity labels
4. Create a subset of the merged data that contains
    * the activty labels
    * the subject_id
    * only those variables that were calculated for mean and standard deviation
5. Create the tidy data file that provides the mean of each variable grouped by "Activity" and "Subject_id"###The script
**"run_analysis.R"**
The script follows steps 2 to 5 above, it will read the appropriate data files, apply the necessary process and then write a tidy data file to your R working directory - "tidydata.txt"
The [readme file]() contains detailed instructions for how to use the script.##Description of the variables in the "tidydata.txt" file General description of the file:
  - 180 observations of 68 variables
  - V1 - "Activity" - chr - contains the activity label for each observation
  - V2 - "Subject" - int - contains the subject id for each observation
  - V3:68 "mean and std" - num - contains the the average of the original mean and std variables
  ##Sources

---Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
---