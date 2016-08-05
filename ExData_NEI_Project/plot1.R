require(lattice)
require(ggplot2)
require(dplyr)
require(tidyr)

#loading the data and making factor variables
NEI <- readRDS("summarySCC_PM25.rds")
NEI$fips <- factor(NEI$fips)
NEI$SCC <- factor(NEI$SCC)
NEI$type <- factor(NEI$type)

SCC <- readRDS("Source_Classification_Code.rds")

#partitioning data and preparing data frames for plots
png('plot1.png', width=480, height=480)
data <- NEI %>% 
  group_by(year) %>% 
  summarise('Total_Emission'=sum(Emissions, na.rm=T))
barplot(data$Total_Emission, names.arg=data$year, main='Total PM2.5 Emissions in the US per Year', 
       xlab='Year', ylab='Total Emission (tons)', ylim=c(0,8e6))
dev.off()
