data <- read.csv("household_power_consumption.txt", sep=";", colClasses=c(NA, NA, rep("numeric",7)), na.strings=c("?"))
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

fdata <- data[data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

png(file="plot2.png", width=480, height=480)
plot(fdata$Time, fdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
