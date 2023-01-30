library(tidyverse)

#load the tidyverse
setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/5_6")

#load the data file 
weather <-read.csv("mexicanweather.csv")

weather.wide <- spread(weather,element, value)

weather.wide
