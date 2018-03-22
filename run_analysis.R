## Prepare environment for script
rm(list=ls())
setwd("~/UCI HAR Dataset")
library(dplyr)

## Load activity labels
act_labels <- read.csv("activity_labels.txt", sep="", header=F)
colnames(act_labels) <- c("Activity_id", "Activity_name")

## Load column names
features <- read.csv("features.txt", sep="", header = F)
colNames <- features[ sapply( features[,2], grepl, pattern="mean\\(\\)|std\\(\\)" ), ]

# Load and prepare the test set
subject_test <- read.csv("./test/subject_test.txt", header=F, sep="")
y_test <- read.csv("./test/y_test.txt", header=F, sep="")

x_test0 <- read.csv("./test/X_test.txt", sep="", header = F)
x_test <- x_test0[ ,colNames$V1 ]
colnames(x_test) <- colNames$V2

# drop unused
rm(x_test0)

## Add Subject and Activity columns to the test set variables
x_test <- cbind( y_test, subject_test, x_test )
colnames(x_test)[c(1,2)] <- c("Activity_id", "Subject" )

# Load and prepare the train set
subject_train <- read.csv("./train/subject_train.txt", header=F, sep="")
y_train <- read.csv("./train/y_train.txt", header=F, sep="")

x_train0 <- read.csv("./train/X_train.txt", sep="", header = F)
x_train <- x_train0[ ,colNames$V1 ]
colnames(x_train) <- colNames$V2

# drop unused
rm(x_train0)

## Add Subject and Activity columns to the test set variables
x_train <- cbind( y_train, subject_train,  x_train )
colnames(x_train)[c(1,2)] <- c("Activity_id", "Subject")

## Union sets (train & test )
full_set <- bind_rows(x_train, x_test)

## Add activity names, joining with activity_labels
full_set_names <- merge( act_labels, full_set,by = "Activity_id" )

## group by Activity and Subject
full_set_means <- group_by( full_set_names , Activity_id, Activity_name, Subject) %>%
              summarize_all( mean  )

## Clean up, drop unused data frames
rm(x_train, x_test, full_set, subject_test, subject_train, y_test, y_train, act_labels, features)

## View results
View(head(full_set_names, 50))
View(head(full_set_means, 50))

## Dump means
write.table(full_set_means, file = "full_set_means.csv", sep=",", row.names = F)
