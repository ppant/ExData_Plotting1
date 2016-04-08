## R script for producing plot 1 -- Explorartory data analysis
## Author: Pradeep K. Pant
## Load CRAN modules 
library(downloader)
library(plyr);
library(knitr)
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
consumDataNew <- read.table("./projectData/household_power_consumption.txt",header =FALSE, sep = "\t") 

## We need to sub set data frame based on two dates 2007-02-01 and 2007-02-02 (for 1 day)
## To do that we need to create date/time objects
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")



