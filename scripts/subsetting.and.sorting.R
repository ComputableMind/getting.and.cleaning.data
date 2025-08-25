### Subnsetting and Sorting ###


 # Subsetting: a quick review #

set.seed(13435)
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x <- x[sample(1:5),]; x$var2[c(1,3)] = NA
x

x[,1] # specifying column
x[,"var1"] # specifying column by name
x[1:2,"var2"] # specifying rows and column

# Logical "and"s and "or"s #

x[(x$var1 <= 3 & x$var3 > 11),] # both conditions must be met for rows for variable subsets.
x[(x$var1 <= 3 | x$var3 > 15),] # at least one of the conditions must be met.

# Dealing with missing values #

x[which(x$var2 > 8),] # NA's will not be returned

# Sorting #

sort(x$var1) # sort values in increasing order; the variable is obviously specified.
sort(x$var1,decreasing=TRUE) # sorting in decreasing order is specified.
sort(x$var2,na.last=TRUE) # specify that all NA values go at the end of a list.

# Ordering #

x[order(x$var1),] # the data-frame is ordered by a particular variable. The values in variable 1 are going in ascending order.
x[order(x$var1,x$var3),] #  if there are multiple values in var1 that are the same, then the values in var3 will go by ascending order within those repeating var1 values.

# Ordering with plyr #

libary(plyr)
arrange(x,var1) # ordering based on a specified variable is now simplified from the plyr package.

arrange(x,desc(var1))

# Adding rows and columns #

x$var4 <- rnorm(5) # assigning a vector of the same dimension to the existing data-frame.s
x

y <- cbind(x,rnorm(5)) # similar method to adding a new column.
# If rnorm(5) was placed before x in the cbind function, then new column would be added to the left-most side.
y





