
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
> ##Create Png device Plot4.png for plot we will create
> png (file="plot4.png", width=480, height=480)
> ##Change setting for plotting as 2 plots per row and 2 plot per coloumn
> par(mfrow=c(2,2),mar=c(4,4,2,1))
> ##Create first plot for Global active power
> with(datesub12,plot(datetime,as.numeric(as.vector(Global_active_power)),type='l',ylab="Global Active Power"))
> ##Create second plot for Voltage
> with(datesub12,plot(datetime,as.numeric(as.vector(Voltage)),type='l',ylab="Voltage"))
> ##Create third plot for Energy Sub metering
> with(datesub12,plot(datetime,as.numeric(as.vector(Sub_metering_1)),type='l',ylab="Energy Sub Metering"))
> with(datesub12,lines(datetime,Sub_metering_1,col="black"))
> with(datesub12,lines(datetime,as.numeric(as.vector(Sub_metering_2)),col="red"))
> with(datesub12,lines(datetime,as.numeric(as.vector(Sub_metering_3)),col="blue"))
> legend("topright",col=c("black","red","blue"),lty=1,lwd=2,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
> ##Create fourth plot for Global reactive power
> with(datesub12,plot(datetime,as.numeric(as.vector(Global_reactive_power)),type='l',ylab="Global_reactive_power"))
> dev.off()
null device 
          1 
> 