<style>
.small-code pre code {
  font-size: 1em;
}
</style>

Let's Code - Week 11
========================================================
author: Adrien ROUX
date: March, 2017
autosize: true

Shiny: web application for R
========================================================
class: small-code

**Shiny** by *RStudio* is a **web application framework for R**: 
<https://shiny.rstudio.com/>

During this session and the next ones, we will present and discuss :
* the basics to build a shiny application. 
* and then try to customize it : its reactions and its appearance.

This presentation is based on <https://shiny.rstudio.com/tutorial/>. I strongly encourage you to have a look. Its a great source of documentation and help.

Shiny: web application for R
========================================================
class: small-code

If you want a better idea of what shiny can allow you to do, take a look at <https://www.rstudio.com/products/shiny/shiny-user-showcase/>

**Note** that dashboards are a specific class of shiny web application: <https://rstudio.github.io/shinydashboard/>.

Shiny: Basics
========================================================
class: small-code

Every **shiny app** is maintained by a computer running R kernel: either a desktop computer with R installed, or a R server or a cloud.

**Shiny** is *just* another way to interface your R scripts, just like:
* basic R script executed in cmd prompt or .bat files,
* Rmd files or R notebook,
* R packages.

Each type of interface serve a different purpose. 

**Note** that prior to work with shiny, you need to *learn R*.


Understand the architecture of a shiny app
========================================================
class: small-code

Let's look a first simple shiny app. 

1. This app is a web page. It runs under your web browser, e.g. Google Chrome.
1. The app is made of components built with R, e.g. a plot.
1. Some parts of the web page are interactive, e.g. drop-down menus or numeric input.
1. Behind this web page, there is a computer - with R installed - serving it.
1. This web page is just a nice end user interface for your R code for people with no coding knowledge to *play* with.

Understand the architecture of a shiny app
========================================================
class: small-code

To design a shiny app, you need to write 2 components:

* a user interface (**UI**): this will be a web page in html code generated using R commands.  It is defined in a source script named **ui.R**
* a set of server instructions that will tell the computer running R what to do when the user interacts with the web page.

Understand the architecture of a shiny app
========================================================
class: small-code

Let's have a look at the simplest shiny app ever done: **Hello, Shiny!**


```r
# make sure shiny package is already installed before...
library(shiny)

#the server: it basically does nothing!
server <- function(input, output, session) { } 

#the user interface: does not much either: just shows some text...
ui <- basicPage("Hello, Shiny! This is a real Shiny app")

## this launches your app
## I won't do it within my slides.
# shinyApp(ui = ui, server = server) 
```

Copy/paste the code above in an R script and run it and see what happens.
Do **NOT** use IE. Use firefox or Chrome instead as shiny uses features that IE does not have.

A slightly more advanced app
========================================================
class: small-code

Here is a nicer **Hello, Shiny!** application.

**ui.R**:

```r
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Hello Shiny!"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
```

<!--html_preserve--><div class="container-fluid">
<h2>Hello Shiny!</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="bins">Number of bins:</label>
<input class="js-range-slider" id="bins" data-min="1" data-max="50" data-from="30" data-step="1" data-grid="true" data-grid-num="9.8" data-grid-snap="false" data-keyboard="true" data-keyboard-step="2.04081632653061" data-drag-interval="true" data-data-type="number" data-prettify-separator=","/>
</div>
</form>
</div>
<div class="col-sm-8">
<div id="distPlot" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
</div>
</div>
</div><!--/html_preserve-->

A slightly more advanced app
========================================================
class: small-code

The server.R script contains the instructions that your computer needs to build your app. Here is the server.R script for the Hello Shiny example.

**server.R**

```r
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot

  output$distPlot <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
})
```

A slightly more advanced app
========================================================
class: small-code

**Notice** that most of the script is wrapped in a call to *renderPlot*.
Your R session will be busy while the Hello Shiny app is active, so you will not be able to run any R commands. R is monitoring the app and executing the app's reactions. To get your R session back, hit escape or click the stop sign icon (found in the upper right corner of the RStudio console panel).


You can create a Shiny app by making a new directory and saving a ui.R and server.R file inside it. Each app will need its own unique directory.

You can run a Shiny app by giving the name of its directory to the function runApp. For example if your Shiny app is in a directory called my_app, run it with the following code:


```r
library(shiny)
if(interactive()) {
  runApp("my_app")  
}
```

A slightly more advanced app
========================================================
class: small-code

Note: runApp is similar to read.csv, read.table, and many other functions in R. The first argument of runApp is the filepath from your working directory to the app's directory. The code above assumes that the app directory is in your working directory. In this case, the filepath is just the name of the directory.


```r
library(shiny)
if(interactive()){
  runApp('./Week11/MyGreatApp')  
}
```


Let's practice
========================================================
class: small-code

Have a look at the example presented in the shiny online gallery available at <https://shiny.rstudio.com/gallery/>. 

Once you clic on one example, you can access the code for **ui.R** and **server.R**. I suggest you start with simple examples and then add more complexity.

**HAVE FUN!**
