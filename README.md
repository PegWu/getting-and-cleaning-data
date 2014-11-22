getting-and-cleaning-data
=========================
This is a class project to work with "Human Activity Recognition Using Smartphones" data from University of California, Irvine. The purpose of this project is obtain publically accessible data, clean up the data, and produce a separate, summarized, wide, tidy dataset. Below lists all the associated files required for this project.

## Dataset
Obtain the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. It contains measurements of movements made by 30 volunteers for the study. Unzip the dataset and create the UCI HAR Dataset directory.

## Code Book
Codebook.md describes the data variables and the process it took to clean it up.

## Script and dependencies
run_analysis.R contains the script used to clean the data. It requires the reshape2 package, which available on CRAN.

## Output
Results.txt is the output of the cleaned, wide tidy dataset, summarizing the mean and standard deviation of the movement measurments by subject and activity.
