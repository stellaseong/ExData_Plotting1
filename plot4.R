plot4 <- function(){
	# Question 1
	if(!file.exists("expdata")) {dir.create("expdata")}
	dat = read.table("household_power_consumption.txt", sep=";", header = TRUE)
		
	a <- as.character(dat$Date)  # character "26/11/2010"
	t <- as.character(date$Time) # character "17:24:00" 
	tcom <- paste(a,t) # character "16/12/2006 17:24:00"
	tc <- strptime(tcom, "%d/%m/%Y %H:%M:%S") # POSIXlt "2006-12-16 17:24:00 CST"
	# tc2 <- as.Date(tc)


	b <- strptime(a, "%d/%m/%Y") # POSIXlt "2010-11-26 CST" 
	c <- as.Date(b) # "2010-11-26" 
	dat$Date <- c
	ind <- grep("2007-02-01|2007-02-02", c)

	sbdat = dat[ind,] # subset for 2/1/2007~2/2/2007

	tvol <- tc[ind] # time index
		
	# Plot 4
	
	gap <- as.numeric(as.character(sbdat$Global_active_power))
	v <- as.numeric(as.character(sbdat$Voltage))

	sm1 <- as.numeric(as.character(sbdat$Sub_metering_1))
	sm2 <- as.numeric(as.character(sbdat$Sub_metering_2))
	sm3 <- as.numeric(as.character(sbdat$Sub_metering_3))

	gr <- as.numeric(as.character(sbdat$Global_reactive_power))

	par(mfrow = c(2, 2))
	with{
	plot(tvol,gap, type='l',ylab="Global Active Power",xlab="")
	plot(tvol,v, type='l',ylab="Voltage",xlab="datetime") 
	
	plot(tvol,sm1, type='l',ylab="Energy sub metering",xlab="")
	lines(tvol,sm2, type='l',ylab="Energy sub metering",xlab="",col="red")
	lines(tvol,sm3, type='l',ylab="Energy sub metering",xlab="",col="blue")
      #legend("topright", lty=1:1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
	
	plot(tvol,gr, type='l',ylab="Global_reactive_power",xlab="datetime") 

	}

	dev.copy(png, file = "plot4.png") # Copy my plot to a PNG file
	dev.off() # Close the device
	
}