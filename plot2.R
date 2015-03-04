# plot2.R
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
png("plot2.png", width=480, height=480)

# Build plot 1, it goes in the png device
plot(datetime, as.numeric(data_sub$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)

dev.off()