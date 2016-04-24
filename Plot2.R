## Getting full dataset
fulldata <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = "", quote = '\"') 
fulldata$Date <- as.Date(fulldata$Date, format = "%d/%m/%Y")

## Subsetting the data
subdata <- subset(fulldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)

## Converting dates
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Generating Plot 2
plot(subdata$Global_active_power ~ subdata$Datetime, type ="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()