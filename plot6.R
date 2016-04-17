## Question 6 & Task 6 : 
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## Script Name: plot6.R
## Libraries needed:
library(ggplot2)
library(plyr)
library(grid)

## Pre-Step One: Set working directory
setwd("G:/RWrokingDirectory")

## Read Data from both files :  This will take some time, please be patient.

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Check size of both files data
length(NEI$Emissions)  # Output should be [1] 6497651
length(NEI$year)  # Output should be [1] 6497651

## check the levels for types of vehicles defined
mv.sourced <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
mv.sourcec <- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]

## subset the data for Baltimore City
emMV.ba <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "24510", ]

## subset our data Los Angeles County
emMV.LA <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "06037", ]

## bind the data created in steps 3A and 3B
emMV.comb <- rbind(emMV.ba, emMV.LA)

## Find the emmissions due to motor vehicles in Baltimore (city) and Los Angeles County
tmveYR.county <- aggregate (Emissions ~ fips * year, data =emMV.comb, FUN = sum )
tmveYR.county$county <- ifelse(tmveYR.county$fips == "06037", "Los Angeles", "Baltimore")

## prepare to plot to png
png("plot6.png", width=750)
qplot(year, Emissions, data=tmveYR.county, geom="line", color=county) + ggtitle(expression("Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County, CA and Baltimore, MD")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))

dev.off()

## prepare to plot to markdown
qplot(year, Emissions, data=tmveYR.county, geom="line", color=county) + ggtitle(expression("Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County, CA and Baltimore, MD")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))


## Answer:
	## Comparisons of \(PM_{2.5}\) emissions between Baltimore, MD (a city in MD) and Los Angeles, CA (county). In this case, we are asked to compare a city to a county. In plot 6, we notice that Baltimore, MD starts considerably lower in terms of \(PM_{2.5}\) emissions. 
	
			# Baltimore, MD [city] (Red Line): 
					# The red line starts marginally above zero and below 1,000 \(PM_{2.5}\) emission values. 
					# Between 1999 and 2002, it slowly declines and remains nearly static between 2002 and 2008.


			# Los Angeles, CA [county] (Blue Line): 
					# The blue line starts significantly higher than the Baltimore, MD line. 
					# Starting with 1999, slightly below 4,000 \(PM_{2.5}\) emisions and steadily increases to 2005. 
					# The value of \(PM_{2.5}\) emissions for 2005 hits a peak at approximately 4,500 \(PM_{2.5}\) 
					# emision levels and then decreases between 2005 and 2008 with an ending value point of slightly above 4,000 \(PM_{2.5}\) emissions.



