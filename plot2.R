rawdata <- read.table("household_power_consumption.txt",header=T,sep=";")
data<-rawdata
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")


DATE1=as.Date("2007-02-01")
DATE2=as.Date("2007-02-02")
sub<-subset(data,Date<=DATE2)
sub<-subset(sub,Date>=DATE1)

sub<-subset(sub,Global_active_power!="?")
sub$Global_active_power<-as.numeric(as.character(sub$Global_active_power))

sub$Time<-as.POSIXlt(paste(as.character(sub$Date),as.character(sub$Time)), format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png")
with(sub,plot(Time,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
lines(sub$Time,sub$Global_active_power)
dev.off()