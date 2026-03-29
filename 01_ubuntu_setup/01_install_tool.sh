#!/bin/bash
# update 2026.03.29 10:30JST

# ----------------------------------
# Check OS ver and Kernel ver
# ----------------------------------
echo "# Check OS ver and Kernel ver"
cat /etc/os-release > ../info/os-release.txt
uname -r > ../info/kernel-version.txt

# ----------------------------------
# for Japanese user, the folder name is in Japanese, so rename it to English
# ----------------------------------
echo "# rename English holder"
LANG=C xdg-user-dirs-gtk-update

# -------------------
# for remote connection
# ---------------
echo "install openssh-server"

sudo apt install -y openssh-server

# -------------------
# for GPU monitoring bash (nvidia-smiと似たコマンド)
# ------------------
echo "install gpustat"

sudo apt install -y gpustat

# -------------------
# for JSON processing in bash
# ------------------
echo "install jq"

sudo apt install -y jq


# -------------------
# for terminal emulator
# -------------------
echo "install terminator"

sudo apt install -y terminator

# -------------------
# for Chrome browser
# -------------------
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
