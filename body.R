# Source the tab items
source("tabs/map.R")
source("tabs/settings.R")
source("tabs/dashboard.R")
source("tabs/ipc_year1.R")
source("tabs/today.R")

# Define the body UI for bs4Dash
body <- bs4DashBody(
  useShinyjs(), # Add shinyjs to the body
  # Main tabItems
  tabItems(
    tab_map,
    tab_settings,
    tab_dashboard,
    tab_ipc_year1,
    tab_today
  )
)
