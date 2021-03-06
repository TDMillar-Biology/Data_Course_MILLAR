df <- read.table("../../Data/ITS_mapping.csv", header = TRUE, sep = "\t")

summary(df)
str(df)
plot(x=(as.factor(df$Ecosystem)),y=df$Lat, xlab = "Ecosystem", ylab = "Latitude", cex.lab=1, cex.axis=0.4, cex.main=1, cex.sub=1, main = "Ecosystems by Latitude")     

png(filename = "./silly_boxplot.png")
plot(x=(as.factor(df$Ecosystem)),y=df$Lat, xlab = "Ecosystem", ylab = "Latitude", cex.lab=1, cex.axis=0.4, cex.main=1, cex.sub=1, main = "Ecosystems by Latitude")    
dev.off()





