# Here is a quick description of one way 
# to install SWIRL package and start learning
# R direclty within RStudio.

# SWIRL is a way to learn R interactively directly 
# in the IDE. It could be a good way to practice
# what we covered during our training sessions.

# NB: You need a working internet connection 
# to follow these steps.

# Download and install package from CRAN repository
install.packages("stringi")
install.packages("swirl")

# Load library to make its functions available to you, 
# i.e. in the current R session.
library(swirl)

# Launch SWIRL
swirl()

# SWIRL is a generic framework to learn R and expore
# R packages. Various courses are proposed. You may
# start with R programming: The basics of programming in R

# Once the content of the course is loaded, you can start
# learning, pause and come back later. SWIRL will keep tracks
# of your learning path.

# To get the description of the main SWIRL cmds that allow
# you to skip something or anything else, just type info()
info()

# to leave swirl, type bye()
bye()

# For the record, SWIRL is also developped on GitHub:
# https://github.com/swirldev/swirl_courses
