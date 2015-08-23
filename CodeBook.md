Code Book
- describes the variables, the data, and transformations or work to clean up the data

Script File
- run_analysis.R 

Data 
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Variables
- features_labels contains features labels
- activity_labels contains acticvity labels
- subject_train contains training subject
- x_train contain features training sets
- y_train contain activity training sets
- subject_test contains test subject
- x_test contain features test sets
- y_test contain actvity test sets
- subject contain all subject
- x contain all features
- y contain all activities
- AllData contain subject, x and y
- MeanSTD contain Mean and Standard Deviation for AllData
- NewColumns is a class dd Mean and Standard Deviation columns
- MergedData contain all data with additional columns
- tidy_data contain mean of each variable on activity and subject 

Tasks performed to clean up
1. Download the UCI HAR Dataset
2. Extract in to UCI HAR Dataset
3. Read the data files above
4. Combine the x, y and subject training and test files
5. Combine steps 4 into one file 
6. Rename the columns
7. Create 'tidy.txt' contain the mean of each variable on activity and subject

Dependencies
- data.table
- dplyr

