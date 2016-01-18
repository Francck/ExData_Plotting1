plot3 <- function(){
  
  data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  # set the data format 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  
  # filter for 2 days
  data <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
  
  # format all data types before the plotting
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  # merge Date and Time to create a new Date column
  data$date2 <- paste(data$Date, data$Time, sep=" ")
  
  # get the data type converted to TimeStamp
  data$date2 <- as.POSIXct(data$date2, "%Y-%m-%d %H:%M:%S", tz="EST")
  
  
  # create png file 
  png(filename="plot3.png", width = 480, height = 480, units = "px")  #units are in pixels "px"
  
  # plot with lines (type = "l")
  plot(data$date2,data$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
  lines(data$date2, data$Sub_metering_2, col = "red")
  lines(data$date2, data$Sub_metering_3, col = "blue")
  legend("topright", 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red","blue"),
         lty=c(1,1), lwd=c(1,1)) # gives the box of right size
  
  
  # close the png device!
  dev.off()
  
}
