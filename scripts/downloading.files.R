### Downloading Files ### 

# Checking for and creating directories #

# file.exists("directoryName") will check to if the directory exists.
# dir.creeate("directoryName") will create a directory if it doesn't exist.

# The following code checks for a "data" directory and creating it if it doesn't exist.

if (!file.exists("data")) {  # replace "data" with whatever file you want to check for.
    dir.create("data")
}

# Download a file from the web #

fileURL<- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile="./data/camera.csv", method="curl")
list.files("./data")

dateDownloaded<-date()
dateDownloaded

# Loading flat files - read.table()
# read.table() has more required elements than typical functions that read files.
cameraData<-read.table("./data/cameras.csv")
head(cameraData)
# try out read.table("./data/cameras.csv") to verify that more elements are needed to run code.
cameraData<-read.table("./data/cameras.csv",sep=",",header = TRUE)

