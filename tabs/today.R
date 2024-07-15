tab_today <- tabItem(
  tabName = "today",
  fluidRow(
    column(
      width = 6,
      box(
        title = "New cases from the sites",
        solidHeader = TRUE,
        status = "danger",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          # Use lapply to generate bs4InfoBox dynamically
          lapply(1:nrow(today_data), function(i) {
            bs4InfoBox(
              value = today_data$Organism[i],  # Notification message
              title = today_data$Site[i],          # Site name
              color = "success",
              icon = icon("users")
            )
          }) 
          # %>%
          #   unlist(recursive = FALSE, use.names = FALSE)
        )
      )
    ),
    # Notifications
    column(
      width = 6,
      box(
        title = "Important Notifications From Sites",
        solidHeader = TRUE,
        status = "info",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          # Use lapply to generate bs4InfoBox dynamically
          lapply(1:nrow(notifications), function(i) {
            bs4InfoBox(
              value = notifications$Notification[i],  # Notification message
              title = notifications$Site[i],          # Site name
              color = "success",
              icon = icon("hospital")
            )
          })
          # %>%
          #   unlist(recursive = FALSE)
        )
      )
    )
  )
)


