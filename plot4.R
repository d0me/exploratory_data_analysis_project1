rm(list = ls())

# Load Data
data <- read.csv("D:/Eigene_Dateien/Coursera/Data_Science/RStudio/data/household_power_consumption.txt" ,header=TRUE,stringsAsFactors = FALSE,strip.white = TRUE, sep=';', na.strings="?", nrows=2075259)

# Format Date Variable
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")

# Create Timestamp
data$date_time<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")



# Get relevant time frame
data1<-subset(data, Date=="2007-02-01" | Date=="2007-02-02")


# Plot

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(date_time, Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(date_time,Voltage, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(date_time,Sub_metering_1, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(date_time,Sub_metering_2, col='Red')
  lines(date_time,Sub_metering_3, col='Blue')
  legend("topright", col=c("black", "red", "blue"), cex=0.75, lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(date_time, Global_reactive_power, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})





# Produce png file
dev.copy(png, file="D:/Eigene_Dateien/Coursera/Data_Science/RStudio/plot4.png", height=480, width=480)
dev.off()

