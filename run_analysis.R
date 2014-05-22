## This program will be used to address the project tasks for Getting and 
## Cleaning Data Peer Assignment project
## Download the required data from the original source and unzip to get the 
## required file which are placed in the "UCI HAR Dataset" directory

## Task 1:  Merge the training set and test set. For this we need to read the 
## "X_train.txt" and "X_test.txt" found in "text" directory under the 
##  "UCI HAR Dataset" directory

## read the data for X from the "text" and "train" directories

dataTrainX <- read.table("train/X_train.txt")
dataTestX <- read.table("test/X_test.txt")

## Merge the training and test sets for X

MergData1 <- rbind(dataTrainX,dataTestX)

## read the data for y from the "text" and "train" directories
dataTrainY <- read.table("train/y_train.txt")
dataTestY <- read.table("test/y_test.txt")

## Merge the training and test sets for X

MergData2 <- rbind(dataTrainY,dataTestY)

## reads the data for subject the "text" and "train" directories

subjectTrain <- read.table("train/subject_train.txt")
subjectTest <- read.table("test/subject_test.txt")

## Merge subject files

MergeSubjectData<- rbind(subjectTrain,subjectTest)

## Task 2: Extract measurements from columns containing mean and std in the name.
## This part reads the feature data set and matches with names containg mean and
## std

## Read features data

featuresData <- read.table("features.txt")

## matches names containing mean and std
featuresMean <- grep("-mean\\(\\)", featuresData[, 2]) 
featuresstd <- grep("-std\\(\\)", featuresData[, 2])

## Combine featureMean and featursstd
featureIndex <- sort(c(featuresMean,featuresstd)) 

## Get data based on the indices
MergData1 <- MergData1[, featureIndex] 

## Get columns related to mean and std
names(MergData1) <- featuresData[featureIndex, 2] 

##  Reshape data 
names(MergData1) <- gsub("\\(|\\)", "", names(MergData1))
names(MergData1) <- toupper(names(MergData1)) 

## Task 3 - Use descriptive activity names to name the activities in the data set

## Read the "activity_labels.txt" from the "UCI HAR Dataset" directory

activityData <- read.table("activity_labels.txt")
MergData2[,1] = activityData[MergData2[,1], 2]
names(MergData2) <- "ACTIVITY" 

## 4 - Appropriately label the data set with descriptive activity names 

## merge X, y and subject datasets

names(MergeSubjectData) <- "SUBJECT"
finalData <- cbind(MergeSubjectData, MergData2, MergData1) 

## 5 - Create a second, independent tidy data set with the average of each variable
## for each activity and each subject.

## finding the no of unique subjects 
uniqueSubjects <- unique(MergeSubjectData)[,1] 
totalCol <- dim(finalData)[2]
# creating the tidy_data table initially
tidy_data <- finalData[1:(length(uniqueSubjects)*length(activityData[,1])),]

## Combine data based on unique subjects and number of uniques activities

n = 1
for (i in 1:length(uniqueSubjects)) 
{
  for (j in 1:length(activityData[,1])) 
  {
    tidy_data[n, 1] = uniqueSubjects[i]
    tidy_data[n, 2] = activityData[j, 2]
    # check if subject and activity matches with final merged data
    test <- finalData$SUBJECT==i & finalData$ACTIVITY==activityData[j, 2]
    tempData <- finalData[test, ]
    tidy_data[n, 3:totalCol] <- colMeans(tempData[, 3:totalCol])
    n = n + 1
  }
}

## writes the file to file name tidy_data.txt to create an independent tidy data set 

write.table(tidy_data, "tidy_data.txt")