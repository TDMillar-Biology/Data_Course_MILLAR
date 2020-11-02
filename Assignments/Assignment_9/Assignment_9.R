## Assignment 9 
## Trevor D. Millar
## 10/28/2020

library(tidyverse)

df <- read_csv("../../Data/GradSchool_Admissions.csv")

head(df)
df$admit <- as.logical(df$admit)
head(df)
