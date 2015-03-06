# This script assumes you have downloaded and unzipped the dataset in the current working directory.
# The script directly looks for the file "household_power_consumption.txt" in the current working directory.

# Read the dataset into a dataframe
hec<- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")

# Subset the required dataset
hec<-hec[hec$Date == "1/2/2007" | hec$Date =="2/2/2007",]
hec$Global_active_power <- as.numeric(hec$Global_active_power)

# Plot the graph and store it in a png file
png("plot1.png")
hist(hec$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()