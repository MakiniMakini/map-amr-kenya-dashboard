output$downloadWord <- downloadHandler(
  filename = function() {
    paste("analyzed_data", Sys.Date(), ".docx", sep = "")
  },
  content = function(file) {
    file.copy("www/analyzed_data.docx", file)
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
