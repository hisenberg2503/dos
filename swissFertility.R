library(leaps)
library(MASS)

# i) Fit initial regression model
full_model <- lm(Fertility ~ ., data = swiss)
summary(full_model)

# ii) Best Subset Selection
best_subset <- regsubsets(Fertility ~ ., data = swiss, nvmax = 5)
summary(best_subset)

# Forward Selection
null_model <- lm(Fertility ~ 1, data = swiss)
forward_model <- stepAIC(null_model, scope = list(lower = null_model, upper = full_model), 
                         direction = "forward", trace = FALSE)

# Backward Selection
backward_model <- stepAIC(full_model, direction = "backward", trace = FALSE)

# Compare results
summary(forward_model)
summary(backward_model)

#iii
# Define the function
f <- function(x) { return(x^2 * exp(x)) }

# Golden Section Search Function
golden_search <- function(f, a, b, tol = 1e-5) {
  ratio <- (sqrt(5) - 1) / 2
  x1 <- b - ratio * (b - a)
  x2 <- a + ratio * (b - a)
  
  while (abs(b - a) > tol) {
    if (f(x1) < f(x2)) {
      b <- x2
      x2 <- x1
      x1 <- b - ratio * (b - a)
    } else {
      a <- x1
      x1 <- x2
      x2 <- a + ratio * (b - a)
    }
  }
  return((a + b) / 2)
}

# Run optimization on [-10, 10]
min_x <- golden_search(f, -10, 10)
cat("Value of x that minimizes f(x):", min_x)


#iv
data("PlantGrowth")

# Perform One-Way ANOVA
anova_results <- aov(weight ~ group, data = PlantGrowth)
summary(anova_results)

# If significant, conduct Tukey's HSD to see which groups differ
TukeyHSD(anova_results)
