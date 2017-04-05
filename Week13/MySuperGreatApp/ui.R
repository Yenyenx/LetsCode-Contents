#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", 
             tabName = "dashboard", 
             icon = icon("dashboard")),
    menuItem("Tables", 
             icon = icon("table"), 
             tabName = "tables",
             badgeLabel = "cool", 
             badgeColor = "yellow")
  )
)
  

dashboardtab <- fluidRow(
  # box 1
  box(
    plotOutput("plot1")
  ),
  # box 2
  box(
    "Box content here", br(), "More box content",
    sliderInput("bins", "Nb of bins:", 1, 100, 50),
    textInput("text", "Text input:")
  ),
  # A static valueBox
  valueBox(10 * 2, 
           "New Orders", 
           icon = icon("thumbs-up", lib = "glyphicon"), 
           color="yellow")
)


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Dashboard tab content"),
            dashboardtab
    ),
    
    tabItem(tabName = "tables",
            h2("Tables tab content")
    )
  ) 
)  


# Define UI for application that draws a histogram
shinyUI(
  dashboardPage(skin = "purple",
                dashboardHeader(title = "Simple dashboard"),
                sidebar,
                body)
)
