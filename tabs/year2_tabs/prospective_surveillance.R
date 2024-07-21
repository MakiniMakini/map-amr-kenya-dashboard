# landing page tab with map and quick figures
tab_prospective_surveillance <- tabItem(tabName = "tab_prospective_surveillance",
                   box(
                     title = tagList(
                       "Prospective surveillance summary",
                       selectInput("prospective_surveillance_select", "Select Prospective Category", choices = c("Categories ..", "Table_1", "TNH", "NSIRH", "JOOTRH"), selected = "Categories ..")
                     ),
                     solidHeader = TRUE,
                     status = "gray-dark",
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
                               title = "MAP-AMR Kenya Prospective Surveillance Sites",
                               maximizable = TRUE,
                               leafletOutput("nairobi_map", height = "800px"),
                               width = 12
                             )
                           ),
                           column(
                             width = 4,
                             bs4Card(
                               solidHeader = TRUE,
                               status = "teal",
                               title = "Candida auris colonization rates",
                               maximizable = TRUE,
                               width = 12,
                               style = "max-height: 300px; overflow-y: auto;",
                               descriptionBlock(
                                 tags$div(
                                   style = "display: flex; flex-direction: row; justify-content: space-around; align-items: center;",
                                   tags$div(
                                     style = "text-align: center;",
                                     tags$p("12.19%", style = "font-size: 24px; font-weight: bold;"),
                                    # tags$span(class = "iconify", "data-icon" = "dashicons:arrow-up-alt", style = "color: #28a745; font-size: 16px; vertical-align: middle; margin-left: 5px;"),
                                     tags$p("Colonization rate", style = "font-size: 18px;"),
                                     tags$p("KNH", style = "font-size: 16px; color: #888888;")
                                   ),
                                   tags$div(
                                     style = "text-align: center;",
                                     tags$p("9.2%", style = "font-size: 24px; font-weight: bold;"),
                                     tags$p("Colonization rate", style = "font-size: 18px;"),
                                     tags$p("TNH", style = "font-size: 16px; color: #888888;")
                                   )
                                 )
                               )
                             ),
                             bs4Card(
                               solidHeader = TRUE,
                               status = "white",
                               title = "Prospective surveillance candida auris - summary",
                               maximizable = TRUE,
                               plotlyOutput("bargraph_summary_pros"),
                               width = 12
                             )
                           )
                         )
                       )
                     )
                   )
                   
)
