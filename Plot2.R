dataset <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.string = "?")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
subset <- dataset[(dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ),]
subset$Global_active_power <- as.numeric(subset$Global_active_power)
DateTime <- paste(subset$Date, subset$Time)
DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")
plot(DateTime, subset$Global_active_power,type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
