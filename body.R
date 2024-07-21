# Source the tab items
source("tabs/map.R")
source("tabs/settings.R")
source("tabs/dashboard.R")
source("tabs/ipc_year1.R")
source("tabs/today.R")
source("tabs/monthly_active_surveillance.R")
source("tabs/sensitivity_tab.R")
source("tabs/analyzed_data.R")
source("tabs/cvc_tip.R")
source("tabs/year2_tabs/prospective_surveillance.R")
source("tabs/year2_tabs/charts/table_1.R")
source("tabs/year2_tabs/charts/pps_2.R")
source("tabs/year1_tabs/pps_1.R")

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
    tab_sensitivity,
    tab_analyzed_data,
    tab_cvc_tip,
    tab_prospective_surveillance,
    tab_table_1,
    tab_pps_2,
    tab_pps_1
  )
)