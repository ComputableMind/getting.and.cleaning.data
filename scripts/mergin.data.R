### Merging Data ####

# Peer review data #

if(!file.exists("./data")) {dir.create("./data")}
fileURL1 <- "https://raw.githubusercontent.com/DataScienceSpecialization/courses/refs/heads/master/03_GettingData/03_05_mergingData/data/reviews.csv"
fileURL2 <- "https://raw.githubusercontent.com/DataScienceSpecialization/courses/refs/heads/master/03_GettingData/03_05_mergingData/data/solutions.csv"
download.file(fileURL1,destfile="./data/reviews.csv")
download.file(fileURL2,destfile="./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews,2)

# Merging data - merge() #

# Merges data frames
# Important paraeters: x,y,by,by.x,by.y,all

head(solutions,2)
name(reviews)
names(solutions)

mergeData <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)

# Default - merge all common column names #

intersect(names(solutions),names(review))
mergedData2 <- merge(review,solutions,all=TRUE)
head(mergedData2)

# Using join in the plyr package #

# Faster, but less full featured - defaults to left join, see help file for me.

df1 <- data.frame(id=sample(1:10),x=rnorm(10))
df2 <- data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id)

# If you have multiple data frames #

df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10),y=rnorm(10))
df3 <- data.frame(id=sample(1:10),z=rnorm(10))
join_ll(dfList)

