# [Kaia.ai](https://kaia.ai/) Docker images

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
