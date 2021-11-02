#!/bin/sh

## Do not modify

ID_ANNOTATION='1nXYHkfcl_velTE8JJsHpyUdPRZEFG1QP'
ID_LOOK='1WH6fKrXW0AbbTkvOELinxHOfZPOFuLMv'
BASE_PATH=$(pwd)
PATH_OUTPUT_DATA="/home/younesbelkada/Travail/LOOK_dataset/visualizations"


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