# Heart Disease Prediction Project

The objective of this project is to find the best possible model to predict the risk of someone getting a heart disease so that people who are at risk of getting a heart disease can get preventive treatment before contracting the heart disease.

The file titled **`end-to-end-heart-disease-classification.ipynb`**, delves into exploring the problem of heart disease classification.

The topics covered are:

-	**Exploratory data analysis (EDA)** - the process of going through a dataset and finding out more about it.
-	**Model training** - create model(s) to learn to predict a target variable based on other variables.
-	**Model evaluation** - evaluating a model's predictions using problem-specific evaluation metrics.
-	**Model comparison** - comparing several different models to find the best one.
-	**Model fine-tuning** - once we've found a good model, how can we improve it?
-	**Feature importance** - since we're predicting the presence of heart disease, are there some things which are more important for prediction?
-	**Cross-validation** - if we do build a good model, can we be sure it will work on unseen data?
-	**Reporting what we've found** - if we had to present our work, what would we show someone?

The problem covered is the issue of binary classification on whether someone does have a heart disease or does not have a heart disease. The data used is from the UCI machine Learning Repository where 14 attributes will be used in the prediction. Some of the machine learning models that I experimented with were Logistics Regression, K-Nearest Neighbours (KNN) and Random Forest.

<img width="300" alt="image" src="https://github.com/SGhuman123/Python-Bootcamp-codes-for-Udemy-course/assets/63066897/c1ec4865-17cf-40a1-b666-0edaad949b66">
 
I found that out of all 3 models, logistics regression performed the best as the base model.

Upon hyperparameter tuning, for the KNN model, I found out that a `n_neighbors = 11` would be ideal. However, the accuracy score of KNN remains below the Logistics Regression and Random Forest model. As such, I ignored the KNN model and chose to focus on the Logistics Regression and Random Forest models instead. 

Upon hyperparameter tuning, for the Logistics Regression model, I used `RandomizedSearchCV` and after 20 iterations, I found out that the best parameters to use would be `{'solver': 'liblinear', 'C': 0.23357214690901212}`.

Upon hyperparameter tuning, for the Random Forest model, I used `RandomizedSearchCV` and after 20 iterations, I found out that the best parameters to use would be `{'n_estimators': 210, 'min_samples_split': 4, 'min_samples_leaf': 19, 'max_depth': 3}`.

After all the hyperparameter tuning, I identified that the Logistics Regression had the highest accuracy and therefore should be used as the model. To take the hyperparameter tuning even further, I used `GridSearchCV`.  I found out that an even better parameter to use for my Logistics Regression model would be `{'C': 0.20433597178569418, 'solver': 'liblinear'}`.

To evaluate my fine-tuned Logistics Regression model, I used the ROC Curve, a confusion matrix and a classification report.

<img width="300" alt="image" src="https://github.com/SGhuman123/Data-Science-Portfolio/assets/63066897/2d6d83d6-3fd7-47c3-b6d5-938bf6375365">

<img width="300" alt="image" src="https://github.com/SGhuman123/Data-Science-Portfolio/assets/63066897/536d1637-cada-4111-8667-90cba5af2241">

<img width="300" alt="image" src="https://github.com/SGhuman123/Data-Science-Portfolio/assets/63066897/8fc51630-1082-42e3-abf4-f6b413ffa0d7">


Subsequently, I used cross-validation to get a better gauge of the Accuracy, Precision, Recall and F1-score. I then conducted a feature importance analysis and out of all the features, sex has the greatest impact on the likelihood of getting a heart disease. Whereby if the patient is female, they're more likely to have heart disease.

<img width="300" alt="Screenshot 2024-05-27 at 8 28 20 PM" src="https://github.com/SGhuman123/Python-Bootcamp-codes-for-Udemy-course/assets/63066897/e338c953-b86d-4731-b4da-58c31376f870">
