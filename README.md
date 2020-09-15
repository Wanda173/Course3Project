## Peer Graded Assignment Course 3 week 4

File : README.md

Repository
----------
A repository has been created on GitHub at https://github.com/Wanda173/Course3Project that contains:
- the script run_analysis.R 
- CodeBook.md
- README.md

Data to be processed
--------------------
- The raw files provided was collected from the accelerometers from the Samsung Galaxy S smartphone.
- Experiments were carried out with a group of 30 volunteers referred to as "Subjects".
- Each person performed 6 activities wearing a smartphone on the waist.
- The experiment recorded readings from a vector of 561 features. 

- The data came in 2 sets of files, a "test" folder and a "train" folder 

Goal
----
The goal of the script run_analysis.R is to create a tidy dataset from the raw files and group the data by activity and subject,
calculating the average of the measurements of features.

Instructions about the Script
-----------------------------
Before running the script, run_analysis.R, the appropriate directory must be set.

Folders /train and /test must exist on your PC with the following files which are used by the script.
/train/y_train.txt
/train/subject_train.txt
/train/X_train.txt
/test/y_test.txt
/test/subject_test.txt
/test/X_test.txt
/features.txt
/activity_labels.txt

It is important to run the code in the script in the order they appear to get the needed results.

The script uses read.table() to read the files into a data frame.

Package dplyr need to be installed and loaded if it was never used before as some functions like rename
have been used that require the package.
- To install the package use installed.packages("dplyr") 
- To load the package use library(dplyr)

Summary of steps done by the Script
-----------------------------------
Note: A detail description of the steps are found in CodeBook.md

The script will perform the below steps to tidy the data from the files:
- A main dataset is obtained by merging the X_*.txt, y_*.txt, subject_*.txt from the test and train folder.
- Only the columns with the mean and standard deviation are extracted from the measurement feature columns.
- Column meanfreq was not included as a mean column from the measurements.
- The activity names are labelled in the dataset using data provided in activity_labels.txt 
- The feature variables are labelled in the dataset using data provided in features.txt
- The features were renamed in such a way that they are not overly long.  For more details, users will
  need to refer to the codebook.
- A summarised dataset is created by grouping the dataset by activity and subject and calculating the average
  of the measurement features.

Codebook
--------
A CodeBook.md file is provided which describes:
1) All the steps followed to get the final tidy the data
2) All the variables in the tidy data.

