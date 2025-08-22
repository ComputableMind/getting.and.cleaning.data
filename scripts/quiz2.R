### Getting and Cleaning Data Quiz 2 ###

# QUESTION 1: Register an application with the Github API. Access the application to get information
# on the the following repository: "https://api.github.com/users/jtleek/repos"
# Use the data to find the time that the datasharing repo was created. 
# What time was it create? 

library(dplyr) # must use dplyr to use the dplyr-specific functions and to pipe the commands.
library(httr)

# Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "Ov23li84P79rM0PNETkX", # replace key
                   secret = "0f245db9c2a425e51a884731b935e5e12801e2dd" # replace key
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(endpoint = httr::oauth_endpoints("github"),
                               app = myapp)

# 4. Requesting the Github API to gather info from Jeff repositories.
request <- httr::GET(url = "https://api.github.com/users/jtleek/repos",
                     config = httr::config(token = github_token))

# Checking the GET. If status == 200 means, then fetching was successful.
request$status_code

# Converting into R object from a JSON file.
df_req <- content(x = request, as = "parsed")

# Number of Repositories in Jeff Leek Github
length(df_req)

# List of repositories initialization
repos_names <- vector()
data_creation <- vector()

# Loop to gather the repo's names.
for (i in 1:length(df_req)) {
  repos_names <- append(repos_names, df_req[[i]]$name)
  data_creation <- append(data_creation, df_req[[i]]$created_at)
}

# Filtering the datasharing repository and its data creation.
data.frame(cbind(repos_names, data_creation)) %>% filter(repos_names =="datasharing")


# QUESTION 2:The sqldf package allows for execution of SQL commands on R data frames.
# We will use the sqldf package to practice the queries we might send with the
# dbSendQuery command in RMySQL. 

# install.packages(sqldf)
library(sqldf)

# Download the file
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
              destfile = "./data/american_community_survey.csv")

# Load the CSV file.
acs <- read.csv(file = "./data/american_community_survey.csv")

# the following command will select only the data for the probability weights pwgtp1 with ages less than 50:
sqldf("select pwgtp1 from acs where AGEP <50")

# QUESTION 3: Using the same data frame you created in the previous problem, 
# what is the equivalent function to unique(acs$AGEP)

x<-unique(acs$AGEP)

y<-sqldf("select distinct AGEP from acs")

x == y # TRUE

# QUESTION 4: How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
# http://biostat.jhsph.edu/~jleek/contact.html
# (Hint: the nchar() function in R may be helpful)

htmlUrl <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(htmlUrl)
close(htmlUrl)
head(htmlCode)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))


# QUESTION 5: Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
# (Hint this is a fixed width file format)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
SST <- read.fwf(fileUrl, skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
head(SST)
sum(SST[,4]) # 32426.7


