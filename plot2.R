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
plot(dataToUse$Global_active_power~dataToUse$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()