# Load the libraries required for server
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
data <- read.csv("data/ANC_county.csv")
map <- st_read("data/fe_2007_39_county/County.shp")

# Load the candidemia data and read the sheets into a separate df
excel_file <- "data/candidemia-data.xlsx"
sheet_names <- excel_sheets(excel_file)

# Create a list to store the df for each sheet
data_list <- lapply(sheet_names, function(sheet){
  read_excel(excel_file, sheet = sheet)
})

# Dynamically assign df to sheet name
names(data_list) <- sheet_names

KNH_data <- data_list[["KNH"]] %>% rename("organism_isolated" = "Organism isolated")

# Server function
server <- function(input, output, session) {
  output$table <- renderDT(data)
  
  # output$timetrend <- renderDygraph({
  #   dataxts <- NULL
  #   counties <- unique(data$County)
  #   for (l in 1:length(counties)) {
  #     datacounty <- data[data$County == counties[l], ]
  #     dd <- xts(
  #       datacounty[, "Percentage"],
  #       as.Date(paste0(datacounty$year, "-01-01"))
  #     )
  #     dataxts <- cbind(dataxts, dd)
  #   }
  #   colnames(dataxts) <- counties
  #   
  #   dygraph(dataxts) %>%
  #     dyHighlight(highlightSeriesBackgroundAlpha = 0.2) -> d1
  #   
  #   d1$x$css <- "
  #     .dygraph-legend > span {display:none;}
  #     .dygraph-legend > span.highlight { display: inline; }
  #   "
  #   d1
  # })
  
  output$map <- renderLeaflet({
    # Add data to map
    datafiltered <- data
    map <- left_join(map, datafiltered, by = c("Name" = "County"))
    
    # Create leaflet
    pal <- colorBin("YlOrRd", domain = map$Percentage, bins = 7)
    
    labels <- sprintf("%s: %g", map$Name, map$Percentage) %>%
      lapply(htmltools::HTML)
    
    l <- leaflet(map) %>%
      addTiles() %>%
      addPolygons(
        fillColor = ~ pal(Percentage),
        color = "white",
        dashArray = "3",
        fillOpacity = 0.7,
        label = labels
      ) %>%
      leaflet::addLegend(
        pal = pal, values = ~Percentage,
        opacity = 0.7, title = NULL
      )
    l
  })
  
  # Create a pie chart
  output$piechart <- renderPlotly({
    # Create table for organism counts
    organism_counts <- KNH_data %>% 
      group_by(organism_isolated) %>% 
      summarise(count = n()) %>% 
      arrange(desc(count))
    
    # Create a pie chart
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
  
  # Observe changes to the project_year input and navigate to the appropriate tab
  observeEvent(input$project_year, {
    selected_year <- input$project_year
    if (selected_year == "Year 1") {
      updateNavbarPage(session, "nav", selected = "Data")
    } else if (selected_year == "Year 2") {
      updateNavbarPage(session, "nav", selected = "Plots")
    } else if (selected_year == "Year 3") {
      updateNavbarPage(session, "nav", selected = "Plots")
    }
  })
  
  # Observe changes to the project_year_plots input and navigate to the appropriate tab
  observeEvent(input$project_year_plots, {
    selected_year <- input$project_year_plots
    if (selected_year == "Year 1") {
      updateNavbarPage(session, "nav", selected = "Data")
    } else if (selected_year == "Year 2") {
      updateNavbarPage(session, "nav", selected = "Plots")
    } else if (selected_year == "Year 3") {
      updateNavbarPage(session, "nav", selected = "Plots")
    }
  })
}