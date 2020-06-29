library(dplyr)
#Merging Testing and Training  Datasets
x<- bind_rows(
  read.table("UCI HAR Dataset/train/X_train.txt"),
  read.table("UCI HAR Dataset/test/X_test.txt")
)
y<- bind_rows(
  read.table("UCI HAR Dataset/train/y_train.txt"),
  read.table("UCI HAR Dataset/test/y_test.txt")
)
subject<- bind_rows(
  read.table("UCI HAR Dataset/train/subject_train.txt"),
  read.table("UCI HAR Dataset/test/subject_test.txt")
)

# Extracting measurement based on mean and standard deviation
featurestb<- read.table("UCI HAR Dataset/features.txt")
features<- featurestb[grep("mean|std", featurestb[,2],ignore.case = TRUE), 2]
x<- x[, features]
tb<- bind_cols(subject,y,x)

# Using descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
tb[, 2] = activity[tb[ , 2], 2]

# Labeling the dataset with descriptive variable name
names(tb)[c(1,2)]<- c("Subject", "Activity")
names(tb)[3:81]<- gsub("\\(\\)", "", features)

write.table(tb, file = "merged_tidy_dataset.txt")

# Creating a dataset with the average of each variable for each activity and each subject
tb<- group_by(tb, Activity, Subject)
avgtb<- summarise_at(tb, .vars = 3:81, .funs = mean)

write.table(avgtb, file = "merged_tidy_dataset_with_averages.txt")