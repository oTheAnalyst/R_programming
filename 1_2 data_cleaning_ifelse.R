library(tidyverse)

#set working directory
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/1_2")

#load the data file
heating <- read.csv("heating.csv")

#tidy the data 

heating <- heating %>% 
  gather(key = "age",value = "homes", -Source)

heating %>% 
  mutate(homes=as.numeric(homes))

heating %>% 
  filter(is.na((as.numeric(homes))))

#using if else function to find "." and replace that object with a  Zero
#it also finds Z and replaces it with 0. if its and else do nothing ie just write in homes
heating <- heating %>% 
  mutate(homes=ifelse(homes==".",0,homes)) %>% 
  mutate(homes=ifelse(homes=="Z",0,homes)) %>% 
  mutate(homes==as.numeric(homes))

summary(heating)