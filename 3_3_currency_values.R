library(tidyverse)
library(lubridate)


setwd("~/workbook/Ex_Files_Cleaning_Bad_Data_R/Exercise Files/3_3")


names <- c("DRG","ProviderID","Name","Address","City","Zip",
           "Region","Discharges","AverageCharges","AverageTotalPayments","AverageMedicarePayments")

inpatient <- read_tsv("inpatient.tsv",skip=1,col_names=names)


summary(inpatient)

inpatient$AverageCharges

types <- 'ciccccccinnn'

inpatient <- read_tsv("inpatient.tsv",skip=1,col_names = names,col_types = types)

summary(inpatient)

