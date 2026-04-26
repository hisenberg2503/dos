counts <- 0:13
freq <- c(57, 203, 383, 525, 532, 408, 273, 139, 49, 27, 10, 4, 2, 0)

lambda_est <- sum(counts * freq) / sum(freq)
expected_probs <- dpois(counts, lambda = lambda_est)

test_result <- chisq.test(freq, p = expected_probs, rescale.p = TRUE)

cat("Estimated Lambda (Mean):", round(lambda_est, 4), "\n")
cat("Chi-Square Statistic (X-squared):", round(test_result$statistic, 4), "\n")
cat("Degrees of Freedom (df):", test_result$parameter, "\n")
cat("P-value:", round(test_result$p.value, 4), "\n")

if(test_result$p.value > 0.05) {
  print("Inference: The Poisson distribution is a GOOD fit (p > 0.05).")
} else {
  print("Inference: The Poisson distribution is a POOR fit (p <= 0.05).")
}