## Question 3 & Task 3 : 
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Script Name: plot3.R
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
baltimore <- subset (NEI, fips == "24510")
typePM25.year <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))

## Rename the col: Emissions
colnames(typePM25.year)[3] <- "Emissions"

## prepare to plot to png
png("plot3.png")
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))

dev.off()

## prepare to plot to markdown
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))


## Answer:
	## Nonpoint (green line): 
		#	From the plot, we see that nonpoint (green line) sharply decreased from 1999 to 2002. 
		#	It remained steady from 2002 to 2005 with 1,500 Total \(PM_{2.5}\) emissions. 
		#	Finally, a slight decrease occurred between 2005 and 2008 from 1,500 Total \(PM_{2.5}\) emissions.

	## Point (purple line): 
		#	From the plot, we see that the point (purple line) slightly increased from 1999 to 2002. 
		#	It then sharply increased in \(PM_{2.5}\) emissions from 2002 to 2005. 
		#	Finally, from 2005 to 2008, the \(PM_{2.5}\) emissions sharply decreased.

	## Onroad (blue line): 
		#	From the plot, we see that the onroad (blue line) slightly decreased from 1999 to 2002. 
		#	It remained approximately steady from 2002 to 2005 and continued this trend from 2005 to 2008. 
		#	In comparison to the nonroad values, this over all trend was lower compared to the nonroad values.

	## Nonroad (red line): 
		#	From the plot, we see that the nonroad (red line) followed the same path as the onroad values only slightly higher in \(PM_{2.5}\) emissions values. 
		#	Slightly decreased from 1999 to 2002. 
		#	It remained approximately steady from 2002 to 2005 and continued this trend from 2005 to 2008.



