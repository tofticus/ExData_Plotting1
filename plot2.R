
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
#destfile = "./household_power_consumption")

hpc <- read_delim("./household_power_consumption.txt", 
                  delim = ";")

head(hpc)

hpc$Date <- hpc$Date %>% as.Date(format = "%d/%m/%Y")

hpc <- hpc %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")

hpc <- within(hpc, datetime <- as.POSIXlt(paste(Date, Time),
                                          format = "%Y-%m-%d %H:%M"))

png("plot2.png")

with(hpc, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.off()










