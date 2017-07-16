NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

library(ggplot2)
NEISCC <- merge(NEI,SCC,by="SCC")
coalRelatedSource  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
coalRelatedSourceSubset <- NEISCC[coalRelatedSource, ]
coal_data <- with(coalRelatedSourceSubset, aggregate(Emissions, by = list(year), sum))
names(coal_data) <- c("year","Emissions")
png("plot4.png", width=480, height=480)
g <- ggplot(coal_data, aes(factor(year), Emissions/1000))+
	geom_bar(stat="identity")+
	labs(x="Years")+
	labs(y=expression('Total PM'[2.5]*' Emission (KiloTons)'))+
	labs(title=expression('Total PM'[2.5]*' Emission From Coal Combustion-Related Sources 1999-2008'))
print(g)
dev.off()
