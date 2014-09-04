#Read given dataset, with ? as NA's
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors=F, na.strings = "?")
#Get the subset of the dataset for days 2007-02-01 & 2007-02-02
data_to_plot <- subset(data, strptime(data$Date, format="%d/%m/%Y", tz="") == strptime("2007-02-01", format="%Y-%m-%d", tz="") | strptime(data$Date, format="%d/%m/%Y", tz="") == strptime("2007-02-02", format="%Y-%m-%d", tz=""))
#Explicitly open a file device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
#Create the Plot
hist(data_to_plot$Global_active_power,col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#Explicitly close the file device
dev.off()