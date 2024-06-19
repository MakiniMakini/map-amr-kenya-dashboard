# controlbar.R

  controlbar = bs4DashControlbar(
    skin = "dark",
    status = "primary",
    background = "dark",
    title = "MAP-AMR",
    sliderInput("obs", "Number of observations:", 1, 100, 50),
    overlay = FALSE,
    collapsed = FALSE,
    pinned = TRUE,
    controlbarMenu(
      menuItem("Item 1", tabName = "item1", icon = icon("gear")),
      menuItem("Item 2", tabName = "item2", icon = icon("bell"))
    )
  )
