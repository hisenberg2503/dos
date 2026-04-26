hits <- c(20, 14, 21, 29, 43, 17, 15, 26, 8, 14, 39, 23, 16, 46, 28, 11, 26, 35, 26, 28, 
          22, 30, 17, 23, 9, 27, 18, 22, 19, 25, 31, 55, 63, 52, 16, 13, 23, 33, 43, 
          49, 25, 32, 26, 51, 39, 42, 55, 41, 36, 32)

# Construct Frequency Table
breaks <- seq(0, 70, by=10)
intervals <- cut(hits, breaks=breaks, right=FALSE)
freq_table <- table(intervals)
print(freq_table)

# Draw Histogram
hist(hits, breaks=breaks, col="skyblue", main="Histogram of Website Hits", 
     xlab="Hits per Day", ylab="Frequency", border="white")