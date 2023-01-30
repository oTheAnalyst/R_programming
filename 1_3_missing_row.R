#load libray set up csv load tidyverse 
#set working directory and read the csv into a dataframe
library(tidyverse)
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/1_3")
land <- read_csv("publiclands.csv")

missing_states <- tibble(State=c('Connecticut','Delaware',
                                'Hawaii','Iowa','Maryland',
                                'Massachusetts','New Jersey','Rhode Island'),
  PublicLandAcres=c(0,0,0,0,0,0,0,0))

land <- rbind(land, missing_states)

View(land)