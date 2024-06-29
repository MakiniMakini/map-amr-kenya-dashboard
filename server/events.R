# Observe changes to inputs and navigate tabs
observeEvent(input$nav, {
  selected_tab <- input$nav
  if (selected_tab %in% c("ipc-year1")) {
    updateNavbarPage(session, "nav", selected = "map")
  } else {
    updateNavbarPage(session, "nav", selected = "Plots")
  }
})

observeEvent(input$today_tab_link, {
  updateTabItems(session, "sidebar", "today")
})
