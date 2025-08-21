### Reading from MySQL ###

# Use the following link to connect to UCSC's genome bioinformatics database:
# https://genome.ucsc.edu/goldenPath/help/mysql.html

# The database is hosted on a MySQL server, and you can connect to it using the RMySQL package.
library(RMySQL)
library(DBI)

# Establish a connection to the MySQL database using information from the following command:
# mysql --user=genome --host=genome-mysql.soe.ucsc.edu -A -P 3306

ucscDb<-dbConnect(MySQL(), user="genome",
                  host="genome-mysql.soe.ucsc.edu") # assigns a connection; each connection should be assigned a handle (e.g, ucscDb)
result<-dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb); # This line applies a query to the database. The semi-colon belongs at the end of the code.
# It is important to disconnect from the database when finished collecting or analyzing data, hence the "dbDisconnect(ucscDb)" code.

result # lists all the databases available from the host MySQL address (UCSC's)

# Connecting to hg19 and listing tables #

hg19<-dbConnect(MySQL(),user="genome",db="hg19", # a specific database is now being accessed from UCSC's MySQL server.
                host="genome-mysql.soe.ucsc.edu") # the MySQL server.
allTables<-dbListTables(hg19) # look at all the tables that exist in the database.
length(allTables) # Tells us the number of tables that are in the database.
allTables[1:5] # The specified column variable names are specified in a given table with this code.

# Each data-set corresponds to its own file

dbListFields(hg19,"affyU133Plus2") # I can view the variables or contents that are specified in 1) a specified database, and 2) a field specified within that database.

dbGetQuery(hg19, "select count(*) from affyU133Plus2") # The MySQL command specifies the number of different rows in the specified dataset.

# Read from the table #

affyData<-dbReadTable(hg19,"affyU133Plus2") # pass the database we are interested in, then the table name we are interested in getting data from.
head(affyData)

# Select a specific subset #

query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3") # This MySQL command selects a subset of data from a dataset.
affyMis<-fetch(query); quantile(affyMis$misMatches) # fetch data and determine the quantiles of the data.

affyMisSmall<-fetch(query,n=10);dbClearResult(query); # we can specify that we only want to see a small bit of the data by using n=

dim(affyMisSmall)


# Don't forget to close the connection #

dbDisconnect(hg19)