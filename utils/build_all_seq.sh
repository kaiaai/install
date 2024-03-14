#!/bin/bash

sudo docker login
sudo docker system prune -f -a
cd ./etc/micro-ros-base-desktop
sudo docker image rm kaiaai/micro-ros-base-desktop:humble
sudo docker build --no-cache -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/micro-ros-base-desktop:humble
sudo docker image rm kaiaai/micro-ros-base-desktop:iron
sudo docker build --no-cache -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/micro-ros-base-desktop:iron
cd ../micro-ros-agent-desktop
sudo docker image rm kaiaai/micro-ros-agent-desktop:humble
sudo docker build --no-cache -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/micro-ros-agent-desktop:humble
sudo docker image rm kaiaai/micro-ros-agent-desktop:iron
sudo docker build --no-cache -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/micro-ros-agent-desktop:iron
cd ../../kaiaai-ros-dev
sudo docker image rm kaiaai/kaiaai-ros-dev:humble
sudo docker build --no-cache -t kaiaai/kaiaai-ros-dev:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/kaiaai-ros-dev:humble
sudo docker image rm kaiaai/kaiaai-ros-dev:iron
sudo docker build --no-cache -t kaiaai/kaiaai-ros-dev:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/kaiaai-ros-dev:iron
cd ../kaiaai
sudo docker image rm kaiaai/kaiaai:humble
sudo docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/kaiaai:humble
sudo docker image rm kaiaai/kaiaai:iron
sudo docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/kaiaai:iron
