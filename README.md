ReadMe
======================
## Getting and Cleaning Data Peer Assignment Project

### Main Tasks and Goals

1.	Merge the training and the test sets to create one data set.
2.	Extract only the measurements on the mean and standard deviation for each measurement. 
3.	Use descriptive activity names to name the activities in the data set
4.	Appropriately label the data set with descriptive activity names. 
5.	Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Data used in the run_analysis.R code

The first step for this analysis is downloading the zip file "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" provided for the project and unzip into a folder in the local directory called "project". The data needed for the project will be found
in "UCI HAR Dataset". Once the data is downloaded from the original source to the local directory the R code ("Run_analysis.R") will be used
to read the required files and produce a tidy data set which contains the mean of each combined measurement for each activity and each subject. 
The final file ("tidy_data") contains the mean and standard deviation for each measurement.

The R code is based on the data downloaded from the original source and placed in a directory called "UCI HAR Dataset".
The code uses files containing aggregated measurements - "X_train.txt" and "X_test.txt" found in "text" directory.


### Running the "Run_analysis.R" code

- The code merges the training set and test set using "X_train.txt" and "X_test.txt" datasets found in "text" directory under the "UCI HAR Dataset" directory
- Then the code extracts measurements from columns containing mean and std in the name by reading the feature data set and matches with names containing mean and std
- The code reads the "activity_labels.txt" from the "UCI HAR Dataset" directory 
- The code appropriately label the data set with descriptive activity names
- The code combines "MergeSubjectData", "MergData2", and "MergData1" to generate a new data set that contains aggregated measurements for each activity and each subject.
- The The code then writes the file to file name tidy_data.txt to create an independent tidy data set in the current working directory.
