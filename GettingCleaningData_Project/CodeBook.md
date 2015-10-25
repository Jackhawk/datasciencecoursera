## Code Book

---

#Tidy Data Project
    author: Jack Cheney
    date: 24 October 2015
    course: Coursera - Getting and Cleaning Data
  
---

###Project Description


The purpose of this project was to demonstrate ability to collect, work with and clean a data set.  The project goal was to prepare a tidy data set that can be used for later analysis.


The raw data was produced from the accelerometers of the Samsung Galaxy S smartphone.

---

##Study design and data processing

---
###Collection of the raw data

Raw data was downloaded from the UCI Machine Learning Repository

[Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


###Notes on the original (raw) data 

**List of the raw data files**

```
./UCI HAR Dataset
  activity_labels.txt		# list of activities with activity_id
  features_info.txt			# description of how variables were created
  features.txt				# list of all variable names
  README.txt				# describes the data and processes applied
  ./UCI HAR Dataset/test/
    ./UCI HAR Dataset/test/Inertial Signals # not used for this project
    subject_test.txt		# list of subject_id for the test data
    X_test.txt				# the test data 
    y_test.txt				# activity_id for the test data
  ./UCI HAR Dataset/train/
    ./UCI HAR Dataset/test/Inertial Signals # not used for this project
    subject_train.txt		# list of subject_id for the test data
    X_train.txt				# the test data
    y_train.txt				# activity_id for the test data
```
These two subfolders and their content were ignored for the purpose of this project

* ./UCI HAR Dataset/test/Inertial Signals

* ./UCI HAR Dataset/train/Inertial Signals

The UCI data was randomly split into two sets

* The **test** dataset contains 30% of the data
* The **train** dataset contains 70% of the data

The original test and train data files contain 561 variables and a total of 10,299 observations over the combined test and train data files.

Each set of observations are made for 30 different subjects undertaking 6 different activities:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

See the file "features_info.txt" for a full description of the the variables.


---
##Creating the tidy datafile

###Cleaning script process

**High level description of the process taken**

1. Download the data from the UCI Machine Learning Repository (as above)

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

5. Create the tidy data file that provides the mean of each variable grouped by "Activity" and "Subject_id"

###The script

**"run_analysis.R"**

The script follows steps 2 to 5 above, it will read the appropriate data files, apply the necessary process and then write a tidy data file to your R working directory - "tidydata.txt"


The [readme file](https://github.com/Jackhawk/datasciencecoursera/blob/master/GettingCleaningData_Project/README.md) contains detailed instructions for how to use the script.

##Description of the variables in the "tidydata.txt" file 


General description of the file:


  - 180 observations of 68 variables

  - V1 - "Activity" - chr - contains the activity label for each observation

  - V2 - "Subject" - int - contains the subject id for each observation

  - V3:68 "mean and std" - num - contains the the average of the original mean and std variables
##Full list of variable names in tidydata.txt
 [1] "Activity"                   
 [2] "Subject"                    
 [3] "tBodyAcc.mean...X"          
 [4] "tBodyAcc.mean...Y"          
 [5] "tBodyAcc.mean...Z"          
 [6] "tBodyAcc.std...X"           
 [7] "tBodyAcc.std...Y"           
 [8] "tBodyAcc.std...Z"           
 [9] "tGravityAcc.mean...X"       
[10] "tGravityAcc.mean...Y"       
[11] "tGravityAcc.mean...Z"       
[12] "tGravityAcc.std...X"        
[13] "tGravityAcc.std...Y"        
[14] "tGravityAcc.std...Z"        
[15] "tBodyAccJerk.mean...X"      
[16] "tBodyAccJerk.mean...Y"      
[17] "tBodyAccJerk.mean...Z"      
[18] "tBodyAccJerk.std...X"       
[19] "tBodyAccJerk.std...Y"       
[20] "tBodyAccJerk.std...Z"       
[21] "tBodyGyro.mean...X"         
[22] "tBodyGyro.mean...Y"         
[23] "tBodyGyro.mean...Z"         
[24] "tBodyGyro.std...X"          
[25] "tBodyGyro.std...Y"          
[26] "tBodyGyro.std...Z"          
[27] "tBodyGyroJerk.mean...X"     
[28] "tBodyGyroJerk.mean...Y"     
[29] "tBodyGyroJerk.mean...Z"     
[30] "tBodyGyroJerk.std...X"      
[31] "tBodyGyroJerk.std...Y"      
[32] "tBodyGyroJerk.std...Z"      
[33] "tBodyAccMag.mean.."         
[34] "tBodyAccMag.std.."          
[35] "tGravityAccMag.mean.."      
[36] "tGravityAccMag.std.."       
[37] "tBodyAccJerkMag.mean.."     
[38] "tBodyAccJerkMag.std.."      
[39] "tBodyGyroMag.mean.."        
[40] "tBodyGyroMag.std.."         
[41] "tBodyGyroJerkMag.mean.."    
[42] "tBodyGyroJerkMag.std.."     
[43] "fBodyAcc.mean...X"          
[44] "fBodyAcc.mean...Y"          
[45] "fBodyAcc.mean...Z"          
[46] "fBodyAcc.std...X"           
[47] "fBodyAcc.std...Y"           
[48] "fBodyAcc.std...Z"           
[49] "fBodyAccJerk.mean...X"      
[50] "fBodyAccJerk.mean...Y"      
[51] "fBodyAccJerk.mean...Z"      
[52] "fBodyAccJerk.std...X"       
[53] "fBodyAccJerk.std...Y"       
[54] "fBodyAccJerk.std...Z"       
[55] "fBodyGyro.mean...X"         
[56] "fBodyGyro.mean...Y"         
[57] "fBodyGyro.mean...Z"         
[58] "fBodyGyro.std...X"          
[59] "fBodyGyro.std...Y"          
[60] "fBodyGyro.std...Z"          
[61] "fBodyAccMag.mean.."         
[62] "fBodyAccMag.std.."          
[63] "fBodyBodyAccJerkMag.mean.." 
[64] "fBodyBodyAccJerkMag.std.."  
[65] "fBodyBodyGyroMag.mean.."    
[66] "fBodyBodyGyroMag.std.."     
[67] "fBodyBodyGyroJerkMag.mean.."
[68] "fBodyBodyGyroJerkMag.std.."   ##Sources

---
Human Activity Recognition Using Smartphones Dataset
Version 1.0

---
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

---[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
---

