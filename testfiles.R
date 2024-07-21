library(shiny)
library(shinydashboard)
library(plotly)
library(dplyr)
library(tidyr)

# Example data frame (if not already defined)
summary_data_prospective <- data.frame(
  Hospital = c("KNH", "TNH"),
  Total = c(566, 489),
  Negatives = c(497, 444),
  Positives = c(69, 45)
)

# Function to create charts
create_chart <- function(type) {
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
        width = 600    # Adjust width as needed
      ) %>%
      config(displayModeBar = FALSE)
  }
}

# Define UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "Dashboard"),
  dashboardSidebar(disable = TRUE),  # Disable the sidebar
  dashboardBody(
    fluidRow(
      box(
        title = tagList(
          "Prospective surveillance summary",
          selectInput("prospective_select", "Select Prospective Category", choices = c("Categories ..", "KNH", "TNH", "NSIRH", "JOOTRH"), selected = "Categories ..")
        ),
        solidHeader = TRUE,
        status = "primary",
        collapsible = TRUE,
        width = 12,
        plotlyOutput("bargraph_summary_pros")
      )
    ),
    tabItems(
      tabItem(tabName = "knh", h2("KNH Tab Content")),
      tabItem(tabName = "tnh", h2("TNH Tab Content")),
      tabItem(tabName = "nsirh", h2("NSIRH Tab Content")),
      tabItem(tabName = "jootrh", h2("JOOTRH Tab Content"))
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  output$bargraph_summary_pros <- renderPlotly({
    create_chart("bargraph_summary_prospective")
  })
  
  observeEvent(input$prospective_select, {
    selected_tab <- tolower(input$prospective_select)
    if (selected_tab != "categories ..") {
      updateTabItems(session, "dashboard", selected = selected_tab)
    }
  })
}

shinyApp(ui, server)
