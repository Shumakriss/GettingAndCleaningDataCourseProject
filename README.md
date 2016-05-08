# GettingAndCleaningDataCourseProject

This project demonstrates the student's ability to retrieve and clean data.

## Data Used
Original data may be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Mirror to data directly:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Created
As instructed, the script does the following (not necessarily in this exact order):

1.  Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final dataset is called "tidy_data" in memory.

## Assumptions
* Step 5 seems pretty unclear, my assumption is that the tidy data set should provide the averages of each variable (features) grouped first by subject, then by activity. This provides the average sensor data for that subject/activity. This is a bit confusing since the feature is already a mean so I have also made the assumption that it is a mean of multiple sensors or a mean over the interval of capture.

## Steps to Use
Clone the git repo and set the R working directory at the top level
Create a folder named data in the working directory
Download the dataset to the data directory
Source the script run_analysis.R
Use the tidy data!

## Notes About the Assignment
The tidy_data set was considered "limited" by one previous reviewer though others said it was fine. I believe this to be due to the wording of the assignment that it is unclear. Many students produced multiple files/datasets to compensate but I believe this analysis is one of several acceptable solutions and satisfies the main goals of tidiness.
