# Load necessary libraries
library(rpart)
library(rpart.plot)
library(dplyr)
library(ggplot2)

# Load the dataset
data <- read.csv("~/Documents/Datathon 24/Horror Movies IMDb.csv")

# Clean the 'Votes' and 'Gross' columns by removing commas, dollar signs, and "M" suffix
data$Votes <- as.numeric(gsub(",", "", data$Votes))
data$Gross <- as.numeric(gsub("[$,M]", "", data$Gross))

# Handle missing values: Remove rows with missing 'Gross' values
data <- data %>% filter(!is.na(Gross))

# Feature Engineering: Create new feature by multiplying Rating and Votes
data$Rating_Votes <- data$Rating * data$Votes

# Split the data into training and testing sets (80% train, 20% test)
set.seed(123)  # For reproducibility
sample_index <- sample(1:nrow(data), 0.8 * nrow(data))
train_data <- data[sample_index, ]
glimpse(train_data)
test_data <- data[-sample_index, ]
glimpse(test_data)

# Build the decision tree model to predict Gross revenue
tree_model <- rpart(Gross ~ Rating + Votes + Rating_Votes + Runtime, 
                    data = train_data, control = rpart.control(cp = 0.01, minsplit = 10, maxdepth = 10))
rpart.plot(tree_model)

# Predict Gross revenue on the training set
train_data$pred_Gross <- predict(tree_model, train_data)

# Calculate Mean Squared Error (MSE) on the training set
MSE <- mean((train_data$Gross - train_data$pred_Gross)^2)
cat("Mean Squared Error (MSE) on Training Set:", MSE)

# Predict Gross revenue on the test set and calculate MSE for testing
test_data$pred_Gross <- predict(tree_model, test_data)
test_MSE <- mean((test_data$Gross - test_data$pred_Gross)^2)
cat("Mean Squared Error (MSE) on Test Set:", test_MSE)

write.csv(test_data, "test_dataset.csv", row.names=FALSE)
