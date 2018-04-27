# 1. Merges the training and the test sets to create one data set.

data.x.train <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/train/X_train.txt')
data.x.test <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/test/X_test.txt')
x <- rbind(data.x.train, data.x.test)

data.y.train <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/train/y_train.txt')
data.y.test <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/test/y_test.txt')
y <- rbind(data.y.train, data.y.test)

data.subject.train <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/train/subject_train.txt')
data.subject.test <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/test/subject_test.txt')
subject <- rbind(data.subject.train, data.subject.test)

# 2, Extracts only the measurements on the mean and standard deviation for each measurement. 
features.data <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/features.txt')
mean.stdev <- grep("-mean\\(\\)|-std\\(\\)", features.data[, 2])
x.mean.stdev <- x[, mean.stdev]




# 3, Uses descriptive activity names to name the activities in the data set
activity.data <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/activity_labels.txt')
setnames(activity.data, names(activity.data), c("activity", "subject"))
y.Data[, 1] <- read.table("C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/activity_labels.txt")[yDataSet[, 1], 2]
names(y) <- "Activity"
names(subject) <- "Subject"
Finaldata.set <- cbind(mean.stdev, y, subject)


# 4. Appropriately labels the data set with descriptive variable names
names(Finaldata.set) <- make.names(names(Finaldata.set))
names(Finaldata.set) <- gsub('Acc',"Acceleration",names(Finaldata.set))
names(Finaldata.set) <- gsub('GyroJerk',"AngularAcceleration",names(Finaldata.set))
names(Finaldata.set) <- gsub('Gyro',"AngularSpeed",names(Finaldata.set))
names(Finaldata.set) <- gsub('Mag',"Magnitude",names(Finaldata.set))
names(Finaldata.set) <- gsub('^t',"TimeDomain.",names(Finaldata.set))
names(Finaldata.set) <- gsub('^f',"FrequencyDomain.",names(Finaldata.set))
names(Finaldata.set) <- gsub('\\.mean',".Mean",names(Finaldata.set))
names(Finaldata.set) <- gsub('\\.std',".StandardDeviation",names(Finaldata.set))
names(Finaldata.set) <- gsub('Freq\\.',"Frequency.",names(Finaldata.set))
names(Finaldata.set) <- gsub('Freq$',"Frequency",names(Finaldata.set))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average <- average [, !(colnames(average.df) %in% c("subj", "activity"))]
str(average)
write.table(average, 'C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/average.txt', row.names = F)
