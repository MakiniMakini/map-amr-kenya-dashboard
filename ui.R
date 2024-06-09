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
  sidebar = bs4DashSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("MAP", tabName = "map", icon = icon("dashboard")),
      menuItem("Settings", tabName = "settings", icon = icon("sliders"),
               menuSubItem("Subitem 1", tabName = "subitem1"),
               menuSubItem("Subitem 2", tabName = "subitem2"))
    )
  )
  ,
  body = bs4DashBody(
    tabItems(
      tabItem(tabName = "dashboard",
              DTOutput("table")
      ),
      tabItem(tabName = "settings",
              box(status = "info", title = "Settings Box", solidHeader = TRUE)
      ),
      tabItem(tabName = "map",
              fluidRow(
                column(width = 12,
                       bs4Card(
                         title = "Maximizable Map",
                         maximizable = TRUE,
                         leafletOutput("map")
                       )
                )
              ),
              fluidRow(
                column(width = 8,
                       bs4Card(
                         title = "Pie Chart",
                         maximizable = TRUE,
                         plotlyOutput("piechart")
                       )
                )
              )
      )
      
    )
  ),
  controlbar = bs4DashControlbar(
    skin = "orange",
    status = "primary",
    background = "orange",
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
  ,
  footer = bs4DashFooter(
    left = "MAP-AMR KENYA",
    right = Sys.Date()
  )
)
