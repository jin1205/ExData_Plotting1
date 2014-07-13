dataset <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.string = "?")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
subset <- dataset[(dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ),]
subset$Global_active_power <- as.numeric(subset$Global_active_power)
DateTime <- paste(subset$Date, subset$Time)
DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

plot(DateTime, subset$Global_active_power,type="l", xlab = "", ylab="Global Active Power")

plot(DateTime, subset$Voltage, type = "l", xlab = "datatime", ylab = "Voltage")

plot(DateTime, subset$Sub_metering_1,type="l", ylab= "Energy sub metering", xlab = "")
lines(DateTime, subset$Sub_metering_2, col = "red")
lines(DateTime, subset$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))

plot(DateTime, subset$Global_reactive_power, type = "l", xlab = "datatime", ylab = "Global_reactive_power")
dev.copy(png, file= "plot4.png")
dev.off()
