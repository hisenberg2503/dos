x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
y <- c(6, 8, 12, 14, 18, 20, 22, 24, 26, 28)

poly_model <- lm(y ~ poly(x, 2, raw = TRUE))

summary(poly_model)

plot(x, y, pch = 19, col = "blue", main = "Polynomial Regression Fit")
lines(x, predict(poly_model), col = "red", lwd = 2)