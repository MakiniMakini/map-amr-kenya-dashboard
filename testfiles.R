library(shiny)
library(shinydashboard)


# Example notifications dataframe
notifications <- data.frame(
  Site = c("KNH", "JOOTRH"),
  Notification = c("Vitek Machine under repair", "Sample shipped to TNH for confirmation")
)

# UI portion where bs4InfoBox elements are dynamically generated
ui <- fluidPage(
  titlePanel("Dynamic bs4InfoBox Example"),
  
  fluidRow(
    column(
      width = 12,
      box(
        title = "Important Notifications From Sites",
        solidHeader = TRUE,
        status = "info",
        collapsible = TRUE,
        width = 12,
        fluidRow(
          # Use unlist within the fluidRow
          lapply(1:nrow(notifications), function(i) {
            bs4InfoBox(
              value = notifications$Notification[i],
              title = notifications$Site[i],
              color = "success",
              icon = icon("hospital")
            )
          })
        )
      )
    )
  )
)

# Server function (not shown for simplicity)
server <- function(input, output) {
  # Server logic goes here
}

# Run the application
shinyApp(ui = ui, server = server)
