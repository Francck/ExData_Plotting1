plot1 <- function(){
  
  # set to English:
  Sys.setlocale("LC_ALL", "English")
  
  data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  # set the data format 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  
  # filter for 2 days
  data <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
  
  # format data type before the plotting
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  
  # create png file 
  png(filename="plot1.png", width = 480, height = 480, units = "px")  #units are in pixels "px"
  
  # plot histogram
  hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
       ylab = "Frequency", main = "Global Active Power")
  
  # close the png device!
  dev.off()
  
  }