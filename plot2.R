#Read given dataset, with ? as NA's
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors=F, na.strings = "?")
#Get the subset of the dataset for days 2007-02-01 & 2007-02-02
data_to_plot <- subset(data, strptime(data$Date, format="%d/%m/%Y", tz="") == strptime("2007-02-01", format="%Y-%m-%d", tz="") | strptime(data$Date, format="%d/%m/%Y", tz="") == strptime("2007-02-02", format="%Y-%m-%d", tz=""))
#Get time-stamp to plot data
timestamp = paste(data_to_plot$Date, data_to_plot$Time, sep = " ")
#Explicitly open a file device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
#Create the Plot
plot(strptime(timestamp, format="%d/%m/%Y %T"), data_to_plot$Global_active_power, type="n",xlab="", ylab="Global Active Power (kilowatts)")
lines(x=strptime(timestamp, format="%d/%m/%Y %T"), y=data_to_plot$Global_active_power)
#Explicitly close the file device
dev.off()