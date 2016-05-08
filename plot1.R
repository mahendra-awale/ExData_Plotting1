##Read complete data
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")

##Check which rows corrosponds to the specified dates, returns boolean
matched<-(data$Date=="1/2/2007" | data$Date=="2/2/2007")

##Extract relevant data, using booleans from above
dataSubset<-data[matched,]

##Convert the factor to numeric
dataForPlot<-as.numeric(levels(dataSubset$Global_active_power)[dataSubset$Global_active_power])

##Generate to PNG file
png(filename="plot1.png", width=480, height=480)
hist(dataForPlot, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()