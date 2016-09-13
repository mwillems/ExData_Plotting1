

##chargement du fichier
full_data <- read.csv("household_power_consumption.txt", colClasses="character",sep=";")


##Adaptation des formats
full_data[,1] <- as.Date(full_data[,1],"%d/%m/%Y" )
full_data[,3] <- as.numeric(full_data[,3])
full_data[,4] <- as.numeric(full_data[,4])
full_data[,5] <- as.numeric(full_data[,5])
full_data[,6] <- as.numeric(full_data[,6])
full_data[,7] <- as.numeric(full_data[,7])
full_data[,8] <- as.numeric(full_data[,8])
full_data[,9] <- as.numeric(full_data[,9])


##Set data from 2007-02-01 and 2007-02-02.
l <- c("2007/02/01","2007/02/02")
y <-as.Date(l,"%Y-%m-%d") 
data_set <- subset(full_data, Date==y[1]|Date==y[2])

##Set data needed on plot2
data_set2 <- data_set[,c(1,2,3)]
data_set2$Time <- strptime(paste(data_set[,1],data_set[,2]),"%Y-%m-%d %H:%M:%S")



##Create file plot2.png
png("Plot2.png",width=480,height=480,units="px",type = "cairo-png")
plot(data_set2$Time,data_set2$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()
