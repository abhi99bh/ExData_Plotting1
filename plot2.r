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


# p2
plot(dataforgraph$timestamp,dataforgraph$Global_active_power,type = "l",ylab ="Global Active Power (kilowatts)",xlab = "")

dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
        cat("Plot2.png has been saved in", getwd())
