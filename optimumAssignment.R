library(lpSolve)

costs <- matrix(c(8, 4, 2, 6, 1,
                  0, 9, 5, 5, 4,
                  3, 8, 9, 2, 6,
                  4, 3, 1, 0, 3,
                  9, 5, 8, 9, 5), nrow = 5, byrow = TRUE)

assignment <- lp.assign(costs)

# Inference for exam:
# Optimal Mapping:
# J1 -> P5 (Cost 1), J2 -> P1 (Cost 0), J3 -> P4 (Cost 2)
# J4 -> P3 (Cost 1), J5 -> P2 (Cost 5)
# Total Minimum Cost: 9

