# Make Dataset a vector
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")

#Take a look around ....
names(data)
lapply(data, class)

# See how dates are formatted
data$Date[1:10]
data$Time[1:10]

#Change the factor date and time values
data$DateTime<-paste(data$Date, data$Time)

#chnage DateTime to yyyy-mm-dd hh:mm:ss
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Filter for the start and end dates 2007-02-01 and 2007-02-02.
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data2<-data[start:end,]

# Make Plot1 ....

hist(as.numeric(as.character(data2$Global_active_power)), 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")