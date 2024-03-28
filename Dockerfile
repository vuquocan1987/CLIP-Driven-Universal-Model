# Use an official CUDA runtime as the base image
FROM nvidia/cuda:11.4.3-devel-ubuntu20.04

# Install system packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
# COPY requirements.txt .

# Install the required packages



RUN mkdir -p /data/MOTS_CLIP/
COPY requirements.txt ./
# Install nnunet
RUN pip3 install nnunet
# Install the required packages
RUN pip3 install -r requirements.txt
RUN pip install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113
RUN pip install --no-cache-dir 'monai[all]'

COPY . .
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]

# Pre-process the datasets
# RUN python3 Upstream/prepare_Kidney_Dataset.py
# RUN python3 Upstream/Convert_MOTS_to_nnUNet_dataset.py  
# RUN python3 Upstream/Convert_VerSe20_to_nnUNet_dataset.py
# RUN python3 Upstream/Convert_Prostate_to_nnUNet_dataset.py
# RUN python3 Upstream/Convert_BraTS21_to_nnUNet_dataset.py
# RUN python3 Upstream/Convert_AutoPET_to_nnUNet_dataset.py
