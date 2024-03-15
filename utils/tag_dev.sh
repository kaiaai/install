#!/bin/bash

docker tag kaiaai/kaiaai:humble kaiaai/kaiaai-ros-dev:humble
sudo docker push kaiaai/kaiaai-ros-dev:humble
docker tag kaiaai/kaiaai:iron kaiaai/kaiaai-ros-dev:iron
sudo docker push kaiaai/kaiaai-ros-dev:iron
