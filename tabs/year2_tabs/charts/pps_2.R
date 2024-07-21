tab_pps_2 <- tabItem(tabName = "tab_pps_2",
                                           # box 1 KNH
                                           # other sites panle tab box
                                           box(
                                             title = "PPS 2 Summary",
                                             solidHeader = TRUE,
                                             status = "gray-dark",
                                             collapsible = TRUE,
                                             width = 12,  # Full width of the column
                                             tabsetPanel(
                                               id = "pps_2_summary",
                                               tabPanel(
                                                 title = "PPS-2 Candida Summary",
                                                 fluidRow(
                                                   column(
                                                     width = 12,
                                                     fluidRow(
                                                       
                                                       column(
                                                         width = 12,
                                                         bs4Card(
                                                           status = "fuchsia",
                                                           title = "",
                                                           maximizable = TRUE,
                                                           plotlyOutput("pps_2_bargraph"),
                                                           width = 12
                                                         )
                                                       )
                                                     )
                                                   )
                                                 )
                                               ),
                                               tabPanel(
                                                 title = "Invasives",
                                                 fluidRow(
                                                   column(
                                                     width = 12,
                                                     fluidRow(
                                                       column(
                                                         width = 12,
                                                         bs4Card(
                                                           status = "fuchsia",
                                                           title = "",
                                                           maximizable = TRUE,
                                                           plotlyOutput("pps_2_invasives"),
                                                           width = 12
                                                         )
                                                       )
                                                     )
                                                   )
                                                 )
                                               ),
                                               tabPanel(
                                                 title = "Analyzed PPS2 Data",
                                                 fluidRow(
                                                   column(
                                                     width = 12,
                                                     fluidRow(
                                                       column(
                                                         width = 4,
                                                         bs4Card(
                                                           status = "gray-dark",
                                                           title = "Click to download the analyzed data table",
                                                           maximizable = TRUE,
                                                           downloadButton("downloadTable_pps2", "Download PPS-2 Analysis Word Document"),
                                                           width = 12
                                                         )
                                                       )
                                                       # column(
                                                       #   width = 8,
                                                       #   bs4Card(
                                                       #     status = "fuchsia",
                                                       #     title = "CGTRH Summary",
                                                       #     maximizable = TRUE,
                                                       #     plotlyOutput(""),
                                                       #     width = 12
                                                       #   )
                                                       # )
                                                     )
                                                   )
                                                 )
                                               )
                                             )
                                           )
)
