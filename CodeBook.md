#Code book

The code in run_analysis.R is fairly simple and easy to follow thanks primarily to the use of the dplyr package. Some details of the code and decisions taken are given below. please note that the dplyr and tidyr packages must be installed to run the code.

##Reading data

We first read the features.txt file and use the column headers in that while importing the X_train.txt and X_test.txt files. We further import the subject files which give us which row should be mapped to which observed person in the test and train data. y_test and y_train is also imported to give us information of what activity was being performed for each observation in the test and train data. The activity.txt file gives us the master used to map each activity code in in y_test and y_train to a plain english activity name.

##Cleaning train dataset

The training data set is prepared by adding the subject information and activity code columns and finally joining the activity code to activity name mapping.

##Cleaning test dataset

The test data set is prepared in a similar manner to the train data set.

##Finalizing tidy data set

Th final dataset is created by appending the test dataset to the train dataset followed by selecting the columns (measures) that contain either mean or std in the column name. I then took the average reading for each selected measure for each subject and activity to get the wide form summarised data. Finally we gather the columns into a tall form tidy data set.

##Writing out data

The data is written out in txt format using write.table with the recommended row.names=false flag and uploaded along withe the assignment.
