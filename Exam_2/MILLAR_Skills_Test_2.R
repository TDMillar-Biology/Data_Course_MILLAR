#### Load Library(ies) >> tidyverse ####
library(tidyverse) 



#### Task 1: Re-create Figure 1####
df <- read_csv("./landdata-states.csv")
options(scipen = 999)

Fig1 <- ggplot(df, aes(y = Land.Value, x = Year, col = region))+
  labs(x = "Year", y = "Land Value (USD)")+
  geom_smooth()+
  labs(color = "Region")+
  theme_minimal()

Fig1
ggsave("./MILLAR_Fig_1.jpg")
#### Task 2: Which state(s) are in the NE region?####

df_NE <- filter(df, region == "N. East")
States <- unique(df_NE$State)
print(States)


#### Task 3: Load and tidy unicef-u5mr.csv####
df2_untidy <- read_csv("unicef-u5mr.csv") 
df2_tidy <- pivot_longer(df2_untidy, starts_with("U5MR."), names_to = "Year", values_to = "MortalityRate", names_prefix = "U5MR.")
df2_tidy_noNA <- filter(df2_tidy, MortalityRate != "NA" )
df2_tidy_noNA$Year <- as.numeric(df2_tidy_noNA$Year)

#### Task 4: Re-create Figure 2####
Fig2 <- ggplot(df2_tidy_noNA,aes(x = Year, y = MortalityRate, col = Continent))+
  geom_point()+
  theme_minimal()

Fig2 
ggsave("./MILLAR_Fig_2.jpg")
#### Task 5: Re-create Figure 3####
df2_tidy_noNA_means <- df2_tidy_noNA %>% 
  group_by(Continent, Year) %>% 
  summarize(Mean.MR = mean(MortalityRate))
Fig3 <- ggplot(df2_tidy_noNA_means, aes(x = Year, y = Mean.MR, col = Continent))+
  geom_line(aes(group = Continent), size = 2)+
  theme_minimal()+
  labs(y= "Mean Mortality Rate (deaths per 1000 live births)")+
  theme(axis.title.y = element_text(size = 8), axis.title.x = element_text(size = 10))
Fig3
ggsave("./MILLAR_Fig_3.jpg")

#### Task 6: Re-create figure 4 ####
df2_tidy_noNA_per1000 <- mutate(df2_tidy_noNA, MRper1000 = MortalityRate / 1000)
Fig4 <- ggplot(df2_tidy_noNA_per1000, aes(x = Year, y = MRper1000))+
  geom_point(color = "blue", 
             aes(group = Continent), 
             size = 0.3,
             alpha = 0.5)+
  facet_wrap(~Region)+
  labs(y= "Mortality Rate")+
  theme_minimal()+
  theme(strip.background = element_rect(size = 0.5), 
        strip.text.x = element_text(size = 5),
        axis.text.x = element_text(size = 5),
        axis.text.y = element_text(size =5),
        axis.title = element_text(size = 8))
Fig4
ggsave("./MILLAR_Fig_4.jpg")


