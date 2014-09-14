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

