NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)
baltimore_data <- unique(subset(NEI, fips=="24510"))
png("plot3.png", width=480, height=480)
g <- ggplot(baltimore_data, aes(factor(year), Emissions/1000))+
	geom_bar(stat="identity")+
	theme_bw()+
	facet_grid(.~type)+
	labs(x="Years")+
	labs(y=expression('Total PM'[2.5]*' Emission (ktons)'))+
	labs(title=expression('Total PM'[2.5]*' Emission by Type of Source from 1999-2008 in Baltimore City'))
print(g)
dev.off()