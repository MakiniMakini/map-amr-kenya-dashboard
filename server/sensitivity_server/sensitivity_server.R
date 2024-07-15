# KNH Data
# Process data
sensitivity_KNH_data_long <- KNH_sensitivity_data %>%
  pivot_longer(cols = c(sensitive, intermediate, resistant), 
               names_to = "Resistance", values_to = "Drugs") %>%
  separate_rows(Drugs, sep = ",") %>%
  filter(Drugs != "None" & Drugs != "none") %>%
  group_by(organism_isolated, Drugs, Resistance) %>%
  summarise(Count = n(), .groups = 'drop')



# Assuming sensitivity_KNH_data_long is already defined somewhere

output$knh_sensitivity_plot <- renderPlotly({
  organism <- switch(input$organism_tabs,
                     parapsilosis = "Candida parapsilosis",
                     albicans = "Candida albicans",
                     tropicalis = "Candida tropicalis",
                     auris = "Candida auris")
  
  p <- ggplot(sensitivity_KNH_data_long %>% filter(organism_isolated == organism), 
              aes(y = Drugs, x = Count, fill = Resistance)) +
    geom_bar(stat = "identity") +
    labs(title = paste(organism, "AFST Results"), x = "Number of organisms", y = "") +
    theme_minimal() +
    theme(axis.text.y = element_text(angle = 0, hjust = 1)) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 0.5))  +
    scale_fill_manual(values = c("sensitive" = "#2c3e50", "intermediate" = "#FDDBC7", "resistant" = "#B2182B"))
  
  ggplotly(p, tooltip = "fill") %>%
    layout(hoverlabel = list(bgcolor = "black", font = list(size = 14)))
})


# outcome data visuals
# Convert to factors to maintain order
KNH_sensitivity_data$organism_isolated <- factor(KNH_sensitivity_data$organism_isolated)
KNH_sensitivity_data$patient_outcome <- factor(KNH_sensitivity_data$patient_outcome)
# Plot the stacked bar chart
output$knh_outcome_plot <- renderPlotly({
  p <- ggplot(KNH_sensitivity_data, aes(x = organism_isolated, fill = patient_outcome)) +
    geom_bar(position = "stack", aes(text = ..count..)) +
    coord_flip() +
    labs(
         x = "",
         y = "Number of patients") +
    theme_minimal() +
    theme(axis.text.y = element_text(angle = 0, hjust = 1))
  
  ggplotly(p, tooltip = c("x", "fill", "text"))
})

##################################
##################################
# TNH Data
##################################
# Process data
sensitivity_TNH_data_long <- TNH_sensitivity_data %>%
  pivot_longer(cols = c(sensitive, intermediate, resistant), 
               names_to = "Resistance", values_to = "Drugs") %>%
  separate_rows(Drugs, sep = ",") %>%
  filter(Drugs != "None" & Drugs != "none") %>%
  group_by(organism_isolated, Drugs, Resistance) %>%
  summarise(Count = n(), .groups = 'drop')

# Render plot based on selected organism
output$tnh_sensitivity_plot <- renderPlotly({
  organism <- switch(input$organism_tabs_tnh,
                     parapsilosis = "Candida parapsilosis",
                     albicans = "Candida albicans",
                     tropicalis = "Candida tropicalis",
                     auris = "Candida auris")
  
  ggplot(sensitivity_TNH_data_long %>% filter(organism_isolated == organism), aes(y = Drugs, x = Count, fill = Resistance)) +
    geom_bar(stat = "identity") +
    labs(title = paste(organism, "AFST Results"), x = "Number of organisms", y = "") +
    theme_minimal() +
    theme(axis.text.y = element_text(angle = 0, hjust = 1)) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 0.5)) +
    scale_fill_manual(values = c("sensitive" = "#2c3e50", "intermediate" = "#FDDBC7", "resistant" = "#B2182B"))
})

# outcome data visuals
# Convert to factors to maintain order
TNH_sensitivity_data$organism_isolated <- factor(TNH_sensitivity_data$organism_isolated)
TNH_sensitivity_data$patient_outcome <- factor(TNH_sensitivity_data$patient_outcome)
# Plot the stacked bar chart
output$tnh_outcome_plot <- renderPlotly({
  p <- ggplot(TNH_sensitivity_data, aes(x = organism_isolated, fill = patient_outcome)) +
    geom_bar(position = "stack", aes(text = ..count..)) +
    coord_flip() +
    labs(
      x = "",
      y = "Number of patients") +
    theme_minimal() +
    theme(axis.text.y = element_text(angle = 0, hjust = 1))
  
  ggplotly(p, tooltip = c("x", "fill", "text"))
})
##################################
##################################
# MPSHAH Data
##################################
# Process data
sensitivity_MPSHAH_data_long <- MPSHAH_sensitivity_data %>%
  pivot_longer(cols = c(sensitive, intermediate, resistant), 
               names_to = "Resistance", values_to = "Drugs") %>%
  separate_rows(Drugs, sep = ",") %>%
  filter(Drugs != "None" & Drugs != "none") %>%
  group_by(organism_isolated, Drugs, Resistance) %>%
  summarise(Count = n(), .groups = 'drop')

# Render plot based on selected organism
output$mpshah_sensitivity_plot <- renderPlotly({
  organism <- switch(input$organism_tabs_mpshah,
                     parapsilosis = "Candida parapsilosis",
                     albicans = "Candida albicans",
                     tropicalis = "Candida tropicalis",
                     auris = "Candida auris")
  
  ggplot(sensitivity_MPSHAH_data_long %>% filter(organism_isolated == organism), aes(y = Drugs, x = Count, fill = Resistance)) +
    geom_bar(stat = "identity") +
    labs(title = paste(organism, "AFST Results"), x = "Number of organisms", y = "") +
    theme_minimal() +
    theme(axis.text.y = element_text(angle = 0, hjust = 1)) +
    scale_x_continuous(breaks = scales::pretty_breaks(n = 0.5)) +
    scale_fill_manual(values = c("sensitive" = "#2c3e50", "intermediate" = "#FDDBC7", "resistant" = "#B2182B"))
})

# Outcome data visuals
# Convert to factors to maintain order
MPSHAH_sensitivity_data$organism_isolated <- factor(MPSHAH_sensitivity_data$organism_isolated)
MPSHAH_sensitivity_data$patient_outcome <- factor(MPSHAH_sensitivity_data$patient_outcome)
# Plot the stacked bar chart
output$mpshah_outcome_plot <- renderPlotly({
  p <- ggplot(MPSHAH_sensitivity_data, aes(x = organism_isolated, fill = patient_outcome)) +
    geom_bar(position = "stack", aes(text = ..count..)) +
    coord_flip() +
    labs(
      x = "",
      y = "Number of patients") +
    theme_minimal() +
    theme(axis.text.y = element_text(angle = 0, hjust = 1))
  
  ggplotly(p, tooltip = c("x", "fill", "text"))
})

