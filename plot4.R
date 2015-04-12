#Set working environment
wd<-"C:/Users/Carolyn/Desktop/Job Hunting 2015/Coursera Data Science Johns Hopkins University/4 Exploratory Data Analysis/Course Project 1"
if(getwd()!=wd){
  setwd(wd)
}
library(data.table)
Sys.setlocale("LC_TIME", "English")

#Read table
epc<-fread("./household_power_consumption.txt", sep = ";", skip="1/2/2007", nrows = 2880)
header<-as.vector(read.table("./household_power_consumption.txt", sep = ";", nrows =1, colClasses = "character"), mode="character")
colnames(epc)<-header

#Convert Time and Date
epc$Date<-as.Date(epc$Date, "%d/%m/%Y")
DateTime<-strptime(paste(epc$Date,epc$Time, sep = " "),"%Y-%m-%d %H:%M:%S")
epc<-cbind(epc, DateTime)

#Making Plot
png(file = "plot4.png")
par(mfrow = c(2,2))
plot(epc$DateTime, epc$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(epc$DateTime, epc$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(epc$DateTime, epc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(epc$DateTime, epc$Sub_metering_2, type = "l", col = "red")
lines(epc$DateTime, epc$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, cex = 0.9, bty = "n")
plot(epc$DateTime, epc$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()