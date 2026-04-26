library(ggplot2)

ggplot(Boston, aes(x = lstat, y = rad)) +
  geom_point(alpha = 0.5, col = "darkgreen") +
  labs(title = "Relationship between Lstat and Rad",
       x = "Lower Status of Population (%)",
       y = "Index of Accessibility to Highways") +
  theme_minimal()