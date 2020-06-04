if(!exists("plot2")){
  plot2 <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

subsetplot2  <- plot2[plot2$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetplot2, sum)

png('plot2.png')

barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Years", ylab=expression('Total PM2.5 Emission'), main=expression('Annual Total PM2.5 Emissions in Baltimore City From 1999 to 2008'))

dev.off()