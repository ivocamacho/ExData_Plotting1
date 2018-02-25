library("data.table")

setwd("C:/Users/Maria Ivora Camacho/Documents/GitHub/ExData_Plotting1")

# reading data from a text file then subsets data for specified dates
HPCdata <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# do not print sci. notation in the histogram
HPCdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# using POSIXct date that can filter and graph by time of day
HPCdata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# using dates from 2007-02-01 and 2007-02-02
HPCdata <- HPCdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width=480, height=480)

## plot 2
plot(x = HPCdata[, dateTime]
     , y = HPCdata[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()