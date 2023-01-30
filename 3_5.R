library(tidyverse)
library(lubridate)
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/3_4")

#load the data file
names <- c('InspectionID','RestaurantName','OtherName','LicenseNumber','FacilityType',
           'Risk','Address','City','State','Zip','InspectionDate','InspectionType','Results',
           'Violations','Latitude','Longitude','Location')

inspection <- read_csv("inspections.csv", col_names = names, skip = 1)

========================================================
#group by aggreagetes restaurants by name
#summarize builds a summary, inspections is the new variable, 
#n counts the records 
#this whole function groups by resturant then counts 
#the number of inspections that was at each resturant
inspection %>% 
  group_by(RestaurantName) %>% 
  summarize(inspection=n()) %>% 
  arrange(desc(inspection))

=========================================================
  
alternates <- inspection %>% 
  filter(grepl("McDo",RestaurantName, ignore.case=TRUE)) %>% 
  filter(RestaurantName!='SARAH MCDONALD STEELE') %>%
  select(RestaurantName) %>% 
  unique() %>% 
  pull(RestaurantName)

inspection <- inspection %>% 
  mutate(RestaurantName=ifelse(RestaurantName %in% alternates,'MCDONALDS',RestaurantName))

inspection %>% 
  group_by(RestaurantName) %>% 
  summarize(inspection=n()) %>% 
  arrange(desc(inspection))
