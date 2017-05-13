
#Continuation of same variables as Plot1 & 2 file

library(ggplot2)

Plot3 <- aggregate(NEI.Baltimore$Emissions  ~ NEI.Baltimore$year + NEI.Baltimore$type, FUN = sum)

names(Plot3) <- c( "year" ,"Type" , "Emission")

png('plot3.png')
ggplot(Plot3, aes(x = year,y = Emission, color = Type) ) + geom_point() + 
  geom_line() + labs(x = "Year" , y  = "Emission (in tons)" , title = expression('Total PM'[2.5]*' emissions at various years by type'))
dev.off()
