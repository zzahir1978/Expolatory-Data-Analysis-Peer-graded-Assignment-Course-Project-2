if(!exists("plot6")){
  plot6 <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

if(!exists("plot6SCC")){
  plot6SCC <- merge(plot6, SCC, by="SCC")
}

library(ggplot2)

subsetplot6 <- plot6[(plot6$fips=="24510"|plot6$fips=="06037") & plot6$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetplot6, sum)

aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"

aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)

g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))

g <- g + facet_grid(. ~ fips)

g <- g + geom_bar(stat="identity")  +
  xlab("Years") +
  ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total Emissions PM2.5 From Motor Vehicle in Baltimore City vs Los Angeles from 1999 to 2008')

print(g)

dev.off()