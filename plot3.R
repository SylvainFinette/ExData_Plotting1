##
#
#  EXPLORATORY DATA ANALYSIS ASSIGNEMENT
#

# Read the data
data_file<-read.table("household_power_consumption.txt",na.strings = "?",sep=";",header=TRUE)

# Convert the Date to proper format
data_file$Date<-as.Date(data_file$Date,format="%d/%m/%Y")

# create a subset on the two days requested
data<-data_file[data_file$Date=="2007-02-01" |  data_file$Date=="2007-02-02",]

# convert the time to POSIXct format by joining with it Date
data$Time<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Create the plot file
png("plot3.png", width = 480, height = 480)
with(data,plot(Time,Sub_metering_1,type="l",ylab="",xlab=""))
points(data$Time,data$Sub_metering_2,type="l",col="red")
points(data$Time,data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
title(ylab="Energy sub metering")
dev.off()