README
========================================================

The Course Project in Getting and Cleaning Data

 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject


## Also include are the following files:

* run_analysis.R - Script that Processes the data and fulfills all the requrements above
* CodeBook.Md - describes the variables, the data, and any transformations or work that you performed to clean up the data

## How to execute:
* Create a working directory on your local drive
* Download the following file to
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Explode the zip files - you will see a directory called UCI HAR Dataset
* Download run_analysis.R in your working directory. --the parent folder of UCI HAR Dataset
* Set your R studion workind directory to the location of the run_analysis file.
You will see the following lines on your console as the run_analysis.R scrip executes:

> [1] "Loading packages..."
[1] "Loading data files..."
[1] "Clean _test data sets..."
[1] "Clean _train data sets..."
[1] "Bind Data sets..."
[1] "Merges Data sets..."
[1] "Melt Data set... Create Stacked Data"
[1] "Create tidy_data..."
[1] "Writing tidy_data"
[1] "Done!"
>

* source the run_analysis.R file
* run the run_analysis.R script. It  will generate a new file in your working directory called "tiny_data.txt" 


## The run_analysis. R script loads and sets the required libraries:
* data.table
* reshape2