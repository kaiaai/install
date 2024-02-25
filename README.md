# Kaia.ai Docker images

[Kaia.ai](https://kaiaai) is a platform for 3D-printable pet robots. Please sign up for an early launch invite [here](https://remake.ai).

[Docker Image](https://hub.docker.com/r/kaiaai/kaiaai-ros-dev) for Developers (instructions and Dockerfile [here](https://github.com/kaiaai/docker/tree/main/kaiaai-ros-dev))
- `docker pull kaiaai/kaiaai-ros-dev:humble`
- `docker pull kaiaai/kaiaai-ros-dev:iron`

## Docker setup video
<a href="http://www.youtube.com/watch?feature=player_embedded&v=XOc5kCE3MC0" target="_blank">
 <img src="http://img.youtube.com/vi/XOc5kCE3MC0/maxresdefault.jpg" alt="Robot Arduino firmware, ROS2/Docker PC setup instructions video" width="720" height="405" border="10" />
</a>

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
### 2/11/2024
- `docker pull kaiaai/kaiaai-ros-dev:humble-02-11-2024`
- `docker pull kaiaai/kaiaai-ros-dev:iron-02-11-2024`
- [ROS2 kaiaai_telemetry package](https://github.com/kaiaai/kaiaai)
  - added support for 3irobotix Delta-2A, Delta-2G laser distance scan sensors

### 2/5/2024
- `docker pull kaiaai/kaiaai-ros-dev:humble-02-05-2024`
- `docker pull kaiaai/kaiaai-ros-dev:iron-02-05-2024`
- added LiDAR/LDS laser distance scan sensors support
  - YDLIDAR X3, X3-PRO
  - Neato XV11
  - SLAMTEC RPLIDAR A1
- split kaiaai_telemetry config into default and custom
  - `kaiaai/kaiaai_telemetry/config/telem.yaml` is the default config
  - `makerspet_loki/config/telem.yaml` is the custom config for the Loki robot model
  - `makerspet_fido/config/telem.yaml` is the custom config for the Fido robot model
  - `makerspet_snoopy/config/telem.yaml` is the custom config for the Snoopy robot model

### 1/28/2024
- `docker pull kaiaai/kaiaai-ros-dev:humble-01-28-2024`
- `docker pull kaiaai/kaiaai-ros-dev:iron-01-28-2024`
- added YDLIDAR X2 to kaiaai_telemetry
- Arduino firmware moved to https://github.com/kaiaai/firmware

### 1/21/2024
- `docker pull kaiaai/kaiaai-ros-dev:humble-01-21-2024`
- `docker pull kaiaai/kaiaai-ros-dev:iron-01-21-2024`
- kaiaai_telemetry now supports multiple laser distance scan sensor models
  - added Xiaomi 1st gen LDS02RR LDS; YDLIDAR X4 is default
  - updated config/telem.yaml settings in makerspet_loki/fido/snoopy
  - `ros2 launch kaiaai_bringup physical.launch.py robot_model:=makerspet_loki lds_model:=LDS02RR`
  - `ros2 launch kaiaai_bringup physical.launch.py robot_model:=makerspet_loki lds_model:=YDLIDAR-X4`
- Frontier exploration works, but needs debug
  - `ros2 launch explore_lite explore.launch.py`

### 12/11/2023
- `docker pull kaiaai/kaiaai-ros-dev:humble-2023-12-11`
- `docker pull kaiaai/kaiaai-ros-dev:iron-2023-12-11`
- increased map saver timeout
- Nav2 SLAM works in physical robot and in simulation
  - `ros2 launch kaiaai_bringup navigation.launch.py robot_model:=makerspet_loki slam:=True`
- kaiaai_teleop bugfix missing setup file
