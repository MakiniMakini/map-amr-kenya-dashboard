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
      menuItem("Dashboard", tabName = "map", icon = icon("dashboard")),
      menuItem("Table", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Settings", tabName = "settings", icon = icon("sliders"),
               menuSubItem("Subitem 1", tabName = "subitem1"),
               menuSubItem("Subitem 2", tabName = "subitem2"))
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
  ,
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
