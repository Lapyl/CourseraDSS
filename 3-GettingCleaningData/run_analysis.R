# Set "UCI HAR Dataset directory" as the working direcory.

# setwd(<UCI HAR Dataset directory>)

# Concatenate test datasets.

testS <- read.table("./test/subject_test.txt", header=FALSE, sep="\t")
testY <- read.table("./test/Y_test.txt", header=FALSE, sep="\t")
testX <- read.table("./test/X_test.txt", header=FALSE, sep="\t")

test <- cbind(testS, testY, testX)

# Concatenate train datasets.

trainS <- read.table("./train/subject_train.txt", header=FALSE, sep="\t")
trainY <- read.table("./train/Y_train.txt", header=FALSE, sep="\t")
trainX <- read.table("./train/X_train.txt", header=FALSE, sep="\t")

train <- cbind(trainS, trainY, trainX)

# Merge test and train datasets.

combo <- rbind(test, train)

# Label the dataset's columns.

colnames(combo) <- c("S", "Y", "X")

# Introduce variables based on the last column's string.
# Copy from xls file's SelVariables sheet's I2:I67 range.

combo$Mean_fBody_Acc_Mag <- substr(combo$X, 8034, 8048)
combo$Mean_fBody_Acc_X <- substr(combo$X, 4242, 4256)
combo$Mean_fBody_Acc_Y <- substr(combo$X, 4258, 4272)
combo$Mean_fBody_Acc_Z <- substr(combo$X, 4274, 4288)
combo$Mean_fBody_AccJerk_Mag <- substr(combo$X, 8242, 8256)
combo$Mean_fBody_AccJerk_X <- substr(combo$X, 5506, 5520)
combo$Mean_fBody_AccJerk_Y <- substr(combo$X, 5522, 5536)
combo$Mean_fBody_AccJerk_Z <- substr(combo$X, 5538, 5552)
combo$Mean_fBody_Gyro_Mag <- substr(combo$X, 8450, 8464)
combo$Mean_fBody_Gyro_X <- substr(combo$X, 6770, 6784)
combo$Mean_fBody_Gyro_Y <- substr(combo$X, 6786, 6800)
combo$Mean_fBody_Gyro_Z <- substr(combo$X, 6802, 6816)
combo$Mean_fBody_GyroJerk_Mag <- substr(combo$X, 8658, 8672)
combo$Mean_tBody_Acc_Mag <- substr(combo$X, 3202, 3216)
combo$Mean_tBody_Acc_X <- substr(combo$X, 2, 16)
combo$Mean_tBody_Acc_Y <- substr(combo$X, 18, 32)
combo$Mean_tBody_Acc_Z <- substr(combo$X, 34, 48)
combo$Mean_tBody_AccJerk_Mag <- substr(combo$X, 3618, 3632)
combo$Mean_tBody_AccJerk_X <- substr(combo$X, 1282, 1296)
combo$Mean_tBody_AccJerk_Y <- substr(combo$X, 1298, 1312)
combo$Mean_tBody_AccJerk_Z <- substr(combo$X, 1314, 1328)
combo$Mean_tBody_Gyro_Mag <- substr(combo$X, 3826, 3840)
combo$Mean_tBody_Gyro_X <- substr(combo$X, 1922, 1936)
combo$Mean_tBody_Gyro_Y <- substr(combo$X, 1938, 1952)
combo$Mean_tBody_Gyro_Z <- substr(combo$X, 1954, 1968)
combo$Mean_tBody_GyroJerk_Mag <- substr(combo$X, 4034, 4048)
combo$Mean_tBody_GyroJerk_X <- substr(combo$X, 2562, 2576)
combo$Mean_tBody_GyroJerk_Y <- substr(combo$X, 2578, 2592)
combo$Mean_tBody_GyroJerk_Z <- substr(combo$X, 2594, 2608)
combo$Mean_tGravity_Acc_Mag <- substr(combo$X, 3410, 3424)
combo$Mean_tGravity_Acc_X <- substr(combo$X, 642, 656)
combo$Mean_tGravity_Acc_Y <- substr(combo$X, 658, 672)
combo$Mean_tGravity_Acc_Z <- substr(combo$X, 674, 688)
combo$Std_fBody_Acc_Mag <- substr(combo$X, 8050, 8064)
combo$Std_fBody_Acc_X <- substr(combo$X, 4290, 4304)
combo$Std_fBody_Acc_Y <- substr(combo$X, 4306, 4320)
combo$Std_fBody_Acc_Z <- substr(combo$X, 4322, 4336)
combo$Std_fBody_AccJerk_Mag <- substr(combo$X, 8258, 8272)
combo$Std_fBody_AccJerk_X <- substr(combo$X, 5554, 5568)
combo$Std_fBody_AccJerk_Y <- substr(combo$X, 5570, 5584)
combo$Std_fBody_AccJerk_Z <- substr(combo$X, 5586, 5600)
combo$Std_fBody_Gyro_Mag <- substr(combo$X, 8466, 8480)
combo$Std_fBody_Gyro_X <- substr(combo$X, 6818, 6832)
combo$Std_fBody_Gyro_Y <- substr(combo$X, 6834, 6848)
combo$Std_fBody_Gyro_Z <- substr(combo$X, 6850, 6864)
combo$Std_fBody_GyroJerk_Mag <- substr(combo$X, 8674, 8688)
combo$Std_tBody_Acc_Mag <- substr(combo$X, 3218, 3232)
combo$Std_tBody_Acc_X <- substr(combo$X, 50, 64)
combo$Std_tBody_Acc_Y <- substr(combo$X, 66, 80)
combo$Std_tBody_Acc_Z <- substr(combo$X, 82, 96)
combo$Std_tBody_AccJerk_Mag <- substr(combo$X, 3634, 3648)
combo$Std_tBody_AccJerk_X <- substr(combo$X, 1330, 1344)
combo$Std_tBody_AccJerk_Y <- substr(combo$X, 1346, 1360)
combo$Std_tBody_AccJerk_Z <- substr(combo$X, 1362, 1376)
combo$Std_tBody_Gyro_Mag <- substr(combo$X, 3842, 3856)
combo$Std_tBody_Gyro_X <- substr(combo$X, 1970, 1984)
combo$Std_tBody_Gyro_Y <- substr(combo$X, 1986, 2000)
combo$Std_tBody_Gyro_Z <- substr(combo$X, 2002, 2016)
combo$Std_tBody_GyroJerk_Mag <- substr(combo$X, 4050, 4064)
combo$Std_tBody_GyroJerk_X <- substr(combo$X, 2610, 2624)
combo$Std_tBody_GyroJerk_Y <- substr(combo$X, 2626, 2640)
combo$Std_tBody_GyroJerk_Z <- substr(combo$X, 2642, 2656)
combo$Std_tGravity_Acc_Mag <- substr(combo$X, 3426, 3440)
combo$Std_tGravity_Acc_X <- substr(combo$X, 690, 704)
combo$Std_tGravity_Acc_Y <- substr(combo$X, 706, 720)
combo$Std_tGravity_Acc_Z <- substr(combo$X, 722, 736)

# Extract columns of mean and std.
# Copy from xls file's SelVariables sheet's J2 cell, and made corrections.

tricom <- combo[, c("S", "Y",
"Mean_fBody_Acc_Mag", "Mean_fBody_Acc_X", "Mean_fBody_Acc_Y", "Mean_fBody_Acc_Z", "Mean_fBody_AccJerk_Mag", "Mean_fBody_AccJerk_X", "Mean_fBody_AccJerk_Y", "Mean_fBody_AccJerk_Z", "Mean_fBody_Gyro_Mag", "Mean_fBody_Gyro_X", "Mean_fBody_Gyro_Y", "Mean_fBody_Gyro_Z", "Mean_fBody_GyroJerk_Mag",
"Mean_tBody_Acc_Mag", "Mean_tBody_Acc_X", "Mean_tBody_Acc_Y", "Mean_tBody_Acc_Z", "Mean_tBody_AccJerk_Mag", "Mean_tBody_AccJerk_X", "Mean_tBody_AccJerk_Y", "Mean_tBody_AccJerk_Z", "Mean_tBody_Gyro_Mag", "Mean_tBody_Gyro_X", "Mean_tBody_Gyro_Y", "Mean_tBody_Gyro_Z", "Mean_tBody_GyroJerk_Mag", "Mean_tBody_GyroJerk_X", "Mean_tBody_GyroJerk_Y", "Mean_tBody_GyroJerk_Z",
"Mean_tGravity_Acc_Mag", "Mean_tGravity_Acc_X", "Mean_tGravity_Acc_Y", "Mean_tGravity_Acc_Z",
"Std_fBody_Acc_Mag", "Std_fBody_Acc_X", "Std_fBody_Acc_Y", "Std_fBody_Acc_Z", "Std_fBody_AccJerk_Mag", "Std_fBody_AccJerk_X", "Std_fBody_AccJerk_Y", "Std_fBody_AccJerk_Z", "Std_fBody_Gyro_Mag", "Std_fBody_Gyro_X", "Std_fBody_Gyro_Y", "Std_fBody_Gyro_Z", "Std_fBody_GyroJerk_Mag",
"Std_tBody_Acc_Mag", "Std_tBody_Acc_X", "Std_tBody_Acc_Y", "Std_tBody_Acc_Z", "Std_tBody_AccJerk_Mag", "Std_tBody_AccJerk_X", "Std_tBody_AccJerk_Y", "Std_tBody_AccJerk_Z", "Std_tBody_Gyro_Mag", "Std_tBody_Gyro_X", "Std_tBody_Gyro_Y", "Std_tBody_Gyro_Z", "Std_tBody_GyroJerk_Mag", "Std_tBody_GyroJerk_X", "Std_tBody_GyroJerk_Y", "Std_tBody_GyroJerk_Z",
"Std_tGravity_Acc_Mag", "Std_tGravity_Acc_X", "Std_tGravity_Acc_Y", "Std_tGravity_Acc_Z"
)]

# Define a vector of names of "mean variables".
# Copy from the above string of tricom, and make corrections.

avgname <- c(
"Mean_fBody_Acc_Mag", "Mean_fBody_Acc_X", "Mean_fBody_Acc_Y", "Mean_fBody_Acc_Z", "Mean_fBody_AccJerk_Mag", "Mean_fBody_AccJerk_X", "Mean_fBody_AccJerk_Y", "Mean_fBody_AccJerk_Z", "Mean_fBody_Gyro_Mag", "Mean_fBody_Gyro_X", "Mean_fBody_Gyro_Y", "Mean_fBody_Gyro_Z", "Mean_fBody_GyroJerk_Mag",
"Mean_tBody_Acc_Mag", "Mean_tBody_Acc_X", "Mean_tBody_Acc_Y", "Mean_tBody_Acc_Z", "Mean_tBody_AccJerk_Mag", "Mean_tBody_AccJerk_X", "Mean_tBody_AccJerk_Y", "Mean_tBody_AccJerk_Z", "Mean_tBody_Gyro_Mag", "Mean_tBody_Gyro_X", "Mean_tBody_Gyro_Y", "Mean_tBody_Gyro_Z", "Mean_tBody_GyroJerk_Mag", "Mean_tBody_GyroJerk_X", "Mean_tBody_GyroJerk_Y", "Mean_tBody_GyroJerk_Z",
"Mean_tGravity_Acc_Mag", "Mean_tGravity_Acc_X", "Mean_tGravity_Acc_Y", "Mean_tGravity_Acc_Z"
)

# Create a matrix of values of averages of "mean variables".
# Copy from xls file's SelVariables sheet's L2 cell, and make corrections.

avgdata <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33,
mean(as.numeric(tricom$Mean_fBody_Acc_Mag)), mean(as.numeric(tricom$Mean_fBody_Acc_X)), mean(as.numeric(tricom$Mean_fBody_Acc_Y)), mean(as.numeric(tricom$Mean_fBody_Acc_Z)), mean(as.numeric(tricom$Mean_fBody_AccJerk_Mag)), mean(as.numeric(tricom$Mean_fBody_AccJerk_X)), mean(as.numeric(tricom$Mean_fBody_AccJerk_Y)), mean(as.numeric(tricom$Mean_fBody_AccJerk_Z)), mean(as.numeric(tricom$Mean_fBody_Gyro_Mag)), mean(as.numeric(tricom$Mean_fBody_Gyro_X)), mean(as.numeric(tricom$Mean_fBody_Gyro_Y)), mean(as.numeric(tricom$Mean_fBody_Gyro_Z)), mean(as.numeric(tricom$Mean_fBody_GyroJerk_Mag)), mean(as.numeric(tricom$Mean_tBody_Acc_Mag)), mean(as.numeric(tricom$Mean_tBody_Acc_X)), mean(as.numeric(tricom$Mean_tBody_Acc_Y)), mean(as.numeric(tricom$Mean_tBody_Acc_Z)), mean(as.numeric(tricom$Mean_tBody_AccJerk_Mag)), mean(as.numeric(tricom$Mean_tBody_AccJerk_X)), mean(as.numeric(tricom$Mean_tBody_AccJerk_Y)), mean(as.numeric(tricom$Mean_tBody_AccJerk_Z)), mean(as.numeric(tricom$Mean_tBody_Gyro_Mag)), mean(as.numeric(tricom$Mean_tBody_Gyro_X)), mean(as.numeric(tricom$Mean_tBody_Gyro_Y)), mean(as.numeric(tricom$Mean_tBody_Gyro_Z)), mean(as.numeric(tricom$Mean_tBody_GyroJerk_Mag)), mean(as.numeric(tricom$Mean_tBody_GyroJerk_X)), mean(as.numeric(tricom$Mean_tBody_GyroJerk_Y)), mean(as.numeric(tricom$Mean_tBody_GyroJerk_Z)), mean(as.numeric(tricom$Mean_tGravity_Acc_Mag)), mean(as.numeric(tricom$Mean_tGravity_Acc_X)), mean(as.numeric(tricom$Mean_tGravity_Acc_Y)), mean(as.numeric(tricom$Mean_tGravity_Acc_Z))
), 33, 2)

# Combine avgname with avgdata.

rownames(avgdata) <- avgname

write.csv(avgdata, "avgdata.csv")
