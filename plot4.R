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