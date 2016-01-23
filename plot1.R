rawdata <- read.table("household_power_consumption.txt",header=T,sep=";")
data<-rawdata
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(as.character(data$Time),"%T")

DATE1=as.Date("2007-02-01")
DATE2=as.Date("2007-02-02")
sub<-subset(data,Date<=DATE2)
sub<-subset(sub,Date>=DATE1)

sub<-subset(sub,Global_active_power!="?")
sub$Global_active_power<-as.numeric(as.character(sub$Global_active_power))


png(filename="plot1.png")
with(sub,hist(Global_active_power,col="red",main="Global Active Power"))
dev.off()