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
#the goal is to find the emissions from motor vehicles in Baltimore City and LA County
#to achieve this goal, I will only collect the data from the SCC Short.Name column that match both
#vehicle

vehicle <- SCC[grep('[Vv]ehicle', SCC$Short.Name),]
SCC_vehicle <- droplevels(vehicle$SCC)

png('plot6.png', width=640, height=480)
data <- NEI %>% 
  filter(SCC %in% SCC_vehicle & fips %in% c('24510','06037')) %>% 
  group_by(fips, year) %>%
  summarise('Total_Emission'=sum(Emissions, na.rm=T)) 
data$Relative_Emission_Change <- unlist(tapply(data$Total_Emission, data$fips, function(x) x/x[1]))  #calculate relative change in emission
location <- c('06037'='LA County, CA', '24510'='Baltimore City, MD')     #create lookup vector for locations
data$Location <- location[as.character(data$fips)]                       #create column with location name

ggplot(data, aes(factor(year), Relative_Emission_Change, fill=Location)) + 
  geom_bar(stat='identity', position='dodge') +
  theme_bw() +
  labs(title='Comparison:Relative change in Emissions from motor vehicle sources \nin Baltimore City, MD vs. Los Angeles County, CA',
       x='Year', y='Relative Emissions')
dev.off()
