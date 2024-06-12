# Neural Networks Regression

The file titled ` 01_neural_network_regression_with_tensorflow.ipynb` was dedicated to learning about neural network regression. I learnt about how to define a regression problem and when might it be possible to treat a problem as a regression problem. 

The following was covered:

- Architecture of a regression model
- Input shapes and output shapes
  - `X`: features/data (inputs)
  - `y`: labels (outputs)
- Creating custom data to view and fit
- Steps in modelling
  - Creating a model
  - Compiling a model
    - Defining a loss function
    - Setting up an optimizer
    - Creating evaluation metrics
  - Fitting a model (getting it to find patterns in our data)
- Evaluating a model
  - Visualizing the model ("visualize, visualize, visualize")
  - Looking at training curves
  - Compare predictions to ground truth (using our evaluation metrics)
- Saving a model (so we can use it later)
- Loading a model


In the file titled ` 01_Exercises_neural_network_regression.ipynb` this was my solution to the practice problem I had to do as part of the course exercise. I did the following:

1. Create your regression dataset (or make the one we created in "Create data to view and fit" bigger) and build fit a model to it.
2. Try building a neural network with 4 Dense layers and fitting it to your own regression dataset, how does it perform?
3. Try and improve the results we got on the insurance dataset, some things you might want to try include:
    - Building a larger model (how does one with 4 dense layers go?).
    - Increasing the number of units in each layer.
    - Look up the documentation of Adam and find out what the first parameter is, what happens if you increase it by 10x?
    - What happens if you train for longer (say 300 epochs instead of 200)?
4. Import the Boston pricing dataset from TensorFlow `tf.keras.datasets` and model it.

