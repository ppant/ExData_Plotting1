## R script for producing plot 1 -- Explorartory data analysis
## Author: Pradeep K. Pant, ppant@cpan.org
## Load CRAN modules 
library(downloader)
library(plyr)
library(knitr)
library(lubridate)
## Stpe 1: Download the dataset and unzip folder

## Check if directory already exists?
if(!file.exists("./projectData")){
  dir.create("./projectData")
  }
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Check if zip has already been downloaded in projectData directory?
if(!file.exists("./projectData/household_power_consumption.zip")){
  download.file(Url,destfile="./projectData/household_power_consumption.zip",mode = "wb")
  }
## Check if zip has already been unzipped?
if(!file.exists("./projectData/household_power_consumption.txt")){
  unzip(zipfile="./projectData/household_power_consumption.zip",exdir="./projectData")
}

## Read the text file in R data structure 
## We'll be reading full data 
consumDataNew <- read.table("./projectData/household_power_consumption.txt", header =TRUE, sep = ";", stringsAsFactors=FALSE, dec=".",na.strings="?")

## We need to sub set data frame based on two dates 2007-02-01 and 2007-02-02 (for 1 day)
## ##DEBUG -- Test --- To do that we need to create date/time objects
# date1 <- as.Date("01/02/2007","%d/%m/%Y")
# time1 <- strptime("00:00:00", format = "%H:%M:%S")
# date2 <- as.Date("02/02/2007","%d/%m/%Y")
# time2 <- strptime("23:59:59", format = "%H:%M:%S")

## Once we have data frame from the above data start plotting using base plotting system
## Test logic 
#subsetconsumData<-subset(consumDataNew,((consumDataNew$V1 >= date1 & consumDataNew$V2 >= time1) & (consumDataNew$V1 <= date2 & consumDataNew$V2 <= time2)
##))
## subSetDataOndates <- consumDataNew[consumDataNew$Date %in% c("2007-02-01","2007-02-02") ,]

# Subsetting dates on range given in assignment
subSetDataOndates <- consumDataNew[consumDataNew$Date %in% c("1/2/2007","2/2/2007") ,]

## Remove full dataset
rm(consumDataNew)

## Test print
##str(subSetDataOndates)

## Make plotting parameter compatible
globalActivePower <- as.numeric(subSetDataOndates$Global_active_power)

## Set plot name and dimensions
png("plot1.png", width = 480, height = 480)

# Create histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()