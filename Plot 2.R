
#Continuation of same variables as Plot1 file

NEI.Baltimore <- subset(NEI, NEI$fips == 24510)

Plot2 <- aggregate(NEI.Baltimore$Emissions  ~ NEI.Baltimore$year, FUN = sum)

names(Plot2) <- c( "year" , "Emission")

with(plot2, plot(year, Emission))

png('plot2.png')
with(Plot2, plot(year, Emission, type = "l", xlab="Years", ylab = "Emission (in tons)",main=expression('Total PM'[2.5]*' emissions at various years in Baltimore, MD')))
dev.off()
