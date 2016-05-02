# Load the labels
activity_labels <- read.delim("data/activity_labels.txt", header=FALSE, sep=" ", col.names = c("activity_id", "activity_name"))
feature_labels <- read.delim("data/features.txt", header=FALSE, sep=" ", col.names=c("feature_id", "feature_name"))

# Load the test data sets
testSubject <- read.csv("data/test/subject_test.txt", header = FALSE, col.names = c("subject_id"))
testFeatures <- read.table("data/test/X_test.txt")
testActivities <- read.csv("data/test/y_test.txt", header=FALSE, col.names = c("activity_id"))

# Apply the labels to the test activities and features
activities <- merge(testActivities, activity_labels, by.y="activity_id")
colnames(testFeatures) <- feature_labels$feature_name

# Combine the newly labeled data
wearables <- data.frame(subject = testSubject$subject_id, activity = activities$activity_name)
wearables$ID<-seq.int(nrow(wearables))
testFeatures$ID<-seq.int(nrow(testFeatures))
testWearables <- merge(wearables, testFeatures, by.y = "ID")

# Repeat for training data
trainSubject <- read.csv("data/train/subject_train.txt", header = FALSE, col.names = c("subject_id"))
trainFeatures <- read.table("data/train/X_train.txt")
trainActivities <- read.csv("data/train/y_train.txt", header=FALSE, col.names = c("activity_id"))

activities <- merge(trainActivities, activity_labels, by.y="activity_id")
colnames(trainFeatures) <- feature_labels$feature_name

wearables <- data.frame(subject = trainSubject$subject_id, activity = activities$activity_name)

wearables$ID<-seq.int(nrow(wearables))
trainFeatures$ID<-seq.int(nrow(trainFeatures))

trainWearables <- merge(wearables, trainFeatures, by.y = "ID")

# Combine the training data
wearables <- rbind(testWearables, trainWearables)

# Extract only mean and standard deviation (as well as subject and activity)
final_columns <- grepl("subject|activity|mean[^F]|std", colnames(trainWearables))
wearables <- wearables[,final_columns]

# Finally, aggregate the mean of each variable, grouped by the subject and activity
tidy_data <- aggregate(wearables[, 3:68], list(wearables$subject, wearables$activity), mean)
# Order it neatly
tidy_data <- tidy_data[order(tidy_data$Group.1, tidy_data$Group.2),]
# Clean up the labels
colnames(tidy_data) <- paste("Mean_Of", colnames(tidy_data), sep = "_")
colnames(tidy_data)[1] <- "Subject"
colnames(tidy_data)[2] <- "Activity"

