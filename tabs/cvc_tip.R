tab_cvc_tip <- tabItem(tabName = "tab_cvc_tip",
                           box(
                             title = "CVC-TIP AFST Results",
                             solidHeader = TRUE,
                             status = "gray-dark",
                             collapsible = TRUE,
                             width = 12,
                             fluidRow(
                               column(
                                 width = 12,
                                 fluidRow(
                                   column(
                                     width = 12,
                                     bs4Card(
                                       tabsetPanel(id = "facility_tabs",
                                                   tabPanel("TNH", value = "TNH",
                                                            tabsetPanel(id = "organism_tabs_tnh",
                                                                        tabPanel("Candida albicans", value = "albicans"),
                                                                        tabPanel("Candida glabrata", value = "glabrata"))),
                                                   tabPanel("MP SHAH", value = "MP SHAH",
                                                            tabsetPanel(id = "organism_tabs_mpshah",
                                                                        tabPanel("Candida albicans", value = "albicans"),
                                                                        tabPanel("Candida auris", value = "auris"),
                                                                        tabPanel("Candida doubushaemulonii", value = "doubushaemulonii"),
                                                                        tabPanel("Candida parapsilosis", value = "parapsilosis")))),
                                       plotlyOutput("sensitivity_plot")
                                     )
                                   )
                                   # ,
                                   # column(
                                   #   width = 4,
                                   #   bs4Card(
                                   #     solidHeader = TRUE,
                                   #     status = "orange",
                                   #     title = "Patient outcome by organism",
                                   #     maximizable = TRUE,
                                   #     plotlyOutput("knh_outcome_plot"),
                                   #     width = 12
                                   #   )
                                   # )
                                 )
                               )
                             )
                           )
                           
)
