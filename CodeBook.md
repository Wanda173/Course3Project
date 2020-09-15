-- CodeBook.md
-- The document is about the variables and work done for the final tidy dataset.
--------------------------------------

----------------------------------
1) Steps followed to tidy the data
----------------------------------

Step 1: Combining the train and test dataset
--------------------------------------------
The subject_test.txt was loaded in a dataset and the single column renamed to "Subject".
The y_test.txt was loaded in a dataset and the single column renamed to "Activity".
The X_test.txt was loaded in another dataset with columns V1 to V561, each representing a "Feature" column.
The above 3 datasets from /test folder were combined together as columns in a single dataset. 
 
The same process was repeated for the train folder.

All the rows from the test and train dataset were merged as a single data frame.

The column names of the merged data frame is as below:
[1]   "V1"       "V2"       "V3"       "V4"       "V5"       "V6"       "V7"       "V8"       "V9"       "V10"     
[11]  "V11"      "V12"      "V13"      "V14"      "V15"      "V16"      "V17"      "V18"      "V19"      "V20"   
 ... 
[551] "V551"     "V552"     "V553"     "V554"     "V555"     "V556"     "V557"     "V558"     "V559"     "V560"    
[561] "V561"     "Activity" "Subject"      


Step 2: Extracting the measurements with the mean and standard deviation only
----------------------------------------------------------------------------

The features.txt file was loaded into a data frame (f).
The data frame "f" contains :
- a column for the feature number  (V1)
- a column to describe the feature (V2)

Sample of the first 6 rows of the "f" data frame
  V1                V2
  1  tBodyAcc-mean()-X
  2  tBodyAcc-mean()-Y
  3  tBodyAcc-mean()-Z
  4  tBodyAcc-std()-X
  5  tBodyAcc-std()-Y
  6  tBodyAcc-std()-Z

All feature numbers "V1" having the word "mean()" or "std()" in the "V2" column were selected and saved
in a data frame (say f2). 

Note : MeanFreq was not included as a mean column since the meaning from the documents is diffrent from the mean.

The dataset from Step 1 was filtered so that only the columns corresponding to the f2 feature number 
would be extracted, together with the "Activity" and "Subject" column. 

The resulting dataset columns now are as follows:
[1]  "V1"       "V2"       "V3"       "V4"       "V5"       "V6"       "V41"      "V42"      "V43"      "V44"     
[11] "V45"      "V46"      "V81"      "V82"      "V83"      "V84"      "V85"      "V86"      "V121"     "V122"    
[21] "V123"     "V124"     "V125"     "V126"     "V161"     "V162"     "V163"     "V164"     "V165"     "V166"    
[31] "V201"     "V202"     "V214"     "V215"     "V227"     "V228"     "V240"     "V241"     "V253"     "V254"    
[41] "V266"     "V267"     "V268"     "V269"     "V270"     "V271"     "V345"     "V346"     "V347"     "V348"    
[51] "V349"     "V350"     "V424"     "V425"     "V426"     "V427"     "V428"     "V429"     "V503"     "V504"    
[61] "V516"     "V517"     "V529"     "V530"     "V542"     "V543"     "Activity" "Subject" 


Step 3 Adding descriptive activity names to name the activities in the data set
-------------------------------------------------------------------------------

A function was created that returns the activity name given the activity identifier using data provided 
from activity_labels.txt

This function was applied to every row of the column "Activity" in the main dataset to return the activity name,
passing the activity column as parameter.  The activity name value was replaced in the "Activity" column itself.

The resulting dataset "Activity" column now has the following "distinct" activity names values:

[1] "STANDING"         "SITTING"          "LAYING"           "WALKING"          "WALKING_DOWNSTAIRS"
[6] "WALKING_UPSTAIRS"  


Step 4: Labelling the data set feature columns with descriptive variable names
------------------------------------------------------------------------------

The feature columns have labels "V1", "V2", "V3" .. labels in the main dataset.

The corresponding feature description were obtained from the features.txt file.

The data from the features.txt were loaded in a separate data frame and updated as follows:
- Symbols like "-", "(" or ")" were removed from the column labels.
- The starting "t" letter was replaced by Time
- The starting "f" letter was replaced by Frequency
- The first letter of "mean" and "std" was set to uppercase.
- The end x,y,z letters were replaced by X-Axis, Y-Axis and Z-Axis repectively.
- The double Body text was replaced by a single one i.e "BodyBody" became "Body".
- Period(.) was added to separate attributes (Body, Acc, Gravity, Mag, Jerk, Gyro) of each feature.
  Eg "BodyAccJerk" became "Body.Acc.Jerk"

- The updated feature descriptions were mapped onto the individual columns of the main dataset.

The resulting main dataset columns became as follows:

 'data.frame':	10299 obs. of  68 variables:
 
 [1] "Time Body.Acc Mean X-Axis"           "Time Body.Acc Mean Y-Axis"           "Time Body.Acc Mean Z-Axis"          
 [4] "Time Body.Acc Std X-Axis"            "Time Body.Acc Std Y-Axis"            "Time Body.Acc Std Z-Axis"           
 [7] "Time Gravity.Acc Mean X-Axis"        "Time Gravity.Acc Mean Y-Axis"        "Time Gravity.Acc Mean Z-Axis"       
[10] "Time Gravity.Acc Std X-Axis"         "Time Gravity.Acc Std Y-Axis"         "Time Gravity.Acc Std Z-Axis"        
[13] "Time Body.Acc.Jerk Mean X-Axis"      "Time Body.Acc.Jerk Mean Y-Axis"      "Time Body.Acc.Jerk Mean Z-Axis"     
[16] "Time Body.Acc.Jerk Std X-Axis"       "Time Body.Acc.Jerk Std Y-Axis"       "Time Body.Acc.Jerk Std Z-Axis"      
[19] "Time Body.Gyro Mean X-Axis"          "Time Body.Gyro Mean Y-Axis"          "Time Body.Gyro Mean Z-Axis"         
[22] "Time Body.Gyro Std X-Axis"           "Time Body.Gyro Std Y-Axis"           "Time Body.Gyro Std Z-Axis"          
[25] "Time Body.Gyro.Jerk Mean X-Axis"     "Time Body.Gyro.Jerk Mean Y-Axis"     "Time Body.Gyro.Jerk Mean Z-Axis"    
[28] "Time Body.Gyro.Jerk Std X-Axis"      "Time Body.Gyro.Jerk Std Y-Axis"      "Time Body.Gyro.Jerk Std Z-Axis"     
[31] "Time Body.Acc.Mag Mean"              "Time Body.Acc.Mag Std"               "Time Gravity.Acc.Mag Mean"          
[34] "Time Gravity.Acc.Mag Std"            "Time Body.Acc.Jerk.Mag Mean"         "Time Body.Acc.Jerk.Mag Std"         
[37] "Time Body.Gyro.Mag Mean"             "Time Body.Gyro.Mag Std"              "Time Body.Gyro.Jerk.Mag Mean"       
[40] "Time Body.Gyro.Jerk.Mag Std"         "Frequency Body.Acc Mean X-Axis"      "Frequency Body.Acc Mean Y-Axis"     
[43] "Frequency Body.Acc Mean Z-Axis"      "Frequency Body.Acc Std X-Axis"       "Frequency Body.Acc Std Y-Axis"      
[46] "Frequency Body.Acc Std Z-Axis"       "Frequency Body.Acc.Jerk Mean X-Axis" "Frequency Body.Acc.Jerk Mean Y-Axis"
[49] "Frequency Body.Acc.Jerk Mean Z-Axis" "Frequency Body.Acc.Jerk Std X-Axis"  "Frequency Body.Acc.Jerk Std Y-Axis" 
[52] "Frequency Body.Acc.Jerk Std Z-Axis"  "Frequency Body.Gyro Mean X-Axis"     "Frequency Body.Gyro Mean Y-Axis"    
[55] "Frequency Body.Gyro Mean Z-Axis"     "Frequency Body.Gyro Std X-Axis"      "Frequency Body.Gyro Std Y-Axis"     
[58] "Frequency Body.Gyro Std Z-Axis"      "Frequency Body.Acc.Mag Mean"         "Frequency Body.Acc.Mag Std"         
[61] "Frequency Body.Acc.Jerk.Mag Mean"    "Frequency Body.Acc.Jerk.Mag Std"     "Frequency Body.Gyro.Mag Mean"       
[64] "Frequency Body.Gyro.Mag Std"         "Frequency Body.Gyro.Jerk.Mag Mean"   "Frequency Body.Gyro.Jerk.Mag Std"   
[67] "Activity"                            "Subject"                            

Step 5: Creating a second dataset with the average of each variable for each activity and each subject.
------------------------------------------------------------------------------------------------------
- The dataset in Step 4 was grouped by Activity, then by Subject
- The mean for each feature measurement variable was calculated

The resulting summarized dataframe structure with sample data is as below:

'data.frame':	180 obs. of  68 variables:
 
 $ Activity                           : chr  "LAYING" "SITTING" "STANDING" "WALKING" ...
 $ Subject                            : int  1 1 1 1 1 1 2 2 2 2 ...
 $ Time Body.Acc Mean X-Axis          : num  0.222 0.261 0.279 0.277 0.289 ...
 $ Time Body.Acc Mean Y-Axis          : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
 $ Time Body.Acc Mean Z-Axis          : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
 $ Time Body.Acc Std X-Axis           : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
 $ Time Body.Acc Std Y-Axis           : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
 $ Time Body.Acc Std Z-Axis           : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
 $ Time Gravity.Acc Mean X-Axis       : num  -0.249 0.832 0.943 0.935 0.932 ...
 $ Time Gravity.Acc Mean Y-Axis       : num  0.706 0.204 -0.273 -0.282 -0.267 ...
 $ Time Gravity.Acc Mean Z-Axis       : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
 $ Time Gravity.Acc Std X-Axis        : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
 $ Time Gravity.Acc Std Y-Axis        : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
 $ Time Gravity.Acc Std Z-Axis        : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
 $ Time Body.Acc.Jerk Mean X-Axis     : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
 $ Time Body.Acc.Jerk Mean Y-Axis     : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
 $ Time Body.Acc.Jerk Mean Z-Axis     : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 $ Time Body.Acc.Jerk Std X-Axis      : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
 $ Time Body.Acc.Jerk Std Y-Axis      : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
 $ Time Body.Acc.Jerk Std Z-Axis      : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
 $ Time Body.Gyro Mean X-Axis         : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
 $ Time Body.Gyro Mean Y-Axis         : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
 $ Time Body.Gyro Mean Z-Axis         : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
 $ Time Body.Gyro Std X-Axis          : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
 $ Time Body.Gyro Std Y-Axis          : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
 $ Time Body.Gyro Std Z-Axis          : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
 $ Time Body.Gyro.Jerk Mean X-Axis    : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
 $ Time Body.Gyro.Jerk Mean Y-Axis    : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
 $ Time Body.Gyro.Jerk Mean Z-Axis    : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
 $ Time Body.Gyro.Jerk Std X-Axis     : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
 $ Time Body.Gyro.Jerk Std Y-Axis     : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
 $ Time Body.Gyro.Jerk Std Z-Axis     : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
 $ Time Body.Acc.Mag Mean             : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ Time Body.Acc.Mag Std              : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ Time Gravity.Acc.Mag Mean          : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
 $ Time Gravity.Acc.Mag Std           : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
 $ Time Body.Acc.Jerk.Mag Mean        : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
 $ Time Body.Acc.Jerk.Mag Std         : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 $ Time Body.Gyro.Mag Mean            : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
 $ Time Body.Gyro.Mag Std             : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
 $ Time Body.Gyro.Jerk.Mag Mean       : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
 $ Time Body.Gyro.Jerk.Mag Std        : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
 $ Frequency Body.Acc Mean X-Axis     : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
 $ Frequency Body.Acc Mean Y-Axis     : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
 $ Frequency Body.Acc Mean Z-Axis     : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
 $ Frequency Body.Acc Std X-Axis      : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
 $ Frequency Body.Acc Std Y-Axis      : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
 $ Frequency Body.Acc Std Z-Axis      : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
 $ Frequency Body.Acc.Jerk Mean X-Axis: num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
 $ Frequency Body.Acc.Jerk Mean Y-Axis: num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
 $ Frequency Body.Acc.Jerk Mean Z-Axis: num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
 $ Frequency Body.Acc.Jerk Std X-Axis : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
 $ Frequency Body.Acc.Jerk Std Y-Axis : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
 $ Frequency Body.Acc.Jerk Std Z-Axis : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
 $ Frequency Body.Gyro Mean X-Axis    : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
 $ Frequency Body.Gyro Mean Y-Axis    : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
 $ Frequency Body.Gyro Mean Z-Axis    : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 $ Frequency Body.Gyro Std X-Axis     : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
 $ Frequency Body.Gyro Std Y-Axis     : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
 $ Frequency Body.Gyro Std Z-Axis     : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
 $ Frequency Body.Acc.Mag Mean        : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
 $ Frequency Body.Acc.Mag Std         : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
 $ Frequency Body.Acc.Jerk.Mag Mean   : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
 $ Frequency Body.Acc.Jerk.Mag Std    : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
 $ Frequency Body.Gyro.Mag Mean       : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
 $ Frequency Body.Gyro.Mag Std        : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
 $ Frequency Body.Gyro.Jerk.Mag Mean  : num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
 $ Frequency Body.Gyro.Jerk.Mag Std   : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...


---------------------------------------------------
2) Description of variables for the final tidy data
----------------------------------------------------

Activity
	Activity performed in the experiment 
	Character variable.
	Can be one of the six possible values:
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING
	
Subject
	Identifier of the volunteer taking part in the Activity
	Integer variable
	Values can range between 1..30
	
Time Body.Acc Mean X-Axis
	Mean value of the time domain Body Acceleration signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : 0.222 0.261 0.279 0.277 0.289 ...

Time Body.Acc Mean Y-Axis          
	Mean value of the time domain Body Acceleration signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...

Time Body.Acc Mean Z-Axis            
	Mean value of the time domain Body Acceleration signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.113 -0.105 -0.111 -0.111 -0.108 ...

Time Body.Acc Std X-Axis
	Standard Deviation of the time domain Body Acceleration signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.928 -0.977 -0.996 -0.284 0.03 ...
 
Time Body.Acc Std Y-Axis
	Standard Deviation of the time domain Body Acceleration signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...

Time Body.Acc Std Z-Axis
	Standard Deviation of the time domain Body Acceleration signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.826 -0.94 -0.98 -0.26 -0.23 ...

Time Gravity.Acc Mean X-Axis
	Mean value of the time domain Gravity Acceleration signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.249 0.832 0.943 0.935 0.932 ...

Time Gravity.Acc Mean Y-Axis
	Mean value of the time domain Gravity Acceleration signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : 0.706 0.204 -0.273 -0.282 -0.267 ...

Time Gravity.Acc Mean Z-Axis
	Mean value of the time domain Gravity Acceleration signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : 0.4458 0.332 0.0135 -0.0681 -0.0621 ...

Time Gravity.Acc Std X-Axis
	Standard Deviation of the time domain Gravity Acceleration signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.897 -0.968 -0.994 -0.977 -0.951 ...

Time Gravity.Acc Std Y-Axis
	Standard Deviation of the time domain Gravity Acceleration signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.908 -0.936 -0.981 -0.971 -0.937 ...

Time Gravity.Acc Std Z-Axis
 	Standard Deviation of the time domain Gravity Acceleration signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.852 -0.949 -0.976 -0.948 -0.896 ...
 
Time Body.Acc.Jerk Mean X-Axis  
	Mean value of the time domain Body Acceleration Jerk signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : 0.0811 0.0775 0.0754 0.074 0.0542 ...
	
Time Body.Acc.Jerk Mean Y-Axis  
	Mean value of the time domain Body Acceleration Jerk signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : 0.003838 -0.000619 0.007976 0.028272 0.02965 ...
	
Time Body.Acc.Jerk Mean Z-Axis  
	Mean value of the time domain Body Acceleration Jerk signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : 0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
 
Time Body.Acc.Jerk Std X-Axis
	Standard Deviation of the time domain Body Acceleration Jerk signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
	
Time Body.Acc.Jerk Std Y-Axis
	Standard Deviation of the time domain Body Acceleration Jerk signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.924 -0.981 -0.986 0.067 -0.102 ...

Time Body.Acc.Jerk Std Z-Axis
	Standard Deviation of the time domain Body Acceleration Jerk signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.955 -0.988 -0.992 -0.503 -0.346 ...
 
Time Body.Gyro Mean X-Axis  
	Mean value of the time domain Body Gyroscope signal in the X direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
	
Time Body.Gyro Mean Y-Axis
	Mean value of the time domain Body Gyroscope signal in the Y direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...

Time Body.Gyro Mean Z-Axis
	Mean value of the time domain Body Gyroscope signal in the Z direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : 0.1487 0.0629 0.0748 0.0849 0.0901 ...

Time Body.Gyro Std X-Axis
	Standard Deviation of the time domain Body Gyroscope signal in the X direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.874 -0.977 -0.987 -0.474 -0.458 ...
	
Time Body.Gyro Std Y-Axis
	Standard Deviation of the time domain Body Gyroscope signal in the Y direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...

Time Body.Gyro Std Z-Axis
	Standard Deviation of the time domain Body Gyroscope signal in the Z direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.908 -0.941 -0.981 -0.344 -0.125 ...

Time Body.Gyro.Jerk Mean X-Axis  
	Mean value of the time domain Body Gyroscope Jerk signal in the X direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...

Time Body.Gyro.Jerk Mean Y-Axis  
	Mean value of the time domain Body Gyroscope Jerk signal in the Y direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...

Time Body.Gyro.Jerk Mean Z-Axis  
	Mean value of the time domain Body Gyroscope Jerk signal in the Z direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...

Time Body.Gyro.Jerk Std X-Axis
	Standard Deviation of the time domain Body Gyroscope Jerk signal in the X direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.919 -0.992 -0.993 -0.207 -0.487 ...

Time Body.Gyro.Jerk Std Y-Axis
	Standard Deviation of the time domain Body Gyroscope Jerk signal in the Y direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.968 -0.99 -0.995 -0.304 -0.239 ...

Time Body.Gyro.Jerk Std Z-Axis
	Standard Deviation of the time domain Body Gyroscope Jerk signal in the Z direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.958 -0.988 -0.992 -0.404 -0.269 ...
	
Time Body.Acc.Mag Mean
	Mean value of the time domain Body Acceleration Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...

Time Body.Acc.Mag Std
	Standard Deviation of the time domain Body Acceleration Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...

Time Gravity.Acc.Mag Mean
	Mean value of the time domain Gravity Acceleration Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...

Time Gravity.Acc.Mag Std
	Standard Deviation of the time domain Gravity Acceleration Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...

Time Body.Acc.Jerk.Mag Mean
	Mean value of the time domain Body Acceleration Jerk Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
	
Time Body.Acc.Jerk.Mag Std
	Standard Deviation of the time domain Body Acceleration Jerk Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
 
Time Body.Gyro.Mag Mean
	Mean value of the time domain Body Gyroscope Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...

Time Body.Gyro.Mag Std
	Standard Deviation of the Time domain Body Gyroscope Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.819 -0.935 -0.979 -0.187 -0.226 ...

Time Body.Gyro.Jerk.Mag Mean
	Mean value of the time domain Body Gyroscope Jerk Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.963 -0.992 -0.995 -0.299 -0.295 ...

Time Body.Gyro.Jerk.Mag Std
	Standard Deviation of the time domain Body Gyroscope Jerk Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.936 -0.988 -0.995 -0.325 -0.307 ...

Frequency Body.Acc Mean X-Axis
	Mean value of the frequency domain Body Acceleration signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
	
Frequency Body.Acc Mean Y-Axis
	Mean value of the frequency domain Body Acceleration signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...

Frequency Body.Acc Mean Z-Axis
	Mean value of the frequency domain Body Acceleration signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.883 -0.959 -0.985 -0.332 -0.226 ...

Frequency Body.Acc Std X-Axis
	Standard Deviation of the frequency domain Body Acceleration signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
	
Frequency Body.Acc Std Y-Axis
	Standard Deviation of the frequency domain Body Acceleration signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.834 -0.917 -0.972 0.056 -0.113 ...

Frequency Body.Acc Std Z-Axis
	Standard Deviation of the frequency domain Body Acceleration signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.813 -0.934 -0.978 -0.28 -0.298 ...
 
Frequency Body.Acc.Jerk Mean X-Axis
	Mean value of the frequency domain Body Acceleration Jerk signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
	
Frequency Body.Acc.Jerk Mean Y-Axis
	Mean value of the frequency domain Body Acceleration Jerk signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
	
Frequency Body.Acc.Jerk Mean Z-Axis
	Mean value of the frequency domain Body Acceleration Jerk signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.948 -0.986 -0.991 -0.469 -0.288 ...
	
Frequency Body.Acc.Jerk Std X-Axis
	Standard Deviation of the frequency domain Body Acceleration Jerk signal in the X direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
	
Frequency Body.Acc.Jerk Std Y-Axis
	Standard Deviation of the frequency domain Body Acceleration Jerk signal in the Y direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.932 -0.983 -0.987 0.107 -0.135 ...

Frequency Body.Acc.Jerk Std Z-Axis
	Standard Deviation of the frequency domain Body Acceleration Jerk signal in the Z direction
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.961 -0.988 -0.992 -0.535 -0.402 ...

Frequency Body.Gyro Mean X-Axis
	Mean value of the frequency domain Body Gyroscope signal signal in the X direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.85 -0.976 -0.986 -0.339 -0.352 ...
	
Frequency Body.Gyro Mean Y-Axis
	Mean value of the frequency domain Body Gyroscope signal signal in the Y direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...

Frequency Body.Gyro Mean Z-Axis
	Mean value of the frequency domain Body Gyroscope signal signal in the Z direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
 
Frequency Body.Gyro Std X-Axis
	Standard Deviation of the frequency domain Body Gyroscope signal signal in the X direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.882 -0.978 -0.987 -0.517 -0.495 ...
	
Frequency Body.Gyro Std Y-Axis 
	Standard Deviation of the frequency domain Body Gyroscope signal signal in the Y direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
	
Frequency Body.Gyro Std Z-Axis
	Standard Deviation of the frequency domain Body Gyroscope signal signal in the Z direction
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.917 -0.944 -0.982 -0.437 -0.238 ...

Frequency Body.Acc.Mag Mean
	Mean value of the frequency domain Body Acceleration Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...

Frequency Body.Acc.Mag Std
	Standard Deviation of the frequency domain Body Acceleration Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.798 -0.928 -0.982 -0.398 -0.187 ...

Frequency Body.Acc.Jerk.Mag Mean 
	Mean value of the frequency domain Body Acceleration Jerk Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
	
Frequency Body.Acc.Jerk.Mag Std
	Standard Deviation of the frequency domain Body Acceleration Jerk Magnitude signal
	In standard gravity units 'g'
	Number variable with decimal points between -1 and 1
	Sample Data : -0.922 -0.982 -0.993 -0.103 -0.104 ...

Frequency Body.Gyro.Mag Mean
	Mean value of the frequency domain Body Gyroscope Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.862 -0.958 -0.985 -0.199 -0.186 ...

Frequency Body.Gyro.Mag Std
	Standard Deviation of the frequency domain Body Gyroscope Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.824 -0.932 -0.978 -0.321 -0.398 ...

Frequency Body.Gyro.Jerk.Mag Mean
	Mean value of the frequency domain Body Gyroscope Jerk Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.942 -0.99 -0.995 -0.319 -0.282 ...

Frequency Body.Gyro.Jerk.Mag Std
	Standard Deviation of the frequency domain Body Gyroscope Jerk Magnitude signal
	In radians/second
	Number variable with decimal points between -1 and 1
	Sample Data : -0.933 -0.987 -0.995 -0.382 -0.392 ...
	

