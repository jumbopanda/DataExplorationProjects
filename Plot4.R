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

##PLOT 4
## combine date and time for chart

png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2), mar = c(5,4,2,4))
plot(power$Global_active_power~power$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(power$Voltage~power$DateTime, type="l", xlab="datetime",ylab="Voltage")

plot(power$DateTime,power$Sub_metering_1,main="", xlab="", ylab="Energy sub metering",type="l", col=2)
lines(power$DateTime, power$Sub_metering_2, type="l", col=3, pch=2)
lines(power$DateTime, power$Sub_metering_3, type="l", col=4, pch=3)
legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=1, col=2:4)

plot(power$Global_reactive_power~power$DateTime, type="l", ylab="Global_rective_power (kilowatts)")

dev.off()

