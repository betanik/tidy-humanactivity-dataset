# Assumes that you have a folder in the same format as
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# which contains "train" and "test" folders, etc.
#
# This particular dataset was provided as part of the Coursera getdata-007 course assignment,
# in turn derived from
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# For more information see the README.txt contained in the zip file.
# Assume this folder is in the same directory as this file.  If it's not, change this.
DATASET_DIR <- "./UCI HAR Dataset"

# This file does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# The result of the processing is stored in a file called tidy.txt
# Another file called VarData.md is produced 


# will be used for data manipulation later
library(dplyr)

# Like read.table, but takes multiple files in its first argument
# Assumes files will contain the same number of columns
read.table.multifile <- function(files, ...) {
  if(length(files) == 1) {
    read.table(files, ...)
  }
  else {
    rbind(
      read.table(head(files,1), ...),
      read.table.multifile(tail(files,-1), ...)
      )
  } 
}


# Step 0: Constants
# ====================================
# Shouldn't need to change any of the constants below.
# Mostly locations of files based on the known structure of the zipped dataset

# Where the file, features.txt, that will form the majority of the column names is
COL_NAME_FILE <- paste0(DATASET_DIR,'/features.txt')
COL_NAMES <- read.table(COL_NAME_FILE, stringsAsFactors = FALSE)[,2]

# Where the activity_labels, which maps a key to the actual activity name is
ACTIVITY_LABELS_FILE <- paste0(DATASET_DIR,'/activity_labels.txt')
ACTIVITY_LABELS <- tbl_df(read.table(ACTIVITY_LABELS_FILE, stringsAsFactors = FALSE, col.names = c("activity","activity_name")))

# The constants below specify the locations of the subject, activity and main dataset
# within the train and test directories
TEST_DIR <- paste0(DATASET_DIR, "/test")
TEST_SUBJECTS_FILE <- paste0(TEST_DIR, "/subject_test.txt")  
TEST_ACTIVITY_FILE <- paste0(TEST_DIR, "/y_test.txt")  
TEST_MAIN_FILE <- paste0(TEST_DIR, "/X_test.txt")  

TRAIN_DIR <- paste0(DATASET_DIR, "/train")
TRAIN_SUBJECTS_FILE <- paste0(TRAIN_DIR, "/subject_train.txt")  
TRAIN_ACTIVITY_FILE <- paste0(TRAIN_DIR, "/y_train.txt")  
TRAIN_MAIN_FILE <- paste0(TRAIN_DIR, "/X_train.txt")  


# Step 1: Merge test and train datasets
# ======================================
# For the purposes of this exercise we want to process both test and train together.
# Result of this step is 3 data sets:
# mainDs, subjectDs, activityDs

# subjectDs <- read.table.multifile("./test-data/subject_test.txt", col.names="subject")
# activityDs <- read.table.multifile("./test-data/y_test.txt", col.names="activity")
# mainDs <- read.table.multifile("./test-data/X_test.txt", col.names = COL_NAMES)

subjectDs <- read.table.multifile(c(TEST_SUBJECTS_FILE, TRAIN_SUBJECTS_FILE), col.names="subject")
activityDs <- read.table.multifile(c(TEST_ACTIVITY_FILE, TRAIN_ACTIVITY_FILE), col.names="activity")
mainDs <- read.table.multifile(c(TEST_MAIN_FILE, TRAIN_MAIN_FILE), col.names = COL_NAMES)


# Step 2: Extract only mean and stddev measurements
# =================================================
meanStdCols <- grepl("-mean\\(\\)", COL_NAMES) | grepl("-std\\(\\)", COL_NAMES)
smallerDs <- mainDs[,meanStdCols]


# Step 3: Use descriptive activity names 
# ======================================
# There's really a 1:1 mapping to all datasets above so cbind them together
# There's also an activity_name joined from activity_labels.txt
# Output of this is joinedDs

joinedDs <- cbind(smallerDs, subjectDs, activityDs) %>%
  inner_join(ACTIVITY_LABELS, by="activity")


# Step 4: Label dataset with descriptive variable names
# =====================================================
colnames(joinedDs) <- c(COL_NAMES[meanStdCols], "subject","activity","activity_name")

# Optionally write out something we can look at in Excel...
write.csv(joinedDs, "narrow.csv", row.names=FALSE)


# Step 5: Tidy dataset
# ====================
# Create a tidy dataset with the average of each variable for each
# activity and each subject.
avgDs <- joinedDs %>%
  group_by(subject, activity_name) %>%
  summarise_each(funs(mean))

write.table(avgDs, "tidy.txt", row.names=FALSE)


# Post-step: Generate Variable data dictionary
# ================
# This forms the basis of a CodeBook.

describe.domain <- function(name) {
  if(grepl("^t", name)) "Time"
  else if(grepl("^f", name)) "Frequency"
  else "N/A"
}

describe.source <- function(name) {
  if(grepl("Acc", name)) "Accelerometer"
  else if(grepl("Gyro", name)) "Gyroscope"
  else "N/A"
}

describe.type <- function(name) {
  if(name == "subject") "Integer 1-30 indicating subject number"
  else if(name == "activity_name") paste(ACTIVITY_LABELS[,2], collapse=", ")
  else if(grepl("mean\\(\\)", name)) "Double indicating average mean for subject and activity"
  else if(grepl("std\\(\\)", name)) "Double indicating average stddev for subject and activity"
  else "N/A"
}

codeBook <- data.frame(variable_name=colnames(avgDs), stringsAsFactors = FALSE) %>%
  mutate(type=sapply(variable_name, describe.type)) %>%
  mutate(domain=sapply(variable_name, describe.domain)) %>%
  mutate(source=sapply(variable_name, describe.source)) %>%
  print

write.table(codeBook, "VarData.md", sep = "|", row.names=FALSE)