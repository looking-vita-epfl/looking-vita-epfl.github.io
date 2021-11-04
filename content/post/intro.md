---
layout:     post 
title:      "Releasing the LOOK Dataset"
description: "A simple and detailed guideline for understanding and using the dataset"
subtitle:   ""
author: " LOOK dataset"
date:       2021-11-04
published: true
URL: "/Release"
image: "/images/look/kitti/000073_r.jpg"
---

The LOOK dataset is **finally online**! Please look at the intructions below in order to understand how the dataset has been created.

## Introduction

We provide an open-source, high quality labeled dataset for the *in-the-wild* eye contact detection task. Eye contact detection is a practically important task to better understand and forecast human behaviors. In particular,autonomous robots  and self driving cars need to solve this task to navigate safely around humans, and act accordingly to this new modality. 
In addition, in Machine Learning it is really important to understand if the trained model is robust across multiple domains, in order to be really good at test time. *LOOK dataset* consists of a combination of several open-source datasets for autonomous driving in order to cover all the possible domains that an autonomous agent can encounter. 

### Statistics

As for **05-11-2021**, the LOOK dataset consists of ~57k labeled instances with a positive rate of ~17%, with ~7900 unique pedestrian annotations. 

## Visualize the ground truth images

Visit the [code](/top/github/) section to download the visualization script and run it in your local machine.

## Understand the data format

The annotation file consist of a single file, containing

## Download the dataset

The dataset is easy to download, please visit the [dataset section](/top/dataset) to get the guidelines of how to download the dataset

## How the data is annotated?

Some instances are really hard to label for humans, thus we need an aggregation of human annotations for this task.
We use Amazon Mechanical Turk to label the images and collected annotations from 4 different annotators. Two main cases can happen while annotating this type of instances, first of all a case where at least 3 over 4 annotators agree on the label of the instance:

![](/images/consensus1.png)

The other case that can happen is when we are faced with a difficult case. If the consensus is not reached, the corresponding instance will be discarded.

![](/images/noconsensus.png)
