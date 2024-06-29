# TODAY DATA
output$new_cases_KNH <- renderText({
  today_data$Total[today_data$Site == "KNH"]
})
