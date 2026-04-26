# Split the data
set.seed(42)
sample_index <- sample(1:nrow(Boston), 0.8 * nrow(Boston))
train_data <- Boston[sample_index, ]
test_data <- Boston[-sample_index, ]

# Build Linear Model: medv is response, all others are independent
model <- lm(medv ~ ., data = train_data)

# Interpret it
summary(model)


#Rsquared: model explains 72.6 of the variance in house prices
#F statistic pvalue<2.2e-16: model is highly statistically significant overall
#key significant predictors: rm,lstat,nox, dis
#non significant predictors: indus, age
