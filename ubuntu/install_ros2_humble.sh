#!/bin/bash
# Install ROS2 Humble desktop (with GUI) on Ubuntu 22.04
#   https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html
sudo apt install software-properties-common -y
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt install ros-dev-tools -y
sudo apt upgrade -y
sudo apt install ros-humble-desktop -y
echo '. /opt/ros/humble/setup.bash' >> ~/.bashrc 
source /opt/ros/humble/setup.bash
