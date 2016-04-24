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

## Generating Plot 4

##Plot1
par(mfrow=c(2,2), mar = c(3,4,2,1), oma = c(0,0,2,0))
with(subdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
##Plot2
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
##Plot3
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1), bty="n", cex=0.5) ## cex will shrink the legend to the topright corner..
##Plot4
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()