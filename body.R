# Source the tab items
source("tabs/map.R")
source("tabs/settings.R")
source("tabs/dashboard.R")
source("tabs/ipc_year1.R")
source("tabs/today.R")
source("tabs/monthly_active_surveillance.R")
source("tabs/sensitivity_tab.R")

# Define the body UI for bs4Dash
body <- bs4DashBody(
  useShinyjs(), # Add shinyjs to the body
  tabItems(
    tab_map,
    tab_monthly_active_surveillance,
    tab_settings,
    tab_dashboard,
    tab_ipc_year1,
    tab_today,
    tab_sensitivity
  )
)