# (i) Probability less than 11
pnorm(11, mean = 12, sd = 1)

# (ii) Probability more than 12.5
1 - pnorm(12.5, mean = 12, sd = 1)

# (iii) Probability between 10.5 and 11.5
pnorm(11.5, mean = 12, sd = 1) - pnorm(10.5, mean = 12, sd = 1)

# (iv) Simulate 1000 selections and plot histogram
sim_data <- rnorm(1000, mean = 12, sd = 1)
hist(sim_data, main="Simulation of 1000 Beer Cans", 
     xlab="Ounces", col="gold", border="white")