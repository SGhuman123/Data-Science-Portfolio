# Project overview

I used the Temporal Fusion Transformer (TFT) model for time series forecasting, specifically for hourly electricity prices in France (FR) and Belgium (BE).

Here's a breakdown of the steps involved:

1. **Data Preparation and Visualization:** The notebook starts by loading electricity consumption data, visualizing it to understand patterns, and filtering the data for France and Belgium.
2. **Feature Engineering:** It then creates time series, time-based, and static covariates to be used as inputs for the TFT model. This involves encoding time-related features and scaling the data.
3. **TFT Model Training:** A TFT model is initialized and trained using the prepared data. The model is configured with specific parameters, including input/output sequence lengths, hidden size, and more.
4. **Cross-validation:** Cross-validation is performed to assess the model's performance using a rolling forecasting window. This helps evaluate how well the model generalizes to unseen data.
5. **Parameter Tuning and Model Optimization:** The notebook then explores hyperparameter tuning using a parameter grid and cross-validation to find the best model configuration. The results are stored and used for the final model.
6. **Implementation and Forecasting:** Finally, the best-tuned model is used to predict future electricity prices. These predictions are unscaled and saved to a CSV file for further analysis or use.
