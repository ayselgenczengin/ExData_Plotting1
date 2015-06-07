
> ##Save household power consumtion text file to ExData_Plotting directory and then read file
> dataEn<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
> ##Combine Date and Time coloumns and convert to POSIXct format
> dataEn$datetime<-as.POSIXct(paste(dataEn$Date,dataEn$Time),format="%d/%m/%Y %H:%M:%S")
> ##Get subset of data with date 2007-02-01
> datesub1<-dataEn[grep("2007-02-01",dataEn$datetime),]
> ##Get subset of data with date 2007-02-02
> datesub2<-dataEn[grep("2007-02-02",dataEn$datetime),]
> ##Merge subsets of data for dates 2007-02-01 and 2007-02-02 into one table
> datesub12<-merge(datesub1,datesub2,all.x=TRUE,all.y=TRUE)
> ##Create Png device Plot3.png for plot we will create
> png (file="plot3.png", width=480, height=480)
> ##Create plot
> with(datesub12,plot(datetime,as.numeric(as.vector(Sub_metering_1)),type='l',ylab="Energy Sub Metering"))
> ##Add lines to plot
> with(datesub12,lines(datetime,Sub_metering_1,col="black"))
> with(datesub12,lines(datetime,as.numeric(as.vector(Sub_metering_2)),col="red"))
> with(datesub12,lines(datetime,as.numeric(as.vector(Sub_metering_3)),col="blue"))
> ##Add legend to plot
> legend("topright",col=c("black","red","blue"),lty=1,lwd=2,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
> dev.off()
null device 
          1 
> 