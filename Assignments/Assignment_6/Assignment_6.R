## Trevor D. Millar Assignment 6
 
data(mtcars)#1. Loads mtcars

#2. Subsets mtcars for automotic transmissions
library(tidyverse) #Tidyverse has filter function
mtcars_sub_automatic <- filter(mtcars, am == 0)

#3. Saves the subset as  “automatic_mtcars.csv”
write.csv(mtcars_sub_automatic,"automatic_mtcars.csv")

#4. Plots HP v MPG using ggplot
png("mpg_vs_hp_auto.png")
ggplot(mtcars_sub_automatic, aes(x= hp, y = mpg))+
  labs(title= "Effect of Horsepower on Gas Mileage", subtitle = "of vehicals with automatic transmissions", x="HP", y="Gas Mileage (MPG)")+
  geom_point()+
  theme_minimal()+
  geom_smooth(method = lm)
dev.off()

#5 saves this plot as  “mpg_vs_hp_auto.png"
## I did this in number 4

#6 plots effect of weight on MPG

tiff("mpg_vs_wt_auto.tiff")
ggplot(mtcars_sub_automatic, aes(x= wt, y = mpg))+
  labs(title= "Effect of weight on Gas Mileage", subtitle = "of vehicals with automatic transmissions", x="Weight (lb/1000)", y="Gas Mileage (MPG)")+
  geom_point()+
  theme_minimal()+
  geom_smooth(method = lm)
dev.off()

#7 saves image as a .tiff “mpg_vs_wt_auto.tiff”
names(mtcars)
#8 Subsets original mtcars for displacements less than or equal to 200cu.in
mtcars_sub_displ200<- filter(mtcars, disp<= 200)

#9 saves #8 to csv called mtcars_max200_displ.csv
write.csv(mtcars_sub_displ200,"mtcars_max200_displ.csv")

#10. Codes maximum hp for each dataframe

Maxhp_mtcars <- max(mtcars$hp)
maxhp_htcars_sub_automatic <- max(mtcars_sub_automatic$hp)
maxhp_htcars_sub_displ200 <- max(mtcars_sub_displ200$hp)
write.t
#11. 
write.table(c(Maxhp_mtcars, maxhp_htcars_sub_automatic, maxhp_htcars_sub_displ200),"hp_maximums.txt")

#12. Combines the 3 plots into one image

p1<- ggplot(mtcars, aes(x = wt, y = mpg))+
  geom_point()+
  geom_smooth(method = lm)+
  labs(title = "Effect of Weight on Gas Mileage", subtitle = "of cars in mtcars", x = "Weight (lb/1000)", y = "Gas Mileage (MPG)")+
  theme_minimal()
p2 <-ggplot(mtcars, aes(x ))

p3 <- ggplot(mtcars, aes(x = hp, y = mpg))+
  geom_point()+
  geom_smooth(method = lm)+
  labs(title = "Effect of Horsepower on Gas Mileage", subtitle = "of cars in mtcars", x = "HP", y = "Gas Mileage(MPG)") +
  theme_minimal()
  

p1 + p3
library(patchwork)
