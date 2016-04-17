## Question 5 & Task 5 : 
## How have emissions from motor vehicle sources changed from 1999 - 2008 in Baltimore City?

## Script Name: plot5.R
## Libraries needed:
library(ggplot2)
library(plyr)

## Pre-Step One: Set working directory
setwd("G:/RWrokingDirectory")

## Read Data from both files :  This will take some time, please be patient.

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Check size of both files data
length(NEI$Emissions)  # Output should be [1] 6497651
length(NEI$year)  # Output should be [1] 6497651

## subset the data 
# Assumptions: motor vehicles = On and check the levels for types of vehicles defined
mv.sourced <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
mv.sourcec <- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]

## subset the emissions from motor vehicles from NEI for Baltimore, MD
emMV.ba <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "24510",]

## find the emissions due to motor vehicles in Baltimore for every year
balmv.pm25yr <- ddply(emMV.ba, .(year), function(x) sum(x$Emissions))

#rename the column
colnames(balmv.pm25yr)[2] <- "Emissions"

## prepare to plot to png
png("plot5.png")
qplot(year, Emissions, data=balmv.pm25yr, geom="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))

dev.off()

## prepare to plot to markdown
qplot(year, Emissions, data=balmv.pm25yr, geom="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))


## Answer:
	# Starting with 1999, the \(PM_{2.5}\) emissions was just below 350, the levels fell sharply until 2002. 
	# From 2002 to 2005 the levels plateaued. 
	# Finally from 2005 to 2008, the \(PM_{2.5}\) emissions drop to below 100 \(PM_{2.5}\) emissions.





