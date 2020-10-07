#Plot1.R
par(mfcol = c(1,1))
#The file household_power_consumption.txt must be located on your working directory
data <- read.table(".\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(data)
str(data)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
str(data)
dataSubset <- subset(data, data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"))
dataSubset$DateTime <- as.POSIXct(paste(dataSubset$Date, dataSubset$Time))
hist(dataSubset$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file = "Plot1.png")
dev.off()