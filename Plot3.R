

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

##Set data needed on plot3
data_set2 <- data_set[,c(1,2,7,8,9)]
data_set2$Time <- strptime(paste(data_set[,1],data_set[,2]),"%Y-%m-%d %H:%M:%S")

names(data_set2)

##Create file plot3.png
png("Plot3.png",width=480,height=480,units="px",type = "cairo-png")
plot(data_set2$Time,data_set2$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="", col="black")
lines(data_set2$Time,data_set2$Sub_metering_2,type="l", col="red")
lines(data_set2$Time,data_set2$Sub_metering_3,type="l", col="blue")
legend("topright", names(data_set2[,c(3,4,5)]), cex=0.8, col=c("black", "red", "blue"),lty=1:3, lwd=2, bty="o")
dev.off()




