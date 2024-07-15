output$downloadTable_1 <- downloadHandler(
  filename = function() {
    paste("Patient characteristics - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 1 - Patient Characteristics February.docx", file)
  }
)
output$downloadTable_2 <- downloadHandler(
  filename = function() {
    paste("Reason for Admission - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 2 - Reasons for current admission February.docx", file)
  }
)
output$downloadTable_3a <- downloadHandler(
  filename = function() {
    paste("Admission Characteristics", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 3a - Admission Characteristics February.docx", file)
  }
)
output$downloadTable_3b <- downloadHandler(
  filename = function() {
    paste("Invasives - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 3b - Invasives, Admission Characteristics February.docx", file)
  }
)
output$downloadTable_4 <- downloadHandler(
  filename = function() {
    paste("Underlying conditions - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 4 - Underlying Conditions February.docx", file)
  }
)
output$downloadTable_5 <- downloadHandler(
  filename = function() {
    paste("MDRO characteristics - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 5 - MDRO and results Characteristics February.docx", file)
  }
)
output$downloadTable_6a <- downloadHandler(
  filename = function() {
    paste("Antibiotic use - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 6a - Antibiotics Characteristics February.docx", file)
  }
)
output$downloadTable_6b <- downloadHandler(
  filename = function() {
    paste("Antifungal use - ", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data_folder/MAP AMR Table 6b - Antifungals Characteristics February.docx", file)
  }
)



# output$downloadWord <- downloadHandler(
#   filename = function() {
#     paste("analyzed_data", Sys.Date(), ".zip", sep = "")
#   },
#   content = function(file) {
#     # Define the folder to be zipped
#     folder_to_zip <- "www/analyzed_data_folder"
#     
#     # Create a temporary file to save the zipped content
#     tmp_file <- tempfile(fileext = ".zip")
#     
#     # Create the zip file
#     zip(tmp_file, files = list.files(folder_to_zip, full.names = TRUE))
#     
#     # Copy the zip file to the output file location
#     file.copy(tmp_file, file)
#     
#     # Clean up the temporary file
#     unlink(tmp_file)
#   }
# )
