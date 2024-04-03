setwd("L:/BUT/SD/Promo 2023/bfontaine/R/CSV")
df = read.csv(file = "velov.csv", header = TRUE, sep = ";", dec = "," )
summary(df)
df$CodePostal = as.factor(df$CodePostal)
df$status = as.factor(df$status)
df$bornes = ifelse(df$bikes+df$stands==df$capacity,"Ok","Ko")
table(df$bornes)
hist(x = df$capacity, main = "Distribution de \n la capacité des stations", breaks = 6, col = "red", xlab = "capacity")
abline(h = 100, col = "blue", lty = 2)
hist(x = df$capacity, main = "Distribution de \n la capacité des stations", col = "red", xlab = "capacity", probability = TRUE, ylim = c(0,0.08))
lines(x = density(df$capacity), lwd = 4,col = "blue")
boxplot(x = df$capacity, 
        main = "Boxplot de \n la capacité des stations",vertical=TRUE,outline=FALSE)
points(mean(df$capacity), col = "red", pch = 15, cex = 2)

par(mfrow=c(1,2))
df7 = subset(df, CodePostal == "69007")
boxplot(x = df7$bikes, 
        main = "Boxplot nb vélos \n 69007",
        ylim = c(0,40))
df8 = subset(df, CodePostal == "69008")
boxplot(x = df8$bikes, 
        main = "Boxplot nb vélos \n 69008",
        ylim = c(0,40))

par(mfrow=c(1,1))
boxplot(formula = bikes ~ bonus,
        data = df, 
        main = "Dispo vélos vs Stations Bonus")
means <- tapply(X = df$bikes, 
                INDEX = df$bonus, 
                FUN = function(X) mean(X))
print(means)
points(means, col = "red", pch = 19)

