library(plyr)
library(dplyr)

fileName <- "household_power_consumption.txt"

power_cons <- read.table(file = fileName, header = TRUE, sep = ";")


power_cons <- read.csv("household_power_consumption.txt", sep = ";",skip = 66636, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")

power_cons$Time <- format(strptime(power_cons$Time, "%H:%M:%S"),format = "%H:%M:%S")

power_cons$DateTime <- strptime(paste(power_cons$Date, power_cons$Time), "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2),mar = c(4,4,2,2))

with(power_cons, plot(DateTime, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power"))

with(power_cons, plot(DateTime, Voltage,type = "l", xlab = "datetime"))

with(power_cons, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

with(power_cons, points(DateTime, Sub_metering_2, type = "l", col = "Red"))

with(power_cons, points(DateTime, Sub_metering_3, type = "l", col = "Blue"))

legend("topright", pch="_____", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(power_cons, plot(DateTime, Global_reactive_power,type = "l", xlab = "datetime"))

dev.copy(png, file ="plot4.png")

dev.off()
