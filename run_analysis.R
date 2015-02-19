require(dplyr)
require(tidyr)

## Reading in all data files and assigning column names
features<-read.table("features.txt",col.names=c("num","col_name"))
X_train<-read.table("train/X_train.txt",col.names=features$col_name)
X_test<-read.table("test/X_test.txt",col.names=features$col_name)

subject_train<-read.table("train/subject_train.txt",col.names="subject")
subject_test<-read.table("test/subject_test.txt",col.names="subject")

y_train<-read.table("train/y_train.txt",col.names="activity_code")
y_test<-read.table("test/y_test.txt",col.names="activity_code")

activity<-read.table("activity_labels.txt",col.names=c("activity_code","activity_name"))

##Cleaning training dataset by adding the subject and activity
X_train_final<-X_train %>% 
        bind_cols(subject_train) %>%
        bind_cols(y_train) %>%
        left_join(activity,by="activity_code") 

##Cleaning test dataset by adding the subject and activity
X_test_final<-X_test %>% 
        bind_cols(subject_test) %>%
        bind_cols(y_test) %>%
        left_join(activity,by="activity_code") 

##Appending test to training dataset, subsetting required measures, taking mean
##of readings for each subject and activity and finally gathering measures into
##tall form of tidy data
final<-X_train_final %>%
        bind_rows(X_test_final) %>%
        select(subject,activity_name,matches("mean|std")) %>%
        group_by(subject,activity_name) %>%
        summarise_each(funs(mean)) %>%
        gather("measure","mean",3:88)

##Writing out data for upload
write.table(final,"final.txt",row.names=FALSE)
