## Read me file
---
## Coursera - Getting and Cleaning Data
## "Tidy Data" course project
---
## Data Requirements:
**"Human Activity Recognition Using Smartphones Data Set"**

UCI Machine Learning Repository
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Download data and extract content as a subfolder to your R working directory

The subfolder must be named **"UCI HAR Dataset"**

Do not rename or alter any files or subfodlers

---
The script "run_analysis.R" will 

* Read select data from the set

* Apply a format and summarise process

* Write a "tidy data" text file to your R working directory, "tidydata.txt"

---
##to run this code:

This script uses the R package 'dplyr' by Hadley Wickham

to install dplyr:

```
> install.packages("dplyr")
```


save "run_analysis.R" to your R working directory

in R: 

```
> source("run_analysis.R")
> run_analysis()
```

The script takes about 20 seconds to run on a Mac with 8 GB RAM

The file "tidydata.txt" will be created in your R working directory

---
**Jack Cheney.  24 October 2015**