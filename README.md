# GettingAndCleaningData

Getting and Cleaning Data - Course Project

The code

1. Loads the "features file" that will later give us the column names of our data set
2. Loads the test file with the features as column names
3. Loads the train file with the features as column names
4. Extracts only the measurements on the mean and standard deviation for each measurement
5. Loads the y_test file providing the concerned activities
6. Loads the y_train file providing the concerned activities
7. Combines row-wise the activitylabel data frames
8. Loads both the subject_test and the subject_train file in two separate data frame before combining them.
9. Combines row-wise the subject data frames
10. Changes factor names in the activitylabel in accordance with the activity_labels file in order to make it more readable
11. Combines the data frames to make the full TIDY data frame
12. Sets the Subject and the activity label variables as id variables
13. Gives the tidy data set "TIDY2" with the average of each variable for each activity and each subject and write it to a text file "TIDY2.txt"
