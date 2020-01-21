#Plot 4

#Download and Unzip the File
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./Week1ProjectData.zip")
unzip("./Week1ProjectData.zip")

#Read the Data into R
data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Subset Out the Rows Between 2007-02-01 and 2007-02-02
febdata <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#Format Dates and Times
DateTime <- paste(febdata$Date, febdata$Time)
febdataTime <- cbind(febdata, DateTime = as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S"))

#Set Up for 4 Plots
par(mfcol = c(2,2))

#Plot A
with(febdataTime, plot(DateTime, Global_active_power, type = "n", ylab = "Global Active Power", xlab = " "))
lines(febdataTime$DateTime, febdataTime$Global_active_power, type = "l")

#Plot B
with(febdataTime, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " "))
lines(febdataTime$DateTime, febdataTime$Sub_metering_1)
lines(febdataTime$DateTime, febdataTime$Sub_metering_2, col = "red")
lines(febdataTime$DateTime, febdataTime$Sub_metering_3, col = "blue")
legend(locator(1), lty = 1, seg.len = .75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .9, xjust = 1, bty = "n", y.intersp = .5)

#Plot C
with(febdataTime, plot(DateTime, Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
lines(febdataTime$DateTime, febdataTime$Voltage)

#Plot D
with(febdataTime, plot(DateTime, Global_reactive_power, type = "n", xlab = "datetime"))
lines(febdataTime$DateTime, febdataTime$Global_reactive_power)

#Copy to PNG
dev.copy(png, file = "plot4.png")
dev.off()