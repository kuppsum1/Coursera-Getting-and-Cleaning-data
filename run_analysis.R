setwd("~/Desktop/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
test <- cbind(subject_test, y_test, X_test)
setwd("~/Desktop/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
train <- cbind(subject_train, y_train, X_train)
#merging the training and test data sets to create one dataset.
data <- rbind(test, train)
#extracting only the measurements on the mean and standard deviation for each measurement
mean_stddev_data <- data[ ,c(1, 2, 3, 4, 5, 6, 7, 8, 43, 44, 45, 46, 47, 48, 83, 84, 85, 86, 87, 88, 123, 124, 125, 126, 127, 128, 163, 164, 165, 166, 167, 168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268, 269, 270, 271, 272, 273, 347, 348, 349, 350, 351, 352, 426, 427, 428, 429, 430, 431, 505, 506, 518, 519, 531, 532, 544, 545)]
#using descriptive activity names to name the activities in the data set
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 1] <- "WALKING"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 2] <- "WALKING_UPSTAIRS"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 3] <- "WALKING_DOWNSTAIRS"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 4] <- "SITTING"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 5] <- "STANDING"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 6] <- "LAYING"
#labeling the data set with descriptive variable names
colnames(mean_stddev_data) <- c("subject", "activity", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X",  "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")
#creating a second, independent tidy data set with the average of each variable for each activity and each subject
x <- ddply(mean_stddev_data, c("subject","activity"), function(x) colMeans(x[ ,c(3:68)]))
write.csv(x, file = "/Users/suma/Desktop/Course_Project.csv")
