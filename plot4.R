################################################################################
# Exploratory Data Analysis - Course Project 1
################################################################################

# Import data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data_subset <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Prepare data
global_active_power <- as.numeric(as.character(data_subset$Global_active_power))
date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(data_subset$Sub_metering_3))
voltage <- as.numeric(as.character(data_subset$Voltage))
global_reactive_power <- as.numeric(as.character(data_subset$Global_reactive_power))

# Create plot
par(mfrow=c(2,2))

plot(date_time, global_active_power, type = "l", xlab="", ylab="Global Active Power")

plot(date_time, voltage, type = "l", xlab="", ylab="Voltage")

plot(date_time, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(date_time, global_reactive_power, type = "l", xlab="", ylab="Global Reactive Power")

# Save plot to png file
dev.copy(png, file = "plot4.png")
dev.print(width = 480, height = 480)
dev.off()