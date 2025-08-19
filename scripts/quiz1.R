## Getting and Cleaning Data Module 1 Quiz ##

library(dplyr)
if(!file.exists("data")){dir.create("data")}

# Download a file from the web #

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" # Idaho housing 2006 microsurvey
setwd("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data") # set working directory
download.file(fileURL,destfile = "C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data/housing.csv") # established path and named new .csv file in working directory
list.files("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data") # check that the new file now exists in the specified directory.
dateDownloaded.housing <- date() # specify when the data was downloaded. The dataset could change in the future, leading to different results.
dateDownloaded.housing

# Read the housing file in the current working directory #

housing.data<-read.table("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data/housing.csv", sep = ",", header = TRUE, quote="")

# QUESTION 1: Properties worth over $1,000,000 # 
# Property Value variable = VAL in metadata

sum(housing.data$VAL == 24, na.rm = TRUE) # turns the integers into logical values (1 or 0), then adds. NA values are excluded.

# QUESTION 2: Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the “tidy data” principles does this variable violate? #

print("Tidy data has one variable per column; FES violates this") # segmentation, like "in LF" and "not in LF," are their own seperate variables.
# The total number of variables could be consolidated by this efficiency.

# QUESTION 3: Download the Excel spreadsheet on Natural Gas Acquisition Program #

fileURL2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL2,destfile = "C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data/gas.xlsx") # established path and named new .csv file in working directory
list.files("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data") # check that the new file now exists in the specified directory.
dateDownloaded.gas<-date()
dateDownloaded.gas

library(xlsx)
gas.data<-read.xlsx("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data/gas.xlsx",sheetIndex=1,header=TRUE) # different from read.table()

# QUESTION 3.1: Read rows 18-23 and columns 7-15 in R; assign to a variable called 'dat'. #

