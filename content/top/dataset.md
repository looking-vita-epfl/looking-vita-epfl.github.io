
# Download the dataset

## Automatic download
---

<p></p>


Download simply everything from [here](https://www.google.com). [Add link to zip file of full data in google drive]

You want to download everything from raw data? Follow the steps here for each dataset:

## Manual download

### Nuscenes
---


<p></p>

![alt text](/images/look/nuscenes/nu2.jpg)

Nuscenes mainly consists of high resolution images with some crowded scenes on a traffic configuration.  

#### Training set
---


<p></p>

* Go to [Nuscenes official website](https://www.nuscenes.org/download) and download the ```sweeps``` from ```CAM_BACK_LEFT``` in ```US```.
* Go to [Nuscenes official website](https://www.nuscenes.org/download) and download the ```samples``` from ```CAM_FRONT``` in ```US```.

There are ***275*** images annotated from ```US/samples/CAM_FRONT``` and ***1500*** images from ```US/sweeps/CAM_BACK_LEFT```.

#### Testing set
---


<p></p>

To write

### JRDB
---

<p></p>


{{< video mp4="/images/look/jrdb/out.mp4" >}}

Download the JRDB train dataset from [here](https://download.cs.stanford.edu/downloads/jrdb/jrdb_train.zip).

#### Training set
---


<p></p>

* ```cvgl/group/jrdb/data/train_dataset/images/image_0/meyer-green-2019-03-16_0```
* ```cvgl/group/jrdb/data/train_dataset/images/image_0/huang-lane-2019-02-12_0```
* ```cvgl/group/jrdb/data/train_dataset/images/image_0/clark-center-2019-02-28_0```
* ```cvgl/group/jrdb/data/train_dataset/images/image_0/cubberly-auditorium-2019-04-22```
* ```cvgl/group/jrdb/data/train_dataset/images/image_2/cubberly-auditorium-2019-04-22```
* ```cvgl/group/jrdb/data/train_dataset/images/image_4/cubberly-auditorium-2019-04-22```
* ```cvgl/group/jrdb/data/train_dataset/images/image_4/bytes-cafe-2019-02-07_0```
* ```cvgl/group/jrdb/data/train_dataset/images/image_8/bytes-cafe-2019-02-07_0```

#### Testing set
---


<p></p>

* ```cvgl/group/jrdb/data/train_dataset/images/image_0/nvidia-aud-2019-04-18_0```
* ```cvgl/group/jrdb/data/train_dataset/images/image_0/stlc-111-2019-04-19```

### Kitti
---

{{< video mp4="/images/look/kitti/out.mp4" >}}

<p></p>

#### Training data

Create an account at the Kitti Benchmark website and move to the [raw data](http://www.cvlibs.net/datasets/kitti/raw_data.php) section. Download the ```2011_09_29_drive_0071``` folder.

#### Testing data

Move to the 2d Object detection benchmark [here](http://www.cvlibs.net/datasets/kitti/eval_object.php?obj_benchmark). Download the first folder called ```Download left color images of object data set (12 GB)``` or directly using this [link](https://s3.eu-central-1.amazonaws.com/avg-kitti/data_object_image_2.zip). Use the folder ```data_object_image_2/training/image_2```.
