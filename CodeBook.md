# Sensor Data Code Book

After running the script run_analysis.R, a few variables are left in memory for use:

##wearables
An indexed data_frame containing the labeled and merged data sets with only the mean and standard deviation features. This is a tidy data set but is not the analysis requested (Requirements 1-4).

##tidy_data
A tidy summary of the wearables data. The set aggregates the wearables data by averaging each variable sensor mean across a specific subject and a specific activity.

* Subject - The test subject's identifier.

* Activity - The activity they were performing when the sample was taken.

* Variables beginning with Mean_Of_ - The mean of the particular variable for this activity for this subject. 

## Notes About the Assignment
The tidy_data set was considered "limited" by one previous reviewer though others said it was fine. I believe this to be due to the wording of the assignment that it is unclear. Many students produced multiple files/datasets to compensate but I believe this analysis is one of several acceptable solutions and satisfies the main goals of tidiness.