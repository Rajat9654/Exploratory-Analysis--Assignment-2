
#Continuation of same variables as Plot1 & Plot2 file

SCC.motar <- SCC$SCC[grep("vehicle", SCC$EI.Sector , ignore.case = TRUE)]

NEI.Baltimore.motar <- NEI.Baltimore[NEI.Baltimore$SCC %in% SCC.motar,]

Plot5 <- aggregate(NEI.Baltimore.motar$Emissions  ~ NEI.Baltimore.motar$year, FUN = sum)

names(Plot5) <- c( "year" , "Emission")

png('Plot5.png')
ggplot(Plot5, aes(x = year,y = Emission) ) + geom_point()+
  geom_line() + labs(x = "Year" , y  = "Emission (in tons)" , title = expression('Total PM'[2.5]*' emissions due to motor vechile in Baltimore City, MD'))
dev.off()

