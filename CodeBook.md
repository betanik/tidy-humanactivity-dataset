CodeBook
========

This file describes the steps in which the data was tidied, and gives an overview of the fields available.

CodeBook.md is created by the command
```
cat 
```

##Transformation

This describes how run_analysis.R has tidied the data in 6 steps.

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

"variable_name"|"type"|"domain"|"source"
"subject"|"Integer 1-30 indicating subject number"|"N/A"|"N/A"
"activity_name"|"WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING"|"N/A"|"N/A"
"tBodyAcc-mean()-X"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAcc-mean()-Y"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAcc-mean()-Z"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAcc-std()-X"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyAcc-std()-Y"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyAcc-std()-Z"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tGravityAcc-mean()-X"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tGravityAcc-mean()-Y"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tGravityAcc-mean()-Z"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tGravityAcc-std()-X"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tGravityAcc-std()-Y"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tGravityAcc-std()-Z"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerk-mean()-X"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerk-mean()-Y"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerk-mean()-Z"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerk-std()-X"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerk-std()-Y"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerk-std()-Z"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyGyro-mean()-X"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyro-mean()-Y"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyro-mean()-Z"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyro-std()-X"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"tBodyGyro-std()-Y"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"tBodyGyro-std()-Z"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerk-mean()-X"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerk-mean()-Y"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerk-mean()-Z"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerk-std()-X"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerk-std()-Y"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerk-std()-Z"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"tBodyAccMag-mean()"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAccMag-std()"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tGravityAccMag-mean()"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tGravityAccMag-std()"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerkMag-mean()"|"Double indicating average mean for subject and activity"|"Time"|"Accelerometer"
"tBodyAccJerkMag-std()"|"Double indicating average stddev for subject and activity"|"Time"|"Accelerometer"
"tBodyGyroMag-mean()"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroMag-std()"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerkMag-mean()"|"Double indicating average mean for subject and activity"|"Time"|"Gyroscope"
"tBodyGyroJerkMag-std()"|"Double indicating average stddev for subject and activity"|"Time"|"Gyroscope"
"fBodyAcc-mean()-X"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAcc-mean()-Y"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAcc-mean()-Z"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAcc-std()-X"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAcc-std()-Y"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAcc-std()-Z"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAccJerk-mean()-X"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAccJerk-mean()-Y"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAccJerk-mean()-Z"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAccJerk-std()-X"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAccJerk-std()-Y"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAccJerk-std()-Z"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyGyro-mean()-X"|"Double indicating average mean for subject and activity"|"Frequency"|"Gyroscope"
"fBodyGyro-mean()-Y"|"Double indicating average mean for subject and activity"|"Frequency"|"Gyroscope"
"fBodyGyro-mean()-Z"|"Double indicating average mean for subject and activity"|"Frequency"|"Gyroscope"
"fBodyGyro-std()-X"|"Double indicating average stddev for subject and activity"|"Frequency"|"Gyroscope"
"fBodyGyro-std()-Y"|"Double indicating average stddev for subject and activity"|"Frequency"|"Gyroscope"
"fBodyGyro-std()-Z"|"Double indicating average stddev for subject and activity"|"Frequency"|"Gyroscope"
"fBodyAccMag-mean()"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyAccMag-std()"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyBodyAccJerkMag-mean()"|"Double indicating average mean for subject and activity"|"Frequency"|"Accelerometer"
"fBodyBodyAccJerkMag-std()"|"Double indicating average stddev for subject and activity"|"Frequency"|"Accelerometer"
"fBodyBodyGyroMag-mean()"|"Double indicating average mean for subject and activity"|"Frequency"|"Gyroscope"
"fBodyBodyGyroMag-std()"|"Double indicating average stddev for subject and activity"|"Frequency"|"Gyroscope"
"fBodyBodyGyroJerkMag-mean()"|"Double indicating average mean for subject and activity"|"Frequency"|"Gyroscope"
"fBodyBodyGyroJerkMag-std()"|"Double indicating average stddev for subject and activity"|"Frequency"|"Gyroscope"
"activity"|"N/A"|"N/A"|"N/A"
