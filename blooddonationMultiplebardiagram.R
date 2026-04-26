# Create the data matrix
donations <- matrix(c(1154, 526, 775, 155, 1700, 1125, 1280, 560), 
                    nrow = 2, byrow = TRUE)
colnames(donations) <- c("O", "A", "B", "AB")
rownames(donations) <- c("1995", "2000")

# Represent data by multiple bar diagram
barplot(donations, beside = TRUE, 
        legend.text = TRUE, 
        main = "Blood Donations: 1995 vs 2000",
        xlab = "Blood Group", ylab = "Number of Donations",
        col = c("darkblue", "red"))