library(tidyverse)
library(car)

df <- read_csv("./Data/BioLog_Plate_Data.csv")
data("MplsStops")
data("MplsDemo")

glimpse(df)

df_long <- pivot_longer(df, cols = starts_with("Hr_"), 
             names_to = "Time", 
             values_to = "Absorbance", 
             names_prefix = "Hr_")

nrow(df)
nrow(df_long)

unique(df_long$Substrate)

df_long$Substrate <- str_squish(df_long$Substrate)
df_long$Time <- as.numeric(df_long$Time)
names(df_long)[1] <- "SampleID"
names(df_long)

p <- ggplot(df_long, aes(x=Time, y = Absorbance, color = SampleID))+
  geom_smooth() + 
  facet_wrap(~Substrate)
       
p

df_long <-mutate(df_long, SampleType = case_when(SampleID %in% c("Clear_Creek", "Waste_Water") ~"Water",
                                                 SampleID %in% c("Soil_1", "Soil_2") ~ "Soil"))

p2 <- ggplot(df_long, aes(x=Time, y = Absorbance, color = SampleType))+
  geom_smooth() + 
  facet_wrap(~Substrate) +
  theme_minimal()

p2

  