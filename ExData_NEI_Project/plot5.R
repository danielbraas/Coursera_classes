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
#the goal is to find the emissions from motor vehicles
#to achieve this goal, I will only collect the data from the SCC Short.Name column that match both
#vehicle

vehicle <- SCC[grep('[Vv]ehicle', SCC$Short.Name),]
SCC_vehicle <- droplevels(vehicle$SCC)


png('plot5.png', width=640, height=480)
NEI %>% 
  group_by(year) %>%
  filter(SCC %in% SCC_vehicle & fips == '24510') %>% 
  summarise('Total_Emission'=sum(Emissions, na.rm=T)) %>% 
  ggplot(., aes(factor(year), Total_Emission)) + 
    geom_bar(stat='identity') +
    theme_bw() +
    labs(title='Total Emissions from motor vehicle sources in Baltimore City, MD',
         x='Year', y='Total Emissions (tons)')
dev.off()
