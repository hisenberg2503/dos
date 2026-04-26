# Load required libraries
library(ISLR)
library(boot)

# --- PART (i): Logistic Regression & Standard Error Comparison ---

# 1. Using standard formula in glm()
glm_fit <- glm(default ~ income + balance, data = Default, family = "binomial")
summary_glm <- summary(glm_fit)
cat("Standard Errors from glm():\n")
print(summary_glm$coefficients[, "Std. Error"])

# 2. Using the Bootstrap
# Define function to return coefficients
boot_fn <- function(data, index) {
  return(coef(glm(default ~ income + balance, data = data, subset = index, family = "binomial")))
}

set.seed(1)
boot_results <- boot(Default, boot_fn, R = 1000)
cat("\nStandard Errors from Bootstrap (1000 replicates):\n")
print(boot_results)


# --- PART (ii): LOOCV vs k-fold Cross Validation ---

# 1. Leave-One-Out Cross Validation (LOOCV)
# Note: glm without family specified defaults to linear, 
# but for cv.glm we use the existing fit.
cv_error_loocv <- cv.glm(Default, glm_fit)$delta[1]

# 2. k-fold Cross Validation (k=10)
set.seed(1)
cv_error_10fold <- cv.glm(Default, glm_fit, K = 10)$delta[1]

# Display Results
cat("\nLOOCV Error Rate:", cv_error_loocv)
cat("\n10-fold CV Error Rate:", cv_error_10fold)