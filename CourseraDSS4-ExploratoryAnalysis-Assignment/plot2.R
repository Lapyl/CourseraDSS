# R's working directory was set to the data file's directory.

# The data file is read as a table into z.
z <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".", na.string="?")

# z is subsetted for rows of 2 dates and for 3 columns.
y <- z[with(z,(Date=="1/2/2007"|Date=="2/2/2007")  & (!Global_active_power=="?")), c("Date","Time","Global_active_power")]

# New variables are added for Date+Time and Global_active_power
y$Dtm <- strptime(paste(y$Date,y$Time), format="%d/%m/%Y %H:%M:%S")
y$GAP <- as.numeric(y$Global_active_power)

# datasets library is added.
library(datasets)

# The required plot is created.
plot(y$Dtm, y$GAP, col="black", type="o", pch=46, cex=0.5, bg=par("bg"), main="Global Active Power versus Date Time", xlab="Date Time", ylab="Global Active Power (kilowatts)")

# The plot is copied to a png file.
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off