CookBook
========

This document presents how the original data were transformed to obtain the tidy dataset.
Variables of this tidy dataset are described at the end of the document

# Data source

Data can be download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data pre-processing

Before working on the data you have to unzip them (see run_analysis.R).

# Data transformation

The following actions were performed on the data (see run_analysis.R):
* creating a logical vector with the column indexes for the asked data (mean and standard deviation)
* loading the test dataset and filtering only the wanted columns 
* appending it the activity names and subjects ids

Same actions were performed on the train dataset.

Then both set were merged.

A small treatment was applied to columns names to improve readibility.

# Variables 

The output document is tidy.means.csv.

Each row contains the mean of a feature regarding an activity for a subject.

Columns are:
* activity: a label for the activity
** WALKING
** WALKING_UPSTAIRS
** WALKING_DOWNSTAIRS
** SITTING
** STANDING
** LAYING
* subject: subject id (integer from 1 to 30)
* xxx.mean[.X|Y|Z]: mean of feature xxx mean (see features.info)
* xxx.std: mean of feature xxx standard deviation (see features.info)
