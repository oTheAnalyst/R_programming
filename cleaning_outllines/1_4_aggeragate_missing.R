library(tidyverse)
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/1_4")
employees <- read_csv("employees.csv")

View(employees)
sum(employees$Salary,na.rm = TRUE)
mean(employees$Salary,na.rm = TRUE)
max(employees$Salary,na.rm = TRUE)

