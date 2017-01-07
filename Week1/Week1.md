<style>
.small-code pre code {
  font-size: 1em;
}
</style>

Let's Code - Week 1
========================================================
author: Adrien ROUX
date: January, 2017
autosize: true

Getting started with R (1/.)
========================================================

R works on pretty much every platform available, including the widely available Windows, Mac OS X, and Linux systems. To get started you basically need 2 things :

1. **R kernel**, e.g. R-3.3.0. It is open source. Usually you start to install the base kernel and then add packages on the fly when they are needed. On my computer, the kernel is installed in C:\Program Files\Microsoft\MRO\R-3.3.0.

1. The **IDE** (**I**ntegrated **D**evelopment **E**nvironment) of your choice : I highly recommend **RStudio**, which is widely used and is free as long as you're fine with the desktop version. Non-free server versions of RStudio exist too and are necessary for more advanced/commercial use of R.

Links for download: 


Getting started with R (2/.)
========================================================

In XXI century, coding often happens in group/team. Sharing (public or restricted) often allows you to leverage on other's work. Other developers may send you suggestions so you benefit from other's ideas or experience. 

Sharing is easily done through IDE using a source control software, e.g. **Git**.

**NB:** Please make sure the installs are perfomed in the order specified above. Otherwise some  manipulations are required to allow the IDE to work as expected.

Usually for professional developers, code is shared over private repositories stored on the company's servers. As we are beginners and the content of our code is not sensitive, we are going to use **GitHub.com**. 

Link to **GitHub**: <https://github.com/Yenyenx/LetsCode-Contents>


R Nuts and Bolts (1/.)
========================================================
class: small-code

Enough talking... Let's start coding. As we go through some exercices, I'll take some time to give you more background on **R**, my favorite IDE **RStudio**, **Git** and **GitHub**.

A first basic example (at least to test that what we installed so far is working well).

Declare and instanciate a variable :

```r
x <- 1; y = 10
```


```r
print(x);
```

```
[1] 1
```

x is equal to 1 and y equals 10.

R Nuts and Bolts (2/.)
========================================================
class: small-code

You should become familiar with:
- the help embedded in the IDE: **?function.name**, e.g. *?strsplit*,
- warnings and error messages sent by the **R** console,
- 


Quick review of the basic algebra operations : +, -, *, / and first manipulation with *string*


```r
2 * x / 2.0 - 0.0
```

```
[1] 1
```


```r
str1 <- "Default_Name_0101"
strsplit(str1, "_")
```

```
[[1]]
[1] "Default" "Name"    "0101"   
```

A more advanced example (1/.)
========================================================
class: small-code

R base package comes with standard datasets often used to present method behavior and test packages. Here is the *cars* dataset.


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

A more advanced example (2/.)
========================================================
class: small-code

Here is the simplest way to present a graph. Even when coding, taking some time to briefly look at the data using a quickly generated graph is a good practice.

![plot of chunk unnamed-chunk-6](Week1-figure/unnamed-chunk-6-1.png)

R objects (1/.)
========================================================
class: small-code

R has 5 basic or **atomic** classes of objects:
- character
- numeric (or real numbers)
- integer
- complex
- logical (True/False)

```r
x <- 'hello'
x <- 1 # If you explicitly want an integer, you need to specify the L suffix. So entering 1 in R gives you a numeric object; entering 1L explicitly gives you an integer object
x <- 1L
x <- 1 + 1i #so be careful when using i...
x <- 2 < 1;
```

R objects (2/.)
========================================================
class: small-code

The most basic type of R object is a **vector**. Empty vectors can be created with the **vector()** function. There is really only one rule about vectors in R : **A vector can only contain objects of the same class.**


```r
x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## logical
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex
```


```r
x <- vector("numeric", length = 10)
x
```

```
 [1] 0 0 0 0 0 0 0 0 0 0
```

But of course, like any good rule, there is an exception : **list**. A list is represented as a vector but can contain objects of different classes. That’s usually why we use them.

R objects (3/.)
========================================================
class: small-code

R objects can have **attributes**, which are like *metadata* for the object. These metadata can be very useful in that they help to describe the object. 

For example, column names on a data frame help to tell us what data are contained in each of the columns. Some examples of R object attributes are:

- **names**, **dimnames**
- **dimensions** (e.g. matrices, arrays),
- **class** (e.g. integer, numeric),
- **length**,
- other user-defined attributes/metadata.

Attributes of an object (if any) can be accessed using the **attributes()** function. Not all R objects contain attributes, in which case the attributes() function returns **NULL**.

R objects : Mixing objects (4/.)
========================================================
class: small-code

There are occasions when different classes of R objects get mixed together. Sometimes this happens by accident but it can also happen on purpose. So what happens with the following code?


```r
y <- c(1.7, "a") ## character
y <- c(TRUE, 2) ## numeric
y <- c("a", TRUE) ## character
```

In each case above, we are mixing objects of two different classes in a vector. But remember that the only rule about vectors says this is not allowed. When different objects are mixed in a vector, **coercion** occurs so that every element in the vector is of the same class.

In the example above, we see the effect of **implicit coercion**. What R tries to do is find a way to represent all of the objects in the vector in a reasonable fashion. Sometimes this does exactly what you want and… sometimes not.

R objects : Mixing objects (5/.)
========================================================
class: small-code

Objects can be explicitly coerced from one class to another using the **as.*** functions, if available.


```r
x <- 0:6;
as.numeric(x)
```

```
[1] 0 1 2 3 4 5 6
```

```r
as.logical(x)
```

```
[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

```r
as.character(x)
```

```
[1] "0" "1" "2" "3" "4" "5" "6"
```

Design of the R system
========================================================

R functionality is divided into 2 conceptual parts:

- The base R system contains, among other things, the base package which is required to run R and contains the most fundamental functions.

- The other packages contained in the “base” system include utils, stats, datasets, graphics, grDevices, grid, methods, tools, parallel, compiler, splines, tcltk, stats4.

- There are also “Recommended” packages: boot, class, cluster, codetools, foreign, KernSmooth, lattice, mgcv, nlme, rpart, survival, MASS, spatial, nnet, Matrix.

Make sure the list of repositories (e.g. **CRAN** or others) is up-to-date, trustworthy (See Misc folder for a short script to add an url to the list of repos).

List
========================================================
class: small-code

Lists are a special type of vector that can contain elements of different classes. Lists are an important data type in R and you should get to know them well. Lists, in combination with the various *apply* functions discussed later, make for a powerful combination.

Lists can be explicitly created using the list() function, which takes an arbitrary number of arguments.


```r
x <- list(1, "a", TRUE, 1 + 4i)
```

We can also create an empty list of a prespecified length with the vector() function.


```r
x <- vector("list", length = 5)
```



Matrices (1/2)
========================================================
class: small-code

Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of length 2 (number of rows, number of columns).


```r
m <- matrix(nrow = 2, ncol = 3)
m
```

```
     [,1] [,2] [,3]
[1,]   NA   NA   NA
[2,]   NA   NA   NA
```

```r
dim(m)
```

```
[1] 2 3
```

```r
attributes(m)
```

```
$dim
[1] 2 3
```

Matrices (2/2)
========================================================
class: small-code

Matrices are constructed column-wise, so entries can be thought of starting in the “upper left” corner and running down the columns.


```r
m <- matrix(1:6, nrow = 2, ncol = 3)
m
```

```
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```


```r
m <- 1:10
dim(m) <- c(2, 5)
m
```

```
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
```

Matrices can be created by column-binding or row-binding with the **cbind()** and **rbind()** functions.

Factors
========================================================
class: small-code

Factors are used to represent **categorical data** and can be unordered or ordered. One can think of a factor as an integer table where each integer has a label.

Using factors with labels is **better** than using integers because factors are self-describing. E.g. Having a variable that has values “Male” and “Female” is better than a variable that has values 1 and 2.


```r
x <- factor(c("yes", "yes", "no", "yes", "no"))
table(x)
```

```
x
 no yes 
  2   3 
```

```r
unclass(x)
```

```
[1] 2 2 1 2 1
attr(,"levels")
[1] "no"  "yes"
```


Missing values
========================================================
class: small-code

Missing values are denoted by **NA** or **NaN** for undefined mathematical operations.

* **is.na()** is used to test objects if they are NA
* **is.nan()** is used to test for NaN
* NA values have a class also, so there are integer NA, character NA, etc.
* A NaN value is also NA but the converse is not true


```r
x <- c(1, 2, NA, 10, 3)
is.na(x)
```

```
[1] FALSE FALSE  TRUE FALSE FALSE
```

```r
is.nan(x)
```

```
[1] FALSE FALSE FALSE FALSE FALSE
```

Data frames
========================================================
class: small-code

Data frames are used to store tabular data in R. They are a **very important** type of object in R and are used in a variety of statistical modeling applications.

Unlike matrices, data frames can store different classes of objects in each column. Matrices must have every element be the same class (e.g. all integers or all numeric).

In addition to column names, indicating the names of the variables or predictors, data frames have a special attribute called row.names which indicate information about each row of the data frame.


```r
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
```

```
  foo   bar
1   1  TRUE
2   2  TRUE
3   3 FALSE
4   4 FALSE
```

Names (1/2)
========================================================
class: small-code

R objects can have names, which is very useful for writing readable code and self-describing objects. Here is an example of assigning names to an integer vector.


```r
x <- 1:3
names(x)
```

```
NULL
```

```r
names(x) <- c("New York", "Los Angeles", "Chicago"); x["New York"]
```

```
New York 
       1 
```

Lists can also have names, which is often **very useful**.


```r
x <- list("Los Angeles" = 1, Boston = 2, London = 3); x$Boston
```

```
[1] 2
```

Names (2/2)
========================================================
class: small-code


```r
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
```

```
  c d
a 1 3
b 2 4
```

```r
m["a","c"]
```

```
[1] 1
```

Summary
========================================================

**There are a variety of different built-in data types in R**. We have reviewed the following:

* atomic classes: numeric, logical, character, integer, complex
* vectors, lists
* factors
* missing values
* data frames and matrices

All R objects can have attributes that help to describe what is in the object. Perhaps the most useful attribute is **names**, such as column and row names in a data frame, or simply names in a vector or list. 

**Attributes** like dimensions are also important as they can modify the behavior of objects, like turning a vector into a matrix.

Assignement for next week
========================================================

* Finish installing R, RStudio and Git on your laptop,
* Create Github account and *fork* **Let's Code** repo,
* Write an R script (e.g. **Assignement1.R**) where you create a data.frame with missing values and at least 1 factor. Commit the file under your Github repo so I can check it out, if you need me too.

