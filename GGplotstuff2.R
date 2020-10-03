library(tidyverse)
library(readxl)

##Read in excel with read_xlsx
df <- read_xlsx("./Data/wide_data_example.xlsx")

##COnvert treatment1 column to numeric
df$`Treatment 1`<-as.numeric(df$`Treatment 1`)

##Convert to long format
df_long<-pivot_longer(df,2:3,names_to = "Treatment", values_to = "Mass_g",names_prefix= "Treatment ")
df_long

ggplot(df_long, aes(y=Mass_g,x=Treatment))+
  geom_boxplot()

df2 <- read.csv("./Data/BioLog_Plate_Data.csv")

hr_cols= c("Hr_24", "Hr_48", "Hr_144")

df2_long <- pivot_longer(df2, 
                         cols = hr_cols,
                         names_to = "Time",
                         values_to = "Absorbance",
                         names_prefix = "Hr_")
df2_long$Time <- as.numeric(df2_long$Time)
ggplot(df2_long, aes(x=Time, y=Absorbance, color=Substrate))+
  geom_smooth(se=FALSE)+
  facet_wrap(~Sample.ID)+
  theme_minimal()
