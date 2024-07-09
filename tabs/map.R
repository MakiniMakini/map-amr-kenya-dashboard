# landing page tab with map and quick figures
tab_map <- tabItem(tabName = "map",
                   # fluidRow(
                   #   bs4ValueBox(
                   #     value = "6", #can use textoutput() as function
                   #     subtitle = "Total sites",
                   #     color = "gray",
                   #     icon("home")
                   #   ),
                   #   bs4ValueBox(
                   #     value = "",
                   #     subtitle = "Total patients",
                   #     color = "gray-dark",
                   #     icon = icon("users")
                   #   ),
                   #   bs4ValueBox(
                   #     value = "",
                   #     subtitle = "Candida isolated",
                   #     color = "warning",
                   #     icon = icon("users")
                   #   ),
                   #   bs4ValueBox(
                   #     value = "",
                   #     subtitle = "Active surveillance",
                   #     color = "gray",
                   #     icon = icon("users")
                   #   )
                   # ),
                   box(
                     title = "MAP-AMR Kenya",
                     solidHeader = TRUE,
                     status = "lightblue",
                     collapsible = TRUE,
                     width = 12,
                     fluidRow(
                       column(
                         width = 12,
                         fluidRow(
                           column(
                             width = 8,
                             bs4Card(
                               status = "gray",
                               color = "gray",
                               title = "MAP-AMR Kenya Sites",
                               maximizable = TRUE,
                               leafletOutput("map", height = "800px"),
                               width = 12
                             )
                           ),
                           column(
                             width = 4,
                             bs4Card(
                               solidHeader = TRUE,
                               status = "gray-dark",
                               title = "Active surveillance total patients hospital summary",
                               maximizable = TRUE,
                               plotlyOutput("piechart_summary_hospital"),
                               width = 12,
                               style = "max-height: 300px; overflow-y: auto;" 
                             ),
                             bs4Card(
                               solidHeader = TRUE,
                               status = "gray-dark",
                               title = "Active surveillance candida results hospital summary",
                               maximizable = TRUE,
                               plotlyOutput("bargraph_summary_candida"),
                               width = 12
                             )
                           )
                         )
                       )
                     )
                   )
     
)
