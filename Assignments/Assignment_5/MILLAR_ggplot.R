## Trevor D. Millar Assignment 5
## Load data from iris and import the tidyverse library
data(iris)
library(tidyverse)

## generate plot number one using geom_point() and geom_smooth()
png(filename = "./iris_fig1.png")
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species))+
  geom_point() +
  geom_smooth(method = lm,aes(col = Species))+
  theme_minimal()+
  labs(title = "Sepal length vs petal length", subtitle = "for three iris species")
dev.off()

## generate plot number two using geom_density()
png(filename = "./iris_fig2.png")
ggplot(iris, aes(x = Petal.Width))+
  labs(title= "Distribution of Petal Widths", subtitle =  "for three iris species",x="density",y="Petal Width")+  
  geom_density(aes(fill = Species, alpha = 0.7))+
  theme_minimal()
dev.off()

## generate plot number three using geom_bar() fix the ratio
sepal_petal_width <-  iris$Petal.Width / iris$Sepal.Width
png(filename = "./iris_fig3.png")
ggplot(iris, aes(x = Species, y = sepal_petal_width))+
  geom_boxplot(aes(fill = Species))+
  labs(title = "Sepal- to Petal- Width Ratio", subtitle = "for three iris species", y= "Ratio of Sepal Width to Petal Width", x = "Species")+
  theme_minimal() 
dev.off()


## generate plot number four using geom_bar()    

iris$`Observations` <- rownames(iris)

iris$deviance <- iris$Sepal.Length - mean(iris$Sepal.Length)
iris <- iris[order(iris$deviance),]

iris$`Observations` <- factor(iris$`Observations`, levels = iris$`Observations`)

png(filename = "./iris_fig4.png")
ggplot(iris, aes(x =`Observations`,deviance)) + 
  geom_bar(stat='identity', aes(fill=Species))  +
  labs(caption = "Note: Deviance = Sepal.Length - mean(Sepal.Length)", title= "Sepal length deviance from the mean of all observations", x = "", y ="Deviance from Mean") + 
  coord_flip() +
  theme(axis.text.y= element_blank(), axis.ticks= element_blank())
dev.off()


