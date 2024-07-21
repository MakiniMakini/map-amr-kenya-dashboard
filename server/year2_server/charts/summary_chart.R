# Function to create charts
create_summary_prospective <- function(type) {
  if (type == "bargraph_summary_prospective") {
    # Convert data frame to long format for plotting
    long_data <- summary_data_prospective %>%
      tidyr::gather(key = "Category", value = "Count", -Hospital)
    
    # Reorder the Category factor levels
    long_data$Category <- factor(long_data$Category, levels = c("Total", "Negatives", "Positives"))
    
    # Define custom colors for each category
    colors <- c("Total" = "#2c3e50", "Negatives" = "#1f77b4", "Positives" = "#B2182B")
    
    plot_ly(
      data = long_data,
      x = ~Hospital,
      y = ~Count,
      color = ~Category,
      colors = colors,
      type = 'bar',
      text = ~paste(Category, ": ", Count),
      textposition = 'auto'
    ) %>%
      layout(
        barmode = 'group',
        xaxis = list(title = "Hospital"),
        yaxis = list(title = "Count"),
        height = 400,  # Adjust height as needed
        width = 400    # Adjust width as needed
      ) %>%
      config(displayModeBar = FALSE)
  }
}

# Example usage
output$bargraph_summary_pros <- renderPlotly({ create_summary_prospective("bargraph_summary_prospective") })
