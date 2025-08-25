### Summarizing Data ###

if(!file.exists("./scripts")){dir.create("./scripts")}
# fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD" # broken link
# download.file(fileURL,destfile="./scripts/restaurants.csv",method = "curl") # cannot use code because of broken link
restData <- read.csv("C:/Users/bradp/Documents/data.science.specialization_coursera/getting.and.cleaning.data/data/restaurants.csv")

# Look at a bit of the data #

head(restData,n=3)
tail(restData,n=3)

# Make summary #

summary(restData)

# More in depth information #

str(restData)

# Quantiles of quantitative variables #

quantile(restData$councilDistrict,na.rm=TRUE)

# Make table #

table(restData$zipCode,useNA="ifany")
table(restData$councilDistrict,restData$zipCode)

# Check for missing values #

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode)

# Row and column sums #

colSums(is.na(restData))
all(colSums(is.na(restData))==0)

# Values with specific characteristics #

table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))

# Values with specific characteristics #

restData[restData$zipCode %in% c("21212","21213"),]

# Cross tabs #

data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
summary(DF)

# Cross tabs #

xt <- xtabs(Freq ~ Gender + Admit,data=DF)
# Freq is the variable displayed in the table. The frequency is broken down by a variable (Gender and admission)
xt

# Flat tables #

warpbreaks$replicate <- rep(1:9, len = 54)
xt <- xtabs(breaks~.,data-warpbreaks)
ftable(xt) # all the tables are summarized into one compact table.

# Size of a data set #

fakeData <- rnorm(1e5)
object.size(fakeData) # we want to see the byte size.
print(object.size(fakeData),units="Mb") # We can specify the scale of the byte size.