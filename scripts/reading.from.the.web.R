### Reading from The Web ###

# Web-scraping: programatically extracting data from the HTML code of websites.
# Data-scraping may go against terms of service for some websites, so be sure  to check.
# Attempting to read too many pages too quickly can get your IP address blocked.
# Other issues could arise if you are web-scraping from webpages with proprietary information.

# Getting data off webpages - readLines() #
con<-url("https://scholar.google.com/citations?user=e0E4Lm8AAAAJ&hl=en&oi=sra") # allows the user to read lines from an HTML.
htmlCode<-readLines(con)
close(con)
htmlCode # the lines will come out unformatted.

# install.packages("rvest")

# Load the rvest package
library(rvest)

# Specify the URL
url <- "https://scholar.google.com/citations?user=e0E4Lm8AAAAJ&hl=en&oi=sra"

# Read the HTML content from the URL
html_page <- read_html(url) # a more modern way to parse the HTML.

# Use rvest's html_nodes and html_text functions with your XPath
title_text <- html_page %>% 
  html_nodes(xpath = "//title") %>% 
  html_text()

# Print the result
print(title_text)

# Find the new element using its class
citation_years <- html_page %>%
  html_nodes(".gsc_g_t") %>% 
  html_text()

# Print the result
print(citation_years)

# Get from the HTTR package #

library(httr); html2=GET(url)
content2 = content(html2,as="tex")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)

# Accessing websites with passwords #
pg2<-GET("http://httpbin.org/basic-auth/user/passwd",
  authenticate("user","passwd"))
pg2
names(pg2)

# Using handles #

google<-handle("http://google.com") # using handles save the authentication for multiple accesses across websites (e.g., Google).
pg1<-GET(handle=google,path="/")
pg2<-GET(handle=google,path="search")
# you will save yourself from constantly having to re-authenticate.