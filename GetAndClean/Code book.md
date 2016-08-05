---
title: 'Code book for coursera project:' 

output: html_document
---
##Getting and Cleaning Data  
  
The data for this project was taken from the Human Activity Recognition Using Smartphones Dataset, Version 1.0* data set. Information about this data set can be obtained from the 'Original-README.txt' file.  
For the Tidy data set, all calculated variables of the original data were considered, however, only those variables that are mean or standard deviation values were used. The data set contains only mean values of the selected variables and are broken down by subject and activity. The measured units are the same as before and can be obtained from the 'features_info.txt' file.  
Variables in the tidy data set are:  


-  Subject
    + categorical: 1-30
-	Activity	    
    + categorical: 
       LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
-	tBodyAcc.mean.X	
    + numeric
-	tBodyAcc.mean.Y	
    + numeric
-	tBodyAcc.mean.Z	
    + numeric
-	tBodyAcc.std.X	
    + numeric
-	tBodyAcc.std.Y	
    + numeric
-	tBodyAcc.std.Z	
    + numeric
-	tGravityAcc.mean.X	
    + numeric
-	tGravityAcc.mean.Y	
    + numeric
-	tGravityAcc.mean.Z	
    + numeric
-	tGravityAcc.std.X	
    + numeric
-	tGravityAcc.std.Y	
    + numeric
-	tGravityAcc.std.Z	
    + numeric
-	tBodyAccJerk.mean.X	
    + numeric
-	tBodyAccJerk.mean.Y	
    + numeric
-	tBodyAccJerk.mean.Z	
    + numeric
-	tBodyAccJerk.std.X	
    + numeric
-	tBodyAccJerk.std.Y	
    + numeric
-	tBodyAccJerk.std.Z	
    + numeric
-	tBodyGyro.mean.X	
    + numeric
-	tBodyGyro.mean.Y	
    + numeric
-	tBodyGyro.mean.Z	
    + numeric
-	tBodyGyro.std.X	
    + numeric
-	tBodyGyro.std.Y	
    + numeric
-	tBodyGyro.std.Z	
    + numeric
-	tBodyGyroJerk.mean.X	
    + numeric
-	tBodyGyroJerk.mean.Y	
    + numeric
-	tBodyGyroJerk.mean.Z	
    + numeric
-	tBodyGyroJerk.std.X	
    + numeric
-	tBodyGyroJerk.std.Y	
    + numeric
-	tBodyGyroJerk.std.Z	
    + numeric
-	tBodyAccMag.mean	
    + numeric
-	tBodyAccMag.std	
    + numeric
-	tGravityAccMag.mean	
    + numeric
-	tGravityAccMag.std	
    + numeric
-	tBodyAccJerkMag.mean	
    + numeric
-	tBodyAccJerkMag.std	
    + numeric
-	tBodyGyroMag.mean	
    + numeric
-	tBodyGyroMag.std	
    + numeric
-	tBodyGyroJerkMag.mean	
    + numeric
-	tBodyGyroJerkMag.std	
    + numeric
-	fBodyAcc.mean.X	
    + numeric
-	fBodyAcc.mean.Y	
    + numeric
-	fBodyAcc.mean.Z	
    + numeric
-	fBodyAcc.std.X	
    + numeric
-	fBodyAcc.std.Y	
    + numeric
-	fBodyAcc.std.Z	
    + numeric
-	fBodyAcc.meanFreq.X	
    + numeric
-	fBodyAcc.meanFreq.Y	
    + numeric
-	fBodyAcc.meanFreq.Z	
    + numeric
-	fBodyAccJerk.mean.X	
    + numeric
-	fBodyAccJerk.mean.Y	
    + numeric
-	fBodyAccJerk.mean.Z	
    + numeric
-	fBodyAccJerk.std.X	
    + numeric
-	fBodyAccJerk.std.Y	
    + numeric
-	fBodyAccJerk.std.Z	
    + numeric
-	fBodyAccJerk.meanFreq.X	
    + numeric
-	fBodyAccJerk.meanFreq.Y	
    + numeric
-	fBodyAccJerk.meanFreq.Z	
    + numeric
-	fBodyGyro.mean.X	
    + numeric
-	fBodyGyro.mean.Y	
    + numeric
-	fBodyGyro.mean.Z	
    + numeric
-	fBodyGyro.std.X	
    + numeric
-	fBodyGyro.std.Y	
    + numeric
-	fBodyGyro.std.Z	
    + numeric
-	fBodyGyro.meanFreq.X	
    + numeric
-	fBodyGyro.meanFreq.Y	
    + numeric
-	fBodyGyro.meanFreq.Z	
    + numeric
-	fBodyAccMag.mean	
    + numeric
-	fBodyAccMag.std	
    + numeric
-	fBodyAccMag.meanFreq	
    + numeric
-	fBodyBodyAccJerkMag.mean	
    + numeric
-	fBodyBodyAccJerkMag.std	
    + numeric
-	fBodyBodyAccJerkMag.meanFreq	
    + numeric
-	fBodyBodyGyroMag.mean	
    + numeric
-	fBodyBodyGyroMag.std	
    + numeric
-	fBodyBodyGyroMag.meanFreq	
    + numeric
-	fBodyBodyGyroJerkMag.mean	
    + numeric
-	fBodyBodyGyroJerkMag.std	
    + numeric
-	fBodyBodyGyroJerkMag.meanFreq
    + numeric

*Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
