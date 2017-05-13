
#Continuation of same variables as Plot1, Plot2 & Plot5 file

NEI.LA <- subset(NEI, NEI$fips == "06037")

NEI.LA.motar <- NEI.LA[NEI.LA$SCC %in% SCC.motar,]

LA.motar <- aggregate(NEI.LA.motar$Emissions  ~ NEI.LA.motar$year, FUN = sum)

names(LA.motar) <- c( "year" , "Emission")


Plot5$County <- "Baltimore"
LA.motar$County <- "Los Angeles"

Plot6 <- rbind(Plot5, LA.motar)

png('Plot6.png')
ggplot(Plot6, aes(x = year,y = Emission, colour = County) ) + geom_point()+
  geom_line() + labs(x = "Year" , y  = "Emission (in tons)" , title = expression('Total PM'[2.5]*' emissions due to motor vechile in Baltimore City & LA'))
dev.off()





