#!/bin/bash

sudo docker login
sudo docker system prune -f -a
cd ./kaiaai
sudo docker image rm kaiaai/kaiaai:humble
sudo docker build --no-cache -t kaiaai/kaiaai:humble --build-arg distro_tag=humble .
sudo docker push kaiaai/kaiaai:humble
sudo docker image rm kaiaai/kaiaai:iron
sudo docker build --no-cache -t kaiaai/kaiaai:iron --build-arg distro_tag=iron .
sudo docker push kaiaai/kaiaai:iron