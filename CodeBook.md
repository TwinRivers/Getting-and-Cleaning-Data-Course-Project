CodeBook
========================================================


This codebook describes the variables, the data, and any transformations or work that you performed to clean up the data for the  Course Project in Getting and Cleaning Data.

The README describes the files in the repo and how to run the run_analysis.R script

## 1.0 The source data for the project is extracted from:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## 2.0 Datset Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### 2.1 For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



Once downloaded and exploded you will see a directory called UCI HAR Dataset.

### 2.2 The following file from that directory will be utilies in this project

#### 2.2.1 Within the UCI HAR Dataset directory:
* features.txt - List of all features
* activity_labels.txt -Links the class labels with their activity name

#### 2.2.2 UCI HAR Dataset/test directory
* X_test.txt - Test set
* y_test.txt  -Test labels
* subject_test.txt

#### 2.2.3 UCI HAR Dataset/train directory
* X_train.txt -Training set
* y_train.txt -Training labels
* subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Reference the README.txt in the UCI HAR Dataset director for further descriptions of the files and the data from the Human Activity Recognition Using Smartphones Dataset

## 3.0 Data set Cleansing Details
The following outline the steps run in the run_analysis.R Script to process the data to meeting the following requirements

### 3.1 Program Requirements

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### 3.2  Requirements Cross reference

1. Data is extracted from the files defined in section 2.1 above and loaded local variables
2. The features files is subset to extracts only the measurements on the mean and standard deviation for each measurement
    * Requirement # 2  -Extracts only the measurements on the mean and standard deviation for each measurement.
3. The Train data sets files X_Train, y_train and subject_train are cleansed
    * 3.1 X_train colmn names are renamed to the features for better understaning
        * Requirement # 4  - Appropriately labels the data set with descriptive variable names.
    * 3.2 subset to keep only the mean and std measures from features file
    * 3.3 rename the Y_train column names  better understaning of the column data
        * Requirement # 3 - Uses descriptive activity names to name the activities in the data set
        * new lables are "Activity_ID", "Activity_Label"
    * 3.4 rename the subject_train column names  better understaning of the column data
     * Requirement # 3 - Uses descriptive activity names to name the activities in the data set
     * new lable "subject"
4. The Test data sets files X_test,  y_test, and subject_test are cleansed
    * Same process flow as train above
5. Merge files 
    * 5.1 Bind - Train Data files X_Train, y_train and subject_train into one file
    * 5.2 Bind Data sets - Train Data files X_Train, y_train and subject_train into one file
    * 5.3 Merges the training and the test sets to create one data set.
    * 5.4 Melt -stacks the measurement columns into a single column of data.
        * Requirement # 1 Merges the training and the test sets to create one data set.  
6. Create the tidy_data file
7. Write the tidy_data file to the working directory
    * Requirement # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   

### 3.3 How to execute:
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


## 3.4 The run_analysis. R script loads and sets the required libraries:
* data.table
* reshape2
   


 




 

