#Plot 2

#Download and Unzip the File
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./Week1ProjectData.zip")
unzip("./Week1ProjectData.zip")

#Read the Data into R
data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Subset Out the Rows Between 2007-02-01 and 2007-02-02
febdata <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#Create Plot 2
DateTime <- paste(febdata$Date, febdata$Time)
febdataTime <- cbind(febdata, DateTime = as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S"))
with(febdataTime, plot(DateTime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = " "))
lines(febdataTime$DateTime, febdataTime$Global_active_power, type = "l")

#Copy to PNG
dev.copy(png, file = "plot2.png")
dev.off()