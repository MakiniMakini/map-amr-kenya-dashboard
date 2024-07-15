tab_analyzed_data <- tabItem(tabName = "tab_analyzed_data",
                       box(
                         title = "Analyzed active survaillance candidemia tables",
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
                                   tabsetPanel(id = "",
                                               tabPanel("Table 1",
                                                        tabsetPanel(id = "table-1",
                                                                    tabPanel("Table 1 Patient characteristics", downloadButton("downloadTable_1", "Download Table 1 Word Document"))
                                                                    )
                                                        ),
                                               tabPanel("Table 2",
                                                        tabsetPanel(id = "table-2",
                                                                    tabPanel(" Table 2 Reason for admission", downloadButton("downloadTable_2", "Download Table 2 Word Document"))
                                                                    )
                                                        ),
                                               tabPanel("Table 3",
                                                        tabsetPanel(id = "table-3",
                                                                    tabPanel("Table 3(a) Admission Characteristics", downloadButton("downloadTable_3a", "Download Table 3a Word Document")),
                                                                    tabPanel("Table 3(b) Invasives", downloadButton("downloadTable_3b", "Download Table 3b Word Document"))
                                                                    )
                                                        ),
                                               tabPanel("Table 4",
                                                        tabsetPanel(id = "table-3",
                                                                    tabPanel("Table 4 Underlying conditions", downloadButton("downloadTable_4", "Download Table 4 Word Document"))
                                                                    )
                                                        ),
                                               tabPanel("Table 5",
                                                        tabsetPanel(id = "table-3",
                                                                    tabPanel("Table 5 MDRO characteristics", downloadButton("downloadTable_5", "Download Table 5 Word Document"))
                                                                    )
                                                        ),
                                               tabPanel("Table 6",
                                                        tabsetPanel(id = "table-3",
                                                                    tabPanel("Table 6(a) - Antibiotic use", downloadButton("downloadTable_6a", "Download Table 6a Word Document")),
                                                                    tabPanel("Table 6(b) - Antifungal use", downloadButton("downloadTable_6b", "Download Table 6b Word Document"))
                                                                    )
                                                        )
                                               )
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
