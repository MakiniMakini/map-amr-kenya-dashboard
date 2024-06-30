# sidebar.R

 #sidebar configuration
  sidebar = bs4DashSidebar(
    skin = "dark",
    inputId = "sidebarState",
    bs4SidebarMenu(
      id = "sidebar",
      bs4SidebarMenuItem(
        text = "Home",
        tabName = "map",
        icon = icon("house"),
        selected = TRUE
      ),
      bs4SidebarMenuItem(
        text = "Today",
        tabName = "today",
        icon = icon("calendar-day")
      ),
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
        )
      ),
      bs4SidebarMenuItem(
        text = "Year 2",
        icon = icon("bars"),
        startExpanded = FALSE,
        bs4SidebarMenuSubItem(
          text = "Item 5",
          tabName = "tab5",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "Item 6",
          tabName = "tab6",
          icon = icon("circle")
        )
      ),
      bs4SidebarMenuItem(
        text = "Year 1",
        icon = icon("bars"),
        startExpanded = FALSE,
        bs4SidebarMenuSubItem(
          text = "Item 5",
          tabName = "tab5",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "IPC",
          tabName = "ipc-year1",
          icon = icon("circle")
        )
      ),
      bs4SidebarMenuItem(
        text = "The team",
        tabName = "",
        icon = icon("van-shuttle")
      )
    )
  )
