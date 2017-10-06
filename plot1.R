#Read Data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#make sure the data is in numeric format
global_active_power <- as.numeric(plot_data$Global_active_power)

#create the plot
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()