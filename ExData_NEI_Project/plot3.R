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
png('plot3.png', width=640, height=480)
NEI %>% 
  group_by(year, type) %>%
  filter(fips=='24510') %>%
  summarise('Total_Emission'=sum(Emissions, na.rm=T)) %>% 
  ggplot(., aes(factor(year), Total_Emission, group=type, color=type)) + 
    geom_line(size=1) +
    theme_bw() +
    labs(title='Total Emissions in Baltimore City, MD by Type',
         x='Year', y='Total Emissions (tons)')
dev.off()
