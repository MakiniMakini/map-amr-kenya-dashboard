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
library(shinyjs)
library(tidyverse)
library(ggplot2)
library(rsconnect)
library(reshape2)
# Set working directory
#setwd("~/WORK/CEMA/MAP-AMR/Dashboard/appdir")

# Load data
data <- read.csv("data/ANC_county.csv")
map <- st_read("data/fe_2007_39_county/County.shp")
#pdf_path <- "data/baseline_ipc_IPCAF_2022.pdf"

# Load Excel data and read sheets into a list
excel_file <- "data/candidemia-data.xlsx"
sheet_names <- excel_sheets(excel_file)
data_list <- lapply(sheet_names, function(sheet) read_excel(excel_file, sheet = sheet))
names(data_list) <- sheet_names
# today data
today_data <- data_list[["Today"]]
notifications <- data_list[["Notifications"]]
summary_data <- data_list[["Totals"]]
#map summary data
hospital_summary <- data_list[["Totals"]]
# monthly summaries
KNH_summary <- data_list[["KNH-summary"]]
TNH_summary <- data_list[["TNH-summary"]]
MP_SHAH_summary <- data_list[["MP-SHAH-summary"]]
Machakos_summary <- data_list[["Machakos-summary"]]
JOOTRH_summary <- data_list[["JOOTRH-summary"]]
CGTRH_summary <- data_list[["CGTRH-summary"]]
# candida results
KNH_candida <- data_list[["KNH-candida"]]
TNH_candida <- data_list[["TNH-candida"]]
MP_SHAH_candida <- data_list[["MP-SHAH-candida"]]
Machakos_candida <- data_list[["Machakos-candida"]]
JOOTRH_candida <- data_list[["JOOTRH-candida"]]
CGTRH_candida <- data_list[["CGTRH-candida"]]
# sensitivity data
# read KNH data 
KNH_sensitivity_data <- data_list[["KNH"]] %>% 
  rename("organism_isolated" = "Organism isolated", "patient_outcome" = "Patient outcome",
         "sensitive" = "AFST-Sensitive", "resistant" = "AFST-Resistant", "intermediate" = "AFST-Intermediate")
# read TNH data 
TNH_sensitivity_data <- data_list[["TNH"]] %>% 
  rename("organism_isolated" = "Organism isolated", "patient_outcome" = "Patient Outcome",
         "sensitive" = "AFST-Sensitive", "resistant" = "AFST-Resistant", "intermediate" = "AFST-Intermediate")
# read MPShah data 
MPSHAH_sensitivity_data <- data_list[["MPShah"]] %>% 
  rename("organism_isolated" = "Organism isolated", "patient_outcome" = "Patient outcome",
         "sensitive" = "AFST -Sensitive", "resistant" = "AFST-Resistant", "intermediate" = "AFST-Intermediate")
# cvc tip data
CVC_TIP_DATA <- data_list[["CVC-TIPS"]]  %>% 
  rename("organism_isolated" = "Organism isolated", "patient_outcome" = "Patient outcome",
         "sensitive" = "AFST-Sensitive", "resistant" = "AFST-Resistant", "intermediate" = "AFST-Intermediate") %>%
  select(Facility, organism_isolated, sensitive, intermediate, resistant, patient_outcome)

