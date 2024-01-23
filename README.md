# Kaia.ai Docker images

[Kaia.ai](https://kaiaai) is a platform for 3D-printable pet robots. Please sign up for an early launch invite [here](https://remake.ai).

Here are the two key images and build Docker files:
- [Docker Image](https://hub.docker.com/r/kaiaai/kaiaai-ros) for End Users (instructions and Dockerfile [here](https://github.com/kaiaai/docker/tree/main/kaiaai-ros))
- [Docker Image](https://hub.docker.com/r/kaiaai/kaiaai-ros-dev) for Developers (instructions and Dockerfile [here](https://github.com/kaiaai/docker/tree/main/kaiaai-ros-dev))

## Install Docker
- If you are using a Windows PC, install [Windows WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install)
and [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
- When using a Linux PC, install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/) or
[Docker Desktop](https://docs.docker.com/desktop/install/linux-install/) (with GUI).
On Ubuntu 22.04 you can run
```
git clone --depth 1 https://github.com/kaiaai/docker
cd docker
. utils/install_docker_on_ubuntu.sh
```

## Optional, log in to Docker Hub
```
sudo docker login -u your_docker_hub_username
```

## Build all images - Linux
- install [Docker for Linux](https://docs.docker.com/engine/install/ubuntu/)
- clone the Kaia.ai Docker repo and run the command below
```
git clone https://github.com/kaiaai/docker
cd docker
. utils/build_all.sh
```

## Build all images - Windows
- install [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/)
- clone the Kaia.ai Docker repo and run the command below
```
git clone https://github.com/kaiaai/docker
cd docker
.\utils\build_all.cmd
```
## Release history
1/21/2024
- kaiaai_telemetry now supports multiple laser distance scan sensor models
  - added Xiaomi 1st gen LDS02RR LDS; YDLIDAR X4 is default
  - updated config/telem.yaml settings in makerspet_loki/fido/snoopy
  - `ros2 launch kaiaai_bringup physical.launch.py robot_model:=makerspet_loki lds_model:=LDS02RR`
  - `ros2 launch kaiaai_bringup physical.launch.py robot_model:=makerspet_loki lds_model:=YDLIDAR-X4`
- Frontier exploration works, but needs debug
  - `ros2 launch explore_lite explore.launch.py`

12/11/2023
- increased map saver timeout
- Nav2 SLAM works in physical robot and in simulation
  - `ros2 launch kaiaai_bringup navigation.launch.py robot_model:=makerspet_loki slam:=True`
- kaiaai_teleop bugfix missing setup file
