  #sidebar configuration
  sidebar = bs4DashSidebar(
    skin = "dark",
    inputId = "sidebarState",
    bs4SidebarMenu(
      id = "sidebar",
      bs4SidebarMenuItem(
        text = "Home",
        tabName = "home",
        icon = icon("house")
      ),
      bs4SidebarMenuItem(
        text = "Project years",
        tabName = "tab2",
        icon = icon("shuttle-space"),
        selected = TRUE
      ),
      bs4SidebarMenuItem(
        text = "Year 3",
        icon = icon("bars"),
        startExpanded = TRUE,
        bs4SidebarMenuSubItem(
          text = "Item 3",
          tabName = "tab3",
          icon = icon("circle")
        ),
        bs4SidebarMenuSubItem(
          text = "Item 4",
          tabName = "tab4",
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
        tabName = "tab7",
        icon = icon("van-shuttle")
      )
    )
  )