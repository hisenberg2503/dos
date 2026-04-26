library(ISLR)
data(Weekly)

# a) Summaries
summary(Weekly)
pairs(Weekly) # Only Volume vs Year shows a clear pattern (increasing over time)

# b) Logistic Regression
# Response: Direction, Predictors: Lag1 to Lag5 + Volume
model <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, 
             data = Weekly, family = binomial)
summary(model) # Usually, only Lag2 is significant (p < 0.05)

# c) Confusion Matrix & Accuracy
probs <- predict(model, type = "response")
preds <- ifelse(probs > 0.5, "Up", "Down")
conf_matrix <- table(preds, Weekly$Direction)
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
miss_error <- 1 - accuracy

print(conf_matrix)
print(accuracy)