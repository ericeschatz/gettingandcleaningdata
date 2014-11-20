library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "run_analysis.zip")

unzip("run_analysis.zip")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity", "activity_description"))


features <- read.table("./UCI HAR Dataset/features.txt")##these are colnames

##this is the "train" data with additional columns added; a staging dataset
##includes the descriptive variable names and merges descriptive activity names
train <- read.table("./UCI HAR Dataset/train/x_train.txt", col.names = as.character(features[,2]))%>%
        cbind(read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subject"))%>%
        cbind(read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity"))%>%
        merge(activity_labels, by="activity")%>%
        select(c(2:564))

##this is the "test" data with additional columns added; a staging dataset
##includes the descriptive variable names and merges descriptive activity names
test <- read.table("./UCI HAR Dataset/test/x_test.txt", col.names = as.character(features[,2]))%>%
    cbind(read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subject"))%>%
    cbind(read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity"))%>%
    merge(activity_labels, by="activity")%>%
    select(c(2:564))
  
##this is the data set for step 4.  merges the two previous staging datasets (test, train)
##contains all mean & stdev variables plus the subject and descriptive variable names, also has descriptive activities
dat <- rbind(train, test)%>%
        select(c(562, 563, c(grep("std()|mean()", features[,2], ignore.case = TRUE))))


##remove the temp data sets
rm(features, train, test, activity_labels)


##create tidy dataset dat2, with mean for all variables grouped by activity description and subject
dat2 <- aggregate(dat[, 3:88], list(dat$activity_description, dat$subject), mean)

colnames(dat2)[c(1,2)] <- c("activity_description", "subject")

##write tidy data set to file (optional)
##write.table(dat2, file = "gettingandcleaningdata_courseassignment.txt", row.names = FALSE)