<style>
.small-code pre code {
  font-size: 1em;
}
</style>

Let's Code - Week 3
========================================================
author: Adrien ROUX
date: January, 2017
autosize: true

Any feedback on last Week
========================================================
class: small-code

1. Missing installs: R, Rstudio, Git...
1. Questions: did you try some of the material discussed in Week 1 or 2 ?
1. Any open issues ?


Control Strutures
========================================================
class: small-code

Control structures in R allow you to control the flow of execution of a series of R expressions. 

Basically, they allow you to put some **logic** into your R code, rather than just always executing the same R code every time. 

They allow you to respond to inputs or to features of the data and execute different R expressions accordingly.

**Example 1:** If (user = "Adrien") 
**Then** do this...
**Else** do that...

**Example 2:** **Repeat** doing this **until** a specific condition is met, (e.g. a user presses the keyboard).


Commonly used control structures
========================================================
class: small-code

Commonly used control structures are:
* **if** and **else**: testing a condition and acting on it
* **for**: execute a loop a *fixed* number of times
* **while**: execute a loop, while a *condition* is true
* **repeat**: execute an *infinite* loop (must break out of it to stop)
* **break**: break the execution of a loop
* **next**: skip an interation of a loop

You need to get familiar with terms such as **condition**, **loop**, **infinite loop**, which will regularly appear.

Control Strutures : If and Else (1/.)
========================================================
class: small-code

The **if-else** combination is probably the most commonly used control structure. It allows you to test a condition and act on it depending on whether it’s true or false.


```r
x <- "Hi everyone"
#x <- "Hello Bob"
#x <- 1

if(is.character(x)) {
  # do something...
  x <- gsub("everyone", "all", x, ignore.case = T)
} else if(is.numeric(x)) {
  x <- x + 1
} else {
  # do nothing at all.
}

x
```

```
[1] "Hi all"
```

The **else** clause is not necessary. You could have a series of if clauses that always get executed if their respective conditions are true.

Control Strutures : For Loops (1/.)
========================================================
class: small-code

**For loops** are pretty much the most common and only looping construct that you will need in R. While you may occasionally find a need for other types of loops, in my experience, I’ve found very few situations where a for loop wasn’t sufficient.


```r
x <- c("a", "b", "c", "d")
for(j in 1:4) {
  print(x[j]) 
}
```

```
[1] "a"
[1] "b"
[1] "c"
[1] "d"
```

In R, for loops take an **iterator variable** (here *j*) and assign it successive values from a sequence (here *1:10*) or an object like a list, vector, etc.

**NB:** *seq_along* is comonly used instead of *1:4* and **For loops** can very well be nested.

Control Strutures : While Loops (1/.)
========================================================
class: small-code

**While loops** begin by testing a **condition**. If it is *true*, then they execute the *loop body*. **Once the loop body is executed, the condition is tested again**, and so forth, until the condition is false, after which the loop exits.


```r
count <- 0
while(count < 5) {
  print(count); count <- count + 1
}
```

```
[1] 0
[1] 1
[1] 2
[1] 3
[1] 4
```

While loops can result in **infinite** loops if not written properly. **Use with care!**

Sometimes there will be more than one condition in the test. They are always evaluated from left to right.

Control Strutures : Repeat Loops (1/.)
========================================================
class: small-code

**repeat** initiates an **infinite loop** right from the start. These are not commonly used in statistical or data analysis applications but they do have their uses. The only way to exit a repeat loop is to call **break**.

One possible paradigm might be in an iterative algorithm where you may be searching for a solution and you don’t want to stop until you’re close enough to the solution.


```r
iMax <- 3; i <- 1

repeat {
  if(i > iMax) {
    break
  } else {
    print(i)
    i <- i + 1
  }
}
```

```
[1] 1
[1] 2
[1] 3
```


Control Strutures : Next, Break (1/.)
========================================================
class: small-code

**next** is used to skip an iteration of a loop.


```r
sum <- 0
for(i in 1:100) {
  if(i <= 20) {
    next
  } else {
    sum = sum + 1
  }
}
sum
```

```
[1] 80
```

**break** is used to exit a loop, regardless of what iteration the loop may be on.


```r
sum <- 0
for(i in 1:100) {
  sum <- sum + 1
  if(i > 20) {
    break
  }
}
sum
```

```
[1] 21
```


Functions (1/.)
========================================================
class: small-code

Writing functions is a **core activity of an R programmer**. It represents the key step of the transition from a mere *user* to a developer who creates new functionality for R. 

Functions are used : 
* **to encapsulate a sequence of expressions** that need to be executed numerous times, perhaps under slightly different conditions. 
* **to write code that must be shared** with others or the public.

The writing of a function allows a developer to : 
* create an interface to the code with an **explicit set of parameters**.
* create an abstraction of the code to potential users (**Black Box**). *This abstraction simplifies the users lives* because it relieves them from having to know every detail of how the code operates.

Functions in R (2/.)
========================================================
class: small-code

Functions in R can be treated much like any other R object. Importantly, they can be:
* **passed as arguments** to other functions. This is very handy for the various apply funtions, like lapply() and sapply().
* **nested**, so that you can define a function inside of another function.

ENOUGH TALKING!

**Your First Function:**
Functions are defined using the function() directive and are stored as R objects just like anything else. In particular, they are R objects of class **function**.

Here’s a simple function that takes no arguments and does nothing.

```r
f <- function() {
## This is an empty function
}
```

Functions in R (2/.)
========================================================
class: small-code


```r
## Functions have their own class
class(f)
```

```
[1] "function"
```

```r
## Execute function
f()
```

```
NULL
```

Not very interesting, but it’s a start. The next thing we can do is create a function that actually has a non-trivial function body.


```r
x <- 1:10
f <- function(x){ x+1 } #Note how using twice x for variable and function defintion does not matter at all.
sapply(x,f)
```

```
 [1]  2  3  4  5  6  7  8  9 10 11
```

Functions in R (3/.)
========================================================
class: small-code

A slighly more advanced use of functions:


```r
f <- function(Operation) {
  # basic requirements for the function to work
  stopifnot(is.character(Operation))
  
  if(Operation == "ADD") {
    return(function(x,y){x+y}) 
  } else if(Operation == "DIFF") {
    return(function(x,y){x-y})
  } else {
    return(function(x,y){})
  }
}

## Let's try it out
g <- f("ADD"); g(1,2)
```

```
[1] 3
```

```r
g <- f("DIFF"); g(1,2)
```

```
[1] -1
```

Arguments matching (1/)
========================================================
class: small-code

Calling an R function with arguments can be done in a variety of ways. R functions arguments can be matched **positionally** or **by name**. (Positional matching just means that R assigns the first value to the first argument, the second value to second argument, etc.)


```r
str(rnorm)
```

```
function (n, mean = 0, sd = 1)  
```

```r
mydata <- rnorm(100,2,1)
sd(mydata, F)
```

```
[1] 0.9578559
```

```r
sd(na.rm = FALSE, x = mydata)
```

```
[1] 0.9578559
```

Arguments matching (2/)
========================================================
class: small-code

You can mix positional matching with matching by name. When an argument is matched by name, it is “taken out” of the argument list and the remaining unnamed arguments are matched in the order that they are listed in the function definition.


```r
sd(na.rm= F, mydata)
```

```
[1] 0.9578559
```

```r
args(sd)
```

```
function (x, na.rm = FALSE) 
NULL
```

I don’t recommend messing around with the order of the arguments too much, since it can lead to some confusion.

Lazy Evaluation
========================================================
class: small-code

Arguments to functions are evaluated lazily, so they are evaluated only as needed in the body of the function.


```r
f <- function(a,b) {
  a^2
}
f(45)
```

```
[1] 2025
```

This function never actually uses the argument b, so calling *f(45)* will not produce an error because the 45 gets positionally matched to a. **This behavior can be good or bad**: It’s common to write a function that doesn’t use an argument and not notice it simply because R never throws an error.

The ... Argument
========================================================
class: small-code

There is a special argument in R known as the ... argument, which indicate a variable number of arguments that are usually passed on to other functions. The ... argument is often used when extending another function and you don’t want to copy the entire argument list of the original
function.


```r
myplot <- function(x, y, type= "l", ...) {
  plot(x, y, type= type, ...)
}
```

**Arguments Coming After the ... Argument:** any arguments that appear after ... on the argument list must be named explicitly and cannot be partially matched or matched positionally.


```r
args(paste)
```

```
function (..., sep = " ", collapse = NULL) 
NULL
```

Summary
========================================================
class: small-code

**Control structures** like **if**, **while**, and **for** allow you to control the flow of an R program:
* Infinite loops should generally be avoided, even if they are theoretically correct.
* Control structures mentioned here are primarily useful for writing programs; for commandline interactive work, the “apply” functions are more useful.

**Functions** can be defined using the **function()** directive and are assigned to R objects just like any other R object:
* It can be defined with named arguments with default values,
* Its arguments are specified by name or by position in the argument list,
* It always returns the last expression evaluated in the function body,
* A variable number of arguments can be specified using the special ... argument in a function definition.


Assignement for next week
========================================================
class: small-code


1. Write a function on your own.
1. Practice if-else control structure
1. Practice for control structure

**Next week:** How to get data in and out of R. 
