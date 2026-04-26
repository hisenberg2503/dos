library(MASS)
data(cats)

# Plot sex-wise boxplot for Heart Weight (Hwt)
# Sex is a factor where F = Female, M = Male
boxplot(Hwt ~ Sex, data = cats, 
        main = "Heart Weight by Sex in Cats",
        xlab = "Sex", ylab = "Heart Weight (g)",
        col = c("pink", "lightblue"))