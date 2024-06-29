# Render PDF viewer content
output$pdf_viewer <- renderUI({
  pdf_path <- "www/baseline_ipc_IPCAF_2022.pdf"
  
  if (file.exists(pdf_path)) {
    tags$iframe(style = "height:600px; width:100%", src = pdf_path)
  } else {
    tags$p("PDF file not found.")
  }
})
