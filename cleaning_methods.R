#load libraries
library(tidyverse)
library(dplyr)
library(janitor)

#view the data throught summary type functions 
data()
View(starwars)
glimpse(starwars)
str(starwars)
head(starwars)


class(starwars$gender)
unique(starwars$gender)

#convert the charecter type to a vector
starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

starwars$gender <- factor((starwars$gender),
                          levels = c("masculine",
                                     "feminine"))

levels(starwars$gender)

#select variables
names(starwars)

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  names()

unique(starwars$hair_color)

#select columns, filters by blonde and brown hair color and height under 180 
# %in% = means or/either12
starwars_df %>% 
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blonde","brown") & 
           height < 180)

mean(starwars$height, na.rm = TRUE)

#Find the incomplete cases in the dataframe
starwars %>% 
  select(name, gender, hair_color,height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)

#Replaces the NA with the string none
starwars %>% 
  select(name, gender, hair_color,height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color,"none"))

#duplicates 
Names <- c("Steven","Jeff","Jamira","Bob","Jamira")
Age <- c(22,33,23,18,23)
friends <- data.frame(Names, Age)
head(friends)
View(friends)

#find duplicates
friends %>% 
  get_dupes()

#filters out duplicates 
friends %>% 
  distinct()

#recoding variables withing fac
starwars %>% 
  select(name,gender) %>%
  mutate(gender = recode(gender,
                         "masculine" = 1, 
                         "feminine" = 2))
