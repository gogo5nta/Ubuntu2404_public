#!/bin/bash
# update 2026.03.23 22:00JST

# ----------------------------------
# echo "# Install NVIDIA Container Toolkit
# ----------------------------------
echo "# Install NVIDIA Container Toolkit"

# Reffernce
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation

# Install the prerequisites for the instructions below:
sudo apt update && sudo apt install -y --no-install-recommends \
   ca-certificates \
   curl \
   gnupg2

# Configure the production repository:
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# Update the packages list from the repository
sudo apt update

# Install the NVIDIA Container Toolkit package
sudo apt install -y nvidia-container-toolkit

# chech NVIDIA Container Toolkit
nvidia-container-toolkit info

# if you have nvidia-docker2 installed, show me
# Usage of nvidia-container-toolkit:

# 確認(docker --gpus)
# sudo docker run --gpus all nvidia/cuda:10.1-base-ubuntu18.04 nvidia-smi
# sudo docker run --gpus all nvidia/cuda:11.0-base-ubuntu18.04 nvidia-smi
# sudo docker run --gpus all nvidia/cuda:11.0-base-ubuntu20.04 nvidia-smi

# reffer: https://hub.docker.com/r/nvidia/cuda/tags
sudo docker run --gpus all nvidia/cuda:12.6.1-base-ubuntu24.04 nvidia-smi
docker pull nvidia/cuda:12.6.1-base

# Dockerコマンドをsudoなしで実行する方法
# URL:https://insilico-notebook.com/docker-run-without-sudo/
# URL:https://qiita.com/DQNEO/items/da5df074c48b012152ee
# dockerグループがなければ作る
sudo groupadd docker

# 現行ユーザをdockerグループに所属させる
sudo usermod -aG docker $USER 
newgrp docker 

# dockerデーモンを再起動
sudo systemctl restart docker

# test
docker run hello-world 
