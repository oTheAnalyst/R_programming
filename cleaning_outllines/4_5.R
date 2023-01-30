library()

setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/4_5")

residents <- read_csv("residents.csv",col_types = 'iillll')

summary(residents)

residents %>% 
  filter(ownsHome==rentsHome)

