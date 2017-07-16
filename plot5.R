NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltimore_data <- unique(subset(NEI, fips=="24510" & type=="ON-ROAD"))
png("plot5.png", width=480, height=480)
g <- ggplot(baltimore_data, aes(factor(year), Emissions/1000))+
	geom_bar(stat="identity")+
	labs(x="Years")+
	labs(y=expression('Total PM'[2.5]*' Emission (KiloTons)'))+
	labs(title=expression('Total PM'[2.5]*' Emission From Motor Vehicle Sources 1999-2008 in Baltimore'))
print(g)
dev.off()