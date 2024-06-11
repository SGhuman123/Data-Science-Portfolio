# Transfer Learning (Feature Extraction)

In the file titled ` 04_Feature_Extraction.ipynb` this was dedicated to learning about Transfer Learning (Feature Extraction) and the benefits of using transfer learning (to leverage an existing neural network architecture proven to work on problems like ours and to work on already learned patterns on similar data to our own).

**"As is" transfer learning** is when you take a pretrained model as it is and apply it to your task without any changes.

**Feature extraction transfer learning** is when you take the underlying patterns (also called weights) a pretrained model has learned and adjust its outputs to be more suited to your problem.

The following was covered: 
- Introduce transfer learning (a way to beat all of our old self-built models)
- Using a smaller dataset to experiment faster (10% of training samples of 10 classes of food)
- Build a transfer learning feature extraction model using TensorFlow Hub
- Introduce the TensorBoard callback to track model training results
- Compare model results using TensorBoard

![image](https://raw.githubusercontent.com/mrdbourke/tensorflow-deep-learning/main/images/04-transfer-learning-feature-extraction.png)


In the file titled ` 04_Practice_Feature_Extraction.ipynb` this was my solution to the practice problem I had to do as part of the course exercise.
