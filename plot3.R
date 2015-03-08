data <- read.csv("household_power_consumption.txt", sep=";", colClasses=c(NA, NA, rep("numeric",7)), na.strings=c("?"))
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

fdata <- data[data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

png(file="plot3.png", width=480, height=480)
plot(fdata$Time, fdata$Sub_metering_1, col="black",type="l", ylab="Energy sub metering", xlab="")
points(fdata$Time, fdata$Sub_metering_2, col="red",type="l")
points(fdata$Time, fdata$Sub_metering_3, col="blue",type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lwd=1)
dev.off()
