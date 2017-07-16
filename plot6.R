NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltimore_data <- unique(subset(NEI, fips=="24510" & type=="ON-ROAD"))
baltimore_data$fips <- "Baltimore City"
la_data <- unique(subset(NEI, fips=="06037" & type=="ON-ROAD"))
la_data$fips <- "Los Angeles"
mergeddata <- rbind(baltimore_data, la_data)
names(mergeddata)[1] <- "city"
png("plot6.png", width=480, height=480)
g <- ggplot(mergeddata, aes(factor(year), Emissions/1000, fill=city))+
	geom_bar(stat="identity")+
	facet_grid( .~city)+
	labs(x="Years")+
	labs(y=expression('Total PM'[2.5]*' Emission (KiloTons)'))+
	labs(title=expression('Total PM'[2.5]*' Emission From Motor Vihecle Between Baltimore and Los Angeles'))
print(g)
dev.off()