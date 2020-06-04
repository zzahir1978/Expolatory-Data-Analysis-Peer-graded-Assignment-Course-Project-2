
if(!exists("plot1")){
  plot1 <- readRDS("./summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

aggregatedTotalByYear <- aggregate(Emissions ~ year, plot1, sum)

png('plot1.png')

barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Years", ylab=expression('Total PM2.5 Emission'), main=expression('Annual Total PM2.5 Emissions From 1999 to 2008'))

dev.off()