# Suppose we have 2 variables: x1 and x2
dvec <- c(4, 8)  # length = 2

# We have 3 constraints:
# 1. 5x1 + 3x2 >= 15
# 2. x1 >= 3
# 3. x2 <= 0  ->  -1x2 >= 0
# We define them row-wise first:
Amat_rows <- matrix(c(5, 3, 
                      1, 0, 
                      0, -1), nrow = 3, byrow = TRUE)

# ERROR: solve.QP(Dmat, dvec, Amat_rows) -> Incompatible! 
# Because length(dvec) is 2, but Amat_rows has 3 rows.

# FIX: Transpose so it has 2 rows (one for x1, one for x2)
sol <- solve.QP(Dmat, dvec, t(Amat_rows), bvec)
sol
