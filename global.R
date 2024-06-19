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

# Set working directory
setwd("~/WORK/CEMA/MAP-AMR/Dashboard/appdir")

# Load data
data <- read.csv("data/ANC_county.csv")
map <- st_read("data/fe_2007_39_county/County.shp")
pdf_path <- "data/baseline_ipc_IPCAF.pdf"

# Load Excel data and read sheets into a list
excel_file <- "data/candidemia-data.xlsx"
sheet_names <- excel_sheets(excel_file)
data_list <- lapply(sheet_names, function(sheet) read_excel(excel_file, sheet = sheet))
names(data_list) <- sheet_names
KNH_data <- data_list[["KNH"]] %>% rename("organism_isolated" = "Organism isolated")
