# CodeBook

The attached R script runs on data collected from the accelerometers from the Samsung Galaxy S smartphone.
[Link to Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)   
This are the tasks that *run_analysis.R* performs on **UCI HAR Dataset**:   
* Code reads the training datasets(*X_train.txt, y_train.txt, subject_train.txt*) and test datasets (*X_train.txt, y_test.txt, subject_test.R*) and merges into one single dataset
(*x,y,subject*)   
* It reads the *features.txt* file and extracts only the measurements on the mean and standard deviation for each measurement.
* It reads activity labels from *activity_labels.txt* and replaces values in dataset *y* with their respective activity name which are
walking; walkingupstairs; walkingdownstairs; sitting; standing; laying  
* Code labels the appropriate name for each extracted variable using features list and colnames function.
* It labels variable containing subject and activity as "Subject" and "Activity", followed by writing this merged data into a text file "*merged_tidy_dataset.txt*".
* Now, Code uses dplyr function **group_by()** to group the data obtained in the previous step by activity and then by subject. This makes easy to summarise data.  
* To data set with the average of each variable for each activity and each subject, we use **summarise_at()** function by library *dplyr*. Three arguments are passed to
 the function: first, table *tb*; second, list of columns to be averaged *.vars=3:81*; third, *.funs= mean* this is reference to the function mean.  
 * Finally, writing this averaged data stored in *avgtb* into file name *"merged_tidy_dataset_with_averages.txt"*, a dataframe of 180 observation and 81 variables.
