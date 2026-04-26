# Variance is 16, so SD is 4
set.seed(123)
samples <- rnorm(200, mean = 10, sd = 4)

summary(samples)
sd(samples)

#b
# 1. Exactly 3 times
prob_exactly_3 <- dbinom(3, size = 10, prob = 0.25)

# 2. At least 3 times: P(X >= 3) which is 1 - P(X <= 2)
prob_at_least_3 <- 1 - pbinom(2, size = 10, prob = 0.25)

cat("Exactly 3:", prob_exactly_3, "\nAt least 3:", prob_at_least_3)