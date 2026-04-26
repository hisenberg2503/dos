#mean = np = 5
#variance = npq = 3
#=> q = 3/5 = 0.6 => p = 1-0.6 = 0.4

# Generate 30 random numbers
n_size <- 13
prob <- 0.4
data_binom <- rbinom(30, size = n_size, prob = prob)

# Descriptive Statistics
summary(data_binom)
sd(data_binom)