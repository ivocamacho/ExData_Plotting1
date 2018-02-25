library("data.table")
setwd("C:/Users/Maria Ivora Camacho/Documents/GitHub/ExData_Plotting1")

# reading data from a text file
HPCdata <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )
# do not print sci. notation in the histogram
HPCdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# from coursera instruction change date and time variables to date/time classes
HPCdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# using dates from 2007-02-01 and 2007-02-02
HPCdata <- HPCdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## plot 1
hist(HPCdata[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
