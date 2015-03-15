## load the data from the data file
setwd("~/Desktop/my_documents/coursera/fall_2015/exploratory_data_analysis/project_1")
classes=c("character","character",rep("numeric",7))
fulldata=read.table('./household_power_consumption.txt',colClasses=classes,na.strings=c('?'),sep=';',header=TRUE)
data=subset(fulldata,fulldata$Date %in% c("1/2/2007","2/2/2007"))
na.sum=sum(is.na(data));print(na.sum)

#### plot2 ####
## merge Date and Time
date.time<-NULL
for (i in 1:length(data$Time)) {
  date.time=c(date.time,paste(data$Date[i],data$Time[i],sep=" "))
}

## plot and save the figure
date.time=strptime(date.time,"%d/%m/%Y %H:%M:%S")
gap=data$Global_active_power
plot(date.time,gap,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.copy(png,file="./plot2.png",width=480,height=480)
dev.off()