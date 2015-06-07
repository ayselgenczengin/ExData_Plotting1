
>  ##Save household power consumtion text file to ExData_Plotting directory and then read file
>  dataEn<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
> ##Combine Date and Time coloumns and convert to POSIXct format
> dataEn$datetime<-as.POSIXct(paste(dataEn$Date,dataEn$Time),format="%d/%m/%Y %H:%M:%S")
> ##Get subset of data with date 2007-02-01
> datesub1<-dataEn[grep("2007-02-01",dataEn$datetime),]
> ##Get subset of data with date 2007-02-02
> datesub2<-dataEn[grep("2007-02-02",dataEn$datetime),]
> ##Merge subsets of data for dates 2007-02-01 and 2007-02-02 into one table
> datesub12<-merge(datesub1,datesub2,all.x=TRUE,all.y=TRUE)
> ##Create Png device Plot1.png for histogram plot we will create
> png (file="plot1.png", width=480, height=480)
> ##Create histogram for Global_active_power
> hist(as.numeric(as.vector(datesub12$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
> ##close device
> dev.off()
null device 
          1 
> 