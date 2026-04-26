# Given data
n <- 49
x_bar <- 39
s <- 11
mu0 <- 30

# Calculate t-statistic
t_stat <- (x_bar - mu0) / (s / sqrt(n))

# Calculate p-value
p_value <- pt(t_stat, df = n-1, lower.tail = FALSE)

cat("T-statistic:", t_stat, "\nP-value:", p_value)


#Since the calculated t-value (5.73) is much greater than the critical value (1.677), we reject the Null Hypothesis. >
#  Furthermore, the p-value is less than 0.05, providing strong evidence against $H_0$. Therefore, we can conclude with high statistical confidence that the population mean diameter of the skin test reaction is significantly greater than 30 mm.