
if(!exists("plot5")){
  plot5 <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

if(!exists("plot5SCC")){
  plot5SCC <- merge(plot5, SCC, by="SCC")
}

library(ggplot2)

subsetplot5 <- plot5[plot5$fips=="24510" & plot5$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetplot5, sum)

png("plot5.png", width=840, height=480)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))

g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total Emissions From Motor Vehicle In Baltimore City from 1999 to 2008')

print(g)

dev.off()