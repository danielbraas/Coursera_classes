---
title: "Readme.md"
output: html_document
---

This is an R Markdown document that describes how the script *run_analysis.R* processes the downloaded raw data from the Human Activity Recognition Using Smartphones Dataset Version 1.0*.  

The first part of the code, locates the files to be read, and finally reads in the train.X and test.X files, which contain the data. To create variable names in X, the features file is read in and applied as column names. The subject and the subject's activity are added as additional variables to the data frame. Finally, both train and test data sets are combined to create one big data frame that includes all calculated data.  
Next, only variables that contain mean or standard deviations are to be selcted for a new data frame. The activities performed were converted from a numeric code to characters while retaining its categorical nature. Finally, the data set is split by subject and activity and the mean of both is calulated as an independet, tidy data frame.  
  
Disclaimer: The script was written using R's basic packages only. I realized later that the dplyr and tidyr packages should have probably been used instead. However, the script should work on any computer with any R version.

*Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
