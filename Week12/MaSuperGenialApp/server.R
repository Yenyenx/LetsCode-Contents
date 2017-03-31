# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/


library(shiny)
library(jpeg)
source('usefulFunctions.R')


# Define server logic 
shinyServer(function(input, output) {
  
    output$img <- renderImage({
      
      # filepath <- "./img/R.jpg"
      # if(file.exists(filepath)){
      #   img1 <- readJPEG(filepath)
      #   plot_jpeg(filepath)  
      # }
      # else
      # {
      #   plot(1:10)
      # }
      
      plot(1:10)
    })
  
  
    output$Log <- renderText({
      getwd()
      })
  
    # output$image <- renderImage({
    #   input$newimage
    #   
    #   # Get width and height of image output
    #   width  <- session$clientData$output_image_width
    #   height <- session$clientData$output_image_height
    #   
    #   # Write to a temporary PNG file
    #   outfile <- tempfile(fileext = ".png")
    #   
    #   png(outfile, width=width, height=height)
    #   library(imager)
    #   im<-load.image("https://www.google.fr/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjNoL2awoDTAhWEWxoKHWtPDGAQjRwIBw&url=https%3A%2F%2Fwww.bonduelle.fr%2F&psig=AFQjCNGTAe3fNFqHnvfe9tdMYfq_aWbADA&ust=1491041938580382")
    #   plot(im)
    #   
    #   dev.off()
    #   
    #   # Return a list containing information about the image
    #   list(
    #     src = outfile,
    #     contentType = "image/png",
    #     width = width,
    #     height = height,
    #     alt = "This is alternate text"
    #   )
    # })
    # 
    # output$image_clickinfo <- renderPrint({
    #   cat("Click:\n")
    #   str(input$image_click)
    # })
   
})