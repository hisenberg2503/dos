before <- c(15, 16, 13, 13, 17, 20, 13, 16, 14, 18)
after <- c(33, 20, 30, 35, 40, 37, 18, 26, 21, 19)

# (i) Test if exercising changes level (Two-sided Paired T-Test)
test_results <- t.test(after, before, paired=TRUE, conf.level=0.95)
print(test_results)

# (ii) 95% Confidence Interval
print("95% Confidence Interval for the mean change:")
print(test_results$conf.int)