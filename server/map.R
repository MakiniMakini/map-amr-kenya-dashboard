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
      fillColor = ~pal(Percentage),
      color = "white",
      dashArray = "3",
      fillOpacity = 0.7,
      label = labels
    )
})
