df <- read.table("../../Data/ITS_mapping.csv", header = TRUE, sep = "\t")

plot(x=(as.factor(df$Ecosystem)),y=df$Lat, xlab = "Ecosystem", ylab = "Latitude", cex.lab=1, cex.axis=0.5, cex.main=1, cex.sub=1)     

png(filename = "./silly_boxplot.png")
par(mar=c(3,3,3,3)+.1)
plot(x=(as.factor(df$Ecosystem)),y=df$Lat, xlab = "Ecosystem", ylab = "Latitude", cex.lab=1, cex.axis=0.4, cex.main=1, cex.sub=1)    
dev.off()





