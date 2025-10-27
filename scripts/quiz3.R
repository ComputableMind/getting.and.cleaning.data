############ Quiz 3 ############

library(dplyr)
library(plyr)
library(readr)
library(tidyr)
library(data.table)

if(!file.exists("data")){dir.create("data")} # do not use this script if you have already set "data" as your working directory.

### QUESTION 1 ###

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" # Idaho housing 2006 microsurvey
setwd("./data") # set working directory
download.file(fileURL,destfile = "housing.csv") # download in established path and .csv file in working directory
list.files("../data") 
dateDownloaded.housing <- date() # specify when the data was downloaded. The dataset could change in the future, leading to different results.
dateDownloaded.housing
housing.data <- read.table("../data/housing.csv", sep = ",", header = TRUE, quote="") # Read the housing file in the current working directory
View(housing.data)

# logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products.

agricultureLogical <- housing.data[which(housing.data$ACR == 3 & housing.data$AGS == 6 ),]
agricultureLogical    

### QUESTION 2 ###
  
# Using the jpeg package read in the following picture of your instructor into R
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)


library(jpeg)

fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
setwd("./data") # set working directory, if necessary
download.file(fileURL2, destfile = "jeff.jpg", mode = "wb") # "wb" literally means "writing binary." JPEG is a binary file, which is why the mode parameter must be explicitly set to "wb".
list.files("../data")
dateDownloaded.jeff <- date()
dateDownloaded.jeff
img <- readJPEG("jeff.jpg", native = TRUE) # the paramter, mode, also works in readJPEG. 
str(img)
quantile(img, probs = c(0.3,0.8))



### QUESTION 3 ###

# Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv


# Load the educational data from this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?
  
# Original data sources: 
# http://data.worldbank.org/data-catalog/GDP-ranking-table
# http://data.worldbank.org/data-catalog/ed-stats


fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL3,destfile = "GDP.csv") # download in established path and .csv file in working directory

fileURL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL4, destfile = "education.csv")

setwd("./data") # set working directory

list.files("../data")

GDP <- fread(fileURL3, skip = 5, nrows = 190, select = c(1,2,4,5), col.names = c("CountryCode", "Rank", "Economy", "Total")) 
GDP

EDU <- fread(fileURL4)
EDU

GDP_EDU <- merge(GDP, EDU, by = 'CountryCode')

GDP_EDU <- GDP_EDU %>% 
  arrange(desc(Rank))

View(GDP_EDU)

nrow(GDP_EDU) # 189 matching IDs
GDP_EDU[13,c(1,5)] # 13th rank is St. Kitts and Nevis



### QUESTION 4 ###

# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

GDP_EDU[, Rank := as.numeric(Rank)]

rank_avg <- GDP_EDU[
  `Income Group` %in% c("High income: OECD", "High income: nonOECD"),
  .(Avg_Rank = mean(Rank, na.rm = TRUE)),
  keyby = `Income Group`
]

rank_avg

### QUESTION 5 ### 

# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

answer <- GDP_EDU[`Income Group` == "Lower middle income" & 
                    Rank <= quantile(Rank, 0.2, na.rm = TRUE), .N]
answer   # 5



















