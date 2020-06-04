if(!exists("plot4")){
  plot4 <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

if(!exists("plot4SCC")){
  plot4SCC <- merge(plot4, SCC, by="SCC")
}

library(ggplot2)

coalMatches  <- grepl("coal", plot4SCC$Short.Name, ignore.case=TRUE)
subsetplot4SCC <- plot4SCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetplot4SCC, sum)

png("plot4.png", width=640, height=480)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))

g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM2.5 Emissions')) +
  ggtitle('Total Emissions from Coal Combustion Sources from 1999 to 2008')

print(g)

dev.off()