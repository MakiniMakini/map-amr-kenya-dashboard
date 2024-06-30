tab_sensitivity <- tabItem(tabName = "tab_sensitivity",
                   box(
                     title = "KNH AFST Results & Outcomes",
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
                               tabsetPanel(
                                 id = "organism_tabs",
                                 type = "pills",
                                 tabPanel("Candida parapsilosis", value = "parapsilosis"),
                                 tabPanel("Candida albicans", value = "albicans"),
                                 tabPanel("Candida tropicalis", value = "tropicalis"),
                                 tabPanel("Candida auris", value = "auris")
                               ),
                               position = "left",
                               status = "primary",
                               title = "AFST REsults",
                               maximizable = TRUE,
                               plotlyOutput("knh_sensitivity_plot"),
                               width = 12
                             )
                           ),
                           column(
                             width = 4,
                             bs4Card(
                               solidHeader = TRUE,
                               status = "orange",
                               title = "Patient outcome by organism",
                               maximizable = TRUE,
                               plotlyOutput("knh_outcome_plot"),
                               width = 12
                             )
                           )
                         )
                       )
                     )
                   ),
                   box(
                     title = "TNH AFST Results & Outcomes",
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
                               tabsetPanel(
                                 id = "organism_tabs_tnh",
                                 type = "pills",
                                 tabPanel("Candida parapsilosis", value = "parapsilosis"),
                                 tabPanel("Candida albicans", value = "albicans"),
                                 tabPanel("Candida tropicalis", value = "tropicalis"),
                                 tabPanel("Candida auris", value = "auris")
                               ),
                               position = "left",
                               status = "primary",
                               title = "AFST REsults",
                               maximizable = TRUE,
                               plotlyOutput("tnh_sensitivity_plot"),
                               width = 12
                             )
                           ),
                           column(
                             width = 4,
                             bs4Card(
                               solidHeader = TRUE,
                               status = "orange",
                               title = "Patient outcome by organism",
                               maximizable = TRUE,
                               plotlyOutput("tnh_outcome_plot"),
                               width = 12
                             )
                           )
                         )
                       )
                     )
                   ),
                   box(
                     title = "MPSHAH AFST Results & Outcomes",
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
                               tabsetPanel(
                                 id = "organism_tabs_tnh",
                                 type = "pills",
                                 tabPanel("Candida parapsilosis", value = "parapsilosis"),
                                 tabPanel("Candida albicans", value = "albicans"),
                                 tabPanel("Candida tropicalis", value = "tropicalis"),
                                 tabPanel("Candida auris", value = "auris")
                               ),
                               position = "left",
                               status = "olive",
                               title = "AFST REsults",
                               maximizable = TRUE,
                               plotlyOutput("mpshah_sensitivity_plot"),
                               width = 12
                             )
                           ),
                           column(
                             width = 4,
                             bs4Card(
                               solidHeader = TRUE,
                               status = "orange",
                               title = "Patient outcome by organism",
                               maximizable = TRUE,
                               plotlyOutput("mpshah_outcome_plot"),
                               width = 12
                             )
                           )
                         )
                       )
                     )
                   )
                   
)
