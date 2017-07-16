NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

emdata <- with(NEI, aggregate(Emissions, by = list(year), sum))
names(emdata) <- c("year","Emissions")
png("plot1.png", width=480, height=480)
barplot(height=emdata$Emissions/1000, names.arg=emdata$year, 
	xlab="Years", 
	ylab=expression('Total PM'[2.5]*' Emission (KiloTons)'), 
	ylim = c(0,8000),
	main=expression('Total PM'[2.5]*' Emissions From 1999 to 2008'))
dev.off()