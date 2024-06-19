# global.R

# Load required libraries
library(shiny)
library(bs4Dash)
library(sf)
library(DT)
library(dygraphs)
library(xts)
library(leaflet)
library(dplyr)
library(readxl)
library(plotly)
library(tidyr)
library(RColorBrewer)

# Set working directory
setwd("~/WORK/CEMA/MAP-AMR/Dashboard/appdir")

# Load data
data <- read.csv("data/ANC_county.csv")
map <- st_read("data/fe_2007_39_county/County.shp")
#pdf_path <- "data/baseline_ipc_IPCAF_2022.pdf"

# Load Excel data and read sheets into a list
excel_file <- "data/candidemia-data.xlsx"
sheet_names <- excel_sheets(excel_file)
data_list <- lapply(sheet_names, function(sheet) read_excel(excel_file, sheet = sheet))
names(data_list) <- sheet_names
summary_data <- data_list[["Totals"]]
KNH_summary <- data_list[["KNH-summary"]]
TNH_summary <- data_list[["TNH-summary"]]
KNH_candida <- data_list[["KNH-candida"]]
TNH_candida <- data_list[["TNH-candida"]]
