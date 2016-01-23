rawdata <- read.table("household_power_consumption.txt",header=T,sep=";")
data<-rawdata
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")


DATE1=as.Date("2007-02-01")
DATE2=as.Date("2007-02-02")
sub<-subset(data,Date<=DATE2)
sub<-subset(sub,Date>=DATE1)

sub<-subset(sub,Global_active_power!="?")
sub$Global_active_power<-as.numeric(as.character(sub$Global_active_power))
sub$Sub_metering_1<-as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2<-as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3<-as.numeric(as.character(sub$Sub_metering_3))
sub$Voltage<-as.numeric(as.character(sub$Voltage))



sub$Time<-as.POSIXlt(paste(as.character(sub$Date),as.character(sub$Time)), format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png")
par(mfrow = c(2, 2))
with(sub,plot(Time,Global_active_power,type="n",xlab="",ylab="Global Active Power"))
lines(sub$Time,sub$Global_active_power)

with(sub,plot(Time,Voltage,type="n",xlab="datetime",ylab="Voltage"))
lines(sub$Time,sub$Voltage)

with(sub,plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
lines(sub$Time,sub$Sub_metering_1)
lines(sub$Time,sub$Sub_metering_3,type="l",col="blue")
lines(sub$Time,sub$Sub_metering_2,type="l",col="red")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n",cex=.75)

with(sub,plot(Time,Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power"))
lines(sub$Time,sub$Global_reactive_power)

dev.off()