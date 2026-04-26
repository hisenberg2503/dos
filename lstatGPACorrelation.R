# Load required libraries
library(boot)
library(ISLR)

# --- PART (i): Bootstrap Correlation ---

# 1. Create the data frame from the table
lstat <- c(576, 635, 558, 578, 666, 580, 555, 661, 651, 605, 653, 575, 545, 572, 594)
gpa <- c(339, 330, 281, 303, 344, 307, 300, 343, 336, 313, 312, 274, 276, 288, 296)
law_data <- data.frame(LSTAT = lstat, GPA = gpa)

# 2. Define function to compute correlation (needed for boot function)
corr_func <- function(data, indices) {
  d <- data[indices, ] # allows boot to select sample
  return(cor(d$LSTAT, d$GPA))
}

# 3. Compute the sample correlation
sample_corr <- cor(law_data$LSTAT, law_data$GPA)
cat("Sample Correlation:", sample_corr, "\n")

# 4. Perform Bootstrap (e.g., 1000 replicates)
set.seed(1)
boot_results <- boot(data = law_data, statistic = corr_func, R = 1000)

# 5. Output the Bootstrap Estimate of Standard Error
print(boot_results)


# --- PART (ii): Analysis of 'Weekly' Dataset ---

# a) Numerical and Graphical Summaries
data("Weekly")
summary(Weekly)
pairs(Weekly) # Scatterplot matrix to look for patterns
cor(Weekly[,-9]) # Correlation matrix (excluding 'Direction' factor)

# b) Logistic Regression
# Response: Direction, Predictors: Lag1 to Lag5 + Volume
logit_model <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, 
                   data = Weekly, family = "binomial")
summary(logit_model)

# c) Confusion Matrix and Accuracy
# Get predicted probabilities
probs <- predict(logit_model, type = "response")

# Convert probabilities to class labels (Up/Down)
preds <- ifelse(probs > 0.5, "Up", "Down")

# Confusion Matrix
conf_matrix <- table(Predicted = preds, Actual = Weekly$Direction)
print("Confusion Matrix:")
print(conf_matrix)

# Accuracy and Error Rate
accuracy <- mean(preds == Weekly$Direction)
error_rate <- 1 - accuracy

cat("\nAccuracy:", accuracy)
cat("\nMissclassification Error:", error_rate)










