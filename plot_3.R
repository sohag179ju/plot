powerConsum <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
powerConsum$Date <- as.Date(powerConsum$Date, format = "%d/%m/%Y")
powerConsum$DateTime <- strptime(paste(powerConsum$Date,powerConsum$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
powerConsum <- powerConsum[powerConsum$Date >= "2007-2-1" & powerConsum$Date <= "2007-2-2",]
powerConsum[,3] <- as.numeric(powerConsum[,3])
powerConsum[,4] <- as.numeric(powerConsum[,4])
powerConsum[,5] <- as.numeric(powerConsum[,5])
powerConsum[,6] <- as.numeric(powerConsum[,6])
powerConsum[,7] <- as.numeric(powerConsum[,7])
powerConsum[,8] <- as.numeric(powerConsum[,8])
with(powerConsum, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(powerConsum, lines(DateTime, Sub_metering_1))
with(powerConsum, lines(DateTime, Sub_metering_2, col = "red"))
with(powerConsum, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(device = png, width = 480, height = 480, file = "Plot3.png")
