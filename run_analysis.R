## Peer Graded Assignment Course 3 Week 4
## ----------------------------------------------------------------
## 1) Merge the training and the test sets to create one data set
## ----------------------------------------------------------------
## For train folder, make sure your are in the train folder
dt <- read.table("./train/X_train.txt")			# get the data for the feature readings
a <- read.table("./train/y_train.txt")			# get the data for the activities 
s <- read.table("./train/subject_train.txt")	# data for subjects who perform an activity

library(dplyr)
a <- rename(a,Activity=V1)				# Renaming single column V1 to Activity
s <- rename(s,Subject=V1)				# Rename single column V1 to Subject

## merging column activity and subject files in train dataset
dt <- cbind(dt,a)
dt <- cbind(dt,s)

## For test Folder , repeat same as above make sure you are in the test folder
dt2 <- read.table("./test/X_test.txt")
a2 <- read.table("./test/y_test.txt")
s2 <- read.table("./test/subject_test.txt")

library(dplyr)
a2 <- rename(a2,Activity=V1)			# Renaming single column V1 to Activity
s2 <- rename(s2,Subject=V1)				# Rename single column V1 to Subject

## merging activity and subject files in test folder
dt2 <- cbind(dt2,a2)
dt2 <- cbind(dt2,s2)

## combine all rows from the train and test dataset into "all" data frame
## columns in "all" are V1, V2 ... V561, Activity, Subject
all <- rbind(dt,dt2)

##------------------------------------------------------------------------------------------
## 2) Extract only the measurements on the mean and standard deviation for each measurement
##------------------------------------------------------------------------------------------

## Read the list of features used.
## Column 1 holds the feature no 1,2,34 ...
## Column 2 holds the description of the feature
## > head(f,2)
##  V1                V2
##1  1 tBodyAcc-mean()-X
##2  2 tBodyAcc-mean()-Y

f <- read.table("features.txt")

## Get the corresponding feature number rows from column 1 where "mean" or "std" exists in 
## the text in column 2.  Exclude meanFreq() as from the info provided it is a different calculation
## from the mean
f2 <- f[grep("mean\\(\\)|std\\(\\)",f[,2]),1]

## Get all rows from the main dataset "all" with columns numbers from f2, the activity and subject column
## column index 562 holds the Activity
## column index 563 holds the Subject 
## column index 1 holds V1, 2 holds V2 etc
all2 <- all[,c(f2,562,563)]


##------------------------------------------------------------------------------------------
## 3) Uses descriptive activity names to name the activities in the data set
##------------------------------------------------------------------------------------------

## the activity names are found in activity_labels.txt
ac <- read.table("activity_labels.txt")

##create a function that returns the activity name after passing the Activity number
##to the activity data frame. Column 2 of "ac" holds the activity name.
activity_name <- function(x) {ac[x,2]}

## all2 in column Activity contains the activity Number
## loop using sapply passing the function above to get the activity name and
## overwrite the all2$Activity column with the Activity Name
all2$Activity <- sapply(all2[,"Activity"],activity_name)


##------------------------------------------------------------------------------------------
#4) Appropriately labels the data set with descriptive variable names.
##------------------------------------------------------------------------------------------

## create a vector of feature description with mean and standard deviation in "f3"
f3 <- f[grep("mean\\(\\)|std\\(\\)",f[,2]),2]

## Remove - or ( or ) from the text
f3 <- gsub("-"," ",f3)
f3 <- sub("\\(\\)","",f3)

## Replace text starting with "t" with "Time"
f3 <- sub("^t","Time ",f3)

## Replace text starting with "f" with "Frequency"
f3 <- sub("^f","Frequency ",f3)

## Capitalise the First letter of mean and std
f3 <- sub("mean","Mean",f3)
f3 <- sub("std","Std",f3)

## Replace x or X at the end with X-Axis
## Same for y or Y  and z or Z 
f3 <- sub("[xX]$","X-Axis",f3)
f3 <- sub("[yY]$","Y-Axis",f3)
f3 <- sub("[zZ]$","Z-Axis",f3)

## Replace double Body text by single one
f3 <- sub("BodyBody","Body",f3)

## Add period(.) to separate distinct attributes of the feature 
## Eg Body, Gravity, Mag, 

f3 <- sub("Body","Body.",f3)
f3 <- sub("Gravity","Gravity.",f3)
f3 <- sub("Jerk",".Jerk",f3)
f3 <- sub("Mag",".Mag",f3)

## Apply the names from f3, Activity and Subject labels to the column names of the main dataset 
colnames(all2) <- c(f3,"Activity","Subject")


##------------------------------------------------------------------------------------------
## 5) From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.
##------------------------------------------------------------------------------------------

## Group by the dataset "all2" by Activity and Subject, calculating the mean of all the other 
## measurement columns and save in "all3"
all3 <- aggregate(.~Activity+Subject, all2, mean)

