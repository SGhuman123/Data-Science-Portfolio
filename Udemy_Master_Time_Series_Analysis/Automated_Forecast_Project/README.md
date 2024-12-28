# Project Overview

This notebook builds an automated time series forecasting model using the Greykite library. It follows these key steps:

1. Setup:
   
    * Imports necessary libraries (pandas, numpy, matplotlib, greykite).
    * Mounts Google Drive to access data files.
    * Defines the names of the datasets (data and future data).
    * Prompts the user to provide necessary parameters: the names of the time series, date, country, regressor columns, and forecast horizon.
  
2. Preprocessing:

    * Cleans and preprocesses data: handles missing values, scales data, converts the date column to the correct format, removes unnecessary characters from columns, and infers the frequency of the time series data.

3. Model Configuration:

    * Defines parameters for the Silverkite model using the Greykite library's components: growth, seasonality, events, changepoints, regressors, lagged_regressors, autoregression, custom.
    * Sets evaluation metrics, cross-validation parameters, and training configuration.

4. Model Training and Forecasting:

    * Initializes a Forecaster object from the Greykite library and runs it with the defined configuration.
    * Generates forecasts for the defined forecast horizon and stores them.

5. Evaluation and Visualization:

    * Summarizes the cross-validation results and prints a table of the best results.
    * Saves the final forecasts to a CSV file.
    * Visualizes the backtesting results using Greykite's plotting functionality.
