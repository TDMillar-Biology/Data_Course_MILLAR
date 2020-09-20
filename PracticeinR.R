library(tidyverse)

data(iris)

iris[1:5,2]
iris[1:5,"Sepal.Width"]
iris$Sepal.Width[1:5]

vec <- 1:10


vec > 2

setosarows <- iris$Species == "setosa"

iris[setosarows,]

filter(iris, Species == "virginica")
filter(iris, Species == "virginica" | Species == "setosa")



data(mtcars) 
?mtcars

glimpse(mtcars)

filter(mtcars, hp > 100 & disp < 150)





