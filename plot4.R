## This code reads in a file (household_power_consumption.txt) 
## and plots four graphs to look at household power consumption over two dates (February 1 and February 2, 2007):
## Global active power, voltage, energy sub metering, and global reactive power
## with output to a png file (plot1.png)


#read in and transform data
library(lubridate)
householdPower <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
power1 <- subset(householdPower, Date == "1/2/2007") 
power2 <- subset(householdPower, Date == "2/2/2007")
power <- rbind(power1,power2)
power$datetime <- paste(power$Date, power$Time, sep=" ")
power$datetime <- dmy_hms(power$datetime)

## create the graphs
png(file="plot4.png",height=480, width=480, units="px")
par(mfrow=c(2,2))

##graph 1
with(power, plot(datetime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n"))
with(power, lines(datetime, Global_active_power))

##graph 2
with(power, plot(datetime, Voltage, ylab="Voltage", xlab="", type="n"))
with(power, lines(datetime, Voltage))

##graph 3
par(mar=c(2,4,2,4))
with(power, plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black"))
with(power, lines(datetime, Sub_metering_2, col="red"))
with(power, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = c(1,1,1), col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##graph 4
with(power, plot(datetime, Global_reactive_power, type="n"))
with(power, lines(datetime, Global_reactive_power))

dev.off()