# Install and load the quadprog library
if (!require("quadprog")) install.packages("quadprog")
library(quadprog)

## 1. Define the Matrix D (Quadratic terms)
# The function has terms like 3x1^2, 2.5x2^2, 2x3^2 and cross-products.
# We must multiply by 2 because quadprog solves 1/2 * x^T D x.
# D = [ 6  2  1 ]
#     [ 2  5  2 ]
#     [ 1  2  4 ]
Dmat <- matrix(c(6, 2, 1, 
                 2, 5, 2, 
                 1, 2, 4), nrow = 3, byrow = TRUE)

## 2. Define the Vector d (Linear terms)
# The linear part is -8x1 - 3x2 - 3x3. 
# Since the formula uses -d^T b, d is positive.
dvec <- c(8, 3, 3)

## 3. Define Constraints (A^T b = b0)
# Constraint 1: 1*x1 + 0*x2 + 1*x3 = 3
# Constraint 2: 0*x1 + 1*x2 + 1*x3 = 0
Amat <- matrix(c(1, 0, 1,
                 0, 1, 1), nrow = 3, byrow = FALSE)
bvec <- c(3, 0)

## 4. Solve the QP problem
# meq = 2 indicates that the first 2 constraints are equality constraints (==)
sol <- solve.QP(Dmat, dvec, Amat, bvec, meq = 2)

## 5. Display results
cat("Optimal values for x1, x2, x3:\n")
print(sol$solution)
cat("\nMinimal value of f(x):\n")
print(sol$value)