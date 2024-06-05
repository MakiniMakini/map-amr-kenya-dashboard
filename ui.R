# Load the libraries
library(shiny)
library(leaflet)
library(DT)
library(dygraphs)

# UI object
ui <- navbarPage(
  title = "MAP-AMR KENYA",
  id = "nav",
  
  # Add custom CSS to style the navbar
  tags$style(HTML("
    .navbar-nav {
      background-color: #3474A7 !important;
    }
    .navbar-nav > li > a, .navbar-brand {
      color: white !important;
    }
    .navbar-nav > li > a:hover, .navbar-nav > li > a:focus {
      background-color: #286090 !important;
      color: white !important;
    }
    .navbar-nav > .active > a, .navbar-nav > .active > a:hover, .navbar-nav > .active > a:focus {
      background-color: #286090 !important;
      color: white !important;
    }
  ")),
  
  tabPanel(
    "Data",
    sidebarLayout(
      sidebarPanel(
        p("Made by", a("CEMA", href = "http://cema-africa.uonbi.ac.ke/")),
        img(src = "kenya-logo.jpg", width = "70px", height = "70px"),
        selectInput("project_year", "Project Year",
                    choices = c("Year 1", "Year 2", "Year 3")),
        width = 3
      ),
      mainPanel(
        DTOutput(outputId = "table")
      )
    )
  ),
  
  tabPanel(
    "Plots",
    sidebarLayout(
      sidebarPanel(
        p("Made by", a("CEMA", href = "http://cema-africa.uonbi.ac.ke/")),
        img(src = "kenya-logo.jpg", width = "70px", height = "70px"),
        selectInput("project_year", "Project Year",
                    choices = c("Year 1", "Year 2", "Year 3")),
        width = 3
      ),
      mainPanel(
        fluidRow(
          column(12, leafletOutput(outputId = "map")),
          fluidRow(
            column(6, dygraphOutput(outputId = "timetrend"))
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

