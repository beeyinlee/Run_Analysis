#setwd("C:/0 Project/A Project/Misc/PMP/Data Science/Coursera/Assignments/Mod3")

##R script called run_analysis.R that does the following. 
##1. Merges the training and the test sets to create one data set.
##2. Extracts  the measurements on the mean and standard deviation for each measurement. 
##3. Uses descriptive activity names to name the activities in the data set
##4. Labels the data set with descriptive variable names. 
##5. From the data set in step 4, another independent tidy data set with the average of each variable for each activity and each subject.

#install.packages("data.table")
#install.packages("dplyr")
library(data.table)
library(dplyr)

#read the features
features_labels <- read.table("UCI HAR Dataset/features.txt")
#read the labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

##read training data sets
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

##read test data sets
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

##combined training and test data
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

#rename the column names, x are features and y is activity
colnames(subject) <- "Subject"
colnames(x) <- t(features_labels[2])
colnames(y) <- "Activity"

#merge all data by columns
AllData <- cbind(x,y,subject)
#dim(AllData)

#adding new columns mean and standard deviations
MeanSTD <- grep(".*Mean.*|.*Std.*", names(AllData), ignore.case=TRUE)
NewColumns <- c(MeanSTD, 562, 563)
#NewColumns
MergedData <- AllData[,NewColumns]
#dim(MergedData)

#3 more descriptive
MergedData$Activity <- as.character(MergedData$Activity)
for (i in 1:6){
  MergedData$Activity[MergedData$Activity == i] <- as.character(activityLabels[i,2])
}
MergedData$Activity <- as.factor(MergedData$Activity)

#4 label the dataset
#names(MergedData)
names(MergedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(MergedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(MergedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(MergedData)<-gsub("^t", "Time", names(extractedData))
names(MergedData)<-gsub("^f", "Frequency", names(extractedData))
names(MergedData)<-gsub("tBody", "TimeBody", names(extractedData))
#names(MergedData)

#5 another tidy data set
MergedData$Subject <- as.factor(MergedData$Subject)
MergedData <- data.table(MergedData)
 
tidy_data <- aggregate(. ~Subject + Activity, MergedData, mean)
tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
write.table(tidy_data, file = "tidy.txt", row.names = FALSE)

