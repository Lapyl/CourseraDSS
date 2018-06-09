# R's working directory was set to the data file's directory.

# The data file is read as a table into z.
z <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".", na.string="?")

# z is subsetted for rows of 2 dates, with 4 different column-sets for 4 different required plots.
y1 <- z[with(z,(Date=="1/2/2007"|Date=="2/2/2007") & (!Global_active_power=="?")), c("Date","Time","Global_active_power")]
y2 <- z[with(z,(Date=="1/2/2007"|Date=="2/2/2007") & (!Sub_metering_1=="?" & !Sub_metering_2=="?" & !Sub_metering_3=="?")), c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
y3 <- z[with(z,(Date=="1/2/2007"|Date=="2/2/2007") & (!Voltage=="?")), c("Date","Time","Voltage")]
y4 <- z[with(z,(Date=="1/2/2007"|Date=="2/2/2007") & (!Global_reactive_power=="?")), c("Date","Time","Global_reactive_power")]

# New variables are added for Date+Time and dependent variable-sets.
y1$Dtm <- strptime(paste(y1$Date,y1$Time), format="%d/%m/%Y %H:%M:%S")
y1$GAP <- as.numeric(y1$Global_active_power)
y2$Dtm <- strptime(paste(y2$Date,y2$Time), format="%d/%m/%Y %H:%M:%S")
y2$Sm1 <- as.numeric(y2$Sub_metering_1)
y2$Sm2 <- as.numeric(y2$Sub_metering_2)
y2$Sm3 <- as.numeric(y2$Sub_metering_3)
y3$Dtm <- strptime(paste(y3$Date,y3$Time), format="%d/%m/%Y %H:%M:%S")
y3$Vol <- as.numeric(y3$Voltage)
y4$Dtm <- strptime(paste(y4$Date,y4$Time), format="%d/%m/%Y %H:%M:%S")
y4$GRP <- as.numeric(y4$Global_reactive_power)

# datasets library is added.
library(datasets)

# The required set of plots is created.
par(mfcol=c(2,2))

plot(y1$Dtm, y1$GAP, col="black", type="o", pch=46, cex=0.5, bg=par("bg"), main="", xlab="Date Time", ylab="Global Active Power")

plot(y2$Dtm, y2$Sm1, col="black", type="o", pch=46, cex=0.5, bg=par("bg"), main="", xlab="Date Time", ylab="Energy Sub Metering")
points(y2$Dtm, y2$Sm2, col="red", type="o", pch=46, cex=0.5, bg=par("bg"))
points(y2$Dtm, y2$Sm3, col="blue", type="o", pch=46, cex=0.5, bg=par("bg"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"), bty="n")

plot(y3$Dtm, y3$Vol, col="black", type="o", pch=46, cex=0.5, bg=par("bg"), main="", xlab="Date Time", ylab="Voltage")

plot(y4$Dtm, y4$GRP, col="black", type="o", pch=46, cex=0.5, bg=par("bg"), main="", xlab="Date Time", ylab="Global Reactive Power")

# The set of plots is copied to a png file.
dev.copy(png, filename="plot4.png", width=480, height=480)
dev.off