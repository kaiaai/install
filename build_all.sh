#!/bin/bash

# https://docs.docker.com/engine/install/ubuntu/
cd ./kaia-ros
docker image rm kaiaai/kaia-ros:humble
docker build -t kaiaai/kaia-ros:humble --build-arg distro_tag=humble .
docker push kaiaai/kaia-ros:humble
docker image rm kaiaai/kaia-ros:iron
docker build -t kaiaai/kaia-ros:iron --build-arg distro_tag=iron .
docker push kaiaai/kaia-ros:iron
cd ../etc/micro-ros-base-desktop
docker image rm kaiaai/micro-ros-base-desktop:humble
docker build -t kaiaai/micro-ros-base-desktop:humble --build-arg distro_tag=humble .
docker push kaiaai/micro-ros-base-desktop:humble
docker image rm kaiaai/micro-ros-base-desktop:iron
docker build -t kaiaai/micro-ros-base-desktop:iron --build-arg distro_tag=iron .
docker push kaiaai/micro-ros-base-desktop:iron
cd ../micro-ros-agent-desktop
docker image rm kaiaai/micro-ros-agent-desktop:humble
docker build -t kaiaai/micro-ros-agent-desktop:humble --build-arg distro_tag=humble .
docker push kaiaai/micro-ros-agent-desktop:humble
docker image rm kaiaai/micro-ros-agent-desktop:iron
docker build -t kaiaai/micro-ros-agent-desktop:iron --build-arg distro_tag=iron .
docker push kaiaai/micro-ros-agent-desktop:iron
cd ../../kaia-ros-dev
docker image rm kaiaai/kaia-ros-dev:humble
docker build -t kaiaai/kaia-ros-dev:humble --build-arg distro_tag=humble .
docker push kaiaai/kaia-ros-dev:humble
docker image rm kaiaai/kaia-ros-dev:iron
docker build -t kaiaai/kaia-ros-dev:iron --build-arg distro_tag=iron .
docker push kaiaai/kaia-ros-dev:iron
