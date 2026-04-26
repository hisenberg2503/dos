# install.packages("lpSolve")
library(lpSolve)

costs <- matrix(c(8, 4, 2, 6, 1,
                  2, 4, 5, 4, 1,
                  3, 6, 7, 6, 5,
                  8, 4, 6, 6, 4,
                  9, 6, 2, 6, 5), nrow=5, byrow=TRUE)

assignment <- lp.assign(costs)
assignment$solution  # Shows the mapping
assignment$objval    # Minimum total cost