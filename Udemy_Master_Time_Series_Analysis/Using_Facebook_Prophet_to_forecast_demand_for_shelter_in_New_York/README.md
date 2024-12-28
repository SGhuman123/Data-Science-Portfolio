# Overview of project

In this notebook, I used Facebook Prophet to forecast the demand for shelters in New York City to enable better resource planning. This involves:

1. **Prepare Dataframe**
      * Facebook Prophet has a lot of quirks.
The Date variable must be called ds and
the time-series has to be y. Additionally,
the date must be in the format yyyymm-dd. Finally, don't forget to prepare
the events like was shown in the
practice tutorial.

2. **Training and test set**
    * In Time-Series, the training and test
set follows a different structure, given
that information without context does
not have value. Additionally, the test
set should have the same number of
days as a real-life forecast.

3. **Prophet Model and Accuracy assessment**
    * Build the Facebook Prophet model,
while adding the regressors. Next,
build the future data frame to
perform the forecast. In the end,
assess the accuracy of the model.

4. **Visualization**
    * Facebook Prophet has very cool built-in
visualization functions. Use them! As a
visual learner myself, I like to see
pretty graphs to know what the model
tells me.

5. **Parameter Tuning**
    * Do the Parameter Tuning while
performing cross-validation. Tune
the parameters we tuned in the
practice tutorial.
