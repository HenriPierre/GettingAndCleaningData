# GettingAndCleaningData
Getting and Cleaning Data - Course Project
The code

load the "features file" that will later give us the column names of our data set
load the test file with the features as column names
load the train file with the features as column names
Extracts only the measurements on the mean and standard deviation for each measurement
load the y_test file providing the concerned activities
load the y_train file providing the concerned activities
combine row-wise the activitylabel data frames
subjecttest<-read.table("test/subject_test.txt",header=FALSE,colClasses="factor",col.names=c("subject"))
subjecttrain<-read.table("train/subject_train.txt",header=FALSE,colClasses="factor",col.names=c("subject"))
combine row-wise the subject data frames
change factor names in the activitylabel in accordance with the activity_labels file in order to make it more readable
combining the data frames to make the full TEST data frame
TIDYmelt<-melt(TIDY,id=c("subject","activitylabel"),measure.vars=c(names(select(TIDY,-(subject:activitylabel)))))
Gives the tidy data set "TIDY2" with the average of each variable for each activity and each subject and write it to a text file "TIDY2.txt"
