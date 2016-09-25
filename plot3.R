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

with(data1, {plot(date_time,Sub_metering_1,col="black", type="l", ylab="Energy sub metering", xlab="")
            lines(date_time,Sub_metering_2, type="l", col="red")
            lines(date_time,Sub_metering_3, type="l", col="blue")
            }
     )

     legend("topright",col=c("black", "red", "blue"),
            lty=1, lwd=2, cex=0.75,  legend=c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"))



# Produce png file
dev.copy(png, file="D:/Eigene_Dateien/Coursera/Data_Science/RStudio/plot3.png", height=480, width=480)
dev.off()

