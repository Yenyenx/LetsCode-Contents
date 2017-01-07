getOption("repos")

local({
r <- getOption("repos")
r["Default"] <- "http://cran.rstudio.com"  
options(repos = r)
})

