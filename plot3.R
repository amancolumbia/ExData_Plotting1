#Read Data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Make sure that data is in datetime and numeric format
datetime <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering1 <- as.numeric(plot_data$Sub_metering_1)
sub_metering2 <- as.numeric(plot_data$Sub_metering_2)
sub_metering3 <- as.numeric(plot_data$Sub_metering_3)

#create the plot
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()