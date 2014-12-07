plot1 <- function(){
	# Question 1
	if(!file.exists("expdata")) {dir.create("expdata")}
	dat = read.table("household_power_consumption.txt", sep=";", header = TRUE)
		
	a <- as.character(dat$Date)  # character "26/11/2010"
	b <- strptime(a, "%d/%m/%Y") # POSIXlt "2010-11-26 CST" 
	c <- as.Date(b) # "2010-11-26" 
	dat$Date <- c
	ind <- grep("2007-02-01|2007-02-02", c)

	sbdat = dat[ind,] 
	
	# Plot 1
	gap <- as.numeric(as.character(sbdat$Global_active_power))
	hist(gap,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
	dev.copy(png, file = "plot1.png") # Copy my plot to a PNG file
	dev.off() # Close the device
	
}