#Plot 4

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

#Convert variables to numeric
gap <- as.numeric(as.character(data$Global_active_power))
sub1 <- as.numeric(as.character(data$Sub_metering_1))
sub2 <- as.numeric(as.character(data$Sub_metering_2))
sub3 <- as.numeric(as.character(data$Sub_metering_3))

#Plot and save as png
png(filename='ExData_Plotting1/plot4.png', width=480, height=480, units='px') #px=pixels
par(mfrow=c(2,2))
plot(x=dt, y=gap, xlab=NA, ylab='Global Active Power', type='l')
plot(x=dt, y=as.numeric(as.character(data$Voltage)), xlab='datetime', ylab='Voltage', type='l')
plot(x=dt, y=sub1, xlab=NA, ylab='Energy sub metering', type='l')
lines(x=dt, y=sub2, col="red")
lines(x=dt, y=sub3, col="blue")
legend("topright", names(data[,7:9]), col=c('black','red','blue'), lty=1, bty='n', cex=.75)
plot(x=dt, y=as.numeric(as.character(data$Global_reactive_power)), xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off()
