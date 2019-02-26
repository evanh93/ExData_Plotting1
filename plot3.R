library(lubridate)

## Set working directory and read data
setwd("C:\\Users\\HaaseE\\Documents\\R Projects\\exdata_data_household_power_consumption")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Formatting and subsetting
data[3:9] <- lapply(data[3:9], function(x) as.numeric(as.character(x)))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- ymd_hms(data$DateTime)
data <- with(data, data[(Date >= "2007-02-01" & Date <= "2007-02-02"), ])

## Save plot to PNG
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
dev.off()