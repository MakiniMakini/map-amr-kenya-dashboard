tab_monthly_active_surveillance <- tabItem(tabName = "monthly_active_surveillance",
                   # box 1 KNH
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
                   # box 2 TNH
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
                   ),
                   # box 3 MP-SHAH
                   box(
                     title = "MP-SHAH Active Surveillance",
                     solidHeader = TRUE,
                     status = "lightblue",
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
                               title = "Candida Isolates at MP-SHAH",
                               maximizable = TRUE,
                               plotlyOutput("piechart_mp_shah_candida"),
                               width = 12
                             )
                           ),
                           column(
                             width = 8,
                             bs4Card(
                               status = "fuchsia",
                               title = "MP-SHAH Summary",
                               maximizable = TRUE,
                               plotlyOutput("bargraph_mp_shah"),
                               width = 12
                             )
                           )
                         )
                       )
                     )
                   ),
                   # other sites panle tab box
                   box(
                     title = "Other sites",
                     solidHeader = TRUE,
                     status = "teal",
                     collapsible = TRUE,
                     width = 12,  # Full width of the column
                     tabsetPanel(
                       id = "knh-tabset",
                       tabPanel(
                         title = "Machakos",
                         fluidRow(
                           column(
                             width = 12,
                             fluidRow(
                               column(
                                 width = 4,
                                 bs4Card(
                                   status = "gray-dark",
                                   title = "Candida Isolates at MP-SHAH",
                                   maximizable = TRUE,
                                   plotlyOutput("piechart_mp_shah_candida"),
                                   width = 12
                                 )
                               ),
                               column(
                                 width = 8,
                                 bs4Card(
                                   status = "fuchsia",
                                   title = "Machakos Summary",
                                   maximizable = TRUE,
                                   plotlyOutput("bargraph_machakos"),
                                   width = 12
                                 )
                               )
                             )
                           )
                         )
                       ),
                       tabPanel(
                         title = "JOOTRH",
                         fluidRow(
                           column(
                             width = 12,
                             fluidRow(
                               column(
                                 width = 4,
                                 bs4Card(
                                   status = "gray-dark",
                                   title = "Candida Isolates at MP-SHAH",
                                   maximizable = TRUE,
                                   plotlyOutput("piechart_mp_shah_candida"),
                                   width = 12
                                 )
                               ),
                               column(
                                 width = 8,
                                 bs4Card(
                                   status = "fuchsia",
                                   title = "JOOTRH Summary",
                                   maximizable = TRUE,
                                   plotlyOutput("bargraph_JOOTRH"),
                                   width = 12
                                 )
                               )
                             )
                           )
                         )
                       ),
                       tabPanel(
                         title = "CGTRH",
                         fluidRow(
                           column(
                             width = 12,
                             fluidRow(
                               column(
                                 width = 4,
                                 bs4Card(
                                   status = "gray-dark",
                                   title = "Candida Isolates at MP-SHAH",
                                   maximizable = TRUE,
                                   plotlyOutput("piechart_mp_shah_candida"),
                                   width = 12
                                 )
                               ),
                               column(
                                 width = 8,
                                 bs4Card(
                                   status = "fuchsia",
                                   title = "CGTRH Summary",
                                   maximizable = TRUE,
                                   plotlyOutput("bargraph_CGTRH"),
                                   width = 12
                                 )
                               )
                             )
                           )
                         )
                       )
                     )
                   )
)
