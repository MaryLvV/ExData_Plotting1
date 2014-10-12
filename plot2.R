## This code reads in a file (household_power_consumption.txt) 
## and plots a simple line graph of Global Active Power on two dates (February 1 and February 2, 2007)
## with output to a png file (plot2.png)

#read in and transform data
library(lubridate)
householdPower <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
power1 <- subset(householdPower, Date == "1/2/2007") 
power2 <- subset(householdPower, Date == "2/2/2007")
power <- rbind(power1,power2)
power$datetime <- paste(power$Date, power$Time, sep=" ")
power$datetime <- dmy_hms(power$datetime)

##create the graph
png(file="plot2.png",height=480, width=480, units="px")
with(power, plot(datetime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="n"))
with(power, lines(datetime, Global_active_power))
dev.off()
