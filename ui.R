# Load the libraries required for UI
library(shiny)
library(leaflet)
library(DT)
library(dygraphs)
library(plotly)

# Reusable sidebar panel content
create_sidebar_panel <- function() {
  sidebarPanel(
    p("Made by", a("CEMA", href = "http://cema-africa.uonbi.ac.ke/")),
    img(src = "kenya-logo.jpg", width = "70px", height = "70px"),
    selectInput("project_year", "Project Year",
                choices = c("Year 1", "Year 2", "Year 3")),
    width = 3
  )
}

# UI object
ui <- navbarPage(
  title = "MAP-AMR KENYA",
  id = "nav",
  
  # Link the external CSS file
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "main.css")),
  
  tabPanel(
    "Data",
    sidebarLayout(
      create_sidebar_panel(),
      mainPanel(
        DTOutput(outputId = "table")
      )
    )
  ),
  
  tabPanel(
    "Plots",
    sidebarLayout(
      create_sidebar_panel(),
      mainPanel(
        fluidRow(
          column(12, leafletOutput(outputId = "map")),
          fluidRow(
            column(6, dygraphOutput(outputId = "timetrend")),
            column(6, plotlyOutput(outputId = "piechart"))
          )
        )
      )
    )
  ),
  
  tabPanel(
    "Login",
    sidebarLayout(
      sidebarPanel(
        p("Made by", a("CEMA", href = "http://cema-africa.uonbi.ac.ke/")),
        img(src = "kenya-logo.jpg", width = "70px", height = "70px"),
        textInput("username", "Username"),
        passwordInput("password", "Password"),
        actionButton("login", "Login"),
        width = 3
      ),
      mainPanel(
        p("Please log in to access additional features.")
      )
    )
  )
)