# Description:

## Objective:
Develop a Proof of Concept (PoC) model to predict potential cancellations.

## Problem Definition:
In our case, the problem we will be exploring is **binary classification** (a sample can only be one of two things).

This is because we're going to be using several different **features** (pieces of information) about whether a person is likely to cancel their hotel booking or not.

> Understanding these features will help us prioritize customers based on their likelihood to cancel, enabling the hotel to allocate resources more effectively, enhance customer retention strategies, and provide personalized service to those less likely to cancel.

## Data used:
* We shall be using `hotel_bookings_2.csv`
* The original database contains 39 attributes, but here only 31 attributes will be used. **Attributes** (also called **features**) are the variables that we'll use to predict our **target variable**.
* Attributes and features are also referred to as **independent variables** and a target variable can be referred to as a **dependent variable**.

> We use the independent variables to predict our dependent variable.

* In our case, the independent variables are a hotel guest's different booking information attributes and the dependent variable is whether or not their booking is cancelled.

## Exploratory Data Analysis:

![First](https://github.com/user-attachments/assets/9e20d420-6b25-4734-b77c-69857c5a0d18)

* From the graph above we can see that there are more cases of non-cancellations over cancellations.

![Second](https://github.com/user-attachments/assets/565c1d45-5b8b-4898-8e3e-47129d0d3995)

* Hence, base on the visualization about it suggest that 2019 is the busiest year and that August tends to be the busiest month.
* However, it is worth noting that this may not be accurate as for both 2018 & 2020, they do not capture all 12 months of the year.

![Third](https://github.com/user-attachments/assets/90cd6af2-53f4-4d8d-a9dd-39a5034ee54f)

* It seems that the busiest month and busiest year are also the ones with the highest cancellation rates.

## Feature Engineering:
* Boolean feature for new customers who have booked rooms in the resort on weekdays.
* Boolean feature of singles or couples without children/babies who have booked rooms with a non-refundable deposit.
* Boolean feature of stay duration as it represents the total number of nights a guest is booked to stay at the hotel, combining both weekend and weekday nights. This feature provides insights into the length of the guest's stay, which can influence the likelihood of cancellation. Longer stays might be more prone to cancellations due to the greater commitment required, whereas shorter stays might be less likely to be cancelled.

## Definition of cancellation:

Target variable data column: **is_canceleled**

Where by for reservation cancellation:
* is_canceleled = 1 means the reservation is cancelled
* is_canceleled = 0 means the reservation is not cancelled

## Data pre-processing:
* Feature encoding: convert non-numerical values to numerical values

## Models experimented with:
1. Logistic Regression - [`LogisticRegression()`](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html)
2. K-Nearest Neighbors - [`KNeighboursClassifier()`](https://scikit-learn.org/stable/modules/generated/sklearn.neighbors.KNeighborsClassifier.html)
3. RandomForest - [`RandomForestClassifier()`](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.RandomForestClassifier.html)

## Model Comparision:
* Random Forest performs the best even after LogisticRegression was fine-tuned using [`RandomizedSearchCV`](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.RandomizedSearchCV.html).
![4th](https://github.com/user-attachments/assets/7578e823-3573-4a2e-b6b8-81c510c89dd5)

## Evaluation metrics:
* ROC curve
![ROC](https://github.com/user-attachments/assets/7b8c3128-9e7a-4f8d-b8c1-a6cc8751ffc5)
* **Interpretation:** This is great, our model does far better than guessing which would be a line going from the bottom left corner to the top right corner, AUC = 0.5. But a perfect model would achieve an AUC score of 1.0, so there's still room for improvement.

* Confusion matrix
* ![Conf_matrix](https://github.com/user-attachments/assets/2fea6c34-93de-4ed4-bc3b-0db8c11a15d9)
* **Interpretation:**
    * **True label 0, Predicted label 0** (Top-left: 1.1e+04): The model correctly predicted 11,000 bookings as not cancelled (true negatives).
    * **True label 0, Predicted label 1** (Top-right: 5.4e+02): The model incorrectly predicted 540 bookings as cancelled when they were not cancelled (false positives).
    * **True label 1, Predicted label 0** (Bottom-left: 1.4e+03): The model incorrectly predicted 1,400 bookings as not cancelled when they were cancelled (false negatives).
    * **True label 1, Predicted label 1** (Bottom-right: 5.5e+03): The model correctly predicted 5,500 bookings as cancelled (true positives).
 
    * **False Positives (540 cases)**: These are instances where the model predicts that a booking will be cancelled, but the booking is not cancelled. In a hotel context, this might mean the hotel mistakenly considers these bookings as cancellations and could potentially release the reserved rooms to other guests or take unnecessary actions to mitigate the perceived cancellations.
    * **False Negatives (1400 cases)**: These are instances where the model predicts that a booking will not be cancelled, but the booking is cancelled. In this scenario, the hotel may hold rooms for guests who end up not showing up, leading to lost revenue opportunities from other potential bookings.
 
## Business Impact and Preference

**1. False Positives:**

* **Impact**: Rooms that were not going to be cancelled are erroneously marked as cancelled. This can lead to the hotel overbooking or rebooking rooms unnecessarily, potentially causing operational inefficiencies, guest dissatisfaction, or the need for compensation if the overbooked guests have to be relocated.
* **Mitigation**: Hotels may manage this by having flexible overbooking strategies and clear communication with guests.

**2. False Negatives:**

* **Impact**: Rooms are held for guests who end up canceling. This can lead to rooms remaining empty, resulting in lost revenue as those rooms could have been sold to other guests. This directly impacts the hotel’s bottom line.
* **Mitigation**: Hotels often manage this risk with last-minute deals, walk-in customers, or dynamic pricing strategies.

### Hotel's Preference
Given the choice between false positives and false negatives, a hotel would generally prefer false positives over false negatives. Here's why:

* **False Positives** lead to operational inconveniences and the potential need to manage overbooked rooms, but these issues are often manageable through established processes like overbooking strategies and guest communication.

* **False Negatives** lead to direct revenue loss because rooms that could have been sold to other guests remain empty. This lost revenue is harder to recover and has a more immediate and tangible impact on the hotel's financial performance.

Therefore, while both types of errors have their drawbacks, false negatives are usually more detrimental to a hotel's revenue and profitability. Reducing false negatives would be more critical for the hotel to ensure optimal room occupancy and revenue management.

## Feature Importance:
* From what we can see we it seems that is_passport has a higher likelihood of leading to a hotel booking cancellation. Meaning foreigners of Singapore are more prone to cancelling bookings.
* Also is_nric is also pretty high suggesting that Singaporeans too are prone to cancelling bookings but not so much as compared to foreigners.
* Also, guest with babies are also high suggesting that due to unforeseen circumstances when handling babies. This may result in cancellation of hotel bookings.
* Also, whether the hotel is Bristol or Botanical Hotel it is likely to have an impact on the cancellations. Suggesting one hotel has a more pertinent issue than the other.
* Also, the arrival date of the month has a large impact on cancellations depend on the time of the month. But using periods closer to the start of the month as an example many people receive their salaries at the end or beginning of the month, influencing their ability to book or cancel trips based on their financial situation.

![feature_imp](https://github.com/user-attachments/assets/6af62db3-1147-4921-9ef1-bc1dbc838ac6)


> **Notes:**
> Before loading the dataset `hotel_bookings.csv` into Postgres, I noticed that there were 4 NA values in the children column which was causing loading difficulties. As such, I cleaned the CSV using Excel manually and created a new CSV file called `hotel_bookings_2.csv`.
