# Exemple Week7

# SETUP YOUR PROXY SETTINGS BEFORE RUNNING THESE EXAMPLE.
# See MISC if you don't know how to proceed.

# SETUP Working directory OR pay attention to file path
setwd("./Week07")

# file.path is pretty convenient to build a path from fragments.
# remember that \ is a special character use \\ or /.


####################################################################
# Example 1
url <- paste0('https://opendata.paris.fr/explore/dataset/reseau-cyclable/download/',
              '?format=csv&timezone=Europe/Berlin',
              '&use_labels_for_header=true')
fileName <- 'reseau.cyclable.csv'
download.file(url, 
              destfile= fileName, 
              method= 'libcurl')

reseau.cyclable <- read.csv(fileName, header=T, sep=';')

# explore newly fetch data
names(reseau.cyclable)
nrow(reseau.cyclable)

####################################################################
# Example 2
library(readxl)

fileName <- 'reseau.cyclable.xls'
reseau.cyclable <- read_excel(fileName, sheet = 1, col_names = T)

names(reseau.cyclable)
str(reseau.cyclable)


####################################################################
# Example 3
library(RCurl)

url <- paste0('https://opendata.paris.fr/explore/dataset/reseau-cyclable/download/',
              '?format=csv&timezone=Europe/Berlin',
              '&use_labels_for_header=true')
y <- getURL(url)
reseau.cyclable <- read.csv(textConnection(y), 
                            header=T,
                            sep=';')

write.csv(reseau.cyclable[reseau.cyclable$ARRDT %in% 1:10,],
          file= 'reseau.cyclable.1to10.csv')