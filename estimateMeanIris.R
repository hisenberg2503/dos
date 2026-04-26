data(iris)

sepal_length <- iris$Sepal.Length

point_estimate <- mean(sepal_length)

conf_int_result <- t.test(sepal_length, conf.level = 0.95)
print(conf_int_result)

cat("Point Estimate (Sample Mean):", round(point_estimate, 4), "\n")
print(conf_int_result)
