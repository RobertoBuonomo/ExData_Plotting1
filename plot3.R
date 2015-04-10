dset <- read.table("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE, header=TRUE, na.strings="?")

dset$date_time <- paste(dset$Date,dset$Time, sep=" ")
dset$date_time <- strptime(dset$date_time, format="%d/%m/%Y %H:%M:%S")
dset$Date <- as.Date(dset$Date, format= "%d/%m/%Y")
dset2 <- dset[dset$Date=="2007-02-1"|dset$Date=="2007-02-2", ]

###plot3###

with(dset2, plot(date_time,Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(dset2, lines(date_time,Sub_metering_1))
with(dset2, lines(date_time,Sub_metering_2,col="red"))
with(dset2, lines(date_time,Sub_metering_3, col="blue"))
legend("topright", lwd=1, pch=c(NA,NA), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png",width = 480, height = 480 )
dev.off()