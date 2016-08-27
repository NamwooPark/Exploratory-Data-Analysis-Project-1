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
with(subdata, plot(time, Global_active_power, type="l", xlab="", 
      ylab="Global Active Power (killowatts)"))
dev.copy(png, file="plot2.png", height=600, width=700)
dev.off()