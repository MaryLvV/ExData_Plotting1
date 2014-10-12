## This code reads in a file (household_power_consumption.txt) 
## and graphs Sub metering 1, Sub metering 2, and Sub metering 3 on two dates (2/1/2007 and 2/2/2007)
## with output to a png file (plot3.png)

#read in and transform data
library(lubridate)
householdPower <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
power1 <- subset(householdPower, Date == "1/2/2007") 
power2 <- subset(householdPower, Date == "2/2/2007")
power <- rbind(power1,power2)
power$datetime <- paste(power$Date, power$Time, sep=" ")
power$datetime <- dmy_hms(power$datetime)

#create the graph
png(file="plot3.png", height=480, width=480, units="px")
par(mar=c(2,4,2,4))
with(power, plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black"))
with(power, lines(datetime, Sub_metering_2, col="red"))
with(power, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = c(1,1,1), col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()