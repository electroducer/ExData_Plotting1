## plot3.R
## Plots: Energy sub metering (1,2,3) over time
##        for data from Feb 1-2, 2007
## Uses the Individual household electric power consumption Data Set
## from the UC Irvine Machine Learning Repository 

plot3 <- function(file_path = "../household_power_consumption.txt") {
  
  # Loads the data (common to all plot scripts)
  data <- read.table(file_path,
                     colClasses = c("character", "character", "numeric",
                                    "numeric", "numeric", "numeric",
                                    "numeric", "numeric", "numeric"),
                     header = TRUE, sep = ";", na.strings = "?")
  
  # Converts the dates and times to a single POSIXlt format 
  data$Date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
  data$Time <- NULL
  
  #Shortens data to only required dates
  data <- data[(data$Date >= as.POSIXlt("2007-02-01")
                & data$Date < as.POSIXlt("2007-02-03")), ]
  
  # Plots the data, stores it as a 480x480 PNG file
  # Creates plot3
  png(filename = "plot3.png")
  plot(data$Date, data$Sub_metering_1, type = "n",
       ylab = "Energy sub metering", xlab = "")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"), lty = 1)
  lines(data$Date, data$Sub_metering_1, col = "black")
  lines(data$Date, data$Sub_metering_2, col = "red")
  lines(data$Date, data$Sub_metering_3, col = "blue")
  dev.off()
}