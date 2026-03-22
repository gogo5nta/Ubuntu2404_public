#!/bin/bash

# -------------------
# echo "install openssh-server"
# ---------------
echo "install openssh-server"

sudo apt install -y openssh-server

# -------------------
# echo "install Chrome"
# ---------------
echo "install Chrome"

# Install tools
sudo apt install -y wget

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Google Chrome
sudo apt install ./google-chrome-stable_current_amd64.deb

# -------------------
# echo "install vscpde"
# ---------------
echo "install vscode"

# Install tools
sudo apt install -y software-properties-common apt-transport-https wget -y

# Import the Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

# Enable the Visual Studio Code repository
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# Update package lists and install Visual Studio Code
sudo apt -y update
sudo apt -y install code
