CodeBook
========

This file describes the steps in which the data was tidied, and gives an overview of the fields available.

CodeBook.md is created by the command

```
cat CodeBookPreamble.md > CodeBook.md; cat VarData.md >> CodeBook.md
```

##Transformation

This describes how [run_analysis.R](run_analysis.R) has tidied the data in 6 steps.

###Step 1: Merge test and train datasets
For the purposes of this exercise we want to process both test and train together.
Result of this step is 3 data sets:
mainDs, subjectDs, activityDs

### Step 2: Extract only mean and stddev measurements
Result of this step is a version of mainDs with fewer fields, called smallerDs

### Step 3: Use descriptive activity names 
There's really a 1:1 mapping to smallerDs, subjectDs, activityDs above so cbind them together
An activity_name column will have been added, sourced from activity_labels.txt in the original dataset.
Result of this step is joinedDs.


### Step 4: Label dataset with descriptive variable names
This step has only renamed columns in joinedDs

### Step 5: Create tidy dataset
Create a tidy dataset with the average of each variable for each activity and each subject.

The output of this is tidyDs, also written to a file called tidy.txt

### Post-step: Generate variable data dictionary
This generates a data dictionary for tidyDs.  It is stored in a dataframe called codeBook, and is also written to VarData.md

Variable Data Dictionary
========================

variable_name|type|domain|source|freq_range
----|----|----|----|----
subject|Integer 1-30 indicating subject number|N/A|N/A|N/A
activity_name|WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|N/A|N/A|N/A
tBodyAcc-mean()-X|Double: average mean|Time|Accelerometer|Body
tBodyAcc-mean()-Y|Double: average mean|Time|Accelerometer|Body
tBodyAcc-mean()-Z|Double: average mean|Time|Accelerometer|Body
tBodyAcc-std()-X|Double: average stddev|Time|Accelerometer|Body
tBodyAcc-std()-Y|Double: average stddev|Time|Accelerometer|Body
tBodyAcc-std()-Z|Double: average stddev|Time|Accelerometer|Body
tGravityAcc-mean()-X|Double: average mean|Time|Accelerometer|Gravity
tGravityAcc-mean()-Y|Double: average mean|Time|Accelerometer|Gravity
tGravityAcc-mean()-Z|Double: average mean|Time|Accelerometer|Gravity
tGravityAcc-std()-X|Double: average stddev|Time|Accelerometer|Gravity
tGravityAcc-std()-Y|Double: average stddev|Time|Accelerometer|Gravity
tGravityAcc-std()-Z|Double: average stddev|Time|Accelerometer|Gravity
tBodyAccJerk-mean()-X|Double: average mean|Time|Accelerometer|Body
tBodyAccJerk-mean()-Y|Double: average mean|Time|Accelerometer|Body
tBodyAccJerk-mean()-Z|Double: average mean|Time|Accelerometer|Body
tBodyAccJerk-std()-X|Double: average stddev|Time|Accelerometer|Body
tBodyAccJerk-std()-Y|Double: average stddev|Time|Accelerometer|Body
tBodyAccJerk-std()-Z|Double: average stddev|Time|Accelerometer|Body
tBodyGyro-mean()-X|Double: average mean|Time|Gyroscope|Body
tBodyGyro-mean()-Y|Double: average mean|Time|Gyroscope|Body
tBodyGyro-mean()-Z|Double: average mean|Time|Gyroscope|Body
tBodyGyro-std()-X|Double: average stddev|Time|Gyroscope|Body
tBodyGyro-std()-Y|Double: average stddev|Time|Gyroscope|Body
tBodyGyro-std()-Z|Double: average stddev|Time|Gyroscope|Body
tBodyGyroJerk-mean()-X|Double: average mean|Time|Gyroscope|Body
tBodyGyroJerk-mean()-Y|Double: average mean|Time|Gyroscope|Body
tBodyGyroJerk-mean()-Z|Double: average mean|Time|Gyroscope|Body
tBodyGyroJerk-std()-X|Double: average stddev|Time|Gyroscope|Body
tBodyGyroJerk-std()-Y|Double: average stddev|Time|Gyroscope|Body
tBodyGyroJerk-std()-Z|Double: average stddev|Time|Gyroscope|Body
tBodyAccMag-mean()|Double: average mean|Time|Accelerometer|Body
tBodyAccMag-std()|Double: average stddev|Time|Accelerometer|Body
tGravityAccMag-mean()|Double: average mean|Time|Accelerometer|Gravity
tGravityAccMag-std()|Double: average stddev|Time|Accelerometer|Gravity
tBodyAccJerkMag-mean()|Double: average mean|Time|Accelerometer|Body
tBodyAccJerkMag-std()|Double: average stddev|Time|Accelerometer|Body
tBodyGyroMag-mean()|Double: average mean|Time|Gyroscope|Body
tBodyGyroMag-std()|Double: average stddev|Time|Gyroscope|Body
tBodyGyroJerkMag-mean()|Double: average mean|Time|Gyroscope|Body
tBodyGyroJerkMag-std()|Double: average stddev|Time|Gyroscope|Body
fBodyAcc-mean()-X|Double: average mean|Frequency|Accelerometer|Body
fBodyAcc-mean()-Y|Double: average mean|Frequency|Accelerometer|Body
fBodyAcc-mean()-Z|Double: average mean|Frequency|Accelerometer|Body
fBodyAcc-std()-X|Double: average stddev|Frequency|Accelerometer|Body
fBodyAcc-std()-Y|Double: average stddev|Frequency|Accelerometer|Body
fBodyAcc-std()-Z|Double: average stddev|Frequency|Accelerometer|Body
fBodyAccJerk-mean()-X|Double: average mean|Frequency|Accelerometer|Body
fBodyAccJerk-mean()-Y|Double: average mean|Frequency|Accelerometer|Body
fBodyAccJerk-mean()-Z|Double: average mean|Frequency|Accelerometer|Body
fBodyAccJerk-std()-X|Double: average stddev|Frequency|Accelerometer|Body
fBodyAccJerk-std()-Y|Double: average stddev|Frequency|Accelerometer|Body
fBodyAccJerk-std()-Z|Double: average stddev|Frequency|Accelerometer|Body
fBodyGyro-mean()-X|Double: average mean|Frequency|Gyroscope|Body
fBodyGyro-mean()-Y|Double: average mean|Frequency|Gyroscope|Body
fBodyGyro-mean()-Z|Double: average mean|Frequency|Gyroscope|Body
fBodyGyro-std()-X|Double: average stddev|Frequency|Gyroscope|Body
fBodyGyro-std()-Y|Double: average stddev|Frequency|Gyroscope|Body
fBodyGyro-std()-Z|Double: average stddev|Frequency|Gyroscope|Body
fBodyAccMag-mean()|Double: average mean|Frequency|Accelerometer|Body
fBodyAccMag-std()|Double: average stddev|Frequency|Accelerometer|Body
fBodyBodyAccJerkMag-mean()|Double: average mean|Frequency|Accelerometer|Body
fBodyBodyAccJerkMag-std()|Double: average stddev|Frequency|Accelerometer|Body
fBodyBodyGyroMag-mean()|Double: average mean|Frequency|Gyroscope|Body
fBodyBodyGyroMag-std()|Double: average stddev|Frequency|Gyroscope|Body
fBodyBodyGyroJerkMag-mean()|Double: average mean|Frequency|Gyroscope|Body
fBodyBodyGyroJerkMag-std()|Double: average stddev|Frequency|Gyroscope|Body
