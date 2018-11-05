library(plyr)
library(dplyr)

fileName <- "household_power_consumption.txt"

power_cons <- read.table(file = fileName, header = TRUE, sep = ";")


power_cons <- read.csv("household_power_consumption.txt", sep = ";",skip = 66636, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")

power_cons$Time <- format(strptime(power_cons$Time, "%H:%M:%S"),format = "%H:%M:%S")

hist(power_cons$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

dev.copy(png, file ="plot1.png")

dev.off()