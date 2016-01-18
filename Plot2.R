plot2 <- function(){
  
  data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  # set the data format 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  
  # filter for 2 days
  data <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
  
  # format data type before the plotting
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  
  
  # merge Date and Time to create a new Date column
  data$date2 <- paste(data$Date, data$Time, sep=" ")
  
  # get the data type converted to TimeStamp
  data$date2 <- as.POSIXct(data$date2, "%Y-%m-%d %H:%M:%S", tz="EST")
  
  # create png file 
  png(filename="plot2.png", width = 480, height = 480, units = "px")  #units are in pixels "px"
  
  # plot with lines (type = "l")
  plot(data$date2,data$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  # close the png device!
  dev.off()
  
}
