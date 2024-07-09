# Remove rows with invalid Longitude or Latitude values
hospital_summary <- hospital_summary[!is.na(as.numeric(hospital_summary$Longitude)) & !is.na(as.numeric(hospital_summary$Latitude)), ]

# Ensure Longitude and Latitude are numeric
hospital_summary$Longitude <- as.numeric(hospital_summary$Longitude)
hospital_summary$Latitude <- as.numeric(hospital_summary$Latitude)

# Render Leaflet map
output$map <- renderLeaflet({
  # Define color palette for number of Candida isolated
  pal <- colorBin("YlOrRd", domain = hospital_summary$Candida_isolated, bins = 3)
  
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
                fillColor = ~pal(hospital_summary$Candida_isolated),
                color = "white",
                dashArray = "3",
                fillOpacity = 0.7,
                highlightOptions = highlightOptions(
                  weight = 5,
                  color = "#666",
                  dashArray = "",
                  fillOpacity = 0.7,
                  bringToFront = TRUE
                )) %>%
    addMarkers(data = hospital_summary,
               lng = ~Longitude,
               lat = ~Latitude,
               label = labels,
               labelOptions = labelOptions(
                 style = list("font-weight" = "bold", padding = "8px"),
                 direction = "auto"
               ),
               icon = icons(
                 iconUrl = "http://leafletjs.com/examples/custom-icons/leaf-green.png",  # Example icon URL
                 iconWidth = 38, iconHeight = 95,
                 iconAnchorX = 22, iconAnchorY = 94
               ))
})
