# year 1 pps data
output$downloadTable_pps1 <- downloadHandler(
  filename = function() {
    paste("PPS 1 Analyzed Data and Retrospective Data- ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/year_1/MAP-AMR_Year 1 PPS and Retrospective Candida Data Analysis.docx", file)
  }
)

