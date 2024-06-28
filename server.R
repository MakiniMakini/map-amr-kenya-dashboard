# server.R

# Load libraries if necessary (already loaded in global.R)
source("global.R")

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
  
  # Render PDF viewer content
  output$pdf_viewer <- renderUI({
    # Example PDF path (adjust as per your actual file path)
    pdf_path <- "www/baseline_ipc_IPCAF_2022.pdf"
    
    # Check if file exists before rendering
    if (file.exists(pdf_path)) {
      tags$iframe(style = "height:600px; width:100%", src = pdf_path)
    } else {
      # Return a message or handle the case where file doesn't exist
      tags$p("PDF file not found.")
    }
  })
  
  # Observe changes to inputs and navigate tabs
  observeEvent(input$nav, {
    selected_tab <- input$nav
    if (selected_tab %in% c("ipc-year1")) {
      updateNavbarPage(session, "nav", selected = "map")
    } else {
      updateNavbarPage(session, "nav", selected = "Plots")
    }
  })
  #today tab added
  observeEvent(input$today_tab_link, {
    updateTabItems(session, "sidebar", "today")
  })
  
  # Function to create pie chart or bar graph
  create_chart <- function(type) {
    if (type == "pie") {
      # Compute counts per site (if not already summarized)
      site_counts <- summary_data %>%
        group_by(Site) %>%
        summarise(count = sum(Numbers)) %>%  # Assuming Numbers contains patient counts
        arrange(desc(count))
      
      # Plotting a pie chart
      plot_ly(
        data = site_counts,
        labels = ~Site,
        values = ~count,
        type = 'pie',
        textinfo = 'label+percent',  # 'label+percent' shows label and percentage
        insidetextorientation = 'radial'
      ) %>% 
        layout(
          showlegend = FALSE
        )
    }
    else if (type == "bar_knh") {
      
      # Define the correct order for the months
      month_levels <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
      # Reshape data from wide to long format for plotting
      data_long <- pivot_longer(KNH_summary, !Outcome, names_to = "Month", values_to = "Count")
      # Convert the Month column to a factor with the specified levels
      data_long$Month <- factor(data_long$Month, levels = month_levels)
      # Convert the Outcome column to a factor to preserve order
      data_long$Outcome <- factor(data_long$Outcome, levels = unique(data_long$Outcome))
      # Plotting a grouped bar graph
      plot_ly(
        data_long, 
        x = ~Month, 
        y = ~Count, 
        color = ~Outcome, 
        type = 'bar',
        text = ~paste( Outcome, "<br>", Count), # Add text for hover info
        hoverinfo = "text",
        marker = list(
          line = list(color = 'rgb(8,48,107)', width = 1.5) # Customize marker appearance
        )
        ) %>%
        layout(
          title = "Counts of Outcomes Across Months",
          xaxis = list(title = "Month"),
          yaxis = list(title = "Count"),
          barmode = 'group',
          legend = list(
            font = list(size = 10) # Reduce legend font size
          )
        )
    }
    else if (type == "pie_knh_candida") {
      # Compute counts per species (if not already summarized)
      candida_counts <- KNH_candida %>%
        group_by(Species) %>%
        summarise(count = sum(Count)) %>%  # Assuming Count contains patient counts
        arrange(desc(count))
      
      # Define a dark blue monochromatic color palette using RColorBrewer
      num_colors <- nrow(candida_counts)
      dark_blue_palette <- colorRampPalette(c("#08306B", "#084594", "#2171B5", "#4292C6", "#6BAED6"))(num_colors)
      
      # Plotting a pie chart for KNH Candida data
      plot_ly(
        data = candida_counts,
        labels = ~Species,
        values = ~count,
        type = 'pie',
        textinfo = 'label+percent',  # 'label+percent' shows label and percentage
        insidetextorientation = 'radial',
        marker = list(colors = dark_blue_palette)  # Specify dark blue monochromatic colors
      ) %>% 
        layout(
          showlegend = FALSE
        )
    }
    
    ######################
    #THN
    ############
    else if (type == "bar_tnh") {
      
      # Define the correct order for the months
      month_levels_tnh <- c("Oct to Dec", "Jan", "Feb", "Mar", "April", "May")
      # Reshape data from wide to long format for plotting
      data_long_tnh <- pivot_longer(TNH_summary, !Outcome, names_to = "Month", values_to = "Count")
      # Convert the Month column to a factor with the specified levels
      data_long_tnh$Month <- factor(data_long_tnh$Month, levels = month_levels_tnh)
      # Convert the Outcome column to a factor to preserve order
      data_long_tnh$Outcome <- factor(data_long_tnh$Outcome, levels = unique(data_long_tnh$Outcome))
      # Plotting a grouped bar graph
      plot_ly(
        data_long_tnh, 
        x = ~Month, 
        y = ~Count, 
        color = ~Outcome, 
        type = 'bar',
        text = ~paste( Outcome, "<br>", Count), # Add text for hover info
        hoverinfo = "text",
        marker = list(
          line = list(color = 'rgb(8,48,107)', width = 1.5) # Customize marker appearance
        )
        ) %>%
        layout(
          title = "Counts of Outcomes Across Months",
          xaxis = list(title = "Month"),
          yaxis = list(title = "Count"),
          barmode = 'group',
          legend = list(
            font = list(size = 10) # Reduce legend font size
          )
        )
    }
    else if (type == "pie_tnh_candida") {
      # Compute counts per species (if not already summarized)
      candida_counts_tnh <- TNH_candida %>%
        group_by(Species) %>%
        summarise(count = sum(Count)) %>%  # Assuming Count contains patient counts
        arrange(desc(count))
      
      # Define a dark blue monochromatic color palette using RColorBrewer
      num_colors <- nrow(candida_counts_tnh)
      dark_blue_palette <- colorRampPalette(c("#8B4513", "#A0522D", "#CD853F", "#D2691E", "#F4A460"))(num_colors)
      
      # Plotting a pie chart for KNH Candida data
      plot_ly(
        data = candida_counts_tnh,
        labels = ~Species,
        values = ~count,
        type = 'pie',
        textinfo = 'label+percent',  # 'label+percent' shows label and percentage
        insidetextorientation = 'radial',
        marker = list(colors = dark_blue_palette)  # Specify dark blue monochromatic colors
      ) %>% 
        layout(
          showlegend = FALSE
        )
    }
    
  }
  
  
  # Render pie chart
  #Total piechart
  output$piechart <- renderPlotly({
    create_chart("pie")
  })
  #KNH pie chart
  output$piechart_knh_candida <- renderPlotly({
    create_chart("pie_knh_candida")
  })
  #TNH pie chart
  output$piechart_tnh_candida <- renderPlotly({
    create_chart("pie_tnh_candida")
  })
  
  # Render bar graphs
  #KNH
  output$bargraph_knh <- renderPlotly({
    create_chart("bar_knh")
  })
  #TNH
  output$bargraph_tnh <- renderPlotly({
    create_chart("bar_tnh")
  })
  
# TODAY DATA
  output$new_cases_KNH <- renderText({
    today_data$Total[today_data$Site == "KNH"]
  })
  
}
