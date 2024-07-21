# Function to create charts
create_summary_pps_2 <- function(type) {
  if (type == "bargraph_summary_prospective") {
    # Convert data frame to long format for plotting
    long_data <- summary_data_pps_2 %>%
      tidyr::gather(key = "Hospital", value = "Count", -Organism)
    
    # Define custom colors for each organism
    colors <- RColorBrewer::brewer.pal(n = nrow(summary_data_pps_2), name = "Set3")
    
    plot_ly(
      data = long_data,
      x = ~Organism,
      y = ~Count,
      color = ~Hospital,
      colors = colors,
      type = 'bar',
      text = ~paste("Count: ", Count),
      textposition = 'auto'
    ) %>%
      layout(
        title = "Candida Summary",
        barmode = 'group',
        xaxis = list(title = "Organism"),
        yaxis = list(title = "Count"),
        height = 400,  # Adjust height as needed
        width = 800    # Adjust width as needed
      ) %>%
      config(displayModeBar = FALSE)
  }
  
  else if (type == "bargraph_invasives_pps2") {
    # Convert data frame to long format for plotting
    long_data <- invasives_data_pps_2 %>%
      tidyr::gather(key = "Hospital", value = "Count", -Invasive)
    
    # Define custom colors for each invasive procedure
    colors <- RColorBrewer::brewer.pal(n = nrow(invasives_data_pps_2), name = "Set3")
    
    plot_ly(
      data = long_data,
      x = ~Invasive,
      y = ~Count,
      color = ~Hospital,
      colors = colors,
      type = 'bar',
      text = ~paste("Count: ", Count),
      textposition = 'auto'
    ) %>%
      layout(
        title = "Candida patients Invasives",
        barmode = 'group',
        xaxis = list(title = "Invasive Procedure"),
        yaxis = list(title = "Count"),
        height = 400,  # Adjust height as needed
        width = 800    # Adjust width as needed
      ) %>%
      config(displayModeBar = FALSE)
  }
  
  
}

# Create the bar graph output using the function
output$pps_2_bargraph <- renderPlotly({
  create_summary_pps_2("bargraph_summary_prospective")
})
# invasives
output$pps_2_invasives <- renderPlotly({
  create_summary_pps_2("bargraph_invasives_pps2")
})




