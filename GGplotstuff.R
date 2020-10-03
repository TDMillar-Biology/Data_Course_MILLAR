data("iris")
library(tidyverse)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+ 
  geom_point()+ 
  geom_smooth(aes(color = Species))+
  theme_bw()

p <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+ 
  geom_point()+ 
  geom_smooth(aes(color = Species))+
  facet_wrap(~Species)+
  labs(title= "Another Iris Plot")+
  scale_color_manual(values= c("#ffffff", "#fffb26","#d1111a"))
  
p
p + theme_bw()
p + theme_classic()
p + theme_minimal()
p + theme_void()

#cusomize our own theme for a plot
p + 
  theme(axis.title = element_text(face = "bold"),
        axis.title.x = element_text(face= "italic"),
        plot.title=element_text(family= "arial", size=26, color= "SteelBlue", face = "italic"),
        panel.grid = element_blank(),
        panel.background=element_rect(fill= "SteelBlue", color = "Purple"),
        strip.text= element_text(face = "italic"),
        strip.background= element_rect(fill="white"),
        legend.text = element_text(face = "italic"),
        axis.text.x=  element_blank()
        )
rlang::last_error()

getwd()
library(ggimage)
data(mtcars)
mtcars$image <- "./Daco_151208.png"
q = ggplot(mtcars, aes(x= disp, y=mpg,image = image))

q
# Heatmap example
table(iris$Petal.Length,iris$Species)




