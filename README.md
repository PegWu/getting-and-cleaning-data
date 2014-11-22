getting-and-cleaning-data
=========================
This is a class project to work with "Human Activity Recognition Using Smartphones" data from University of California, Irvine. The purpose of this project is obtain publically accessible data, clean up the data, and produce a separate, summarized, wide, tidy dataset. Below lists all the associated files required for this project.

## Dataset
Obtain the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Unzip the dataset and create the UCI HAR Dataset directory.

## Cookbook
Codebook.md describes the data variables and the process it took to clean up and transform the data.

## Script and dependencies
run_analysis.R contains the script used to perform the data transformation. It requires the reshape2 package, which available on CRAN.

## Output
Results.txt is the output of the cleaned, wide tidy dataset, summarizing the mean and standard deviation of the measurments by subject and activity.
