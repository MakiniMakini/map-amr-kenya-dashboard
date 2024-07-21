# year 2 pps data
output$downloadTable_pps2 <- downloadHandler(
  filename = function() {
    paste("PPS 2 Analyzed Data - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/year 2/MAP-AMR_Year 2 PPS phase 2 Candida Data Analysis.docx", file)
  }
)

