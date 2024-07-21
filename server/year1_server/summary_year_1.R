create_summary_pps_1 <- function() {
  # Convert data frame to long format for plotting
  long_data <- summary_data_pps_1 %>%
    tidyr::gather(key = "Hospital", value = "Count", -Variable)
  
  # Ensure the 'Variable' column is a factor with the specified levels to maintain order
  long_data$Variable <- factor(long_data$Variable, levels = c("Totals", "Adults (>=20 years)", "Neonates (0-28 days)", "Infants (<1 year)", "Children (1-10 years)", "Adolescents (11-19 years)"))
  
  # Define specific colors for each hospital
  colors <- c("KNH" = "#2c3e50", "NSIRH" = "#0668a4", "TNH" = "#B2182B")
  
  plot_ly(
    data = long_data,
    x = ~Variable,
    y = ~Count,
    color = ~Hospital,
    colors = colors,
    type = 'bar',
    text = ~paste("Count: ", Count),
    textposition = 'auto'
  ) %>%
    layout(
      title = "Age Distribution Summary by Hospital",
      barmode = 'group',
      xaxis = list(title = "Variable"),
      yaxis = list(title = "Count"),
      height = 400,  # Adjust height as needed
      width = 800    # Adjust width as needed
    ) %>%
    config(displayModeBar = FALSE)
}

output$summary_year_1_bar <- renderPlotly({
  create_summary_pps_1()
})