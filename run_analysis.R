# Downloading data (assuming your at the repository's root)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="data/UCI_HAR_Dataset.zip")
#unzip("data/UCI_HAR_Dataset.zip")

#
# Loading data
#

# Labels
Activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("act_id", "activity"))
Features <- read.table("UCI HAR Dataset/features.txt")

# Vector to get only the means and standard deviations
ofInterest <- grep('-std\\(\\)|-mean\\(\\)', Features[,2])

# Loading test set (keeping only the mean and std deviation)
X_test <- read.table("UCI HAR Dataset/test//X_test.txt", col.names = Features[,2])[,ofInterest]
X_test_activities <- read.table("UCI HAR Dataset/test//y_test.txt", col.names=c("act_id"))
X_test$activity <- merge(X_test_activities, Activities)[,2]
X_test$subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")[,1]


# Loading train set (keeping only the mean and std deviation)
X_train <- read.table("UCI HAR Dataset/train//X_train.txt", col.names = Features[,2])[,ofInterest]
X_train_activities <- read.table("UCI HAR Dataset/train//y_train.txt", col.names=c("act_id"))
X_train$activity <- merge(X_train_activities, Activities)[,2]
X_train$subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")[,1]

# Merging sets
X_all <- rbind(X_test, X_train)
names(X_all) <- gsub('..', '', names(X_all), fixed = TRUE)

# Computing means and sorting this set
X_means <- aggregate(.~activity+subject, X_all,mean)
write.table(X_means, file="tidy.means.csv", row.names=F)
