# Transfer Learning (Fine-tuning)

In the file titled ` 05_transfer_learning_in_tensorflow_part_2_fine_tuning.ipynb` this was dedicated to learning about Transfer Learning (Fine-tuning).

**"As is" transfer learning** is when you take a pre-trained model as it is and apply it to your task without any changes.

In **fine-tuning transfer learning** the pre-trained model weights from another model are unfrozen and tweaked to better suit your own data.

The following was covered: 
- Introduce fine-tuning, a type of transfer learning to modify a pre-trained model to be more suited to your data
- Using the Keras Functional API (a different way to build models in Keras)
- Using a smaller dataset to experiment faster (e.g. 1-10% of training samples of 10 classes of food)
- Data augmentation (how to make your training dataset more diverse without adding more data)
- Running a series of modelling experiments on our Food Vision data
  - **Model 0**: a transfer learning model using the Keras Functional API
  - **Model 1**: a feature extraction transfer learning model on 1% of the data with data augmentation
  - **Model 2**: a feature extraction transfer learning model on 10% of the data with data augmentation
  - **Model 3**: a fine-tuned transfer learning model on 10% of the data
  - **Model 4**: a fine-tuned transfer learning model on 100% of the data
- Introduce the ModelCheckpoint callback to save intermediate training results
- Compare model experiment results using TensorBoard

![image]([https://github.com/SGhuman123/Data-Science-Portfolio/assets/63066897/9a4ba8ca-a669-4e03-a35d-4dbb1ceaeeca](https://raw.githubusercontent.com/mrdbourke/tensorflow-deep-learning/main/images/05-transfer-learning-feature-extraction-vs-fine-tuning.png))
 
In the file titled ` 05_Practice_transfer_learning_in_tensorflow_part_2_fine_tuning.ipynb` this was my solution to the practice problem I had to do as part of the course exercise.

