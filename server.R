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

# Load data
data <- read.csv("data/ANC_county.csv")
map <- st_read("data/fe_2007_39_county/County.shp")
pdf_path <- "data/baseline_ipc_IPCAF.pdf"

# Load Excel data and read sheets into a list
excel_file <- "data/candidemia-data.xlsx"
sheet_names <- excel_sheets(excel_file)
data_list <- lapply(sheet_names, function(sheet) read_excel(excel_file, sheet = sheet))
names(data_list) <- sheet_names
KNH_data <- data_list[["KNH"]] %>% rename("organism_isolated" = "Organism isolated")

# Server function
server <- function(input, output, session) {
  
  # Render DataTable
  output$table <- renderDT(data)
  
  # Render Leaflet map
  output$map <- renderLeaflet({
    datafiltered <- data
    map <- left_join(map, datafiltered, by = c("Name" = "County"))
    
    pal <- colorBin("YlOrRd", domain = map$Percentage, bins = 3)
    
    labels <- sprintf("%s: %g", map$Name, map$Percentage) %>%
      lapply(htmltools::HTML)
    
    leaflet(map) %>%
      addTiles() %>%
      addPolygons(
        fillColor = ~ pal(Percentage),
        color = "white",
        dashArray = "3",
        fillOpacity = 0.7,
        label = labels
      )
  })
  
  # Function to render PDF viewer
  output$pdfviewer <- renderUI({
    tags$iframe(style = "height:600px; width:100%", src = pdf_path)
  })
  
  # Observe changes to inputs and navigate tabs
  observeEvent(input$nav, {
    selected_tab <- input$nav
    if (selected_tab %in% c("ipc-year1", "tab5")) {
      updateNavbarPage(session, "nav", selected = "Data")
    } else {
      updateNavbarPage(session, "nav", selected = "Plots")
    }
  })
  
  # Function to create pie chart or bar graph
  create_chart <- function(type) {
    organism_counts <- KNH_data %>% 
      group_by(organism_isolated) %>% 
      summarise(count = n()) %>% 
      arrange(desc(count))
    
    if (type == "pie") {
      plot_ly(
        data = organism_counts,
        labels = ~organism_isolated,
        values = ~count,
        type = 'pie',
        textinfo = 'label+percent',
        insidetextorientation = 'radial'
      ) %>% 
        layout(title = "Distribution of organisms isolated")
    } else if (type == "bar") {
      plot_ly(
        data = organism_counts,
        x = ~organism_isolated,
        y = ~count,
        type = 'bar',
        textinfo = 'label+value'
      ) %>% 
        layout(
          title = "Distribution of organisms isolated",
          xaxis = list(title = "Organism Isolated"),
          yaxis = list(title = "Count")
        )
    }
  }
  
  # Render pie chart
  output$piechart <- renderPlotly({
    create_chart("pie")
  })
  
  # Render bar graph
  output$bargraph <- renderPlotly({
    create_chart("bar")
  })
  
}
