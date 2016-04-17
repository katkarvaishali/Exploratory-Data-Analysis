## Question 4 & Task 4 : 
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Script Name: plot4.R
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

## subset the data for only coal-combustion
coalcomb.scc <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Instutional - Coal", 
  "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - 
  Coal"))


## comparisons so that we didn't ommit anything weird
coalcomb.scc1 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))

nrow(coalcomb.scc) 	#evaluate: rows 35
nrow(coalcomb.scc1) #evaluate: rows 91

## set the differences 
dif1 <- setdiff(coalcomb.scc$SCC, coalcomb.scc1$SCC)
dif2 <- setdiff(coalcomb.scc1$SCC, coalcomb.scc$SCC)

length(dif1)	#6
length(dif2)	#62

## Take union of the two difference sets
coalcomb.codes <- union(coalcomb.scc$SCC, coalcomb.scc1$SCC)
length(coalcomb.codes) #97

## subset again for what we want
coal.comb <- subset(NEI, SCC %in% coalcomb.codes)

## get the PM25 values as well
coalcomb.pm25year <- ddply(coal.comb, .(year, type), function(x) sum(x$Emissions))

#rename the column
colnames(coalcomb.pm25year)[3] <- "Emissions"

## prepare to plot to png
png("plot4.png")
qplot(year, Emissions, data=coalcomb.pm25year, color=type, geom="line") + stat_summary(fun.y = "sum", fun.ymin = "sum", fun.ymax = "sum", color = "purple", aes(shape="total"), geom="line") + geom_line(aes(size="total", shape = NA)) + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~ "Emissions by Source Type and Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))

dev.off()

## prepare to plot to markdown
qplot(year, Emissions, data=coalcomb.pm25year, color=type, geom="line") + stat_summary(fun.y = "sum", fun.ymin = "sum", fun.ymax = "sum", color = "purple", aes(shape="total"), geom="line") + geom_line(aes(size="total", shape = NA)) + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~ "Emissions by Source Type and Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))


## Answer:
	## Total (Purple Line): 
		# From the plot, we see that the purple line for total slightly declines from 1999 to 2002. 
		# From 2002 to 2005 the line has a marginal increase. 
		# Finally, from 2005 to 2008, the overall trend has a sharp decrease.

	## Point (Blue Line): 
		# From the plot, we see that the blue line for point is slightly similar in shape to the total purple line. 
		# From 1999 to 2002 the point blue line has a steeper decrease. 
		# From 2002 to 2005, the point blue line increases only slightly. 
		# Finally, from 2005 to 2008, the overall trend has a sharp decrease.

	## Nonpoint (Red Line): 
		# This line is remarkably different from the other two lines. 
		# From 1999 to 2002 it has an increase (although it starts from a much lower level than the other two lines at just above zero). 
		# From 2002 to 2005 it remains nearly level and does not appear to increase or decrease much. 
		# Finally, from 2005 to 2008, another symmetrical decrease occurs to end just below the initial levels for the 1999 values.





