# Bulldozer Price Prediction

The objective of this project is to create a model that can best predict the price of bulldozers based on several key parameters.

The file titled **`end-to-end-bulldozer-price-regression.ipynb`**, delves into exploring the sale price of bulldozers. We treat this as a regression problem. The evaluation metric used was Root Mean Square Log Error (RMSLE). 

The dataset used comprises of the historic sales data of bulldozer prizes for things such as model type, size, sales date and more. The data would have a training set, a validation dataset and a testing dataset.

The model used is a Random Forest Regressor. Upon hyperparameter-tuning using `RandomizedSearchCV` I found out that the best hyperparameters to use are ` {'n_estimators': 90,  'min_samples_split': 18,  'min_samples_leaf': 3, 'max_samples': 10000, 'max_features': 'sqrt', 'max_depth': 10}.

Using feature importance, I figured that the most important feature that would affect the bulldozer's price would be the year that the bulldozer was made.

<img width="500" alt="image" src="https://github.com/SGhuman123/Data-Science-Portfolio/assets/63066897/5a8fbdca-980d-4da1-a2e4-b8b3b62137c8">

