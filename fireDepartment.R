response_times <- c(1, 1, 2, 2, 6, 9, 4, 1, 7, 10, 2, 4, 5, 10, 5)

five_num <- fivenum(response_times)
names(five_num) <- c("Min", "Q1", "Median", "Q3", "Max")

print("Five-Number Summary:")
print(five_num)

boxplot(response_times, 
        main = "Fire Department Response Times", 
        ylab = "Minutes", 
        col = "skyblue", 
        border = "darkblue",
        horizontal = TRUE)


sample_mean <- mean(response_times)
sample_sd <- sd(response_times)

cat("\nSample Mean:", sample_mean, "minutes\n")
cat("Sample Standard Deviation:", round(sample_sd, 3), "minutes\n")