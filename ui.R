library(shiny)
library(bs4Dash)

bs4DashPage(
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
          text = "Item 6",
          tabName = "tab6",
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
  ,
  #body of the dashboard work out
  body = bs4DashBody(
    tabItem(tabName = "map",
            box(
              title = "MAP-AMR Kenya",
              solidHeader = TRUE,
              status = "primary",
              collapsible = TRUE,
              width = 12,
              fluidRow(
                column(
                  width = 12,
                  fluidRow(
                    column(
                      width = 8,
                      bs4Card(
                        title = "MAP-AMR Kenya Sites",
                        maximizable = TRUE,
                        leafletOutput("map"),
                        width = 12
                      )
                    ),
                    column(
                      width = 4,
                      bs4Card(
                        title = "Summary of Candida",
                        maximizable = TRUE,
                        plotlyOutput("piechart"),
                        width = 12
                      )
                    )
                  )
                )
              )
            ),
            box(
              title = "MAP-AMR Kenya",
              solidHeader = TRUE,
              status = "primary",
              collapsible = TRUE,
              width = 12,
              fluidRow(
                column(
                  width = 12,
                  fluidRow(
                    column(
                      width = 8,
                      bs4Card(
                        title = "MAP-AMR Kenya Sites",
                        maximizable = TRUE,
                        DTOutput("table"),
                        width = 12
                      )
                    ),
                    column(
                      width = 4,
                      bs4Card(
                        title = "Summary of Candida",
                        maximizable = TRUE,
                        plotlyOutput("bargraph"),
                        width = 12
                      )
                    )
                  )
                )
              )
            )
    )
    ,
      tabItem(tabName = "settings",
              box(status = "info", title = "Settings Box", solidHeader = TRUE)
      ),
  tabItem(
    tabItem(tabName = "dashboard",
            DTOutput("table"))
    )
  )
  
  #control bar section
  ,
  controlbar = bs4DashControlbar(
    skin = "dark",
    status = "primary",
    background = "dark",
    title = "MAP-AMR",
    sliderInput("obs", "Number of observations:", 1, 100, 50),
    overlay = FALSE,
    collapsed = FALSE,
    pinned = TRUE,
    controlbarMenu(
      menuItem("Item 1", tabName = "item1", icon = icon("gear")),
      menuItem("Item 2", tabName = "item2", icon = icon("bell"))
    )
  )
  
  #footer section
  ,
  footer = bs4DashFooter(
    left = "MAP-AMR KENYA",
    right = Sys.Date()
  )
)
