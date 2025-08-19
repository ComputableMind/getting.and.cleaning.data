## Getting and Cleaning Data Module 1 Quiz ##

library(dplyr)

# Download a file from the web #

fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" # Idaho housing 2006 microsurvey
setwd("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data") # set working directory
download.file(fileURL,destfile = "C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data/housing.csv") # established path and named new .csv file in working directory
list.files("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data") # check that the new file now exists in the specified directory.
dateDownloaded <- date() # specify when the data was downloaded. The dataset could change in the future, leading to different results.
dateDownloaded

# Read the housing file in the current working directory #

housing.data<-read.table("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data/housing.csv", sep = ",", header = TRUE, quote="")

# Properties worth over $1,000,000 # 
# Property Value variable = VAL in metadata

sum(housing.data$VAL == 24, na.rm = TRUE) # turns the intergers into logical values (1 or 0), then adds. NA values are excluded.
