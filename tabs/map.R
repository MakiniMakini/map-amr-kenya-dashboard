tab_map <- tabItem(tabName = "map",
                   box(
                     title = "MAP-AMR Kenya",
                     solidHeader = TRUE,
                     status = "olive",
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
                   )
     
)
