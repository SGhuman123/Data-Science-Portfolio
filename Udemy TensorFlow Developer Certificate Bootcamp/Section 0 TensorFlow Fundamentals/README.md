# TensorFlow Fundamentals

In the file titled `00_tensorflow_fundamentals.ipynb` was dedicated to exploring how the Tensorflow library worked. I learnt about the different datatypes of tensors being scalar, vectors and matrixes.

I also learnt how to shuffle the order of elements in a tensor. Moreover, I learned how to turn NumPy arrays into Tensors and how to extrapolate information on shape, rank and size from Tensors. I then learnt about indexing tensors and manipulating tensors through tensor operations (`+`, `-`, `/`, `*`).

Moreover, I learnt about matrix multiplication and dot product. I also utilized aggregation which involves finding the min, max, mean and sum on the whole tensor. On top of that, I found the positional maximum and minimum. Lastly, I learned how to squeeze a tensor (remove all single dimensions) and learned about one-hot encoding.

In the file titled ` 00_Exercises_TensorFlow_Fundamentals.ipynb ` this was my solution to the practice problem I had to do as part of the course exercise. Where I did the following:

1. Create a vector, scalar, matrix and tensor with values of your choosing using `tf.constant()`.
2. Find the **shape**, **rank** and **size** of the tensors you created in 1.
3. Create two tensors containing random values between 0 and 1 with shape `[5, 300]`.
4. Multiply the two tensors you created in 3 using **matrix multiplication**.
5. Multiply the two tensors you created in 3 using **dot product**.
6. Create a tensor with **random values** between 0 and 1 with shape `[224, 224, 3]`.
7. Find the **min** and **max values** of the tensor you created in 6.
8. Created a tensor with random values of shape `[1, 224, 224, 3]` then **squeeze** it to change the shape to `[224, 224, 3]`.
9. Create a tensor with shape `[10]` using your own choice of values, then find the **index** which has the **maximum value**.
10. **One-hot** encode the tensor you created in 9.
