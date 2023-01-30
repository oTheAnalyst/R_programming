library(tidyverse)
library(RSQLite)
library(DBI)
library(ggplot2)
library(forcats)
library(dplyr)

setwd("~/workbook")

con <- dbConnect(RSQLite::SQLite(),"Disaster_Data.db")

dbListTables(con)
dbListFields(con,"us_disaster_declarations")

res<- dbSendQuery(con,
"SELECT fy_declared, 
count(incident_type) AS number_of_incidents 
FROM us_disaster_declarations
WHERE fy_declared > 1960
GROUP BY fy_declared
ORDER by fy_declared DESC;")

res<- dbGetQuery(con,
"SELECT fy_declared, 
count(incident_type) AS number_of_incidents 
FROM us_disaster_declarations
WHERE fy_declared > 1960
GROUP BY fy_declared
ORDER by fy_declared DESC;")


disaster_df <- dbReadTable(con, "us_disaster_declarations")
query <- dbReadTable(con,res)

summary(disaster_df)
colnames(disaster_df)


type<- disaster_df %>% 
  count(incident_type)


res <- res %>% 
  rename(Number_of_Disasters_Declared = number_of_incidents,Year_Declared = fy_declared)

type <- type %>% 
  arrange(n)

fct_reo

boxplot(res$number_of_incidents)
boxplot(type$n)

res <- res %>% 
  filter(number_of_incidents < 4500)

type <- type %>% 
  filter(n < 5000)

boxplot(type$n)

boxplot(res$number_of_incidents)

type %>% 
  arrange(n) %>% 
  mutate(incident_type=factor(incident_type,levels=incident_type)) %>% 
  ggplot(aes(x=incident_type,y=n))+
  geom_point(aes())+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

type %>% 
  dplyr::mutate(incident_type = fct_reorder(n,incident_type, .fun ='length')) %>% 
  ggplot(aes(x=incident_type,y=n))+
  geom_point(aes())+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))



ggplot(data = res,mapping = aes(x = Year_Declared,y=Number_of_Disasters_Declared))+
  geom_point(aes())+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  labs(title = "Number of Natural Disasters Declared by year",subtitle = 
         "By the federal government")




fct_reo


type %>% 
  mutate(incident_type = fct_reorder(incident_type,n))




dbDisconnect(con)



