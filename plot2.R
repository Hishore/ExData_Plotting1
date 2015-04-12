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
plot(epc$DateTime, epc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()