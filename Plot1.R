##Getting and Subsetting data 
url <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007", readLines(url), value = TRUE), 
        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                      "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

# Creating Plot 1
hist(data$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()