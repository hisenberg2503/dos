x <- seq(2, 20, by=2)
y <- c(6, 10, 12, 16, 18, 22, 24, 26, 28, 30)

# Fit a 2nd degree polynomial model
poly_model <- lm(y ~ poly(x, 2, raw = TRUE))

# Summary and Plot
summary(poly_model)
plot(x, y, main="Polynomial Regression")
lines(x, predict(poly_model), col="red")


#The polynomial regression plots and summaries were obtained. The highest adjusted Rsquare value was found to be 0.9961