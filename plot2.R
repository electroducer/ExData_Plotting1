## plot2.R
## Plots: Global active power over time
##        for data from Feb 1-2, 2007
## Uses the Individual household electric power consumption Data Set
## from the UC Irvine Machine Learning Repository

plot2 <- function(file_path = "../household_power_consumption.txt") {
  
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
  # Creates plot2
  png(filename = "plot2.png")
  plot(data$Date, data$Global_active_power, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
}