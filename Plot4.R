plot4 <- function(){
  
  data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  # set the data format 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  
  # filter for 2 days
  data <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
  
  # format all data types before the plotting
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  # merge Date and Time to create a new Date column
  data$date2 <- paste(data$Date, data$Time, sep=" ")
  
  # get the data type converted to TimeStamp
  data$date2 <- as.POSIXct(data$date2, "%Y-%m-%d %H:%M:%S", tz="EST")
  
  
  
  # create png file 
  png(filename="plot4.png", width = 480, height = 480, units = "px")  #units are in pixels "px"
  
  # devide the plot area in 4
  par(mfrow = c(2,2)) 
  
  # 1st plot with lines (type = "l")
  plot(data$date2,data$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power")
 
  # 2nd plot with lines (type = "l")
  plot(data$date2,data$Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
  
  # 3rd plot with lines (type = "l")
  plot(data$date2,data$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
  lines(data$date2, data$Sub_metering_2, col = "red")
  lines(data$date2, data$Sub_metering_3, col = "blue")
  legend("topright", 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red","blue"),
         lty=c(1,1), lwd=c(1,1), bty = "n") # gives the box of right size
  
  # 4th plot with lines (type = "l")
  plot(data$date2,data$Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_power")
  
  # close the png device!
  dev.off()
  
}
