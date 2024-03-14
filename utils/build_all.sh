#!/bin/bash

sudo docker login
sudo docker image rm kaiaai/micro-ros-base-desktop:humble
sudo docker image rm kaiaai/micro-ros-base-desktop:iron
sudo docker image rm kaiaai/micro-ros-agent-desktop:humble
sudo docker image rm kaiaai/micro-ros-agent-desktop:iron
sudo docker image rm kaiaai/kaiaai-ros-dev:humble
sudo docker image rm kaiaai/kaiaai-ros-dev:iron
sudo docker system prune -f -a
cd ./etc/micro-ros-base-desktop
sudo docker build --no-cache -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/micro-ros-base-desktop:humble >> push_humble.log &
sudo docker build --no-cache -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/micro-ros-base-desktop:iron >> push_iron.log &
cd ../micro-ros-agent-desktop
sudo docker build --no-cache -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/micro-ros-agent-desktop:humble >> push_humble.log &
sudo docker build --no-cache -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/micro-ros-agent-desktop:iron >> push_iron.log &
cd ../../kaiaai-ros-dev
sudo docker build --no-cache -t kaiaai/kaiaai-ros-dev:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/kaiaai-ros-dev:humble >> push_humble.log &
sudo docker build --no-cache -t kaiaai/kaiaai-ros-dev:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/kaiaai-ros-dev:iron >> push_iron.log &
cd ..
