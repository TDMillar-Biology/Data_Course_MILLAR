
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

##Q4 real question

##Q5




