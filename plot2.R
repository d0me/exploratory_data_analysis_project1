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

plot(data1$date_time, data1$Global_active_power  , ylab="Global Active Power (kilowatts)", type="l", xlab="")

dev.copy(png, file="D:/Eigene_Dateien/Coursera/Data_Science/RStudio/plot2.png", height=480, width=480)
dev.off()
