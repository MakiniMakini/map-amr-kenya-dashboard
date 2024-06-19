# body.R

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
    ),
  tabItem(
    tabItem(tabName = "ipc-year1",
            uiOutput("pdfviewer"))
    )
  )
