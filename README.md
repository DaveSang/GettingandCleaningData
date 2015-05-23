# GettingandCleaningData
## Project Requirements
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

 1. Merges the training and the test sets to create one data set.
 2. 2Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set  
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and   each subject.


## An explanation of how I went about developing the code neccesary to meet the assignment requirements.
1. To kick things off, I downloaded the data and placed the unzipped files in my Working Directory.
2. I then read the "UCI HAR Dataset/features.txt" and "UCI HAR Dataset/activity_labels.txt" files.
3. I read the "UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/train/y_train.txt" and "UCI HAR Dataset/train/X_train.txt"    (training data) files.
4. I then read "UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/test/y_test.txt" and "UCI HAR Dataset/test/X_test.txt"        files.
5. I proceeded to combine/merge the data, initially using the rbind() function to merge the test and traninig data sets in relation    to subject, activity and features, and allocated column/field names for variables "Subject" and "Activity".
6. I then allocated the data to a single table using the cbind() function and checked to see that all was as to be expected. 
7. I then looked for all columns that had a "Std." or "Mean." and then lookd at the DIM of each field.
8. I generated an output with a condition to ensure that the required columns and conditions ("Std" and "Mean") were met.  From now    on referred to the "Subset data".
9. I then named/labelled the activities in the dataset and allocated the Activity field/column as a character (from a numeric type)    within the Subset data.  This was done to ensure that the field/column can can accept activity names.  The activity names were      then taken from the documentation supporting.  
10. I then enabled the Activity variable to be factored for future processing (changing naming conventions with the Subset data).
11. I then looked at te field/column names within the Subset data (all data that had "Std." and "Mean" data).  I proceeded to change    those variable identities (and others) to something more visually appealing and easier to understand.
12. I then proceeded to clean things up within the Subset dataset.
13. I made the "Subject" field/column a factor.  I the then aggregated the "Subject" and "Activity with the "Subset data", "mean"      and using the aggregate() function and then ordered the subset data by subject and activity.
14. I then generated the "Tidy.txt" file using the write.table() function.
