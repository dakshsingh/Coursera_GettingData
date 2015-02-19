# Coursera_GettingData
Course assignment for the getting and cleaning data course on Coursera

The attached code does the following:

1. Reading in all data files and assigning column names

2. Cleaning training dataset by adding the subject and activity

3. Cleaning test dataset by adding the subject and activity

4. Appending test to training dataset, subsetting required measures, taking mean of readings for each subject and activity and finally gathering measures into tall form of tidy data

5. Writing out data for upload

The code has been suitably commented so can can follow how each part functions. The tidy dataset has been uploaded on Coursera along with the assignment submission. Once the data set is downloaded it can be read into R with the following:
read.table("final.txt")

The run_analysis.R script was used to create final.txt and can be run to exactly reproduce the submitted file. It is required that the UCI data files are in the R working directory and dplyr and tidyr packages are installed.
