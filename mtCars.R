data(mtcars)
head(mtcars)

model <- lm(mpg ~ wt + hp + am, data = mtcars)

model_summary <- summary(model)
print(model_summary)

coef(model)

shapiro_test <- shapiro.test(residuals(model))
print(shapiro_test)

if(require(car)) {
  print(vif(model))
}

par(mfrow = c(2, 2)) 
plot(model)