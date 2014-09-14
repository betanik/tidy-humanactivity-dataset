Tidying "Human Activity" Dataset
================================

##Purpose

This is mainly a Coursera "Getting and Cleaning Data" assignment.

It tidies data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip which was in turn sourced from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. (Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012)

Briefly, the original dataset contains accelerometer and gyroscope measurements, gathered from a group of 30 volunteers performing 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The raw measurements have been post-processed in a number of ways; see the features_info.txt in the original dataset for a full explanation.  The result is a set of variables such as:

* tBodyAcc-mean()-X
* tBodyAcc-std()-X
* tBodyAcc-energy()-X

In this case these are the mean, stddev, and energy measures of the time-domain body accelerometer X-axis.

The [tidied dataset](tidy.txt) contains *only* the average mean and stddev measures across all original variables, over subject and activity.

See [CodeBook.md](CodeBook.md) for the precise steps in which the data was tidied, and more information about the tidied data.

##Files

###Prerequisites
This project assumes the existence of an unzipped version of https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip in the same directory.

In order to run the files, you must have:

* R, version > 3.0.2
* dplyr, version 0.2

###Contents
This repository contains the following files:

* README.md: this file
* [run_analysis.R](run_analysis.R): the file which processes the supplied UCI Dataset.  Produces tidy.txt, VarData.md
* [CodeBook.md](CodeBook.md): Description of how the data was transformed, plus definitions of the fields

Supporting files:

* [CodeBookPreamble.md](CodeBookPreamble.md): Description of how the data was transformed.  Intended for use in CodeBook.md
* [VarData.md](VarData.md): a generated file containing definitions of the fields
* [tidy.txt](tidy.txt): a generated file containing the main result of running run_analysis.R
