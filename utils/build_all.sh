#!/bin/bash

# docker system prune -f -a
# docker login -u username
cd ./kaia-ros
sudo docker image rm kaiaai/kaia-ros:humble
sudo docker build --no-cache -t kaiaai/kaia-ros:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/kaia-ros:humble &
sudo docker image rm kaiaai/kaia-ros:iron
sudo docker build --no-cache -t kaiaai/kaia-ros:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/kaia-ros:iron &
cd ../etc/micro-ros-base-desktop
sudo docker image rm kaiaai/micro-ros-base-desktop:humble
sudo docker build --no-cache -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/micro-ros-base-desktop:humble &
sudo docker image rm kaiaai/micro-ros-base-desktop:iron
sudo docker build --no-cache -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/micro-ros-base-desktop:iron &
cd ../micro-ros-agent-desktop
sudo docker image rm kaiaai/micro-ros-agent-desktop:humble
sudo docker build --no-cache -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/micro-ros-agent-desktop:humble &
sudo docker image rm kaiaai/micro-ros-agent-desktop:iron
sudo docker build --no-cache -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/micro-ros-agent-desktop:iron &
cd ../../kaia-ros-dev
sudo docker image rm kaiaai/kaia-ros-dev:humble
sudo docker build --no-cache -t kaiaai/kaia-ros-dev:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/kaia-ros-dev:humble &
sudo docker image rm kaiaai/kaia-ros-dev:iron
sudo docker build --no-cache -t kaiaai/kaia-ros-dev:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/kaia-ros-dev:iron &
