#Programming Assignment 1: Getting and Cleaning Data

========================================================================================
Original Data: Human Activity Recognition Using Smartphones Dataset, Version 1.0
Credits:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
========================================================================================

##Overview of the study/assignment

We received multiple folders containing various data files, some containing data collected from accelerometers from the Samsung Galaxy S smartphone, and some with labels, information and descriptions. The data was provided in two sets, a test set and a training set. Our goal was to prepare a tidy data set showing the averages of certain desired variables to be used for later analysis. But first we need to combine all of the original data, clean it, then subset those desired variables and calculate the desired means, producing a final tidy dataframe.

##Original Information about the data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data (to build up a model) and 30% the test data (to validate the model). 

The sensor signals (accelerometer and gyroscope [for measuring angular velocity]) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec
and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into
body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Specifics of the "run_analysis.R" Script

We were given a features list, from which we first created a subset containing only variables of mean and standard deviation (std) to be used later in subsetting the data itself.

We first put together and cleaned the test data set. We changed the column name of the "subject_test" data to be "Subject", of the "y_test" data to be "Activity", and all columns of "x_test" to be those names provided in the features list. We used cbind to merge together all the test data info (subject + activity + collected feature data). This is the "total_test" dataframe.

We then put together and cleaned the training data set. We changed the column name of the "subject_train" data to be "Subject", of the "y_train" data to be "Activity", and all columns of "x_train" to be those names provided in the features list. We used cbind to merge together all the training data info (subject + activity + collected feature data). This is the "total_train" dataframe.

Finally, we used rbind to add the test dataframe created above to the training dataframe created above, producing a full set of data. This is the "total_data" dataframe.

In that full set of data, we mapped the activities column from representative integers (1,2,3,4,5,or6) to their actual english language activity name as given in the activity_lables file.

From that set of data, the only variables of interest are those of mean and standard deviation. So we used the subsetted features list previously created to subset the dataframe, so that only the data related to means and standard deviations are included. This is the "subset_data" dataframe.

In the subsetted dataframe we cleaned up the column names by taking out all parenthesies () so that they do not confuse R when using this dataframe in future analaysies.

Using melt and dcast functions the dataframe is then manipulated to produce a new dataframe showing the averages of each of the subset mean and std variables for each combination of subject and activity. This final dataframe is the "averages" dataframe.
