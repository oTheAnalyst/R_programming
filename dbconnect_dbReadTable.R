install.packages("DBI")
install.packages("RSQLite")
library(DBI)
library(RSQLite)


con <- dbConnect(RSQLite::SQLite(),"Hospital_Data")

dbListTables(con)

Hospital_df <- dbReadTable(con,"Hospital_General_Information")

summary(Hospital_df)

dbDisconnect(con)
