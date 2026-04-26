# (a) Generate X and Noise
set.seed(1)
x <- rnorm(100)
eps <- rnorm(100)

# (b) Generate Response Y (Model: Y = 2 + 3X - 5X^2 + 0.5X^3 + eps)
# I chose beta coefficients: b0=2, b1=3, b2=-5, b3=0.5
y <- 2 + 3*x - 5*x^2 + 0.5*x^3 + eps

# (c) Best Subset Selection
library(leaps)

# Create data frame with X, X^2, ..., X^10
df <- data.frame(y = y)
for(i in 1:10) {
  df[paste0("x", i)] <- x^i
}

# Perform best subset selection
best_subset <- regsubsets(y ~ ., data = df, nvmax = 10)
summary_best <- summary(best_subset)

# View which variables were chosen for the "best" model (e.g., by BIC)
which.min(summary_best$bic)
plot(best_subset, scale = "bic")