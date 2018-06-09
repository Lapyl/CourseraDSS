# R's working directory was set to the data file's directory.

# The data file is read as a table into z.
z <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".", na.string="?")

# z is subsetted for rows of 2 dates and for 2 columns.
y <- z[with(z,(Date=="1/2/2007"|Date=="2/2/2007") & (!Global_active_power=="?")), c("Date","Global_active_power")]

# Numeric variable is added for Global_active_power.
y$GAP <- as.numeric(y$Global_active_power)

# datasets library is added.
library(datasets)

# The required histogram is created.
hist(y$GAP, col="red", main="Frequency of Global Active Power", xlab="Global Active Power (kilowatts)")

# The histogram is copied to a png fil.
dev.copy(png, filename="plot1.png", width=480, height=480) #, units="px", pointsize=12, bg="white", res=NA, restoreConsole=TRUE)
dev.off