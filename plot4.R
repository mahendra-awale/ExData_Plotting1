#Read all data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)

#Format data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Setbset the data
dataToUse <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates to day
datetime <- paste(as.Date(dataToUse$Date), dataToUse$Time)
dataToUse$Datetime <- as.POSIXct(datetime)

# set parameters for multiple plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#First plot
plot(dataToUse$Global_active_power~dataToUse$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Second plot
plot(dataToUse$Voltage~dataToUse$Datetime, type="l", ylab="Voltage (volt)", xlab="DateTime")

#Third plot
plot(dataToUse$Sub_metering_1~dataToUse$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#add lines    
lines(dataToUse$Sub_metering_2~dataToUse$Datetime,col='Red')
lines(dataToUse$Sub_metering_3~dataToUse$Datetime,col='Blue')

# add legends
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Fourth plot    
plot(dataToUse$Global_reactive_power~dataToUse$Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="DateTime")

# save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()