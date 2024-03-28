# this script generate a file list for the dataset, take input as the path of the dataset, and output the file list in the same directory as the dataset.

import os
import sys

def generate_file_list(dataset_path, output_path):
    # get the list of files in the dataset
    files = os.listdir(dataset_path)
    train_files = 