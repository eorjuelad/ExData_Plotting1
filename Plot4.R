#Plot4.R
windows(height = 7, width = 15.5)
getwd()

par(mfcol = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#The file household_power_consumption.txt must be located on your working directory
data <- read.table(".\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(data)
str(data)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
str(data)
dataSubset <- subset(data, data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"))
dataSubset$DateTime <- as.POSIXct(paste(dataSubset$Date, dataSubset$Time))
dataSubset$DateTime <- as.POSIXct(paste(dataSubset$Date, dataSubset$Time))
plot(dataSubset$Global_active_power ~ dataSubset$DateTime, type = "l", xlab = "", ylab = "Global Active Power")

plot(dataSubset$Sub_metering_1 ~ dataSubset$DateTime, type = "n", xlab = "", ylab = "Energy sub meeting")
lines(dataSubset$Sub_metering_1 ~ dataSubset$DateTime, col = "black", type = "l")
lines(dataSubset$Sub_metering_2 ~ dataSubset$DateTime, col = "red", type = "l")
lines(dataSubset$Sub_metering_3 ~ dataSubset$DateTime, col = "blue", type = "l")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dataSubset$Voltage ~ dataSubset$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dataSubset$Global_reactive_power ~ dataSubset$DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "Plot4.png")
dev.off()