# Process data
sensitivity_data_long <- CVC_TIP_DATA %>%
  pivot_longer(cols = c(sensitive, intermediate, resistant), 
               names_to = "Resistance", values_to = "Drugs") %>%
  separate_rows(Drugs, sep = ",") %>%
  filter(Drugs != "None" & Drugs != "none" & Drugs != "Not done" & Drugs != "") %>%
  group_by(Facility, organism_isolated, Drugs, Resistance) %>%
  summarise(Count = n(), .groups = 'drop')

# plot the graphs

output$sensitivity_plot <- renderPlotly({
  facility <- switch(input$facility_tabs,
                     "TNH" = "TNH",
                     "MP SHAH" = "MP SHAH")
  
  organism <- switch(input$facility_tabs,
                     "TNH" = switch(input$organism_tabs_tnh,
                                    albicans = "Candida albicans",
                                    glabrata = "Candida glabrata"),
                     "MP SHAH" = switch(input$organism_tabs_mpshah,
                                        albicans = "Candida albicans",
                                        auris = "Candida auris",
                                        doubushaemulonii = "Candida doubushaemulonii",
                                        parapsilosis = "Candida parapsilosis"))
  
  plot_data <- sensitivity_data_long %>% filter(Facility == facility & organism_isolated == organism)
  
  plot <- ggplot(plot_data, aes(y = Drugs, x = Count, fill = Resistance)) +
    geom_bar(stat = "identity") +
    labs(title = paste(facility, "-", organism, "AFST Results"), x = "Number of organisms", y = "") +
    theme_minimal() +
    theme(axis.text.y = element_text(angle = 0, hjust = 1)) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 5))  +
    scale_fill_manual(values = c("sensitive" = "#2c3e50", "intermediate" = "#FDDBC7", "resistant" = "#B2182B"))
  
  ggplotly(plot)
})