# Load the libraries required for UI and server
library(shiny)
library(bs4Dash)

# Source the ui and server
source("ui.R")
source("server.R")

# Run the app
shinyApp(ui = ui, server = server)
