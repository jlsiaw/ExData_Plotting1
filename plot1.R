# The dataset has 2,075,259 rows and 9 columns. A rough estimate of 
# the memory requirements is thus 2M * 9 * 8 bytes / 1M ~ 144 MB.
#
# read.table() is slow, scan() a bit faster, and readLines() fastest.

file <- "household_power_consumption.txt"

colNames <- names(read.csv2(file, header=TRUE, nrows=1))

# selective date range extraction from file
# get the line data if pattern matched
dateInc <- grep("^[1|2]/2/2007", readLines(file), value=TRUE)

data1 <- read.csv2(text=dateInc, header=F, na.strings = "?", 
                   col.names=colNames)

hist(as.numeric(as.character(data1$Global_active_power)), col="red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()
