#Set working environment
wd<-"C:/Users/Carolyn/Desktop/Job Hunting 2015/Coursera Data Science Johns Hopkins University/4 Exploratory Data Analysis/Course Project 1"
if(getwd()!=wd){
  setwd(wd)
}
library(data.table)

#Read table
epc<-fread("./household_power_consumption.txt", sep = ";", skip="1/2/2007", nrows = 2880)
header<-as.vector(read.table("./household_power_consumption.txt", sep = ";", nrows =1, colClasses = "character"), mode="character")
colnames(epc)<-header

#Making Plot
hist(epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = "orangered")
dev.copy(png, file = "plot1.png")
dev.off()