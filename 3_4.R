setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/3_4")
library(tidyverse)
library(lubridate)

capitals <- read_csv("capitals.csv")

head(capitals)
tail(capitals)
summary(capitals)

capitals %>% 
  select(zip) %>% 
  mutate(capitals$zip,ifelse()
digits


#data was corrected at the source
#the codde to correct the excel document would
#have been to complex for a simple task
capitals <- read_csv("capitals_corrected.csv")

