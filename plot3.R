

# plotting and creating png file
with(subdata, plot(time, Sub_metering_1, type="l", ylab = "Energy sub metering", 
                   xlab=""))
lines(subdata$time, subdata$Sub_metering_2, col="red")
lines(subdata$time, subdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", 
                  "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png" , height=600, width=700)
dev.off()