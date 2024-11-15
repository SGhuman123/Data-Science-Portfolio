# Description

> **Goal:** Turn an ML research paper into usable code.

In this notebook, we're going to be **replicating the [Vision Transformer (ViT)](https://arxiv.org/abs/2010.11929) architecture/paper** from scratch with PyTorch.

We'll then see how ViT, a state-of-the-art computer vision architecture, performs on our FoodVision Mini problem.

The contents of a machine learning research paper can vary from paper to paper but they generally follow the structure:

| **Section** | **Contents** |
| ----- | ----- |
| **Abstract** | An overview/summary of the paper's main findings/contributions. |
| **Introduction** | What's the paper's main problem and what details of previous methods were used to try and solve it? |
| **Method** | How did the researchers go about conducting their research? For example, what model(s), data sources, and training setups were used? |
| **Results** | What are the outcomes of the paper? If a new type of model or training setup was used, how did the results of the findings compare to previous works? (this is where **experiment tracking** comes in handy) |
| **Conclusion** | What are the limitations of the suggested methods? What are some next steps for the research community? |
| **References** | What resources/other papers did the researchers look at to build their own body of work? |
| **Appendix** | Are there any extra resources/findings to look at that weren't included in any of the above sections? |

## What we're going to cover

We replicated the machine learning research paper [*An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale*](https://arxiv.org/abs/2010.11929)  (ViT paper) with PyTorch.

The Transformer neural network architecture was originally introduced in the machine learning research paper [*Attention is all you need*](https://arxiv.org/abs/1706.03762).

The original Transformer architecture was designed to work on one-dimensional (1D) sequences of text.

A **Transformer architecture** is generally considered to be any neural network that uses the [**attention mechanism**](https://en.wikipedia.org/wiki/Attention_(machine_learning)) as its primary learning layer. Similar to how a convolutional neural network (CNN) uses convolutions as its primary learning layer.

As the name suggests, **the Vision Transformer (ViT) architecture was designed to adapt the original Transformer architecture to vision problem(s)** (classification being the first and since many others have followed).

The original Vision Transformer has been through several iterations over the past couple of years, however, we're going to focus on replicating the original, otherwise known as the "vanilla Vision Transformer". Because if you can recreate the original, you can adapt to the others.

We're going to be focusing on building the ViT architecture as per the original ViT paper and applying it to FoodVision Mini.

| **Topic** | **Contents** |
| ----- | ----- |
| **[0. Getting setup](https://www.learnpytorch.io/08_pytorch_paper_replicating/#0-getting-setup)** | We've written a fair bit of useful code over the past few sections, let's download it and make sure we can use it again. |
| **[1. Get data](https://www.learnpytorch.io/08_pytorch_paper_replicating/#1-get-data)** | Let's get the pizza, steak and sushi image classification dataset we've been using and build a Vision Transformer to try and improve the FoodVision Mini model's results. |
| **[2. Create Datasets and DataLoaders](https://www.learnpytorch.io/08_pytorch_paper_replicating/#2-create-datasets-and-dataloaders)** | We'll use the `data_setup.py` script we wrote in chapter 05. PyTorch Going Modular to set up our data loaders. |
| **[3. Replicating the ViT paper: an overview](https://www.learnpytorch.io/08_pytorch_paper_replicating/#3-replicating-the-vit-paper-an-overview)** | Replicating a machine learning research paper can be a fair challenge, so before we jump in, let's break the ViT paper down into smaller chunks, so we can replicate the paper chunk by chunk. |
| **[4. Equation 1: The Patch Embedding](https://www.learnpytorch.io/08_pytorch_paper_replicating/#4-equation-1-split-data-into-patches-and-creating-the-class-position-and-patch-embedding)** | The ViT architecture is comprised of four main equations, the first being the patch and position embedding. Or turning an image into a sequence of learnable patches. |
| **[5. Equation 2: Multi-Head Attention (MSA)](https://www.learnpytorch.io/08_pytorch_paper_replicating/#5-equation-2-multi-head-attention-msa)** | The self-attention/multi-head self-attention (MSA) mechanism is at the heart of every Transformer architecture, including the ViT architecture, let's create an MSA block using PyTorch's in-built layers. |
| **[6. Equation 3: Multilayer Perceptron (MLP)](https://www.learnpytorch.io/08_pytorch_paper_replicating/#6-equation-3-multilayer-perceptron-mlp)** | The ViT architecture uses a multilayer perceptron as part of its Transformer Encoder and for its output layer. Let's start by creating an MLP for the Transformer Encoder. |
| **[7. Creating the Transformer Encoder](https://www.learnpytorch.io/08_pytorch_paper_replicating/#7-create-the-transformer-encoder)** | A Transformer Encoder is typically comprised of alternating layers of MSA (equation 2) and MLP (equation 3) joined together via residual connections. Let's create one by stacking the layers we created in sections 5 & 6 on top of each other.  |
| **[8. Putting it all together to create ViT](https://www.learnpytorch.io/08_pytorch_paper_replicating/#8-putting-it-all-together-to-create-vit)** | We've got all the pieces of the puzzle to create the ViT architecture, let's put them all together into a single class we can call as our model. |
| **[9. Setting up training code for our ViT model](https://www.learnpytorch.io/08_pytorch_paper_replicating/#9-setting-up-training-code-for-our-vit-model)** | Training our custom ViT implementation is similar to all of the other models we've trained previously. And thanks to our `train()` function in `engine.py` we can start training with a few lines of code. |
| **[10. Using a pre-trained ViT from `torchvision.models`](https://www.learnpytorch.io/08_pytorch_paper_replicating/#10-using-a-pretrained-vit-from-torchvisionmodels-on-the-same-dataset)** | Training a large model like ViT usually takes a fair amount of data. Since we're only working with a small amount of pizza, steak and sushi images, let's see if we can leverage the power of transfer learning to improve our performance. |
| **[11. Make predictions on a custom image](https://www.learnpytorch.io/08_pytorch_paper_replicating/#11-make-predictions-on-a-custom-image)** | The magic of machine learning is seeing it work on your data, so let's take our best performing model and put FoodVision Mini to the test on the infamous *pizza-dad* image (a photo of my dad eating pizza). |

> **Note:** Despite the fact we're going to be focused on replicating the ViT paper, avoid getting too bogged down on a particular paper as newer better methods will often come along, quickly, so the skill should be to remain curious whilst building the fundamental skills of turning math and words on a page into working code.
