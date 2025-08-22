### Reading from HDF5 ###

# http//:www.hdfgroup.org/
  
# R HDF5 Package #

# install.packages("BiocManager") # be sure to install the bioconductor to manage bioconductor packages.
BiocManager::install("rhdf5") # HDF5 must be installed through bioconductor.


library(rhdf5)
created = h5createFile("example.h5") # an example h5 file was created for this tutorial.
created

# Create h5 file groups #

created = h5createGroup("example.h5","foo") # group created
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa") # sub-group in "foo" has now been created.
h5ls("example.h5") # like the ls() command but is listing the groups in the "example.h5" file.

# Write to groups #

A<-matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A") # we write object A (a matrix) to a particular h5 group ("foo").
B<-array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B,"scale")<-"liter"
h5write(B,"example.h5","foo/foobaa/B") # object B (an array) is written to the "foobaa" subgroup.
h5ls("example.h5") # h5ls() is displaying the h5 file contents and describing some aspects of the file.

# Write a data-set #

df <- data.frame(1L:5L,seq(0,1,length.out=5),
  c("ab","cde","fghi","a","s"),stringsAsFactors=FALSE)
h5write(df,"example.h5","df")
h5ls("example.h5")


# Reading data #

readA<-h5read("example.h5","foo/A")
readB<-h5read("example.h5","foo/foobaa/B")
readdf<-h5read("example.h5","df")
readA

# Writing and reading chunks #

h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1)) # writing elements to the first three rows and the first column in a data-set.
h5read("example.h5","foo/A")

# hdf5 can be used to optimize reading/writing from disc in R.
# See more in the rhdf5 tutorial at Bioconductor.