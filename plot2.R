## Question 2 & Task 2 : 
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

## Script Name: plot2.R
## Libraries needed: no special libraries needed for this part

## Pre-Step One: Set working directory
setwd("G:/RWrokingDirectory")

## Read Data from both files :  This will take some time, please be patient.

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Check size of both files data
length(NEI$Emissions)  # Output should be [1] 6497651
length(NEI$year)  # Output should be [1] 6497651

## obtain the subsets to plot
baltimore <- subset (NEI, fips == "24510")
total.PM25year <- tapply(baltimore$Emissions, baltimore$year, sum)

## plot prepare to plot to png
png("plot2.png")
plot(names(total.PM25year), total.PM25year, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "blue")

## Close the png file.
dev.off() 

## plot to markdown file
plot(names(total.PM25year), total.PM25year, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "blue")


## Answer : 
## The data indicate a sharp decline between 1999 and 2002. 
## A sharp increase occurred from 2002 to 2005. 
## Finally, another sharp decrease occurred from 2005 to 2008.