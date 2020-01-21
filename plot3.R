#Plot 3

#Download and Unzip the File
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./Week1ProjectData.zip")
unzip("./Week1ProjectData.zip")

#Read the Data into R
data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Subset Out the Rows Between 2007-02-01 and 2007-02-02
febdata <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#Create Plot 3
DateTime <- paste(febdata$Date, febdata$Time)
febdataTime <- cbind(febdata, DateTime = as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S"))
with(febdataTime, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " "))
lines(febdataTime$DateTime, febdataTime$Sub_metering_1)
lines(febdataTime$DateTime, febdataTime$Sub_metering_2, col = "red")
lines(febdataTime$DateTime, febdataTime$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copy to PNG
dev.copy(png, file = "plot3.png")
dev.off()