

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Basic chekcs
head(NEI)
head(SCC)
str(NEI)

#converting the data types for ease
NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$type <- as.factor(NEI$type)

NEI$year <- as.numeric(as.character(NEI$year))
NEI$Emissions <- as.numeric(as.character(NEI$Emissions))


##Summing the data of emissions by year

Plot1 <- aggregate(NEI$Emissions  ~ NEI$year, FUN = sum)

names(Plot1) <- c( "year" , "Emission")

png('plot1.png')
with(Plot1, plot(year, Emission, type = "l", xlab="Years", ylab = "Emission (in tons)",main=expression('Total PM'[2.5]*' emissions at various years')))
dev.off()


