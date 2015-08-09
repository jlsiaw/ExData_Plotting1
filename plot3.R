file <- "household_power_consumption.txt"

data3 <- read.csv2(file, header= T, na.strings= "?", stringsAsFactors= F)

data3$Date <- strptime(data3$Date, format= "%d/%m/%Y")

data3 <- data3[data3$Date>= "2007-02-01" & data3$Date<= "2007-02-02", ]

dateTime <- paste(data3$Date, data3$Time)
data3$dateTime <- as.POSIXct(dateTime)

png("plot3.png", width= 400, height= 400)

with(data3, {
      plot(as.numeric(Sub_metering_1) ~ dateTime, type= "l",
           ylab= "Energy Sub Metering", xlab= "")
      lines(as.numeric(Sub_metering_2) ~ dateTime, col= "Red")
      lines(as.numeric(Sub_metering_3) ~ dateTime, col= "Blue")
      legend("topright", 
             # inset= c(0.05, 0), cex= 0.75
             legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             col= c("Black", "Red", "Blue"),
             lty= 1, lwd= 1
             )
})

# copy command produce different result for legend box
# dev.copy(png, file = "plot3.png", width = 480, height = 480)

dev.off()
