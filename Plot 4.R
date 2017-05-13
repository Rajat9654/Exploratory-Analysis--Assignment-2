
#Continuation of same variables as Plot1 file

SCC$SCC <- as.factor(SCC$SCC)
SCC$EI.Sector <- as.factor(SCC$EI.Sector)

SSC.coal <- SCC$SCC[grep("coal", SCC$EI.Sector , ignore.case = TRUE)]

NEI.coal <- NEI[NEI$SCC %in% SSC.coal,]

plot4 <- aggregate(NEI.coal$Emissions  ~ NEI.coal$year, FUN = sum)

names(plot4) <- c( "year" , "Emission")

png('plot4.png')
ggplot(plot4, aes(x = year,y = Emission) ) + geom_point()+
  geom_line() + labs(x = "Year" , y  = "Emission (in tons)" , title = expression('Total PM'[2.5]*' emissions due to coal'))
dev.off()
