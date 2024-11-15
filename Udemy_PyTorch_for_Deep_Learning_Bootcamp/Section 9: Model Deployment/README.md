# Description

> What is model deployment?
>
> Machine learning model deployment is the act of making your machine learning model(s) available to someone or something else.

> **We're going to deploy our FoodVision Mini model to the internet as a usable app!**

<img src="https://github.com/mrdbourke/pytorch-deep-learning/raw/main/images/09-model-deployment-what-were-doing-demo-trimmed-cropped-small.gif" alt="demo of food vision mini computer vision model being used on a mobile device to predict on an image of sushi and getting it right" width=900/>

*Trying out the [deployed version of FoodVision Mini](https://huggingface.co/spaces/mrdbourke/foodvision_mini) (what we're going to build) on my lunch. The model got it right too 🍣!*

## What is machine learning model deployment?

**Machine learning model deployment** is the process of making your machine learning model accessible to someone or something else.

Someone else is a person who can interact with your model in some way.

For example, someone takes a photo on their smartphone of food and then has our FoodVision Mini model classify it into pizza, steak or sushi.

<img src="https://raw.githubusercontent.com/mrdbourke/pytorch-deep-learning/main/images/09-what-is-model-deployment-someone-or-something-else.png" width=900 alt="two use cases for model deployment, making your model available to someone else, for example, someone using it in an app, or making it available to something else such as another program or model"/>

*Machine learning model deployment involves making your model available to someone or something else.*

## Why deploy a machine learning model?

Although you can get a pretty good idea of how your model's going to function by evaluating it on a well-crafted test set or visualizing its results, you never really know how it's going to perform until you release it to the wild.

Having people who've never used your model interact with it will often reveal edge cases you never thought of during training.

For example, what happens if someone were to upload a photo that *wasn't* of food to our FoodVision Mini model?

What happens then?

Thus this highlights the importance of model deployment: it helps you figure out errors in your model that aren't obvious during training/testing.

<img src="https://raw.githubusercontent.com/mrdbourke/pytorch-deep-learning/main/images/09-pytorch-workflow-with-deployment.png" alt="A PyTorch workflow with added model deployment and monitoring step" width=900/>

*We covered a PyTorch workflow back in [01. PyTorch Workflow](https://www.learnpytorch.io/01_pytorch_workflow/). But once you've got a good model, deployment is a good next step. Monitoring involves seeing how your model goes on the most important data split: data from the real world. For more resources on deployment and monitoring see [PyTorch Extra Resources](https://www.learnpytorch.io/pytorch_extra_resources/#resources-for-machine-learning-and-deep-learning-engineering).*

## What we're going to cover

Enough talking about deploying a machine learning model.

Let's become machine learning engineers and actually deploy one.

Our goal is to deploy our FoodVision Model via a demo Gradio app with the following metrics:
1. **Performance:** 95%+ accuracy.
2. **Speed:** real-time inference of 30FPS+ (each prediction has a latency of lower than ~0.03s).

We'll start by running an experiment to compare our best two models so far: EffNetB2 and ViT feature extractors.

Then we'll deploy the one which performs closest to our goal metrics.

Finally, we'll finish with a (BIG) surprise bonus.

| **Topic** | **Contents** |
| ----- | ----- |
| **0. Getting setup** | We've written a fair bit of useful code over the past few sections, let's download it and make sure we can use it again. |
| **1. Get data** | Let's download the [`pizza_steak_sushi_20_percent.zip`](https://github.com/mrdbourke/pytorch-deep-learning/blob/main/data/pizza_steak_sushi_20_percent.zip) dataset so we can train our previously best-performing models on the same dataset. |
| **2. FoodVision Mini model deployment experiment outline** | Even on the third milestone project, we're still going to be running multiple experiments to see which model (EffNetB2 or ViT) achieves the closest to our goal metrics. |
| **3. Creating an EffNetB2 feature extractor** | An EfficientNetB2 feature extractor performed the best on our pizza, steak, and sushi dataset in [07. PyTorch Experiment Tracking](https://www.learnpytorch.io/07_pytorch_experiment_tracking/), let's recreate it as a candidate for deployment. |
| **4. Creating a ViT feature extractor** | A ViT feature extractor has been the best-performing model yet on our pizza, steak, and sushi dataset in [08. PyTorch Paper Replicating](https://www.learnpytorch.io/08_pytorch_paper_replicating/), let's recreate it as a candidate for deployment alongside EffNetB2. |
| **5. Making predictions with our trained models and timing them** | We've built two of the best-performing models yet, let's make predictions with them and track their results. |
| **6. Comparing model results, prediction times and size** | Let's compare our models to see which performs best with our goals. |
| **7. Bringing FoodVision Mini to life by creating a Gradio demo** | One of our models performs better than the other (in terms of our goals), so let's turn it into a working app demo! |
| **8. Turning our FoodVision Mini Gradio demo into a deployable app** | Our Gradio app demo works locally, let's prepare it for deployment! |
| **9. Deploying our Gradio demo to HuggingFace Spaces** | Let's take FoodVision Mini to the web and make it publicly accessible for all! |
| **10. Creating a BIG surprise** | We've built FoodVision Mini, time to step things up a notch. |
| **11. Deploying our BIG surprise** | Deploying one app was fun, how about we make it two? |
