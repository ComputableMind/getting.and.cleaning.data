### Reshaping data ###

# Start with reshaping #

library(reshape2)
head(mtcars)

# Melting data frames #
# melting a df basically means converting a wide df to a long df.
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

# Casting data frames #
# Reformatting the dataset into different shapes.
cylData <- dcast(carMelt,cyl ~ variable)
cylData

cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

# Averaging Values #

head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)
# tapply basically means to apply along the index of a particular function.


# Another way -split #

spIns <- split(InsectsSprays$count,InsectsSprays$spray) # split up for different lists.
spIns

# Another way -apply #

sprCount <- lapply(spIns,sum) # apply along a list.
sprCount

# Another way -combine #

unlist(sprCount) # undo lists.
sapply(spIns,sum)

# Another way -plyr package #

library(plyr)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

# Creating a new variable #

spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)

