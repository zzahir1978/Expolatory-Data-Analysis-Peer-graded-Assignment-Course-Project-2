if(!exists("plot3")){
  plot3 <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

library(ggplot2)

subsetplot3  <- plot3[plot3$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetplot3, sum)

png("plot3.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))

g <- g + geom_line() +
  xlab("Year") +
  ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Annual Total Emissions in Baltimore City, Maryland From 1999 To 2008')

print(g)

dev.off()