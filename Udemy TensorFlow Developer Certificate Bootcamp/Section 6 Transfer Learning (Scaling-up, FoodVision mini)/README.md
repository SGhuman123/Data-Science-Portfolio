# Transfer Learning (Scaling-up, FoodVision Mini)

In the file titled 06_Transfer_Learning_Scaling_up.ipynb` was dedicated to learning about Transfer Learning (Fine-tuning).

**"As is" transfer learning** is when you take a pre-trained model as it is and apply it to your task without any changes.

**Feature extraction transfer learning** is when you take the underlying patterns (also called weights) a pre-trained model has learned and adjust its outputs to be more suited to your problem.

In **fine-tuning transfer learning** the pre-trained model weights from another model are unfrozen and tweaked to better suit your own data.

The goal of this notebook is to **beat the original [Food101 paper](https://data.vision.ee.ethz.ch/cvl/datasets_extra/food-101/static/bossard_eccv14_food-101.pdf)'s results with 10% of data** (leverage the power of deep learning).

![image](https://raw.githubusercontent.com/mrdbourke/tensorflow-deep-learning/main/images/06-ml-serial-experimentation.png)

The following is covered:
- Downloading and preparing 10% of the Food101 data (10% of training data)
- Training a feature extraction transfer learning model on 10% of the Food101 training data
- Fine-tuning our feature extraction model
- Saving and loading our trained model
- Evaluating the performance of our Food Vision model trained on 10% of the training data
  - Finding our model's most wrong predictions
- Making predictions with our Food Vision model on custom images of food

In the file titled ` 06_Practice_Transfer_Learning_Scaling_up.ipynb` this was my solution to the practice problem I had to do as part of the course exercise.
