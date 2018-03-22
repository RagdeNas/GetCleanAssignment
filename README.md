# Getting and Cleaning Data Course Project
# ========================================

## Purpose
Demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Inputs
The following files where used to generate the tidy datasets ( __Human Activity Recognition Using Smartphones Dataset Version 1.0 / www.smartlab.ws__):

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': Subject labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': Subject labels

## Outputs
The following R data frames are the output of this script:

- **full_set_names**: the union of the train and test datasets, only columns/variables for mean() and sd()

- **full_set_means**: contains the same variables as "full_set_names", but the means for every variable is computed, information grouped by Activity and test Subject.

## **run_analysis.R** script explaination

1. Read source datasets with **read.csv** function

2. Obtain only columns that are needed (means and sd's), subseting the features dataset using **grep** function.

3. select only the filtered columns from both datasets (train & test ) using **vector subsetting**

3. Assign the proper column names to both datasets using **colnames**.

5. Add two Additional columns to both datasets (the activity id's and subjects) using function **cbind**, and name them properly using **colnames**

6. Union both datasets with the **bind_rows** function

7. Assign the Activities Names merging activity_labels and the dataset from step 6, using **merge** function

8. Group and summarize the dataset of step 7, by Activity and Subject and then computing the means for all variables using functions **group_by** and **summarize_all**.

9. Remove unused data frames.

10. Display **head** of resulting data frames.
