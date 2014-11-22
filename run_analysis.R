## This program is to run HAR data

## Clear the console of any objects
rm(list=ls())

## Read in all the necessary files

## Read in the data for training and test sets
x_train  <-  read.table("UCI HAR Dataset/train/X_train.txt")
dim(x_train)  #7352x561
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
dim(x_test) # 2947x561

## Read in the feature label
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE) 
dim(features) # 561x2
                       
## Read in the activities label
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
dim(activitylabels) #6x2

## Read in the activity labels for training and test data sets
y_train  <-  read.table("UCI HAR Dataset/train/Y_train.txt")
table(y_train)
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
table(y_test)

## Read in the subject labels for training and test data sets
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 1. Merge the training and the test data sets to create one dataset
dat <- rbind(x_train, x_test)  
dim(dat) #1029x561

# 2. Extract only the measurements on the mean and standard deviations for each measurement
## Features dataframe contains the variable names for the dat dataframe.
## We need to add features labels as column names for the dat dataframe.

colnames(dat) <- features[ ,2] 

## Clean up the column names that we want to select. 
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

## Select columns that have mean, std in their names
dat <- dat[,grep(".*Mean.*|.*Std.*", features[,2]))
dim(dat) #10299x86 

# 3. Use descriptive activity names to name the activities in the data set

colnames(activitylabels) <- c("ActivityID", "ActivityLabel")

# 4. Appropriately label the data set with descriptive variables

## Merge the activity id’s from the label test and training data sets
ActivityID <- rbind(y_train, y_test)

## Label V1 as "ActivityID" in order to link up with the activity label from step 3
colnames(ActivityID) <- "ActivityID" 

## Join the two dataframes by "ActiivtyID"
activities <-join(ActivityID, activitylabels, by="ActivityID")

## Add the "ActivityID" and "ActivityLabel" columns to the overall "dat" dataframe
dat <- cbind(activities, dat)

## Combine the subject labels from the subject test and training data set
subjects <- rbind(subject_train, subject_test)

## Add column name ""Subjects" 
colnames(subjects) <- "Subject"

## Add Subject column to the overall "dat" dataframe 
dat <-cbind(subjects, dat)

## write out the first set of cleaned data if one so chooses
write.table(dat, "dat.txt") 
            
# 5. Create a second, independent, tidy data set with the average of each variable for each activity and each subject, from the data in step 4. 
library(reshape2)
sum <- melt(dat, id.vars = c("Subject", "ActivityLabel"))
results <- dcast(sum, Subject+ActivityLabel ~ variable, fun.aggregate=mean)
write.table(results, "results.txt", sep=" ", col.names=TRUE, row.name=FALSE)
            
            