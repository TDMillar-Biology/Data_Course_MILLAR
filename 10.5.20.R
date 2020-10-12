# Load libraries, data, etc ####
library(tidyverse)
library(skimr)



df <- read_csv("./Data/MLO_Metadata.csv")

glimpse(df)
skim(df)

names(df)

#dplyr verbs #### 

filter() ## picks rows
select() ## picks columns
arrange() ## arranges data frame based on a column(sorting function)
mutate() ## Creates, modifies and deletes columns as a function of an existing column
group_by() ## Create groups based on a column 
summarize() ## Summarize usually based on grouped variables

%>% #pipe output of left becomes first argument of right side function
  
  
  
df2 <-df %>%
  filter(Month %in% c("April","May")) %>% 
  select(where(is.numeric)) %>% 
  arrange(MLO_Aerosol_cm3) %>% 
  mutate(MLO_Aero_Scat_Mean = sum(MLO_aero_scat1,MLO_aero_scat2,MLO_aero_scat3)/3)

names(df)  
        
df2 %>% 
  group_by(Year) %>% 
  summarize(Mean_cm3 = mean(MLO_Aerosol_cm3))
