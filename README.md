# Horror Movies IMDb Revenue Prediction

## Project Overview
This project aims to predict the gross revenue of horror movies using a decision tree model. The dataset used includes IMDb ratings, vote counts, and runtime, among other features. The project involves data cleaning, feature engineering, model training, and evaluation.

## Dataset
- The dataset is sourced from IMDb and contains information on horror movies.
- Key variables:
  - `Rating`: IMDb rating of the movie.
  - `Votes`: Number of votes received.
  - `Gross`: Gross revenue in millions (after preprocessing).
  - `Runtime`: Duration of the movie in minutes.

## Preprocessing Steps
1. **Data Cleaning**:
   - Removed commas from `Votes` and dollar signs, commas, and 'M' suffix from `Gross`.
   - Converted these columns into numeric format.
   - Removed rows with missing values in `Gross`.

2. **Feature Engineering**:
   - Created a new feature `Rating_Votes` by multiplying `Rating` and `Votes` to enhance predictive power.

## Model Development
- A **decision tree model** was built using the `rpart` package to predict `Gross` revenue.
- The model was trained on 80% of the data and tested on the remaining 20%.
- Parameters used:
  - Complexity Parameter (`cp`) = 0.01
  - Minimum Split (`minsplit`) = 10
  - Maximum Depth (`maxdepth`) = 10
- The model was visualized using `rpart.plot`.

## Model Evaluation
- **Mean Squared Error (MSE)** was calculated for both training and test datasets to assess performance.
- Predictions were stored in a CSV file (`test_dataset.csv`).

## Dependencies
Ensure you have the following R libraries installed:
```r
install.packages("rpart")
install.packages("rpart.plot")
install.packages("dplyr")
install.packages("ggplot2")
```

## Running the Project
1. Load the necessary libraries.
2. Read the dataset (`Horror Movies IMDb.csv`).
3. Perform data cleaning and preprocessing.
4. Train the decision tree model.
5. Evaluate the model using MSE.
6. Save the predictions to `test_dataset.csv`.

## Author
Keerthana

## License
This project is for educational purposes and follows an open-source license.

