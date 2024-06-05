# Load the libraries
library(shiny)
library(sf)
library(DT)
library(dygraphs)
library(xts)
library(leaflet)
library(dplyr)

# Set working directory (adjust this path to your actual working directory)
setwd("~/MAKINI CODES/CEMA/MAP-AMR/Dashboard/appdir/appdir")

# Load data
data <- read.csv("data/data.csv")
map <- st_read("data/fe_2007_39_county/fe_2007_39_county.shp")

# Server function
server <- function(input, output) {
  output$table <- renderDT(data)
  
  output$timetrend <- renderDygraph({
    dataxts <- NULL
    counties <- unique(data$county)
    for (l in 1:length(counties)) {
      datacounty <- data[data$county == counties[l], ]
      dd <- xts(
        datacounty[, "cases"],
        as.Date(paste0(datacounty$year, "-01-01"))
      )
      dataxts <- cbind(dataxts, dd)
    }
    colnames(dataxts) <- counties
    
    dygraph(dataxts) %>%
      dyHighlight(highlightSeriesBackgroundAlpha = 0.2) -> d1
    
    d1$x$css <- "
      .dygraph-legend > span {display:none;}
      .dygraph-legend > span.highlight { display: inline; }
    "
    d1
  })
  
  output$map <- renderLeaflet({
    # Add data to map
    datafiltered <- data[data$year == 1980, ]
    map <- left_join(map, datafiltered, by = c("NAME" = "county"))
    
    # Create leaflet
    pal <- colorBin("YlOrRd", domain = map$cases, bins = 7)
    
    labels <- sprintf("%s: %g", map$NAME, map$cases) %>%
      lapply(htmltools::HTML)
    
    l <- leaflet(map) %>%
      addTiles() %>%
      addPolygons(
        fillColor = ~ pal(cases),
        color = "white",
        dashArray = "3",
        fillOpacity = 0.7,
        label = labels
      ) %>%
      leaflet::addLegend(
        pal = pal, values = ~cases,
        opacity = 0.7, title = NULL
      )
    l
  })
}


