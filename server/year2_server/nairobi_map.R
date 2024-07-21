# Remove rows with invalid Longitude or Latitude values
prospective_summary_data <- prospective_summary_data[!is.na(as.numeric(prospective_summary_data$Longitude)) & !is.na(as.numeric(prospective_summary_data$Latitude)), ]

# Ensure Longitude and Latitude are numeric
prospective_summary_data$Longitude <- as.numeric(prospective_summary_data$Longitude)
prospective_summary_data$Latitude <- as.numeric(prospective_summary_data$Latitude)

# Render Leaflet map
# Render Leaflet map
output$nairobi_map <- renderLeaflet({
  # Define color palette for number of Candida isolated
  pal <- colorBin("YlOrBr", domain = prospective_summary_data$Candida_isolated, bins = 3)
  
  # Define labels for hospitals showing screened patients and Candida isolated
  labels <- lapply(1:nrow(prospective_summary_data), function(i) {
    html <- paste0("<strong>", prospective_summary_data$Hospital[i], "</strong><br>",
                   "Screened patients: ", prospective_summary_data$Screened_patients[i], "<br>",
                   "Candida auris isolated: ", prospective_summary_data$Candida_isolated[i])
    htmltools::HTML(html)
  })
  
  # Render Leaflet map with shapefile and markers
  leaflet() %>%
    addTiles() %>%
    addPolygons(
      data = map,
      color = ~ifelse(Name == "Nairobi", "orange", "white"), # Change the color for Nairobi
      dashArray = "1",
      fillOpacity = ~ifelse(Name == "Nairobi", 0.3, 0), # Only fill Nairobi
      highlightOptions = highlightOptions(
        weight = 2,
        color = "#666",
        dashArray = "",
        fillOpacity = 0.1,
        bringToFront = TRUE
      )
    ) %>%
    addMarkers(
      data = prospective_summary_data,
      lng = ~Longitude,
      lat = ~Latitude,
      popup = labels,
      label = labels,
      labelOptions = labelOptions(
        style = list("font-weight" = "bold", padding = "8px"),
        direction = "auto"
      )
    ) %>%
    setView(lng = 36.8219, lat = -1.2921, zoom = 12) # Set the view to focus on Nairobi
  
})

