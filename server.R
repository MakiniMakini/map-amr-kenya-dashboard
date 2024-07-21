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
  source("server/sensitivity_server/cvc_tip.R", local = TRUE)
  source("server/download_documents.R", local = TRUE)
  source("server/year2_server/nairobi_map.R", local = TRUE)
  source("server/year2_server/charts/summary_chart.R", local = TRUE)
  source("server/year2_server/charts/pps_2.R", local = TRUE)
  source("server/year1_server/download_analyzed_data_y1.R", local = TRUE)
}
