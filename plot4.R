file <- "household_power_consumption.txt"

data4 <- read.csv2(file, header= T, na.strings= "?", stringsAsFactors= F)

data4$Date <- strptime(data4$Date, format= "%d/%m/%Y")

data4 <- data4[data4$Date>= "2007-02-01" & data4$Date<= "2007-02-02", ]

dateTime <- paste(data4$Date, data4$Time)
data4$dateTime <- as.POSIXct(dateTime)

png("plot4.png", width= 400, height= 400)

par(mfrow= c(2,2), mar= c(4,4,2,1), oma= c(0,0,2,0))

with(data4, {
      plot(as.numeric(Global_active_power) ~ dateTime, type= "l",
           ylab= "Global Active Power",
           xlab= "")
      plot(as.numeric(Voltage) ~ dateTime, type= "l",
           ylab= "Voltage")
      plot(as.numeric(Sub_metering_1) ~ dateTime, type= "l",
           ylab= "Energy Sub Metering", xlab= "")
      lines(as.numeric(Sub_metering_2) ~ dateTime, col= "Red")
      lines(as.numeric(Sub_metering_3) ~ dateTime, col= "Blue")
      legend("topright", cex= 0.75,
             legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             col= c("Black", "Red", "Blue"),
             lty= 1, lwd= 1, bty= "n"
             )
      plot(as.numeric(Global_reactive_power) ~ dateTime, type= "l",
           ylab= "Global_reactive_power")
})

# copy command produce different result for legend box
# dev.copy(png, file = "plot3.png", width = 480, height = 480)

dev.off()
