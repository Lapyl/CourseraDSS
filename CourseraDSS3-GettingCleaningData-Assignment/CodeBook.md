xxxxxxxxx
OBJECTIVE
xxxxxxxxx

This is an R program based data analysis of a given dataset.
This is submitted for Coursera's "Getting andf Cleaning Data" course's Course Project.

xxxx
DATA
xxxx

A zip file of data was downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data was collected by others by using accelerometers from Samsung Galaxy S smartphone.

The nature of data is described at:

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

xxxxxxxxxxxxxxxxxx
METHOD & VARIABLES
xxxxxxxxxxxxxxxxxx

Started a new R code file in an R editor, and named it run_analysis.R.

In the R code file:

- Added a code for concatenating the relevant datasets in R.

----- testS: dataset read from test subject_test.txt
----- testY: dataset read from test Y_test.txt
----- testX: dataset read from test X_test.txt
----- test: column bind of testS, testY, testX

----- trainS: dataset read from train subject_train.txt
----- trainY: dataset read from train Y_train.txt
----- trainX: dataset read from train X_train.txt
----- train: column bind of trainS, trainY, trainX

- Added a code for Merged the datasets in R.

----- combo: row bind of test, train

- Added a code for labeling the dataset's columns.

----- colnames(combo) <- c("S", "Y", "X")

Opened Features.txt file in Excel; it placed all the vairables in one column.

Renamed the Excel sheet as AllVariables, and saved the file as an xls file.

Reviewed X_test.txt and X_train files, and determined beginning and ending location numbers of the variables.

In the xls file's AllVariables sheet:

- In B and C columns, wrote beginning and ending location numbers of variables.
- In D column, wrote "mean" of A contains "mean".
- In D column, wrote "std" of A contains "std".

Copied AllVariables sheet as SelVariables sheet.

In SelVariables sheet:

- Removed records with blank in D column.
- In E column, wrote "fBody" or "tBody" or "tGravity" based on A column.
- In F column, wrote "Acc" or "AccJerk" or "Gyro" or "GyroJerk" based on A column.
- In G column, wrote "X" or "Y" or "G" or "Mag" based on A column.
- In H2 cell, wrote formula: =CONCATENATE(D2,"_",E2,"_",F2,"_",G2)
- In H2:H67 range, filled down the formula, and copied-pasted all as values.
- Sorted all cells based on H column's values.
- In I2 cell, wrote formula: =CONCATENATE("combo$",H2," <- substr(combo$X, ",B2,", ",C2,")")
- In I2:I67 range, filled down the formula.
- In J2 cell, wrote formula: =CONCATENATE("""",H2,"""",", ",J3,"""")
- In J2:J67 range, filled down the formula.
- In K2 cell, wrote formula: =CONCATENATE("mean(as.numeric(tricom$",H2,")), ")
- In K2:K34 range, filled down the formula.
- In L2 cell, wrote formula: =CONCATENATE(K2,L3)
- In L2:L34 range, filled down the formula.

In the R file:

- Copied SelVariable sheet's I2:I67 range below "colnames(" line.

- Copied SelVariable sheet's J2 cell below the above pasting.

- In front of the above pasting, added: tricom <- combo[, c("S", "Y",

----- tricom: dataset containing only mean and std columns

- At the end of the above pasting, replaced surplus commas etc with )].

- Added avgname vector of names of mean variables.

----- avgname: vector defining names of mean variables

- Copied SelVariables sheet's L2 cell below avgname, and made corrections.

----- avgdata: matrix of values of mean variables

- Added a code for combining avgname with avgdata.

- Added a code for exporting the avgdata dataset as a csv file.

- Tested and finalized the code.

Obtained and reviewed the avgdata.csv file exported by the code.

The exported csv file shows averages for the following parameters.

- fBody_Acc_Mag
- fBody_Acc_X
- fBody_Acc_Y
- fBody_Acc_Z
- fBody_AccJerk_Mag
- fBody_AccJerk_X
- fBody_AccJerk_Y
- fBody_AccJerk_Z
- fBody_Gyro_Mag
- fBody_Gyro_X
- fBody_Gyro_Y
- fBody_Gyro_Z
- fBody_GyroJerk_Mag
- tBody_Acc_Mag
- tBody_Acc_X
- tBody_Acc_Y
- tBody_Acc_Z
- tBody_AccJerk_Mag
- tBody_AccJerk_X
- tBody_AccJerk_Y
- tBody_AccJerk_Z
- tBody_Gyro_Mag
- tBody_Gyro_X
- tBody_Gyro_Y
- tBody_Gyro_Z
- tBody_GyroJerk_Mag
- tBody_GyroJerk_X
- tBody_GyroJerk_Y
- tBody_GyroJerk_Z
- tGravity_Acc_Mag
- tGravity_Acc_X
- tGravity_Acc_Y
- tGravity_Acc_Z