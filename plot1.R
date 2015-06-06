## plot1.R
## Plots: histogram of Global active power
##        for data from Feb 1-2, 2007
## Uses the Individual household electric power consumption Data Set
## from the UC Irvine Machine Learning Repository

plot1 <- function(file_path = "../household_power_consumption.txt") {
  
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
  # Creates plot1
  png(filename = "plot1.png")
  hist(data$Global_active_power, col = "red", main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  dev.off()
}