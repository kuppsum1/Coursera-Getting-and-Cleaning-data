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
setwd("~/Desktop/UCI HAR Dataset")
features <- read.table("features.txt")
mean_values <- grep("mean()", features$V2)
stddev_values <- grep("std()", features$V2)
mean_stddev_values <- sort(c(mean_values, stddev_values))
mean_stddev_data <- data[ ,c(1, 2, (mean_stddev_values + 2))]
#using descriptive activity names to name the activities in the data set
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 1] <- "WALKING"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 2] <- "WALKING_UPSTAIRS"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 3] <- "WALKING_DOWNSTAIRS"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 4] <- "SITTING"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 5] <- "STANDING"
mean_stddev_data$V1.1[mean_stddev_data$V1.1 == 6] <- "LAYING"
#labeling the data set with descriptive variable names
colnames(mean_stddev_data) <- c("subject", "activity", as.vector(features$V2[mean_stddev_values]))
names(mean_stddev_data) <- sub("()", "", names(mean_stddev_data), fixed = TRUE)
names(mean_stddev_data) <- sub("^t", "time", names(mean_stddev_data))
names(mean_stddev_data) <- sub("^f", "frequency", names(mean_stddev_data))
names(mean_stddev_data) <- sub("Acc", "Acceleration", names(mean_stddev_data))
names(mean_stddev_data) <- sub("std", "std_deviation", names(mean_stddev_data))
names(mean_stddev_data) <- sub("X", "X-axis", names(mean_stddev_data))
names(mean_stddev_data) <- sub("Y", "Y-axis", names(mean_stddev_data))
names(mean_stddev_data) <- sub("Z", "Z-axis", names(mean_stddev_data))
names(mean_stddev_data) <- sub("mag", "magnitude", names(mean_stddev_data))
#creating a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
x <- ddply(mean_stddev_data, c("subject","activity"), function(x) colMeans(x[ ,c(3:81)]))
names(x)[3:81] <- sub("^", "average-", names(x[3:81]))
write.csv(x, file = "/Users/suma/Desktop/Course_Project_Tidy_data.csv")
