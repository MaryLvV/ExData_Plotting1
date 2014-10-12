## This code reads in a file (household_power_consumption.txt) 
## and plots a histogram of Global Active Power on two dates (February 1 and February 2, 2007)
## with output to a png file (plot1.png)

#read in and transform data
householdPower <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)
power1 <- subset(householdPower, Date == "1/2/2007") 
power2 <- subset(householdPower, Date == "2/2/2007")
power <- rbind(power1,power2)

##create the graph
png(file="plot1.png",height=480, width=480, units="px")
hist(as.numeric(power$Global_active_power), col="red", breaks=20, xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()