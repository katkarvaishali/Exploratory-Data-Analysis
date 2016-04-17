## Question 1 & Task 1: 
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system only, make a plot showing the total PM2.5 emissions from all sources for each of the years 1999, 2002, 2005, and 2008.

## Script Name: plot1.R
## Libraries needed: no special libraries needed for this part

## Pre-Step One: Set working directory
setwd("G:/RWrokingDirectory")

## Read Data from both files :  This will take some time, please be patient.
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Check size of both files data
length(NEI$Emissions)  # Output should be [1] 6497651
length(NEI$year)  # Output should be [1] 6497651


total.pm25year <- tapply(NEI$Emissions, NEI$year, sum)

## Prepare plot1
png("plot1.png")
plot(names(total.pm25year), total.pm25year, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ 
     PM[2.5] ~ "Emissions by Year"), col="Purple")

dev.off()

## plot to markdown file
plot(names(total.pm25year), total.pm25year, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ 
     PM[2.5] ~ "Emissions by Year"), col="Purple")

## Answer:
## Yes, they sharply declined from 1999 to 2002. 
## Then a slower decline between 2002 and 2005. 
## Finally, they sharply declined from 2005 to 2008.
