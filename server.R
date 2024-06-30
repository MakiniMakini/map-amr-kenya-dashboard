# Load libraries if necessary (already loaded in global.R)
source("global.R")

# Server function
server <- function(input, output, session) {
  # Source server files
  source("server/table.R", local = TRUE)
  source("server/map.R", local = TRUE)
  source("server/pdf.R", local = TRUE)
  source("server/events.R", local = TRUE)
  source("server/charts.R", local = TRUE)
  source("server/today.R", local = TRUE)
  source("server/sensitivity_server/sensitivity_server.R", local = TRUE)
}
