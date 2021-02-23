library(tidyverse)

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
#destfile = "./household_power_consumption")

hpc <- read_delim("./household_power_consumption.txt", 
                          delim = ";")

head(hpc)

hpc$Date <- hpc$Date %>% as.Date(format = "%d/%m/%Y")


hpc <- hpc %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")

png("plot1.png")

with(hpc, hist(Global_active_power, col = "red" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.off()
