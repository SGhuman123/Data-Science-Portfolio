# Transfer Learning (Feature Extraction)

The file titled ` 04_Feature_Extraction.ipynb` was dedicated to learning about Transfer Learning (Feature Extraction) and the benefits of using transfer learning (to leverage an existing neural network architecture proven to work on problems like ours and to work on already learned patterns on similar data to our own).

**"As is" transfer learning** is when you take a pre-trained model as it is and apply it to your task without any changes.

**Feature extraction transfer learning** is when you take the underlying patterns (also called weights) a pre-trained model has learned and adjust its outputs to be more suited to your problem.

The following was covered: 
- Introduce transfer learning (a way to beat all of our old self-built models)
- Using a smaller dataset to experiment faster (10% of training samples of 10 classes of food)
- Build a transfer learning feature extraction model using TensorFlow Hub
- Introduce the TensorBoard callback to track model training results
- Compare model results using TensorBoard

![image](https://raw.githubusercontent.com/mrdbourke/tensorflow-deep-learning/main/images/04-transfer-learning-feature-extraction.png)


In the file titled ` 04_Practice_Feature_Extraction.ipynb` this was my solution to the practice problem I had to do as part of the course exercise. Some of the tasks done were:
1. Build and fit a model using the same data we have here but with the MobileNetV2 architecture feature extraction ([`mobilenet_v2_100_224/feature_vector`](https://tfhub.dev/google/imagenet/mobilenet_v2_100_224/feature_vector/5)) from TensorFlow Hub, how does it perform compared to our other models?

2. Name 3 different image classification models on TensorFlow Hub that we haven't used.

3. Build a model to classify images of two different things you've taken photos of.
    - You can use any feature extraction layer from TensorFlow Hub you like for this.
    - You should aim to have at least 10 images of each class, for example, to build a fridge versus oven classifier, you'll want 10 images of fridges and 10 images of ovens.


4. What is the current best-performing model on ImageNet?
