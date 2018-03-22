# Data Frames Variables
# =====================

By running the "run_analysis.R" script the following data frames are available:

* **full_set_means**
* **full_set_names**

They are the result of the union of the train & test datasets, see README.md for transformation details.

The following attributes are available in the resulting data frames:

* __Activity_id__: number, unique identifier of the activity

* __Activity_name__: char, descriptive name of the activity

* __Subject__: number, unique identifier of the experiment subject

The following variables are available in the resulting data frames:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

- mean(): Mean value
- std(): Standard deviation

The data frame **full_set_means** contains the same variables as **full_set_names** but the
variables are grouped by __Activity_id__, __Activity_name__ and __Subject__, the grouping function used was
**mean** to obtain the average of every variable.
