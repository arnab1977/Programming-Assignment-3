# Programming-Assignment-3
03 Data reading and cleaning course
# 1. Merges the training and the test sets to create one data set.

# reads the data table x for train
data.x.train <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/train/X_train.txt')

# reads the data table x for test
data.x.test <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/test/X_test.txt')

# Combines x tables
x <- rbind(data.x.train, data.x.test)

# reads the data table y for train
data.y.train <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/train/y_train.txt')

# reads the data table y for test
data.y.test <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/test/y_test.txt')

# Combines y tables
y <- rbind(data.y.train, data.y.test)

# reads subject tables for train
data.subject.train <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/train/subject_train.txt')

# reads subject tables for test
data.subject.test <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/test/subject_test.txt')

# Combines tables for subject
subject <- rbind(data.subject.train, data.subject.test)

# 2, Extracts only the measurements on the mean and standard deviation for each measurement. 


#  read features table
features.data <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/features.txt')

# extracts mean and standard deviation 

mean.stdev <- grep("-mean\\(\\)|-std\\(\\)", features.data[, 2])
x.mean.stdev <- x[, mean.stdev]




# 3, Uses descriptive activity names to name the activities in the data set

# reads activity labels data
activity.data <- read.table('C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/activity_labels.txt')
# set names for columns
setnames(activity.data, names(activity.data), c("activity", "subject"))
y.Data[, 1] <- read.table("C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/UCI HAR Dataset/activity_labels.txt")[yDataSet[, 1], 2]
names(y) <- "Activity"
names(subject) <- "Subject"

# Creates final data set by combining tables
Finaldata.set <- cbind(mean.stdev, y, subject)


# 4. Appropriately labels the data set with descriptive variable names

# Appropriately lables the columns
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

# creates a clean data table called average.txt and writes to hard disk
average <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average <- average[, !(colnames(average.df) %in% c("subj", "activity"))]
str(average)
write.table(average, 'C:/Users/bhattarn/OneDrive - Hewlett Packard Enterprise/My documents/coursera/data science/03-/average.txt', row.names = F)
