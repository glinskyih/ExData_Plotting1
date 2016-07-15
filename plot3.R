#Plot 3

#Change directory
setwd("P:/Data Science/Coursera/4 Exploratory Data Analysis/Assignment1")
getwd()

#Read in data from downloaded zip file
alldata <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt")
                      ,header=T
                      ,sep=";")
str(alldata)

#Convert dates from string to date format
alldata[,1] <- as.Date(alldata[,1], "%d/%m/%Y")

#Subset data for dates between 2007-02-01 and 2007-02-02
data <- subset(alldata, alldata$Date %in% as.Date("2007-02-01"):as.Date("2007-02-02"))
barplot(table(data[,1]))

#Convert time from factor to time
dt <- as.POSIXct(paste(data[,1], data[,2]), format="%Y-%m-%d %H:%M:%S")

#Convert energy submetering to numeric
sub1 <- as.numeric(as.character(data$Sub_metering_1))
sub2 <- as.numeric(as.character(data$Sub_metering_2))
sub3 <- as.numeric(as.character(data$Sub_metering_3))

#Plot and save as png
png(filename='ExData_Plotting1/plot3.png', width=480, height=480, units='px') #px=pixels
plot(x=dt, y=sub1, xlab=NA, ylab='Energy sub metering', type='l')
lines(x=dt, y=sub2, col="red")
lines(x=dt, y=sub3, col="blue")
legend("topright", names(data[,7:9]), col=c('black','red','blue'), lty=1, cex=.75)
dev.off()
