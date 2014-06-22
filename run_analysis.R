##******************************************************************************
##
## File Name : run_analysis.R
##
## Getting and Cleaning Data Course Project  
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject. 
##
## the following packages are loaded and utilized in this script
##
## 1. data.table
## 2. reshape2
##
##******************************************************************************



print("Loading packages...")
## load and set required libraries
if (!require("data.table")) {
    install.packages("data.table")
}

if (!require("reshape2")) {
    install.packages("reshape2")
}

require("data.table")
require("reshape2")

print("Loading data files...")
## Load data from files
## load activity Lables
##    --  LAYING, SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS,WALKING_UPSTAIRS 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

## load features 
## -- example angle(tBodyGyroMean,gravityMean)
## 477 levels
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

##Get truth table of features that contain either Mean or std
mean_std_features <- grepl("mean|std", features)

## load X_test and Y_test data sets
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

## load subject_test data set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load  X_train and Y_train data sets
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## load subject_train data set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


##
## Cleans train data sets
##
print("Clean _train data sets...")

## rename the X_train column names to the features for better understaning 
## of the column data
## - Requirement # 4 
## Appropriately labels the data set with descriptive variable names.
names(X_train) = features

## subset X_train to keep just the columns that have to do with mean and Std
## - Requirement # 2 
## Extracts only the measurements on the mean and standard deviation for 
## each measurement. 
X_train = X_train[,mean_std_features]

## take the columns values from activity_labels the line up with the columns from Y_train
## and add to a second column of Y_train, provifing the text value of the acitivity
## numerice value -- it's a merge
Y_train[,2] = activity_labels[Y_train[,1]]

## modify the column names for y_test
## rename the Y_train column names  better understaning of the column data
## - Requirement # 3 
## Uses descriptive activity names to name the activities in the data set
names(Y_train) = c("Activity_ID", "Activity_Label")

## rename the subject_train column names  better understaning of the column data
names(subject_train) = "subject"

##
## Clean test data sets
##
print("Clean _test data sets...")
## rename the x_test column names to the features for better understaning 
## of the column data
## - Requirement # 4 
## Appropriately labels the data set with descriptive variable names.
names(X_test) = features

## subset X_test to keep just the columns that have to do with mean and Std
## - Requirement # 2 
## Extracts only the measurements on the mean and standard deviation for 
## each measurement. 
X_test = X_test[,mean_std_features]


## take the columns values from activity_labels the line up with the columns from y_test
## and add to a second column of y_test, provifing the text value of the acitivity
## numerice value -- it's a merge
y_test[,2] = activity_labels[y_test[,1]]

## modify the column names for y_test
## rename the y_test column names  better understaning of the column data
## - Requirement # 3 
## Uses descriptive activity names to name the activities in the data set
names(y_test) = c("Activity_ID", "Activity_Label")

## rename the subject_test column names  better understaning of the column data
names(subject_test) = "subject"



##
##Bind Data sets
##
print("Bind Data sets...")

## combine the test data columns toeather into one table 2947 obs
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

## combine the train data columns toeather into one table 7252 obs
train_data <- cbind(as.data.table(subject_train), Y_train, X_train)

## Append the  train_data to the test_data to create one large datasets 
## - Requirement # 1 
## Merges the training and the test sets to create one data set.
print("Merges Data sets...")
combodata = rbind(test_data, train_data)

myid.vars   = c("subject", "Activity_ID", "Activity_Label")

## setdiff – set difference between two matrices, vectors or lists
## get the list of other columns so I can make them measure varables
mymeasure.vars  = setdiff(colnames(combodata), myid.vars)

## The melt function takes data in wide format and stacks a set of columns into
## a single column of data.
print("Melt Data set... Create Stacked Data")
StackedComboData = melt(combodata, id = myid.vars, measure.vars = mymeasure.vars)


# Apply mean function to dataset using dcast function
## - Requirement # 5 
## Creates a second, independent tidy data set with the average of each variable
## for each activity and each subject.
print("Create tidy_data...")
tidy_data   = dcast(StackedComboData, subject + Activity_Label ~ variable, mean)

print("Writing tidy_data")
write.table(tidy_data, file = "./tidy_data.txt")
print("Done!")
