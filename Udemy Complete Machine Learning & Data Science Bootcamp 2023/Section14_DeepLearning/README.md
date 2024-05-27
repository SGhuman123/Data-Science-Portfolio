# Dog Vision Project

In the file titled **`end-to-end-dog-vision-project.ipynb`**, this delves into creating a multi-class image classifier using TensorFlow. The purpose of this is to classify multiple different breeds of dogs. 

Approach taken was:

-	Get data ready (download from Kaggle, store, import).
-	Prepare the data (preprocessing, the 3 sets, X & y).
-	Choose and fit/train a model (TensorFlow Hub, tf.keras.applications, TensorBoard, EarlyStopping).
-	Evaluating a model (making predictions, comparing them with the ground truth labels).
-	Improve the model through experimentation (start with 1000 images, make sure it works, increase the number of images).
-	Save, sharing and reloading your model 


For preprocessing the image, the image filepath was taken as input. TensorFlow was used to read the file and save it to a variable, image. Image is then turn into Tensors. Then normalized, convert color channel values from 0-255 to 0-1. Then resized into a shape of (224,224).

Then I used batching with a batch size of 32 to reduce the memory space taken up and improve efficiency when training the model.

Using transfer learning of Mobilenet_v2_130_224 from TensorHub, I chose this as the model that I will be using for my multi-classification problem. Through the use of `TensorBoard` callbacks and `EarlyStopping` to track the progress of the model and stop the model from training too long.

To evaluate the model, I used prediction probabilities and showed it alongside the image. Where green would indicate the correct choice and red would indicate the wrong choice. Also I plotted a bar graph to see how off the model is from the actual result.

<img width="452" alt="image" src="https://github.com/SGhuman123/Data-Science-Portfolio/assets/63066897/57bf134b-d47c-4de1-a180-8b69878797a5">
