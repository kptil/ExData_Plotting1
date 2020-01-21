#Plot 1

#Download and Unzip the File
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./Week1ProjectData.zip")
unzip("./Week1ProjectData.zip")

#Read the Data into R
data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Subset Out the Rows Between 2007-02-01 and 2007-02-02
febdata <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#Create Plot 1
par(mar = c(4.1,4.1,2.1,3.1))
hist(as.numeric(febdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Save Plot 1 to PNG File
dev.copy(png, file = "plot1.png")
dev.off()
