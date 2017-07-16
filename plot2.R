NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

bal_data <- unique(subset(NEI, fips=="24510"))
bal_emdata <- with(bal_data, aggregate(Emissions, by = list(year), sum))
names(bal_emdata) <- c("year","Emissions")
png("plot2.png", width=480, height=480)
barplot(height=bal_emdata$Emissions/1000, names.arg=bal_emdata$year, 
	xlab="Years", 
	ylab=expression('Total PM'[2.5]*' Emission (KiloTons)'), 
	ylim = c(0,4),
	main=expression('Total PM'[2.5]*' Emissions From 1999 to 2008 in Baltimore City'))
dev.off()