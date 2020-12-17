## Trevor D. Millar
## Skills Test 1 Revisited
## 12/12/2020

## Let's load up the libraries we will likely need:
library(tidyverse)

## Let's load up and explore the data set some:
df <- read_csv("./DNA_Conc_by_Extraction_Date.csv")
head(df)
names(df)

## This is q1 ---
hist(df$DNA_Concentration_Katy, xlab = "DNA Concentration", main = "Katy's DNA Concentrations")
hist(df$DNA_Concentration_Ben, xlab = "DNA Concentration", main = "Ben's DNA Concentrations")

## This is q2 ---  
jpeg("./MILLAR_Plot1.jpeg")
plot(x = (as.factor(df$Year_Collected)), y = df$DNA_Concentration_Katy , xlab = "YEAR", ylab = "DNA Concentration", main = "Katy's Extractions")
dev.off()
jpeg("./MILLAR_Plot2.jpeg")
plot(x = (as.factor(df$Year_Collected)), y = df$DNA_Concentration_Ben , xlab = "YEAR", ylab = "DNA Concentration", main = "Ben's Extractions")
dev.off()
## Q3 was added ^^^

##Q4 visualization
plot(x = df$DNA_Concentration_Ben, y = df$DNA_Concentration_Katy)
##Q4 real question
new_vector <- df$DNA_Concentration_Ben / df$DNA_Concentration_Katy
min_difference <- min(new_vector)
index_difference <- which(min_difference == new_vector)
lowest_difference_year <- df$Year_Collected[index_difference]
print(lowest_difference_year)
##Q5
subset_df_downstairs <- filter(df,Lab %in% "Downstairs")
jpeg("./Ben_DNA_over_time.jpeg")
plot(x = as.POSIXct(subset_df_downstairs$Date_Collected), y = subset_df_downstairs$DNA_Concentration_Ben, xlab = "Date_Sample_Collection",ylab = "DNA_Concentration_Ben")
dev.off() 


## Q6 -- Bonus
head(df) ## Take a look at the df again
## Lets group the data by year and summarize the whole year's data as the mean of the DNA concentrations
dfben <- group_by(df, Year_Collected) %>% summarize(mean_Ben = mean(DNA_Concentration_Ben)) 
dfben ## Take a look at Bens Yearly averages 1.46 was the max in 2007.
## Lets save dfben here
write.csv(dfben, "./Ben_Average_Conc.csv")
Ben_Max <- max(dfben$mean_Ben) ## Grab the 1.46 data
Ben_Max_Index <- which(dfben$mean_Ben == Ben_Max) ## Find the index of the data
Ben_Max_Year <- dfben$Year_Collected[Ben_Max_Index]
Ben_Max_Year ## 2007 is the right answer. 
