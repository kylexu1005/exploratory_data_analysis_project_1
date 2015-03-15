## load the data from the data file
setwd("~/Desktop/my_documents/coursera/fall_2015/exploratory_data_analysis/project_1")
classes=c("character","character",rep("numeric",7))
fulldata=read.table('./household_power_consumption.txt',colClasses=classes,na.strings=c('?'),sep=';',header=TRUE)
data=subset(fulldata,fulldata$Date %in% c("1/2/2007","2/2/2007"))
na.sum=sum(is.na(data));print(na.sum)

## preperations
date.time<-NULL
for (i in 1:length(data$Time)) {
  date.time=c(date.time,paste(data$Date[i],data$Time[i],sep=" "))
}
date.time=strptime(date.time,"%d/%m/%Y %H:%M:%S")
gap=data$Global_active_power

## begin figure
png(filename="./plot4.png",width=480,height=480)
par(mfcol=c(2,2))

## topleft subfigure
plot(date.time,gap,xlab="",ylab="Global Active Power (kilowatts)",type="l")

## bottomleft subfigure
x<-rep(date.time,3)
y<-c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3)
g<-gl(3,2880,labels=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# make the figure in the corresponding png file directly
png(filename="./plot3.png",width=480,height=480)
plot(x,y,xlab="",ylab="Energy sub mertering",type="n") # construct the frame
points(date.time,data$Sub_metering_1,col="black",type="l")
points(date.time,data$Sub_metering_2,col="red",type="l")
points(date.time,data$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))

## topright subfigure
plot(date.time,data$Voltage,xlab="datetime",ylab="Voltage",type="l")

## bottomright subfigure
plot(date.time,gap,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()

