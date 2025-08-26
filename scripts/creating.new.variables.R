### Creating New Variables ###

if(!file.exists(".data")){dir.create("./data")}
fileURL <- "https://raw.githubusercontent.com/DataScienceSpecialization/courses/refs/heads/master/03_GettingData/03_02_summarizingData/data/restaurants.csv"
download.file(fileURL,destfile="./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

# Creating sequences #

s1 <- seq(1,10,by=2); s1
s2 <- seq(1,10,length=3);s2
x <- c(1,3,8,25,100);seq(along = x) # an index that loops over the five values
# creating sequences are useful for indexing.

# Subsetting Variables #

restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# Creating binary variables #

restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode < 0)

# Creating Categorical Variables # 

restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups,restData$zipCode)

# Easier cutting #

library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode,g=4)
table(restData$zipGroups)

# Creating factor variables #

restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

class(restData$zcf)

# Levels of factor variables #

yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac <- factor(yesno, levels=c("yes","no"))
relevel(yesnofac,ref="yes")

as.numeric(yesnofac)

# Cutting produces factor variables #

library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)

# Using the mutate function #

library(Hmisc); library(plyr)
restData2 <- mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)

