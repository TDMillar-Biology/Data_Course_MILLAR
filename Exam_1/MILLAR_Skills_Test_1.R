library(tidyverse)
df <- read.csv("DNA_Conc_by_Extraction_Date.csv")
head(df)
## This is q1
hist(df$DNA_Concentration_Katy, xlab = "DNA Concentration", main = "Katy's DNA Concentrations")
hist(df$DNA_Concentration_Ben, xlab = "DNA Concentration", main = "Ben's DNA Concentrations")
## This is q2 --- Make sure to clean these up before turning them in. 
png("./MILLAR_Plot1.png")
plot(x = (as.factor(df$Year_Collected)), y = df$DNA_Concentration_Katy , xlab = "Year", ylab = "DNA Concentration", main = "Katy's Extractions")
dev.off()
png("./MILLAR_Plot2.png")
plot(x = (as.factor(df$Year_Collected)), y = df$DNA_Concentration_Ben , xlab = "Year", ylab = "DNA Concentration", main = "Ben's Extractions")
dev.off()
## Q3 was added ^^^
 
##Q4 visualization
plot(x = df$DNA_Concentration_Ben, y = df$DNA_Concentration_Katy)
##Q4 real question
new_vector <- df$DNA_Concentration_Ben / df$DNA_Concentration_Katy
min_difference <- min(new_vector)
index_difference <- which(min_difference == new_vector)
lowest_difference_year <- df$Year_Collected[index_difference]

##Q5
subset_df_downstairs <- filter(df,Lab %in% "Downstairs")
png("./Ben_DNA_over_time.jpg")
plot(x = as.POSIXct(subset_df_downstairs$Date_Collected), y = subset_df_downstairs$DNA_Concentration_Ben, xlab = "Date_Sample_Collection",ylab = "DNA_Concentration_Ben")
dev.off()


