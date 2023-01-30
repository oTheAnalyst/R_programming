
library(tidyverse)
library(dplyr)
library(janitor)

data()
View(starwars)

glimpse(starwars)
str(starwars)

head(starwars)
class(starwars$gender)
unique(starwars$gender)

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

# %in% = means or/either12
starwars_df %>% 
  select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blonde","brown") & 
           height < 180)

mean(starwars$height, na.rm = TRUE)

starwars %>% 
  select(name, gender, hair_color,height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)

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

friends %>% 
  get_dupes()

friends %>% 
  distinct()

#recoding variables 
starwars %>% 
  select(name,gender) %>%
  mutate(gender = recode(gender,
                         "masculine" = 1, 
                         "feminine" = 2))
