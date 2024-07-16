# Remove rows with invalid Longitude or Latitude values
hospital_summary <- hospital_summary[!is.na(as.numeric(hospital_summary$Longitude)) & !is.na(as.numeric(hospital_summary$Latitude)), ]

# Ensure Longitude and Latitude are numeric
hospital_summary$Longitude <- as.numeric(hospital_summary$Longitude)
hospital_summary$Latitude <- as.numeric(hospital_summary$Latitude)

# Render Leaflet map
# Render Leaflet map
output$map <- renderLeaflet({
  # Define color palette for number of Candida isolated
  pal <- colorBin("YlOrBr", domain = hospital_summary$Candida_isolated, bins = 3)
  
  # Define labels for hospitals showing screened patients and Candida isolated
  labels <- lapply(1:nrow(hospital_summary), function(i) {
    html <- paste0("<strong>", hospital_summary$Hospital[i], "</strong><br>",
                   "Screened patients: ", hospital_summary$Screened_patients[i], "<br>",
                   "Candida isolated: ", hospital_summary$Candida_isolated[i])
    htmltools::HTML(html)
  })
  
  # Render Leaflet map with shapefile and markers
  leaflet() %>%
    addTiles() %>%
    addPolygons(data = map,
                color = "orange",
                dashArray = "1",
                fillOpacity = 0.3,
                highlightOptions = highlightOptions(
                  weight = 2,
                  color = "#666",
                  dashArray = "",
                  fillOpacity = 0.8,
                  bringToFront = TRUE
                )) %>%
    addMarkers(data = hospital_summary,
               lng = ~Longitude,
               lat = ~Latitude,
               popup = labels,
               label = labels,
               labelOptions = labelOptions(
                 style = list("font-weight" = "bold", padding = "8px"),
                 direction = "auto"
               ))
})

