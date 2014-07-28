The experiments relevant to the data set “Coursera_Project_Tidy_data" has been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled with fixed-width sliding windows of 2.56 sec and 50% overlap (128 reading/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components , therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ’t’ to denote time) were captured at constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyGyroMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (The ‘f’ indicates the frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern. ‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.


The set of variables used in the dataset ‘Course_Project_Tidy_data’ that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

run_analysis.R code:

1. The working directory is set to UCI HAR Dataset/test. The files subject_test.txt, X_test.txt and y_test.text are read into R using the function “read.table”. The three files are merged into a dataset called “test” using the function “cbind”.
2.The working directory is set to UCI HAR Dataset/train. The files subject_train.txt, X_train.txt and y_train.text are read into R using the function “read.table”. The three files are merged into a dataset called “train” using the function “cbind”.
3. The two datasets “test and “train” are merged into a single dataset called “data” using   “rbind”
4. The mean and standard deviation values of X along with the subject and y values are extracted from the dataset “data” by using the function "grep" and the dataset containing the values is called "mean_stddev_data".
5. The descriptive activity names are given to the second column containing y values by subsetting the dataset.
6 The descriptive variable names are used for labeling the dataset.
7. The second, independent tidy dataset "x" with the average of each variable for each activity and each subject is created using the “plyr” package and function “ddply”. The descriptive variable names are used for labeling the dataset.
8. The file created in step 7 is written into a file called “Course_Project_Tidy_data.csv” using the function “write.csv”.
9. The “Course_Project_Tidy_data.csv” file was exported to pdf format befor uploading it to Coursera.

