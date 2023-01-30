library(tidyverse)
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/2_2")
population <- read.csv("population.csv")

summary(population)
head(population)
View(population)
glimpse(population)

population <- population %>% 
  filter(!(Subject %in% c('Total','Male','Female')))

sum(population$Population)


population <- population %>% 
  filter(!(Subject %in% c('Total','Male','Female'))) %>% 
  sum(population$Population)
