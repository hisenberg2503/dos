
my_matrix <- matrix(c(10, 2, 3, 5, 
                      1, 14, 7, 2, 
                      8, 5, 9, 1, 
                      4, 3, 2, 11), nrow=4, byrow=TRUE)

print("Original Matrix:")
print(my_matrix)


print("Transpose:")
print(t(my_matrix))


print(paste("Determinant:", det(my_matrix)))


print("Inverse:")
print(solve(my_matrix))


print("Row Sums:")
print(rowSums(my_matrix))


print("Eigenvalues:")
print(eigen(my_matrix)$values)