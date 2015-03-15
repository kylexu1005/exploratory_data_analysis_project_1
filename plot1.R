## load the data from the data file
setwd("~/Desktop/my_documents/coursera/fall_2015/exploratory_data_analysis/project_1")
classes=c("character","character",rep("numeric",7))
fulldata=read.table('./household_power_consumption.txt',colClasses=classes,na.strings=c('?'),sep=';',header=TRUE)
data=subset(fulldata,fulldata$Date %in% c("1/2/2007","2/2/2007"))
na.sum=sum(is.na(data));print(na.sum)

#### plot1 ####
## draw the plot on screen 
gap<-data$Global_active_power
hist(gap,breaks=20,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

## copy the plot and save it as a png file
dev.copy(png,file="./plot1.png",width=480,height=480)
dev.off()

