# Load the libraries
library(shiny)
library(sf)
library(DT)
library(dygraphs)
library(xts)
library(leaflet)
library(dplyr)
library(readxl)
library(plotly)

# Set working directory (adjust this path to your actual working directory)
setwd("~/WORK/CEMA/MAP-AMR/Dashboard/appdir")

# Load dummy data
data <- read.csv("data/data.csv")
map <- st_read("data/fe_2007_39_county/fe_2007_39_county.shp")

#load the candidemia data and read the sheets into a separate df
excel_file <- "data/candidemia-data.xlsx"
sheet_names <- excel_sheets(excel_file)

#create a list to store the df for each sheet
data_list <- lapply(sheet_names, function(sheet){
  read_excel(excel_file, sheet = sheet)
})

#dynamically assign df to sheet name
names(data_list) <- sheet_names

KNH_data <- data_list[["KNH"]] %>% rename("organism_isolated" = "Organism isolated")

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
  
  #create a pie chart
  output$piechart <- renderPlotly({
    #create table for organism counts
    organism_counts <- KNH_data %>% 
      group_by(organism_isolated) %>% 
      summarise(count = n()) %>% 
      arrange(desc(count))
    
    #create a pie chart
    plot_ly(
      data = organism_counts,
      labels = ~organism_isolated,
      values = ~count,
      type = 'pie',
      textinfo = 'label+percent',
      insidetextorientation = 'radial'
    ) %>% 
      layout(title = "Distribution of organisms isolated")
  })
}


