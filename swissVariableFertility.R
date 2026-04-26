library(tidyverse)
library(caret)
# Load the data
head(swiss)
str(swiss)
# Split the data into training and test set
set.seed(123)
train_set <- swiss$Fertility %>%createDataPartition(p = 0.8, list = FALSE)
train.data <- swiss[train_set, ]
test.data <- swiss[-train_set, ]
# Build the model
model <- lm(Fertility ~., data = train.data)
# Make predictions and compute the R2, RMSE and MAE
predictions = model %>% predict(test.data)
predictions
data.frame( R2 = R2(predictions, test.data$Fertility),
            RMSE = RMSE(predictions, test.data$Fertility),
            MAE = MAE(predictions, test.data$Fertility))

#The validation set approach is used to train the linear regression model on the swiss dataset. The model have a r squared value of 0.594 and RMSE value of 6.41