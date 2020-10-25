## Assignment 8 Trevor D. Millar
#### Loading in libraries ####
library(tidyverse)
library(patchwork)
library(MASS)
library(modelr)
#### Loads "mushroom_growth.csv" ####
df <- read_csv("../../Data/mushroom_growth.csv")
names(df)
head(df)

#### Preliminary Plotting ####
## Plots GrowthRate ~ Light
p1 <- ggplot(df, aes(x = as.factor(Light), y = GrowthRate))+
  geom_boxplot()
p1
## Plots GrowthRate ~ Nitrogren
p2 <- ggplot(df, aes(x = as.factor(Nitrogen), y = GrowthRate))+
  geom_boxplot()
p2
##Plots GrowthRate ~ Humidity, AOV
p3 <- ggplot(df, aes(x = Humidity, y = GrowthRate))+
  geom_boxplot()
p3
##Plots GrowthRate ~ Temperature
p4 <- ggplot(df, aes(x = as.factor(Temperature), y = GrowthRate))+
  geom_boxplot()
p4
model_temp<- aov(GrowthRate ~ as.factor(Temperature), df)
summary(model_temp) # no significant differnce between temps (p = 0.154)
(p1 + p2) / (p3 + p4)

##Plots GrowthRate ~ Species
p5 <- ggplot(df, aes(x = Species,y = GrowthRate))+
  geom_boxplot()
p5
mod_Species = aov(GrowthRate ~ Species, data = df)
summary(mod_Species) ## Statistically significant difference between species
mean(mod_Species$residuals^2)




#### Modeling####
#Modeling  Growth rate as a function of Nitrogen
mod_nitrogen = lm(GrowthRate ~ Nitrogen, data = df)
summary(mod_nitrogen)
mean(mod_nitrogen$residuals^2)
#Modeling Growth rate as a function of Light
mod_light = lm(GrowthRate ~ Light, data = df )
summary(mod_light)
mean(mod_light$residuals^2)
#Modeling Growth rate as a function of Humidity
mod_Humidity = aov(GrowthRate ~ Humidity, data = df)
summary(mod_Humidity)
mean(mod_Humidity$residuals^2)

#Modleing Growth rate as a function of Species
mod_Species <- aov(GrowthRate ~ Species, data = df)
summary(mod_Species) ## P.Cornicopiae Grows faster than P. Ostreotus P = 0.000273

#Modeling growth rate as a full model 
mod_full <- glm(data = df, formula = GrowthRate ~ Species * Light * Nitrogen * Humidity * Temperature)
summary(mod_full)
mean(mod_full$residuals^2)

# Attempting to Optimize my full model
step <- stepAIC(mod_full)
step$formula
mean(step$residuals^2)
mod_step <- glm(data = df, formula = step$formula)
summary(mod_step)

anova(mod_full, mod_step)

mean(mod_full$residuals^2) ## Better of the two based on lower residuals difference of ~64
mean(mod_step$residuals^2)

#Adding predictions to the actual values
df2 <- df %>% add_predictions(mod_full)

#Making a hypothetical dataframe with each possible variable value
hypo_df = data.frame(Light= rep(c(5,15,25), 120) , Nitrogen= rep(c(0,5,15,25,35), 72), Temperature= rep(c(5,10,15,20,25,30),60), Species= rep(c("P.ostreotus","P.cornucopiae"),180),
                   Humidity= rep(c("High","Low"), 180))

#Adding predicitons to the hypothetical values
hypodf_pred = hypo_df %>% add_predictions(mod_full)

#Adding lables to indicate which data is real and which is made-up
df2$PredictionType <- "Real"
hypodf_pred$PredictionType <- "Hypothetical"

#Combining real and made up dfs
combined <- full_join(df2, hypodf_pred)

#plotting the combined data 
#360 rows containing missing values are removed because the hypothetical values 
# do not have any value for measured GrowthRate. It's not a bug. 
ggplot(combined, aes(x = Nitrogen, y = pred, color = PredictionType))+
  geom_point()+
  theme_minimal()+
  geom_point(aes(y = GrowthRate), color = "Black")
