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
with(powerConsum, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
                       col = "red", main = "Global Active Power"))
dev.copy(device = png, width = 480, height = 480, file = "Plot1.png")
