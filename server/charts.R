# Function to create charts
create_chart <- function(type) {
 if (type == "piechart_summary_hospital") {
    # Compute counts per site
    site_counts <- hospital_summary %>%
      group_by(Hospital) %>%
      summarise(count = sum(Screened_patients)) %>%
      arrange(desc(count))
    
    plot_ly(
      data = site_counts,
      labels = ~Hospital,
      values = ~count,
      type = 'pie',
      textinfo = 'label+percent',
      insidetextorientation = 'radial'
    ) %>% 
      layout(
        showlegend = FALSE,
        height = 300,  # Adjust height as needed
        width = 300    # Adjust width as needed
      ) %>%
      config(displayModeBar = FALSE)
  }
  
  else if (type == "bargraph_summary_candida") {
    # Select columns and store in new data frame
    new_summary_data <- hospital_summary[, c("Hospital", "Screened_patients", "Candida_isolated")]
    
    # Convert data to long format
    data_long <- reshape2::melt(new_summary_data, id.vars = "Hospital")
    
    # Define colors for the bars
    colors <- c("#2c3e50", "#B2182B")
    
    # Plot using plot_ly
    plot_ly(
      data_long,
      x = ~Hospital,
      y = ~value,
      color = ~variable,
      colors = colors,
      type = 'bar',
      text = ~paste(Hospital, "<br>", variable, ": ", value),
      hoverinfo = "text",
      marker = list(line = list(color = 'rgb(8,48,107)', width = 1.5))
    ) %>%
      layout(
        title = "",
        xaxis = list(title = "Hospital"),
        yaxis = list(title = "Count"),
        barmode = 'group',
        legend = list(font = list(size = 10))
      ) %>%
      config(displayModeBar = FALSE)
  }
  
  
  else if (type == "bar_knh") {
    # Define the correct order for the months
    month_levels <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
    data_long <- pivot_longer(KNH_summary, !Outcome, names_to = "Month", values_to = "Count")
    data_long$Month <- factor(data_long$Month, levels = month_levels)
    data_long$Outcome <- factor(data_long$Outcome, levels = unique(data_long$Outcome))
    
    plot_ly(
      data_long,
      x = ~Month,
      y = ~Count,
      color = ~Outcome,
      type = 'bar',
      text = ~paste(Outcome, "<br>", Count),
      hoverinfo = "text",
      marker = list(line = list(color = 'rgb(8,48,107)', width = 1.5))
    ) %>%
      layout(
        title = "Counts of Outcomes Across Months",
        xaxis = list(title = "Month"),
        yaxis = list(title = "Count"),
        barmode = 'group',
        legend = list(font = list(size = 10))
      )
  } 
  
  else if (type == "pie_knh_candida") {
    # Compute counts per species
    candida_counts <- KNH_candida %>%
      group_by(Species) %>%
      summarise(count = sum(Count)) %>%
      arrange(desc(count))
    
    dark_blue_palette <- colorRampPalette(c("#08306B", "#084594", "#2171B5", "#4292C6", "#6BAED6"))(nrow(candida_counts))
    
    plot_ly(
      data = candida_counts,
      labels = ~Species,
      values = ~count,
      type = 'pie',
      textinfo = 'label+percent',
      insidetextorientation = 'radial',
      marker = list(colors = dark_blue_palette)
    ) %>% 
      layout(showlegend = FALSE)
  } else if (type == "bar_tnh") {
    # Define the correct order for the months
    month_levels_tnh <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
    data_long_tnh <- pivot_longer(TNH_summary, !Outcome, names_to = "Month", values_to = "Count")
    data_long_tnh$Month <- factor(data_long_tnh$Month, levels = month_levels_tnh)
    data_long_tnh$Outcome <- factor(data_long_tnh$Outcome, levels = unique(data_long_tnh$Outcome))
    
    plot_ly(
      data_long_tnh,
      x = ~Month,
      y = ~Count,
      color = ~Outcome,
      type = 'bar',
      text = ~paste(Outcome, "<br>", Count),
      hoverinfo = "text",
      marker = list(line = list(color = 'rgb(8,48,107)', width = 1.5))
    ) %>%
      layout(
        title = "Counts of Outcomes Across Months",
        xaxis = list(title = "Month"),
        yaxis = list(title = "Count"),
        barmode = 'group',
        legend = list(font = list(size = 10))
      )
  } else if (type == "pie_tnh_candida") {
    # Compute counts per species
    candida_counts_tnh <- TNH_candida %>%
      group_by(Species) %>%
      summarise(count = sum(Count)) %>%
      arrange(desc(count))
    
    dark_blue_palette <- colorRampPalette(c("#8B4513", "#A0522D", "#CD853F", "#D2691E", "#F4A460"))(nrow(candida_counts_tnh))
    
    plot_ly(
      data = candida_counts_tnh,
      labels = ~Species,
      values = ~count,
      type = 'pie',
      textinfo = 'label+percent',
      insidetextorientation = 'radial',
      marker = list(colors = dark_blue_palette)
    ) %>% 
      layout(showlegend = FALSE)
  }
  # Pie chart for mp-shah
   else if (type == "piechart_mp_shah_candida") {
    # Compute counts per species
    candida_counts_mp_shah <- MP_SHAH_candida %>%
      group_by(Species) %>%
      summarise(count = sum(Count)) %>%
      arrange(desc(count))
    
    dark_blue_palette <- colorRampPalette(c("#08306B", "#084594", "#2171B5", "#4292C6", "#6BAED6"))(nrow(candida_counts_mp_shah))
    
    plot_ly(
      data = candida_counts_mp_shah,
      labels = ~Species,
      values = ~count,
      type = 'pie',
      textinfo = 'label+percent',
      insidetextorientation = 'radial',
      marker = list(colors = dark_blue_palette)
    ) %>% 
      layout(showlegend = FALSE)
   }
  # bar plot for mp-shah
  else if (type == "bar_mp_shah") {
    # Define the correct order for the months
    month_levels_mp_shah <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
    data_long_mp_shah <- pivot_longer(MP_SHAH_summary, !Outcome, names_to = "Month", values_to = "Count")
    data_long_mp_shah$Month <- factor(data_long_mp_shah$Month, levels = month_levels_mp_shah)
    data_long_mp_shah$Outcome <- factor(data_long_mp_shah$Outcome, levels = unique(data_long_mp_shah$Outcome))
    
    plot_ly(
      data_long_mp_shah,
      x = ~Month,
      y = ~Count,
      color = ~Outcome,
      type = 'bar',
      text = ~paste(Outcome, "<br>", Count),
      hoverinfo = "text",
      marker = list(line = list(color = 'rgb(8,48,107)', width = 1.5))
    ) %>%
      layout(
        title = "Counts of Outcomes Across Months",
        xaxis = list(title = "Month"),
        yaxis = list(title = "Count"),
        barmode = 'group',
        legend = list(font = list(size = 10))
      )
  }
  # bar plot for machakos
  else if (type == "bar_machakos") {
    # Define the correct order for the months
    month_levels_machakos <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
    data_long_machakos <- pivot_longer(Machakos_summary, !Outcome, names_to = "Month", values_to = "Count")
    data_long_machakos$Month <- factor(data_long_machakos$Month, levels = month_levels_machakos)
    data_long_machakos$Outcome <- factor(data_long_machakos$Outcome, levels = unique(data_long_machakos$Outcome))
    
    plot_ly(
      data_long_machakos,
      x = ~Month,
      y = ~Count,
      color = ~Outcome,
      type = 'bar',
      text = ~paste(Outcome, "<br>", Count),
      hoverinfo = "text",
      marker = list(line = list(color = 'rgb(8,48,107)', width = 1.5))
    ) %>%
      layout(
        title = "Counts of Outcomes Across Months",
        xaxis = list(title = "Month"),
        yaxis = list(title = "Count"),
        barmode = 'group',
        legend = list(font = list(size = 10))
      )
  }
  # bar plot for JOOTRH
  else if (type == "bar_JOOTRH") {
    # Define the correct order for the months
    month_levels_JOOTRH <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
    data_long_JOOTRH <- pivot_longer(JOOTRH_summary, !Outcome, names_to = "Month", values_to = "Count")
    data_long_JOOTRH$Month <- factor(data_long_JOOTRH$Month, levels = month_levels_JOOTRH)
    data_long_JOOTRH$Outcome <- factor(data_long_JOOTRH$Outcome, levels = unique(data_long_JOOTRH$Outcome))
    
    plot_ly(
      data_long_JOOTRH,
      x = ~Month,
      y = ~Count,
      color = ~Outcome,
      type = 'bar',
      text = ~paste(Outcome, "<br>", Count),
      hoverinfo = "text",
      marker = list(line = list(color = 'rgb(8,48,107)', width = 1.5))
    ) %>%
      layout(
        title = "Counts of Outcomes Across Months",
        xaxis = list(title = "Month"),
        yaxis = list(title = "Count"),
        barmode = 'group',
        legend = list(font = list(size = 10))
      )
  }
  # bar plot for CGTRH
  else if (type == "bar_CGTRH") {
    # Define the correct order for the months
    month_levels_CGTRH <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
    data_long_CGTRH <- pivot_longer(CGTRH_summary, !Outcome, names_to = "Month", values_to = "Count")
    data_long_CGTRH$Month <- factor(data_long_CGTRH$Month, levels = month_levels_CGTRH)
    data_long_CGTRH$Outcome <- factor(data_long_CGTRH$Outcome, levels = unique(data_long_CGTRH$Outcome))
    
    plot_ly(
      data_long_CGTRH,
      x = ~Month,
      y = ~Count,
      color = ~Outcome,
      type = 'bar',
      text = ~paste(Outcome, "<br>", Count),
      hoverinfo = "text",
      marker = list(line = list(color = 'rgb(8,48,107)', width = 1.5))
    ) %>%
      layout(
        title = "Counts of Outcomes Across Months",
        xaxis = list(title = "Month"),
        yaxis = list(title = "Count"),
        barmode = 'group',
        legend = list(font = list(size = 10))
      )
  }
}

# Render charts
output$piechart_summary_hospital <- renderPlotly({ create_chart("piechart_summary_hospital") })
output$piechart_knh_candida <- renderPlotly({ create_chart("pie_knh_candida") })
output$piechart_tnh_candida <- renderPlotly({ create_chart("pie_tnh_candida") })
output$piechart_mp_shah_candida <- renderPlotly({ create_chart("piechart_mp_shah_candida") })
# render bar graphs
output$bargraph_knh <- renderPlotly({ create_chart("bar_knh") })
output$bargraph_summary_candida <- renderPlotly({ create_chart("bargraph_summary_candida") })
output$bargraph_tnh <- renderPlotly({ create_chart("bar_tnh") })
output$bargraph_mp_shah <- renderPlotly({ create_chart("bar_mp_shah") })
output$bargraph_machakos <- renderPlotly({ create_chart("bar_machakos") })
output$bargraph_JOOTRH <- renderPlotly({ create_chart("bar_JOOTRH") })
output$bargraph_CGTRH <- renderPlotly({ create_chart("bar_CGTRH") })
