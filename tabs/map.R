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
                   ),
                   # box 2 KNH
                   box(
                     title = "KNH Active Surveillance",
                     solidHeader = TRUE,
                     status = "gray",
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
                               plotlyOutput("bargraph_knh"),
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
                   # box 3 TNH
                   box(
                     title = "TNH Active Surveillance",
                     solidHeader = TRUE,
                     status = "teal",
                     collapsible = TRUE,
                     width = 12,
                     fluidRow(
                       column(
                         width = 12,
                         fluidRow(
                           column(
                             width = 4,
                             bs4Card(
                               status = "gray-dark",
                               title = "Candida Isolates at TNH",
                               maximizable = TRUE,
                               plotlyOutput("piechart_tnh_candida"),
                               width = 12
                             )
                           ),
                           column(
                             width = 8,
                             bs4Card(
                               status = "fuchsia",
                               title = "TNH Summary",
                               maximizable = TRUE,
                               plotlyOutput("bargraph_tnh"),
                               width = 12
                             )
                           )
                         )
                       )
                     )
                   )
)
