
# ui.R

# Load libraries if necessary (already loaded in global.R)
source("global.R")
# Define UI for application
ui <- bs4DashPage(
  header = bs4DashNavbar(
    title = "MAP-AMR KENYA",
    titleWidth = NULL,
    disable = FALSE,
    .list = NULL,
    leftUi = NULL,
    rightUi = NULL,
    skin = "dark",
    status = "dark",
    border = TRUE,
    compact = FALSE,
    sidebarIcon = shiny::icon("bars"),
    controlbarIcon = shiny::icon("table-cells"),
    fixed = FALSE
  ),
  
  # Sidebar configuration
  sidebar = source("sidebar.R")$value,
  
  # Body of the dashboard
  body = source("body.R")$value,
  
  # Control bar section
  controlbar = source("controlbar.R")$value,
  
  # Footer section
  footer = bs4DashFooter(
    left = "MAP-AMR KENYA",
    right = Sys.Date()
  )
)

