# body.R

# Define the body UI for bs4Dash
body <- bs4DashBody(
  # Main tabItems
  tabItems(
    # First tabItem: "map"
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
                        status = "primary",
                        title = "MAP-AMR Kenya Sites",
                        maximizable = TRUE,
                        leafletOutput("map"),
                        width = 12
                      )
                    ),
                    column(
                      width = 4,
                      bs4Card(
                        solidHeader = TRUE,
                        status = "orange",
                        title = "Summary of Active Surveillance Data",
                        maximizable = TRUE,
                        plotlyOutput("piechart"),
                        width = 12
                      )
                    )
                  )
                )
              )
            ),
            # box 2 KNH
            box(
              title = "Active Surveillance Per site",
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
                        title = "KNH Summary",
                        maximizable = TRUE,
                        plotlyOutput("bargraph"),
                        width = 12
                      )
                    ),
                    column(
                      width = 4,
                      bs4Card(
                        solidHeader = TRUE,
                        status = "gray-dark",
                        title = "Candida Isolates at KNH",
                        maximizable = TRUE,
                        plotlyOutput("piechart_knh_candida"),
                        width = 12
                      )
                    )
                  )
                )
              )
            ),
            # box 3
            box(
              title = "Active Surveillance Per site",
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
                        plotlyOutput(""),
                        width = 12
                      )
                    )
                  )
                )
              )
            )
    ),
    
    # Second tabItem: "settings"
    tabItem(
      tabName = "settings",
      box(
        title = "Settings Box",
        status = "info",
        solidHeader = TRUE
      )
    ),
    
    # Third tabItem: "dashboard"
    tabItem(
      tabName = "dashboard",
      DTOutput("table")
    ),
    
    # Fourth tabItem: "ipc-year1"
    tabItem(
      tabName = "ipc-year1",
      box(
        title = "Summary of Candida",
        solidHeader = TRUE,
        status = "primary",
        collapsible = TRUE,
        width = 12,
        plotlyOutput("")
      )
    )
  )
)

