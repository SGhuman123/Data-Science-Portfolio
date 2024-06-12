# Convolutional Neural Network

The file titled ` 03_CNN.ipynb` was dedicated to learning about computer vision and Convolutional Neural Networks in TensorFlow. I learnt the use cases of such a network for cases such as:

* Classify whether a picture of food contains pizza 🍕 or steak 🥩 (we're going to do this)
* Detect whether or not an object appears in an image (e.g. did a specific car pass through a security camera?)

The following was covered:

- Getting a dataset to work with
- Architecture of a convolutional neural network
- A quick end-to-end example (what we're working towards)
- Steps in modelling for binary image classification with CNNs
  - Becoming one with the data
  - Preparing data for modelling
  - Creating a CNN model (starting with a baseline)
  - Fitting a model (getting it to find patterns in our data)
  - Evaluating a model
  - Improving a model
  - Predicting with a trained model
- Steps in modelling for multi-class image classification with CNNs
 - Same as above (but this time with a different dataset)

In the file titled ` 03_Practice_CNN.ipynb` this was my solution to the practice problem I had to do as part of the course exercise with a focus on classifying between baseball ⚾️ and basketballs 🏀. Some of the tasks done were:

1. Spend 20 minutes reading and interacting with the [CNN explainer website](https://poloclub.github.io/cnn-explainer/).
  * What are the key terms? e.g. explain convolution in your own words, pooling in your own words

    - Convolution: Mathematical operation on two functions that produces a third function
    - Pooling: Average pooling is another type of pooling, and that's where you take the average value from each region rather than the max (max pooling).

2. Play around with the "understanding hyperparameters" section in the [CNN explainer](https://poloclub.github.io/cnn-explainer/) website for 10-minutes.
  * What is the kernel size? Ans: `kernel_size` - the size of our filters, for example, a `kernel_size` of `(3, 3)` (or just 3) will mean each filter will have the size 3x3, meaning it will look at a space of 3x3 pixels each time. The smaller the kernel, the more fine-grained features it will extract.
  * What is the stride? ANS: `stride` - the number of pixels a `filter` will move across as it covers the image. A `stride` of 1 means the filter moves across each pixel 1 by 1. A `stride` of 2 means it moves 2 pixels at a time.
  * How could you adjust each of these in the TensorFlow code?
3. Take 10 photos of two different things and build your own CNN image classifier using the techniques we've built here.
4. Find an ideal learning rate for a simple convolutional neural network model on your 10-class dataset.
