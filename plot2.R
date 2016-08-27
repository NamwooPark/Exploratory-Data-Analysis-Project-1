# transforming dataset
subdata <- subdata %>%
      mutate(time = ymd_hms(paste(Date, Time)))

# plotting and creating png file
with(subdata, plot(time, Global_active_power, type="l", xlab="", 
      ylab="Global Active Power (killowatts)"))
dev.copy(png, file="plot2.png", height=600, width=700)
dev.off()