#Read Data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Make sure that data is in datetime and numeric format
datetime <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(plot_data$Global_active_power)

#create the plot
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()