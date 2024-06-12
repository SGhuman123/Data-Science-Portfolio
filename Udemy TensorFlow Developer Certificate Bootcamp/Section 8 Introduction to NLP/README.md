# Natural Language Processing (NLP)

In the file titled ` 08_introduction_to_nlp_in_tensorflow_video.ipynb ` this was dedicated to understanding Natural Language Processing. 

The following was covered:

* Downloading a text dataset for disaster tweets
* Visualizing text data
* Converting text into numbers using tokenization
* Turning our tokenized text into an embedding
* Modelling a text dataset
  * Starting with a baseline (TF-IDF)
  * Building several deep-learning text models
    * Dense, LSTM, GRU, Conv1D, Transfer learning
* Comparing the performance of each of our models
* Combining our models into an ensemble
* Saving and loading a trained model
* Find the most wrong predictions

![image](https://raw.githubusercontent.com/mrdbourke/tensorflow-deep-learning/main/images/08-text-classification-inputs-and-outputs.png)

![image](https://raw.githubusercontent.com/mrdbourke/tensorflow-deep-learning/main/images/08-tokenization-vs-embedding.png)

Some of the models I experimented with were:

* Model 0: Naive Bayes (baseline), this is from Sklearn ML map: https://scikit-learn.org/stable/tutorial/machine_learning_map/index.html
* Model 1: Feed-forward neural network (dense model)
* Model 2: LSTM model (RNN)
* Model 3: GRU model (RNN)
* Model 4: Bidirectional-LSTM model (RNN)
* Model 5: 1D Convolutional Neural Network (CNN)
* Model 6: TensorFlow Hub Pretrained Feature Extractor (using transfer learning for NLP)
* Model 7: Same as model 6 with 10% of training data

Some types of sequence-based problems:
* **One to one:** one input, one output, such as image classification.
* **One to many:** one input, many outputs, such as image captioning (image input, a sequence of text as caption output).
* **Many to one:** many inputs, one output, such as text classification (classifying a Tweet as a real disaster or not a real disaster).
* **Many to many:** Many inputs, many outputs, such as machine translation (translating English to Spanish) or speech to text (audio wave as input, text as output).

In the file titled ` 08_Exercise_nlp_in_tensorflow.ipynb` this was my solution to the practice problem I had to do as part of the course exercise. This involved the following:

1. Rebuild, compile and train `model_1`, `model_2` and `model_5` using the Keras Sequential API instead of the Functional API.
2. Retrain the baseline model with 10% of the training data. How does perform compared to the Universal Sentence Encoder model with 10% of the training data?
3. Try fine-tuning the TF Hub Universal Sentence Encoder model by setting training=True when instantiating it as a Keras layer
4. Retrain the best model you've got so far on the whole training set (no validation split). Then use this trained model to make predictions on the test dataset and format the predictions into the same format as the `sample_submission.csv` file from Kaggle (see the Files tab in Colab for what the `sample_submission.csv` file looks like). Once you've done this, [submit to the Kaggle competition](https://www.kaggle.com/c/nlp-getting-started/data), how did your model perform?

5. Combine the ensemble predictions using the majority vote (mode), how does this perform compared to averaging the prediction probabilities of each model?

6. Make a confusion matrix with the best-performing model's predictions on the validation set and the validation ground truth labels.

The files titled ` 08_Kaggle_Tensorflow.ipynb ` and ` 08_Kaggle_Part_2_Tensorflow.ipynb ` were the files used to develop my submission to the [Natural Language Processing with Disaster Tweets on Kaggle]( https://www.kaggle.com/c/nlp-getting-started/data). 

Some ideas I experimented with are:
* Try trainable = False of 100% of the data WORKS!!!
* Change the optimizer type and try: RMSprop? WORKS (very marginal)!!!
* Find the ideal learning rate. Use learning rate callback? WORKS (very marginal)!!!
* Batching - No
* Add in LSTM or bidirectional LSTM layer - No
* [Augment the data](https://www.youtube.com/watch?v=lpWewl7y57o)

As of 12 June 2024, I managed to acquire a rank of 286 with an F1-score of 0.81673.

<img width="1300" alt="Screenshot 2024-06-12 at 9 07 41 PM" src="https://github.com/SGhuman123/Data-Science-Portfolio/assets/63066897/2df4ded2-9cde-4123-bd4f-a0148025b82d">
