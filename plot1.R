#Plot 1

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

#Convert Global_active_power to numeric
gap <- as.numeric(as.character(data$Global_active_power))

#Plot and save as png
png(filename="ExData_Plotting1/plot1.png", width=480, height=480, units="px") #px=pixels
hist(gap, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
