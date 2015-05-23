## Reading in the documentation as recommended by assignment guidelines

featureNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

## Reading in the Training Data
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

## Reading in the Test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
##


## Part 1
## Combining the data (Merge the Test and Training datasets into one)
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

## Setting up to be able to name the columns in the table
colnames(features) <- t(featureNames[2])

## Allocating names for the tables columns
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

## Allocating the data to a single table
completeData <- cbind(features,activity,subject)
#check the table
completeData
##


## Part 2
## Find the columns that have either a MEAN or SD (seen as Std. for now)
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)

## Allocate required columns and look at DIM
requiredColumns <- c(columnsWithMeanSTD, 562, 563)
dim(completeData)
requiredColumns

## Allocate required columns and look at DIM
extractedData <- completeData[,requiredColumns]
dim(extractedData)
##


## Part 3
## Naming the activities in the dataset, allocate the Activity field as a character within the extractedData table
extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}

## Make the Activity field within the extractedData table a factor
extractedData$Activity <- as.factor(extractedData$Activity)
##


## Part 4
## Check of the existing names within the extracted data
names(extractedData)

## The names aren't in a suitable/usable format - the following code changes the names of some data
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

## Check the new names within the extracted data
names(extractedData)
##


## Part 5 - cleans things up and generates a 'Tidy' dataset
## Make the Subject field wtihin the extractedData a factor
extractedData$Subject <- as.factor(extractedData$Subject)

## Change the form of the data into a table
extractedData <- data.table(extractedData)

## generate new object and aggregate needed fields
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
# order the new fields
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

## Generate the Tidy.txt file
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

## Check the Tidy data
tidyData
##

