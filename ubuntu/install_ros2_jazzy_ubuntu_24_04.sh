#!/bin/bash
# Install ROS2 Jazzy desktop (with GUI) on Ubuntu 24.04
#   https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html
# Skip this script if ROS2 Jazzy is already installed.
set -e

. /etc/os-release
if [ "$VERSION_ID" != "24.04" ]; then
    echo "ROS2 Jazzy requires Ubuntu 24.04, found $PRETTY_NAME" >&2
    exit 1
fi

sudo apt update
sudo apt install -y software-properties-common curl
sudo add-apt-repository -y universe

# ros2-apt-source sets up the ROS2 apt repository and keeps its signing key current
ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb
rm /tmp/ros2-apt-source.deb

sudo apt update
sudo apt upgrade -y
sudo apt install -y ros-jazzy-desktop ros-dev-tools

grep -qxF '. /opt/ros/jazzy/setup.bash' ~/.bashrc || echo '. /opt/ros/jazzy/setup.bash' >> ~/.bashrc
echo "ROS2 Jazzy installed. Next, run install_kaiaai_jazzy.sh"
