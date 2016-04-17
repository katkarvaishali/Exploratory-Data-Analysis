Assignment 2 : Exploratory Data Analysis Project

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008.

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. 
In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. 
Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). 
For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. 
The data that used for this assignment are for 1999, 2002, 2005, and 2008.

Downloadig the Data : 

The data for this assignment are available from the course web site as a single zip file:

Data for Peer Assessment [29Mb] file need to be downloaded for the same.

The zip file contains two files:
Source_Classification_Code.rds
summarySCC_PM25.rds

The fields used in above two files are as below ;
fips: A five-digit number (represented as a string) indicating the U.S. county
SCC: The name of the source as indicated by a digit string (see source code classification table)
Pollutant: A string indicating the pollutant
Emissions: Amount of PM2.5 emitted, in tons
type: The type of source (point, non-point, on-road, or non-road)
year: The year of emissions recorded


Questions and Tasks for Exploratory Analysis :

For each question/task below mentioned a single plot is displayed.

Task 1 : 
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
Using the base plotting system, a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008 is to be displayed.

R code file name for this task = Plot1.R
PNG File name for this task : 

Task 2 :
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (6064\color{red}{\verb|fips == 24510|}6064) from 1999 to 2008? 
Using the base plotting system a plot answering this question is displayed.

Task 3 : 
Of the four types of sources indicated by the 6064\color{red}{\verb|type|}6064 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
Which have seen increases in emissions from 1999–2008? 

Using the ggplot2 plotting system a plot is displayed to answer this question.

Task 4 :
Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

Task 5 :
How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

Task 6 : 
Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (6064\color{red}{\verb|fips == 06037|}6064). 
Which city has seen greater changes over time in motor vehicle emissions?

Plots Preparation Details :

For each plot -
1.  Plot is displayed in PNG file
2.  A separate R code file is prepared for each task above mentioned and for each PNG file
plotThe code file included code for reading the data so that the plot can be fully reproduced
plotThe code which creates the PNG file is also included in the code file
3.  The same R code is available in the text box for peer review for the assessment.

