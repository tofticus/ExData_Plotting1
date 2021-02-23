#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
#destfile = "./household_power_consumption")

hpc <- read_delim("./household_power_consumption.txt", 
                  delim = ";")

head(hpc)

hpc$Date <- hpc$Date %>% as.Date(format = "%d/%m/%Y")

hpc <- hpc %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")

hpc <- within(hpc, datetime <- as.POSIXlt(paste(Date, Time),
                                          format = "%Y-%m-%d %H:%M"))

png("plot3.png")

with(hpc, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
points(y = hpc$Sub_metering_1, x = hpc$datetime, type = "l", col = "black")
points(y = hpc$Sub_metering_2, x = hpc$datetime, type = "l", col = "red")
points(y = hpc$Sub_metering_3, x = hpc$datetime, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()
