# R's working directory was set to the data file's directory.

# The data file is read as a table into z.
z <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".", na.string="?")

# z is subsetted for rows of 2 dates and for 5 columns.
y <- z[with(z,(Date=="1/2/2007"|Date=="2/2/2007") & (!Sub_metering_1=="?" & !Sub_metering_2=="?" & !Sub_metering_3=="?")), c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")]

# New variables are added for Date+Time and Global_active_power
y$Dtm <- strptime(paste(y$Date,y$Time), format="%d/%m/%Y %H:%M:%S")
y$Sm1 <- as.numeric(y$Sub_metering_1)
y$Sm2 <- as.numeric(y$Sub_metering_2)
y$Sm3 <- as.numeric(y$Sub_metering_3)

# datasets library is added.
library(datasets)

# The required plot is created.
plot(y$Dtm, y$Sm1, col="black", type="o", pch=46, cex=0.5, bg=par("bg"), main="Energy Sub Meterings versus Date time", xlab="Date Time", ylab="Energy Sub Metering")
points(y$Dtm, y$Sm2, col="red", type="o", pch=46, cex=0.5, bg=par("bg"))
points(y$Dtm, y$Sm3, col="blue", type="o", pch=46, cex=0.5, bg=par("bg"))

# The plot is copied to a png file.
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))
dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off