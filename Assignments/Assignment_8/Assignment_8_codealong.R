## Assignment 8 Trevor D. Millar

library(modelr)
library(tidyverse)

df <- data(mtcars)
names(mtcars)

mod1 = lm(mpg ~ disp, data = mtcars)
summary(mod1)

ggplot(mtcars, aes(x = disp, y = mpg))+
  geom_point()+
  geom_smooth(method = "lm")+ 
  theme_minimal()


mod2 = lm(mpg ~ qsec, data = mtcars)

ggplot(mtcars, aes(x = qsec, y = mpg))+
  geom_point()+
  geom_smooth(method = "lm")+
  theme_minimal()
summary(mod2)

mean(mod1$residuals^2)
mean(mod2$residuals^2)

df <- mtcars %>% add_predictions(mod1)
df[,c("mpg","pred")] %>% head()

newdf <- data.frame(disp = c(500,600,700,800,900))
pred <- predict(mod1, newdata = newdf)
print(pred)
hyp_preds <- data.frame(disp = newdf$disp, pred = pred)

df$PredictionType <- "Real"
hyp_preds$PredictionType <- "Hypothetical"

combined <- full_join(df, hyp_preds)

ggplot(combined, aes(x = disp, y = pred, color = PredictionType))+
  geom_point() +
  theme_minimal()+
  geom_point(aes(y = mpg), color = "Black")

