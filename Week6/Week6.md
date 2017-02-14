<style>
.small-code pre code {
  font-size: 1em;
}
</style>

Let's Code - Week 6
========================================================
author: Adrien ROUX
date: January, 2017
autosize: true

Getting Data In and Out of R
========================================================
class: small-code

Multiple use cases:
* data are available **on your computer locally** or through **local network**,
* data are available through **R repositories** => reference dataset,
* data is stored in outside world...: classic web or API.

But first of all, let us learn how to manipulate file and folder in R.

Basic file manipulation (1/)
========================================================
class: small-code

File manipulation in R:
* **file.create(..., showWarnings = TRUE)** : creates files with the given names if they do not already exist and truncates them if they do. They are created with the maximal read/write permissions.


```r
file.create("HelloWorld.txt", showWarnings = T)
```

```
[1] TRUE
```

```r
file.create(c("File1.txt", "File2.txt"), showWarnings = T)
```

```
[1] TRUE TRUE
```

* **file.exists(...)** :  returns a logical vector indicating whether the files exist. (Here *exists* is in the sense of the system's stat call: a file will be reported as existing only if you have the permissions needed.)


```r
file.exists("HelloWorld.txt")
```

```
[1] TRUE
```

```r
file.exists("Blabla.txt")
```

```
[1] FALSE
```

**NB:** the existence of a file does not imply that it is readable.

Basic file manipulation (2/)
========================================================
class: small-code

* **file.rename(from, to)** : 

```r
file.rename("File1.txt", "File1.csv")
```

```
[1] TRUE
```

* **file.copy(from, to, overwrite = recursive, recursive = FALSE, copy.mode = TRUE, copy.date = FALSE)** :

```r
file.copy(from="File2.txt", to="File3.txt")
```

```
[1] TRUE
```

Basic file manipulation (3/)
========================================================
class: small-code

* **file.remove(...)** : attempts to remove the files named in its argument. On Windows, *file* means a regular file and not, say, an empty directory.

```r
file.remove("File3.txt")
```

```
[1] TRUE
```

* **file.info(...)**,
* **file.access(...)**.

**NB:** All these methods are available in base package.

A first basic example
========================================================
class: small-code


```r
if(file.create("BasicExample.txt")) {
  fileConn <- file("BasicExample.txt")
  writeLines("First Basic Example", fileConn)
  close(fileConn)  
}

if(file.exists("BasicExample.txt")) {
  if(!file.copy("BasicExample.txt", "BasicExample2.txt")) {
    warning("file not properly copied!")
  }
}

if(file.exists("BasicExample.txt") & file.exists("BasicExample2.txt")) {
  if(!file.append("BasicExample.txt", "BasicExample2.txt")){
    warning("Appending data to file went wrong!")
  }
}

if(file.exists("BasicExample.txt")) {
  content <- readLines(fileConn <- file("BasicExample.txt"))
  print(content)
  close(fileConn)  
}
```

```
[1] "First Basic Example" "First Basic Example" "End of file"        
```

```r
if(file.exists("BasicExample.txt")) {
  if(!file.remove("BasicExample.txt")) {
    warning("File not properly removed!")
  }
}
```

Basic folder manipulation
========================================================
class: small-code

folder manipulation:
* **list.files()**: produce a character vector of the names of files or directories in the named directory.
* **getwd()**: returns an absolute filepath representing the current working directory of the R process.
* **setwd(**dir**)**: used to set the working directory to *dir*.
* **dir.create(**path**)**: creates a new directory.
* **dir.exists(**paths**)**: checks if a list of directories exist.

A first basic example
========================================================
class: small-code


```r
list.files()
```

```
 [1] "BasicExample2.txt" "data.R"            "File1.csv"        
 [4] "File2.txt"         "HelloWorld.txt"    "mydata.rda"       
 [7] "mydata.RData"      "Runners.csv"       "serial_x.txt"     
[10] "Test.xls"          "Test.xlsx"         "Week6.html"       
[13] "Week6.Rpres"       "y.R"              
```

```r
list.dirs()
```

```
[1] "."
```

Reading data into R
========================================================
class: small-code

There are a few principal functions reading data into R:

* **read.table**, **read.csv**, for reading tabular data ;
* **readLines**, for reading lines of a text file
* **source**, for reading in R code files (inverse of dump)
* **dget**, for reading in R code files (inverse of dput)
* **load**, for reading in saved workspaces
* **unserialize**, for reading single R objects in binary form.

There are of course, many R packages that have been developed to read in all kinds of other datasets, and you may need to resort to one of these packages if you are working in a specific area.


Reading data from MS Excel files
========================================================
class: small-code


```r
library(openxlsx)
df <- read.xlsx("Test.xlsx", sheet= 1, startRow= 1, colNames = T)
str(df)
```

```
'data.frame':	4 obs. of  2 variables:
 $ Name: chr  "Adrien" "Bob" "Adrien" "Bob"
 $ Dist: num  10 45 20 42
```

```r
library(readxl)
df <- read_excel("Test.xls", sheet= 1)
str(df)
```

```
Classes 'tbl_df', 'tbl' and 'data.frame':	4 obs. of  3 variables:
 $ Name: chr  "Adrien" "Bob" "Adrien" "Bob"
 $ Dist: num  10 45 20 42
 $ Unit: chr  "km" "km" "miles" "km"
```

Using the readr Package
========================================================
class: small-code

The readr package is recently developed by **Hadley Wickham** to deal with reading in large flat files quickly. The package provides replacements for functions like read.table() and read.csv(). The analogous functions in *readr* are **read_table()** and **read_csv()**. This functions are oven much faster than their *base* R analogues and provide a few other nice features such as progress meters.


```r
library(readr)
args(read_csv)
```

```
function (file, col_names = TRUE, col_types = NULL, locale = default_locale(), 
    na = c("", "NA"), quoted_na = TRUE, comment = "", trim_ws = TRUE, 
    skip = 0, n_max = Inf, guess_max = min(1000, n_max), progress = interactive()) 
NULL
```

```r
# n <- 1000000
# runners <- data.frame(Name= sample(c("Adrien", "Bob", "Janine"), size= n, replace= T),
#                       Distance= sample(c(10,45,20,70), size= n, replace= T),
#                       Unit= sample(c("km", "m", "miles"), size= n, replace= T))
# write.table(runners, file="Runners.csv", col.names = T, row.names =F, sep= ";")

runners <- read_csv2(file = "Runners.csv",
                     col_names = TRUE,
                     trim_ws = TRUE)

str(runners)
```

```
Classes 'tbl_df', 'tbl' and 'data.frame':	1000000 obs. of  3 variables:
 $ Name    : chr  "Janine" "Janine" "Adrien" "Janine" ...
 $ Distance: int  20 70 10 45 70 10 70 10 20 45 ...
 $ Unit    : chr  "km" "m" "miles" "miles" ...
 - attr(*, "spec")=List of 2
  ..$ cols   :List of 3
  .. ..$ Name    : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  .. ..$ Distance: list()
  .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
  .. ..$ Unit    : list()
  .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
  ..$ default: list()
  .. ..- attr(*, "class")= chr  "collector_guess" "collector"
  ..- attr(*, "class")= chr "col_spec"
```

Using Binary Formats for Storing Data
========================================================
class: small-code

One way to pass data around is by deparsing the R object with **dput()** and reading it back in (parsing it) using **dget()**.


```r
y <- data.frame(a = 1, b = "a")
dput(y, file="y.R")
new.y <- dget("y.R")
new.y
```

```
  a b
1 1 a
```

Multiple objects can be deparsed at once using the dump function and read back in using source.


```r
x <- "foo"
y <- data.frame(a = 1L, b = "a")

dump(c("x", "y"), file = "data.R")
```

The inverse of dump() is source()


```r
source("data.R")
str(y)
```

```
'data.frame':	1 obs. of  2 variables:
 $ a: int 1
 $ b: Factor w/ 1 level "a": 1
```

```r
str(x)
```

```
 chr "foo"
```

Using Binary Formats for Storing Data (1/.)
========================================================
class: small-code

The complement to the textual format is the binary format, which is sometimes necessary to use for efficiency purposes, or because there’s just no useful way to represent data in a textual manner. Also, with numeric data, one can often lose precision when converting to and from a textual format, so it’s better to stick with a binary format.

The key functions for converting R objects into a binary format are **save()**, **save.image()**, and **serialize()**. Individual R objects can be saved to a file using the **save()** function.


```r
a <- data.frame(x = rnorm(100), y = runif(100))
b <- c(3, 4.4, 1 / 3)
save(a, b, file = "mydata.rda")
load("mydata.rda")
```

If you have a lot of objects that you want to save to a file, you can save all objects in your workspace using the save.image() function.


```r
## Save everything to a file
save.image(file = "mydata.RData")

## load all objects in this file
load("mydata.RData")
```

**NB**: Using *.rda* extension when using **save()** and the *.RData* extension when using **save.image()** is not at all mandatory. This is just common practice, since .rda and .RData are fairly common extensions and are recognized by other software.

Using Binary Formats for Storing Data (2/.)
========================================================
class: small-code

The **serialize()** function is used to convert individual R objects into a binary format that can be communicated across an arbitrary connection. This may get sent to a file, but it could get sent over a network or other connection.

When you call serialize() on an R object, the output will be a raw vector coded in hexadecimal format.


```r
x <- list(1,2,3)
serialize(x, NULL)
```

```
 [1] 58 0a 00 00 00 02 00 03 03 02 00 02 03 00 00 00 00 13 00 00 00 03 00
[24] 00 00 0e 00 00 00 01 3f f0 00 00 00 00 00 00 00 00 00 0e 00 00 00 01
[47] 40 00 00 00 00 00 00 00 00 00 00 0e 00 00 00 01 40 08 00 00 00 00 00
[70] 00
```

```r
con <- file("serial_x.txt", "w")
serialize(x,con)
```

```
NULL
```

```r
close(con)

con <- file("serial_x.txt", "r")
x.new <- unserialize(con)
close(con)
x.new
```

```
[[1]]
[1] 1

[[2]]
[1] 2

[[3]]
[1] 3
```

If you want, this can be sent to a file, but in that case you are better off using something like save(). The benefit of the serialize() function is that it is the only way to perfectly represent an R object in an exportable format, without losing precision or any metadata.


Interfaces to the Outside World
========================================================
class: small-code

Data are read in using connection interfaces. Connections can be made to files (most common) or to other more exotic things.

- file, opens a connection to a file (Already done above...)
- gzfile, opens a connection to a file compressed with gzip
- bzfile, opens a connection to a file compressed with bzip2
- url, opens a connection to a webpage

A first example with an URL
========================================================
class: small-code






```
Error in url("http://www.jhsph.edu", "r") : cannot open the connection
```
