# [Kaia.ai](https://kaia.ai/) Docker images
Here are the two key images and build Docker files:
- [Docker Image](https://hub.docker.com/r/kaiaai/kaia-ros) for End Users (Dockerfile [here](https://github.com/kaiaai/docker/tree/main/kaia-ros))
- [Docker Image](https://hub.docker.com/r/kaiaai/kaia-ros-dev) for Developers (Dockerfile [here](https://github.com/kaiaai/docker/tree/main/kaia-ros-dev))

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
