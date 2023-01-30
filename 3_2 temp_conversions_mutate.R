library(tidyverse)
library(lubridate)

setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/3_2")

weather <- read_csv("mexicanweather.csv")

weather <- weather %>% 
  spread(element, value)


weather <- weather %>% 
  filter(!(is.na(TMAX) & is.na(TMIN)))


weather <- weather %>% 
  rename(maxtemp=TMAX, mintemp=TMIN) %>% 
  select(station, date, mintemp, maxtemp)

head(weather, n=20)

weather <- weather %>% 
  mutate(mintemp=mintemp/10) %>% 
  mutate(maxtemp=maxtemp/10)


head(weather)


weather <- weather %>% 
  mutate(mintemp=mintemp*(9/5)+32) %>% 
  mutate(maxtemp=maxtemp*(9/5)+32)
