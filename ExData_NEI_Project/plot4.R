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
#the goal is to find the emissions from coal combustion-related sources
#to achieve this goal, I will only collect the data from the SCC Short.Name column that match both
#[Cc]oal and [Cc]ombustion

coal_combust <- SCC[intersect(grep('[Cc]oal', SCC$Short.Name), grep('[Cc]ombustion', SCC$Short.Name)),]
SCC_coal_combust <- droplevels(coal_combust$SCC)               #determine SCC for coal_combust


png('plot4.png', width=640, height=480)
NEI %>% 
  group_by(year) %>%
  filter(SCC %in% SCC_coal_combust) %>%
  summarise('Total_Emission'=sum(Emissions, na.rm=T)) %>% 
  ggplot(., aes(factor(year), Total_Emission)) + 
    geom_bar(stat='identity') +
    theme_bw() +
    labs(title='Total Emissions from coal combustion-related sources in the US',
         x='Year', y='Total Emissions from coal combustion-related sources (tons)')
dev.off()
