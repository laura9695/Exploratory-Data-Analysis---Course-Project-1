################################################################################
# Exploratory Data Analysis - Course Project 1
################################################################################

# Import data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data_subset <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Prepare data
global_active_power <- as.numeric(as.character(data_subset$Global_active_power))
hist(global_active_power, col = "red", xlab = "Global Active Power (kilowatts)")

# Create plot
title(main = "Global Active Power")

# Save plot to png file
dev.copy(png, file = "plot1.png")
dev.print(width = 480, height = 480)
dev.off()