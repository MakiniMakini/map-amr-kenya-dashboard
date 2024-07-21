# Observe changes to inputs and navigate tabs

# Toggle control bar using shinyjs
# observeEvent(input$btn_prospective_surveillance, {
#   toggle <- shinyjs::toggle(selector = ".controlbar", anim = TRUE)
#   
#   
#   # Switch to the tab
#   updateTabItems(session, "sidebarMenu", "tab_prospective_surveillance")
# })

observeEvent(input$prospective_surveillance_select, {
  selected_tab <- tolower(input$prospective_surveillance_select)
  if (selected_tab != "categories ..") {
    updateTabItems(session, "tabs_prospective", selected = selected_tab)
  }
})