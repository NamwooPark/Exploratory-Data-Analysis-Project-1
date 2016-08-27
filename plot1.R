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

# plotting and creating png file.
with(subdata, hist(Global_active_power, col="red", main="Global Active Power", 
            font.main=2, xlab="Global Active Power (killowatts)"))
dev.copy(png, file="plot1.png", height=600, width=700)
dev.off()