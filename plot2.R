# user must first set the working directory to the location of the unzipped file 'household_power_consumption.txt' 
# from the data source on the course website before running these lines
directory = getwd()
data = read.csv(paste(directory,"/household_power_consumption.txt",sep="") , sep=";",stringsAsFactors=F)

# subset to dates of interest, convert time data, & remove extraneous columns
d1 = subset(data, data$Date == '1/2/2007')
d2 = subset(data, data$Date == '2/2/2007')
data = rbind(d1,d2)
data$Date = strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data = data[,-6]
data = data[,-2]

# format classes of numeric columns
for (i in 2:7){
    class(data[,i]) = 'numeric'
}
rm(d1,d2,directory,i)

# generate second plot
png(file='Plot2.png',width=480,height=480)
plot(data$Date, data$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='',cex.lab=0.85)
dev.off()
