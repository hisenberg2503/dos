library(MASS)
data(Boston)

# a) Pairwise scatterplots (using first few predictors for clarity)
pairs(Boston[, 1:5], main = "Pairwise Scatterplots for Boston Data")

# b) Association with Crime Rate (crim)
# Check correlation matrix for the first column (crim)
cor(Boston)[, "crim"]


