#Read all data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      stringsAsFactors=FALSE)

#Format data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Setbset the data
dataToUse <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


# Convert dates to day
datetime <- paste(as.Date(dataToUse$Date), dataToUse$Time)
dataToUse$Datetime <- as.POSIXct(datetime)


# plot it
with(dataToUse, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()