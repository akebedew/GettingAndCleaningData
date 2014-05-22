
## Study description

The original full description of the study is available at the site where the data was obtained and is also provided
on the Getting and Cleaning Data project website. The address for the original sources is:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data used for the project

The data for this project can be found from the following address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

## The R code (run_analysis.R) performs the following tasks

- The code merges the training set and test set using "X_train.txt" and "X_test.txt" datasets found in "text" directory under the 
"UCI HAR Dataset" directory
- Then the code extracts measurements from columns containing mean and std in the name by reading the feature data set and matches with names 
containing mean and std
- The code reads the "activity_labels.txt" from the "UCI HAR Dataset" directory 
- The code appropriately label the data set with descriptive activity names
- The code combines "MergeSubjectData", "MergData2", and "MergData1" to generate a new data set that contains aggregated measurements for each activity and each subject.
- The The code then writes the file to file name tidy_data.txt to create an independent tidy data set in the current working directory.