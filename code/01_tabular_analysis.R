here::i_am("code/01_tabular_analysis.R")

#load data
library(readr)
data <- read_csv("data/Impact_of_Remote_Work_on_Mental_Health.csv")

#tabular analysis
install.packages("glue")
library(labelled)
library(dplyr)
library(gtsummary)
data$Number_workhour_per_week <- ifelse(data$Hours_Worked_Per_Week <= 40, "<= 40", "> 40")
var_label(data) <- list(
  Industry = "Industry",
  Work_Location = "Work Location",
  Work_Life_Balance_Rating = "Work-Life Balance Rating",
  Stress_Level = "Stress Level",
  Sleep_Quality = "Sleep Quality",
  Region = "Region",
  Number_workhour_per_week = "Number of Work Hours per Week")


table_one <-data |> 
  select(Industry, Work_Location, Work_Life_Balance_Rating, Stress_Level, Sleep_Quality, Region, Number_workhour_per_week) |>
  tbl_summary(by = Stress_Level) |>
  modify_spanning_header(c("stat_1", "stat_2","stat_3") ~ "**Stress Level**") |>
  add_overall() |>
  add_p()


saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)

