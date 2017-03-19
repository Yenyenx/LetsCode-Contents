# https://rstudio.github.io/leaflet/
  
library(RCurl)
options(RCurlOptions = list(proxy = "https://proxy-fr.trading-lb.gdfsuez.net", 
                            proxyport = 8080))
library(httr)
set_config(
  #use_proxy(url="18.91.12.23", port=8080, username="",password="password")
  use_proxy(url="proxy-fr.trading-lb.gdfsuez.net", port=8080)
)

library(devtools)
devtools::install_github('rstudio/leaflet')

library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map


