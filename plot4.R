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
par(mfrow=c(2,2))

with(subdata, {
      plot(time, Global_active_power, type="l", ylab="Global Active Power", xlab="")
      plot(time, Voltage, type="l", ylab="Voltage", xlab="datetime")
      plot(time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
      lines(time, Sub_metering_2, type="l", col="red")
      lines(time, Sub_metering_3, type="l", col="blue")
      plot(time, Global_reactive_power, type="l", xlab="datetime")
})

dev.copy(png, file="plot4.png" , height=600, width=700)
dev.off()