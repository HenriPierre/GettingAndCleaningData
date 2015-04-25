features<-read.table("features.txt",header = FALSE) #load the "features" file that will later give us the column names of our data set
X_test<-read.table("test/X_test.txt",header = FALSE,col.names=c(as.character(features$V2))) #load the test file with the features as column names
X_train<-read.table("train/X_train.txt",header = FALSE,col.names=c(as.character(features$V2))) #load the train file with the features as column names
X<-rbind(X_test,X_train)
X2<-X[,c(grep(".mean..",names(X),ignore.case=FALSE,fixed=TRUE),grep(".std",names(X),ignore.case=FALSE,fixed=TRUE))] #Extracts only the measurements on the mean and standard deviation for each measurement
activitylabeltest<-read.table("test/y_test.txt",header=FALSE,colClasses="factor") #load the y_test file providing the concerned activities
activitylabeltrain<-read.table("train/y_train.txt",header=FALSE,colClasses="factor") #load the y_train file providing the concerned activities
activitylabel<-rbind(activitylabeltest,activitylabeltrain) # combine row-wise the activitylabel data frames
subjecttest<-read.table("test/subject_test.txt",header=FALSE,colClasses="factor",col.names=c("subject"))
subjecttrain<-read.table("train/subject_train.txt",header=FALSE,colClasses="factor",col.names=c("subject"))
subject<-rbind(subjecttest,subjecttrain)# combine row-wise the subject data frames
activitylabel<-factor(activitylabel$V1,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")) #change factor names in the activitylabel in accordance with the activity_labels file in order to make it more readable
TIDY<-cbind(subject,activitylabel,X2)#combining the data frames to make the full TEST data frame
TIDYmelt<-melt(TIDY,id=c("subject","activitylabel"),measure.vars=c(names(select(TIDY,-(subject:activitylabel)))))
TIDY2<-dcast(TIDYmelt, subject+activitylabel~variable,mean)#tidy data set with the average of each variable for each activity and each subject.
write.table(TIDY2,file="TIDY2.txt",row.name=FALSE)
