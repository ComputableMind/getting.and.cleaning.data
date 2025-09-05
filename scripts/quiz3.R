#### Quiz 3 ###

library(dplyr)
library(plyr)
library(readr)
library(tidyr)
if(!file.exists("data")){dir.create("data")}

# QUESTION 1 ###

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" # Idaho housing 2006 microsurvey
setwd("./data") # set working directory
download.file(fileURL,destfile = "housing.csv") # download in established path and .csv file in working directory
list.files("../data") 
dateDownloaded.housing <- date() # specify when the data was downloaded. The dataset could change in the future, leading to different results.
dateDownloaded.housing
housing.data<-read.table("../data/housing.csv", sep = ",", header = TRUE, quote="") # Read the housing file in the current working directory
View(housing.data)

# logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products.


agricultureLogical <- housing.data[(housing.data$ACR == 3 & housing.data$AGS == 6 ),]
  
which(agricultureLogical)        
        
        
