# This script assumes you have downloaded and unzipped the dataset in the current working directory.
# The script directly looks for the file "household_power_consumption.txt" in the current working directory.

# Read the dataset into a dataframe
hec<- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")

# Subset the required dataset
hec<-hec[hec$Date == "1/2/2007" | hec$Date =="2/2/2007",]

# Convert Variables to correct class
hec$Global_active_power <- as.numeric(hec$Global_active_power)
hec$Date<-strptime(paste(hec$Date,hec$Time),"%d/%m/%Y %H:%M:%S") # Combine date and time columns and cinvert it to POSIXlt format
hec$Sub_metering_1 <- as.numeric(hec$Sub_metering_1)
hec$Sub_metering_2 <- as.numeric(hec$Sub_metering_2)
hec$Sub_metering_3 <- as.numeric(hec$Sub_metering_3)

# Plot the graph and store it in a png file
png("plot3.png")
with(hec, plot(Date, Sub_metering_1, type = "n"))
with(hec, lines(Date, Sub_metering_1, col = "black"))
with(hec, lines(Date, Sub_metering_2, col = "red"))
with(hec, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", lty=1,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()