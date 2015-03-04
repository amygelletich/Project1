# plot1.R
# This script assumes that an unzipped version of household_power_consumption.txt is available in the current directory.

# Read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset to dates of interest for plots using %in% function
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get rid of full dataset
remove(data)

# Initiate png device
png("plot1.png", width=480, height=480)

# Build plot 1, it goes in the png device
hist(as.numeric(data_sub$Global_active_power), 
     main="Global Active Power",
     col="red",
     xlab="Global Active Power (kilowatts)",
     )

dev.off()