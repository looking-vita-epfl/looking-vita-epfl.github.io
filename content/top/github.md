---
title:      "Releasing the LOOK dataset"
URL: "/top/github"
---
# Visualization code

Copy the following python file or download it from [here](/code/code/utils.py):
```python
import argparse
import os
import errno

from PIL import Image
import numpy as np
import cv2

parser = argparse.ArgumentParser(description='Script to build the LOOK dataset visualization')
parser.add_argument('--path_gt', dest='pgt', type=str, help='path to the annotation file', default="./annotations.csv")
parser.add_argument('--path_images', dest='pot', type=str, help='path to the LOOK dataset', default="")
parser.add_argument('--path_output_images', dest='poi', type=str, help='path to the output images', default="")

def makedirectory(path):
    try:
        os.makedirs(path)
    except OSError as e:
        if e.errno != errno.EEXIST:
            raise

def parse_annotation(file):
    """
    Utility function to parse the LOOK annotation file to a dictionnary
    """
    dict_output = {}
    
    for line in file:
        if line.split(',')[0] != 'filename':
            line = line[:-1]
            image_name = line.split(',')[0]
            if image_name not in dict_output:
                dict_output[image_name] = {'bboxes':[], 'splits':[], 'labels':[], 'lines':[]}
            bbox = [float(line.split(',')[1]), float(line.split(',')[2]), float(line.split(',')[3]), float(line.split(',')[4])]
            label = int(line.split(',')[-1])
            split = line.split(',')[5]
            if label != -1:
                dict_output[image_name]['bboxes'].append(bbox)
                dict_output[image_name]['splits'].append(split)
                dict_output[image_name]['labels'].append(label)
                name_data = line.split(',')[0].split('/')[1]
    return dict_output

def enlarge_bbox(bb, enlarge=1):
    """
    Convert the bounding box from Pifpaf to an enlarged version of it 
    """
    delta_h = bb[3] / (7 * enlarge)
    delta_w = bb[2] / (3.5 * enlarge)
    bb[0] -= delta_w
    bb[1] -= delta_h
    bb[2] += delta_w
    bb[3] += delta_h
    return bb

def convert_bb(bb):
    """
    Convert the bounding box from a [x, y, w, h] format to a [x1, y1, x2, y2] a format.
    """
    return [bb[0], bb[1], bb[0]+bb[2], bb[1]+bb[3]]

def visualize(parsed_annotation, path_input_images, path_output_images):
    """
    """
    for j, keys in enumerate(parsed_annotation):
        path_input_image = os.path.join(path_input_images, keys)
        path_output_image = os.path.join(path_output_images, keys)
        cv2_image = cv2.imread(path_input_image)
        plain_image = np.zeros_like(cv2_image, np.uint8)
        for i in range(len(parsed_annotation[keys]['labels'])):
            label = parsed_annotation[keys]['labels'][i]

            bbox = parsed_annotation[keys]['bboxes'][i]
            bbox = [bbox[0], bbox[1], abs(bbox[2]-bbox[0]), abs(bbox[3]-bbox[1])]
            bbox = convert_bb(enlarge_bbox(bbox))
            
            start_point = (int(bbox[0]), int(bbox[1]))
            end_point = (int(bbox[2]), int(bbox[3]))
            if label == 1:
                plain_image = cv2.rectangle(plain_image, start_point, end_point, (0,255,0), 1)
            else:
                plain_image = cv2.rectangle(plain_image, start_point, end_point, (0,0,255), 1)
        
        mask = plain_image.astype(bool)
        alpha = 0.7
        cv2_image[mask] = cv2.addWeighted(plain_image, alpha, cv2_image, 1-alpha, 0)[mask]
        makedirectory(os.path.dirname(path_output_image))
        cv2.imwrite(path_output_image, cv2_image)
if __name__ == '__main__':
    args = parser.parse_args()
    look_directory = args.pot
    anno_file = args.pgt
    path_output_images = args.poi

    annotation_file = open(anno_file, 'r')
    parsed_annotation = parse_annotation(annotation_file)
    visualize(parsed_annotation, look_directory, path_output_images)
```
And the sh script below:
```sh
#!/bin/sh

## Do not modify

ID_ANNOTATION='1nXYHkfcl_velTE8JJsHpyUdPRZEFG1QP'
ID_LOOK='1WH6fKrXW0AbbTkvOELinxHOfZPOFuLMv'
BASE_PATH=$(pwd)

## Variable to modify
PATH_OUTPUT_DATA="TO DO"


mkdir -p $PATH_OUTPUT_DATA
mkdir -p "${PATH_OUTPUT_DATA}/LOOK_ground_truth"

cd $PATH_OUTPUT_DATA
echo "Downloading LOOK annoations ..."
gdown --id $ID_ANNOTATION
echo "Downloading LOOK images ..."
gdown --id $ID_LOOK
unzip LOOK_dataset.zip

cd $BASE_PATH
python utils.py --path_gt "${PATH_OUTPUT_DATA}/annotations.csv" --path_images "${PATH_OUTPUT_DATA}/LOOK_dataset" --path_output_images "${PATH_OUTPUT_DATA}/LOOK_ground_truth"
```

Modify the variable ```PATH_OUTPUT_DATA``` which corresponds to the path where the ground truth visualizations would be outputted. Once this is done, run the modified sh file.