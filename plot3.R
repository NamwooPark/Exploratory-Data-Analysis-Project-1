library(lubridate)  # data package
library(dplyr)

# unzip and read data file
unzip(zipfile="household_power_consumption.zip")
wholeData <- read.table("household_power_consumption.txt", 
                        header=T, sep=";", stringsAsFactors = F, na.strings="?")

# subsetting and transforming dataset
subdata <- wholeData %>%
      filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
      mutate(Date=dmy(Date))

# transforming dataset
subdata <- subdata %>%
      mutate(time = ymd_hms(paste(Date, Time)))

# plotting and creating png file
with(subdata, plot(time, Sub_metering_1, type="l", ylab = "Energy sub metering", 
                   xlab=""))
lines(subdata$time, subdata$Sub_metering_2, col="red")
lines(subdata$time, subdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", 
                  "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png" , height=600, width=700)
dev.off()
