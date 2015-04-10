dset <- read.table("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE, header=TRUE, na.strings="?")

dset$date_time <- paste(dset$Date,dset$Time, sep=" ")
dset$date_time <- strptime(dset$date_time, format="%d/%m/%Y %H:%M:%S")
dset$Date <- as.Date(dset$Date, format= "%d/%m/%Y")
dset2 <- dset[dset$Date=="2007-02-1"|dset$Date=="2007-02-2", ]

###plot2###

plot(dset2$date_time, dset2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png",width = 480, height = 480 )
dev.off()