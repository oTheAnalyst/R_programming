library(tidyverse)
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/2_1")
continents <- read_csv("continents.csv")

summary(continents)
View(continents)

continents <- unique(continents)

continents <- continents %>% 
  filter(!Continent=='Antartica' & Population> 100000)

View(continents)