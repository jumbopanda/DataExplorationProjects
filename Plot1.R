## Data Exporation Class
## Project Week #1

#IMPORT DATA
power<- read.table("household_power_consumption.txt",sep=";",skip=1, na.strings="?")
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## Subset two days of data
power<- subset(power, Date=="1/2/2007" | Date=="2/2/2007")
## Change date from d/m/y to y/m/d
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

##PLOT 1
png('plot1.png', width = 480, height = 480)
hist(power$Global_active_power, col="red", main="Golbal Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
