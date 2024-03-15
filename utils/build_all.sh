#!/bin/bash

sudo docker login
sudo docker image rm kaiaai/kaiaai:humble
sudo docker image rm kaiaai/kaiaai:iron
sudo docker image rm kaiaai/kaiaai-ros-dev:humble
sudo docker image rm kaiaai/kaiaai-ros-dev:iron
sudo docker system prune -f -a
cd ./kaiaai
sudo docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/kaiaai:humble >> push_humble.log &
sudo docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/kaiaai:iron >> push_iron.log &
cd ..
docker tag kaiaai/kaiaai:humble kaiaai/kaiaai-ros-dev:humble
sudo docker push kaiaai/kaiaai-ros-dev:humble >> push_humble.log &
docker tag kaiaai/kaiaai:iron kaiaai/kaiaai-ros-dev:iron
sudo docker push kaiaai/kaiaai-ros-dev:iron >> push_iron.log &
