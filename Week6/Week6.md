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



Basic folder manipulation
========================================================
class: small-code

folder manipulation:
* list.files()
* getwd()
* setwd()
* dir.create()
* dir.exists()

A first basic example
========================================================
class: small-code



A more advanced example
========================================================
class: small-code



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

Using the readr Package
========================================================
class: small-code



Reading data from MS Excel files
========================================================
class: small-code



Using Textual and Binary Formats for Storing Data
========================================================
class: small-code



Interfaces to the Outside World
========================================================
Data are read in using connection interfaces. Connections can be made to files (most common) or to other more exotic things.

- file, opens a connection to a file
- gzfile, opens a connection to a file compressed with gzip
- bzfile, opens a connection to a file compressed with bzip2
- url, opens a connection to a webpage

Github configuration
========================================================
In .gitconfig in %USERS%:
[http]
	proxy = http://proxy-fr.trading-lb.gdfsuez.net:8080
[https]
	proxy = https://proxy-fr.trading-lb.gdfsuez.net:8080


