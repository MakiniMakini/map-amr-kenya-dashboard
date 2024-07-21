# sidebar.R

 #sidebar configuration
  sidebar = bs4DashSidebar(
    skin = "dark",
    inputId = "sidebarState",
    bs4SidebarMenu(
      id = "sidebar",
      # home/map tab
      bs4SidebarMenuItem(
        text = "Home",
        tabName = "map",
        icon = icon("house"),
        selected = TRUE
      ),
      # today tab
      bs4SidebarMenuItem(
        text = "Today",
        tabName = "today",
        icon = icon("calendar-day")
      ),
      # year 3 tabs
      bs4SidebarMenuItem(
        text = "Year 3",
        icon = icon("bars"),
        startExpanded = TRUE,
        bs4SidebarMenuSubItem(
          text = "Monthly Active surveillance",
          tabName = "monthly_active_surveillance",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "AFST Results",
          tabName = "tab_sensitivity",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "CVC-TIP Samples",
          tabName = "tab_cvc_tip",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "Analyzed Data - Tables",
          tabName = "tab_analyzed_data",
          icon = icon("circle")
        )
      ),
      # year 2 tabs
      bs4SidebarMenuItem(
        text = "Year 2",
        icon = icon("bars"),
        startExpanded = FALSE,
        bs4SidebarMenuSubItem(
          text = actionButton("btn_prospective_surveillance", "Prospective surveillance", icon = icon("circle")),
          tabName = "tab_prospective_surveillance"
        ),
        bs4SidebarMenuSubItem(
          text = "PPS 2",
          tabName = "tab_pps_2",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "IPC",
          tabName = "tab6",
          icon = icon("circle")
        )
      ),
      # year 1 tabs
      bs4SidebarMenuItem(
        text = "Year 1",
        icon = icon("bars"),
        startExpanded = FALSE,
        bs4SidebarMenuSubItem(
          text = "PPS 1",
          tabName = "tab_pps_1",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "IPC",
          tabName = "ipc-year1",
          icon = icon("circle")
        )
      ),
      bs4SidebarMenuItem(
        text = "",
        tabName = "",
        icon = icon("")
      )
    )
  )
