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

# Create the plot file
png("plot1.png", width = 480, height = 480)
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global active power (Kilowatts)"))
dev.off()