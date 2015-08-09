file <- "household_power_consumption.txt"

data2 <- read.csv2(file, header= T, na.strings= "?", stringsAsFactors= F)

data2$Date <- strptime(data2$Date, format="%d/%m/%Y")

data2 <- data2[data2$Date >= "2007-02-01" & data2$Date <= "2007-02-02", ]

dateTime <- paste(data2$Date, data2$Time)
data2$dateTime <- as.POSIXct(dateTime)

with(data2, plot(as.numeric(Global_active_power) ~ dateTime, type= "l",
                 ylab= "Global Active Power (kilowatts)",
                 xlab= ""))

dev.copy(png, file = "plot2.png", width = 480, height = 480)

dev.off()
