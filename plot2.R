plot2 <- function(){
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

	sbdat = dat[ind,] 
	
	# Plot 2
	gap <- as.numeric(as.character(sbdat$Global_active_power))
	tvol <- tc[ind]
	plot(tvol,gap, type='l',ylab="Global Active Power (kilowatts)",xlab="")
	dev.copy(png, file = "plot2.png") # Copy my plot to a PNG file
	dev.off() # Close the device


}