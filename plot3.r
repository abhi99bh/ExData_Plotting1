library(data.table)

setwd("D:\\Coursra\\Exploratery\\exdata_data_household_power_consumption")


suppressWarnings(data<-fread("household_power_consumption.txt"))

#convert date to proper format

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset required data 

dataforgraph<-data[Date =='2007-02-01'|Date =='2007-02-02']

rm(data)

dataforgraph$Sub_metering_1<-as.numeric(dataforgraph$Sub_metering_1)
dataforgraph$Sub_metering_2<-as.numeric(dataforgraph$Sub_metering_2)
dataforgraph$Sub_metering_3<-as.numeric(dataforgraph$Sub_metering_3)
dataforgraph$Voltage<-as.numeric(dataforgraph$Voltage)
dataforgraph$Global_reactive_power<-as.numeric(dataforgraph$Global_reactive_power)
dataforgraph$Global_active_power<-as.numeric(dataforgraph$Global_active_power)
dataforgraph$timestamp<-as.POSIXct(paste(dataforgraph$Date, dataforgraph$Time))
dataforgraph$weekday<-weekdays(as.Date(dataforgraph$Date,"%Y-%m-%d"))


# p3
plot(dataforgraph$timestamp,dataforgraph$Sub_metering_1,type="l",ylab ="Energy sub metering",xlab = "")
lines(dataforgraph$timestamp,dataforgraph$Sub_metering_2,col="red")
lines(dataforgraph$timestamp,dataforgraph$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
        cat("Plot3.png has been saved in", getwd())
