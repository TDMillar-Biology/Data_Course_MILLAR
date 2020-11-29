### Exam 3
### BIOL 3100
### Trevor D. Millar
### 11/28/2020

# Load up libraries
library(tidyverse)
library(patchwork)
library(modelr)
library(broom)

# Read in and explore the data set
df <- read.csv("./FacultySalaries_1995.csv")
head(df)
names(df)
########################### Question 1 ######################################
# We need to make this data set longer. Specifically we need to look at a column with 
# The professional's position and his or her salary. Because there are three
# positions listed, we will triple the length of our data frame when we do this pivot
columns_for_pivot <- c("AvgAssistProfSalary","AvgAssocProfSalary","AvgFullProfSalary")
df_long <- pivot_longer(df, cols = all_of(columns_for_pivot), names_to = "Rank", 
                        values_to = "Salary", names_prefix = "Avg")



# Our data frame seems a bit cluttered. We can cut that down to only include the
# information we are interested in. We will, of course, keep our original df
# Just in case we need it in the analysis

df_trimmed <- select(df_long, "UnivName", "State", "Tier", "Rank", "Salary")
df_trimmed$Rank <- as.factor(df_trimmed$Rank)
tiers_of_interest = c("I", "IIA", "IIB")

## We need to cut out the tier VIIB from the list. 
df_trimmed_selected <- filter(df_trimmed, Tier == "I" | Tier == "IIA" | Tier == "IIB")

## Lastly, it looks like we need to remove the suffixes from the x labels
df_trimmed_selected$Rank <- gsub("ProfSalary", "", df_trimmed_selected$Rank)

# Here we are going to separate the data by tier, as shown in the image provided
# by Dr. Zahn

p <- ggplot(df_trimmed_selected, aes(x = Rank, y = Salary, fill = Rank))+
  geom_boxplot() +
  theme_minimal() +
  facet_wrap(~Tier)+
  theme(axis.text.x = element_text(angle = 60))
p

jpeg("./MILLAR_Fig_1.jpg")
p
dev.off()


########################### Question 2 ######################################
Anova <- aov(Salary ~ State + Tier + Position, data =  df_trimmed)
Anova_summary <- summary(Anova)
capture.output(Anova_summary, file = "./Salary_ANOVA_Summary.txt")

########################### Question 3 ######################################
## Load up the data
df_oils <- read.csv("Juniper_Oils.csv")
## It looks like we need to change the way things are named, Dr. Zahn was 
## Mean to us and have us a list of chemicals separated by "-" not "." as is in 
## the Raw data.

names(df_oils) <- gsub("\\.", "-",names(df_oils))
names(df_oils)
## That should do it, also, we will save Dr. Zahn's list of chemicals.
listed_chemicals <- c("alpha-pinene","para-cymene","alpha-terpineol","cedr-9-ene","alpha-cedrene","beta-cedrene","cis-thujopsene","alpha-himachalene","beta-chamigrene","cuparene","compound 1","alpha-chamigrene","widdrol","cedrol","beta-acorenol","alpha-acorenol","gamma-eudesmol","beta-eudesmol","alpha-eudesmol","cedr-8-en-13-ol","cedr-8-en-15-ol","compound 2","thujopsenal")
## It looks like there is a problem with some spacing in "compound 1" and "Compound 2"
listed_chemicals <- gsub(" ","-", listed_chemicals)
print(listed_chemicals)
## All of the names in the listed chemicals should match those in the data frame now. 
## Lets trim up our data-frame to include only the info we will examine
df_oils_trimmed <- select(df_oils, "YearsSinceBurn", listed_chemicals)
## We need to pivot this data set, its just not going to go through GG plot correctly if not
df_oils_trimmed_long <- pivot_longer(df_oils_trimmed, cols = listed_chemicals, names_to = "Compound", values_to = "Concentration")
names(df_oils_trimmed_long)

########################### Question 4 ######################################
oils_plot <- ggplot(df_oils_trimmed_long, aes(x = YearsSinceBurn, y = Concentration))+
  facet_wrap(~Compound, scales = "free_y")+
  theme_minimal()+
  geom_smooth()
jpeg("MILLAR_Fig_2.jpg")
oils_plot
dev.off()

########################### Question 5 ######################################
mod1 <- glm(data = df_oils_trimmed_long, Concentration ~ YearsSinceBurn)

df_oils_Wpred <- add_predictions(df_oils_trimmed_long, mod1)
head(df_oils_Wpred)
