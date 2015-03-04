# plot4.r
# This script assumes that an unzipped version of household_power_consumption.txt is available in the current directory.

#Read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset to dates of interest for plots using %in% function
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get rid of full dataset
remove(data)

# Get date/time
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Initiate png device
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#Global Active Power
plot(datetime, as.numeric(data_sub$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)

#Voltage
plot(datetime, as.numeric(data_sub$Voltage),
     type="l",
     xlab="datetime",
     ylab="Voltage"
)

#Energy sub metering
plot(datetime, as.numeric(data_sub$Sub_metering_1),
     type="l",
     xlab="",
     ylab="Energy sub metering",
)
lines(datetime,as.numeric(data_sub$Sub_metering_2),type="l",col="red")
lines(datetime,as.numeric(data_sub$Sub_metering_3),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, bty = "n",col=c("black", "red", "blue"))

#Reactive power
plot(datetime, as.numeric(data_sub$Global_reactive_power),
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
)

dev.off()