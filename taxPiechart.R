# Create data
revenue <- c(6526, 7108, 2568, 560, 763)
sources <- c("Excise", "Customs", "Corp Tax", "Income Tax", "Other")

# Calculate percentages for labels
percent <- round(100 * revenue / sum(revenue), 1)
labels <- paste(sources, "-", percent, "%")

# Represent data by a pie chart
pie(revenue, labels = labels, 
    main = "Tax Revenue of India (1984-85)",
    col = rainbow(length(revenue)))