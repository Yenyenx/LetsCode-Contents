#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # mon contenu
  fluidRow(
      column(width = 4,
             plotOutput("img")
             ),
      column(width = 3, 
             offset = 2,
             textInput("FilePath","File Path:"),
             actionButton("Go", "Go!"),
             verbatimTextOutput("Log")
             )
  )
)
)

