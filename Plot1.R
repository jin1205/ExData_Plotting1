dataset <- read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
subset <- dataset[(dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02" ),]
subset$Global_active_power <- as.numeric(subset$Global_active_power)
hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
# dev.off()
