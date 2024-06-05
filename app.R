#load the libraries
library(shiny)

# ui object
ui <- fluidPage(
  titlePanel(p("MAP-AMR KENYA", style = "color:#3474A7")),
  sidebarLayout(
    sidebarPanel(img(src = "kenya-logo.jpg",
                     width = "70px", height = "70px")),
    mainPanel("Main Panel")
  )
)

#server
server <- function(input, output){}

#shinny app
shinyApp(ui = ui, server = server)
